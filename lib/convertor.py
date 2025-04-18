import csv
class Item:
    def __init__(self, name, amount):
        self.name = name
        self.amount = amount
    def __str__(self):
        return f"Item(name: '{self.name}', amount: {self.amount})"
class SellInfo:
    def __init__(self, item, npc, sellType, requiredItem, sellAmount, resetCycle, accountLimit, region):
        self.item = item
        self.npc = npc
        self.sellType = sellType
        self.requiredItem = requiredItem
        self.sellAmount = sellAmount
        self.resetCycle = resetCycle
        self.accountLimit = accountLimit
        self.region = region
    def __str__(self):
        return f"ToBuy(item:SellInfo(item: {self.item}, npc: '{self.npc}', sellType: {self.sellType}, requiredItem: {self.requiredItem}, sellAmount: {self.sellAmount}, resetCycle: {self.resetCycle}, accountLimit: {self.accountLimit}, region: {self.region}), toBuy: false),"

if __name__ == "__main__":
    sellInfoList = []
    with open("lib/tobuy.csv", "r", encoding="utf-8") as file:
        reader = csv.reader(file)
        for row in reader:
            name, amount, npc, input1, require_item, require_amount, sell_amount, input2, input3, input4 = row
            if input1=="물물교환":
                type = "trade"
            elif input1=="소모품":
                type = "consume"
            elif input1=="음식":
                type = "food"
            elif input1=="재료":
                type = "material"
            elif input1=="마물 퇴치 증표":
                type = "cert"
            elif input1=="이벤트":
                type = "event"
            elif input1=="매일 특가":
                type = "dailySale"
            elif input1=="안경 상자":
                type = "glasses"
            elif input1=="캐시샵-데카":
                type = "cashDeca"
            elif input1=="캐시샵-골드":
                type = "cashGold"

            if input2 =="매일 6시":
                reset_cycle = "daily"
            elif input2 =="월요일 6시":
                reset_cycle = "weekly"
            elif input2 =="계정 영구":
                reset_cycle = "account"
            elif input2 =="캐릭터당 1회":
                reset_cycle = "character"
            elif input2 =="무제한":
                reset_cycle = "noLimit"
            elif input2 =="이벤트 활성화":
                reset_cycle = "onEvent"

            if input4 =="티르코네일":
                reg = "tirconail"
            elif input4 =="콜헨":
                reg = "colhen"
            elif input4 =="던바튼":
                reg = "dunbaton"
            elif input4 =="두갈드아일":
                reg ="dugaldhail"
            elif input4 =="캐시샵":
                reg = "cashshop"

            sellType = f"SellType.{type}"
            cycle = f"ResetCycle.{reset_cycle}"
            region = f"Region.{reg}"

            accountLimit = "false"
            if input3 =="Yes":
                acctountLimit = "true"

            if amount == "":
                amount = "1"
            if sell_amount == "":
                sell_amount = "-1"
            require_amount = require_amount.replace(",","")
            item = Item(name, amount)
            requiredItem = Item(require_item, require_amount)
            sellInfoList.append(SellInfo(item, npc, sellType, requiredItem, sell_amount, cycle, accountLimit, region))    
    sellInfoList.sort(key=lambda x: (not x.accountLimit, x.region, x.resetCycle, x.npc))
    for info in sellInfoList:
        print(SellInfo.__str__(info))
