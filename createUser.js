require('dotenv').config()
const { PrismaClient } = require('@prisma/client')
const bcrypt = require('bcryptjs');

const prisma = new PrismaClient()

async function main() {

  if (process.env.PASSWORD1) {
    let salt = bcrypt.genSaltSync(10)
    let hash = bcrypt.hashSync(process.env.PASSWORD1, salt)
    let user = { email: process.env.USER1, password: hash, }
    await prisma.user.create({ data: user })
  }

  if (process.env.PASSWORD2) {
    let salt = bcrypt.genSaltSync(10)
    let hash = bcrypt.hashSync(process.env.PASSWORD2, salt)
    let user = { email: process.env.USER2, password: hash, }
    await prisma.user.create({ data: user })
  }

  if (process.env.PASSWORD3) {
    let salt = bcrypt.genSaltSync(10)
    let hash = bcrypt.hashSync(process.env.PASSWORD3, salt)
    let user = { email: process.env.USER3, password: hash, }
    await prisma.user.create({ data: user })
  }

}

main()
  .catch(e => {
    throw e
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
