Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0552C52546
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 09:51:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 553EC1663;
	Tue, 25 Jun 2019 09:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 553EC1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561449100;
	bh=OzOMzdlqcDPff1O/QTHdsQBhJpJ5rhpuoeSO/OzIecQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aZHPaTPUm4n4yBDKCyQvaMqqI2ZJATrA2JZRSdxtcdXAN4RQGfguV4B16XbzAfOPK
	 J+hcaUIYTL/UEGTfqEoXNs9pno6nGxAaLxbrp+Uwcw5dOick/ek4rmm32a8qQdlXNT
	 BqvJHZzRQg1tWvPIScMqmTdg4dcGNgnxPl6MKLl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81F1DF896F0;
	Tue, 25 Jun 2019 09:49:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0454EF896FC; Tue, 25 Jun 2019 09:49:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40102.outbound.protection.outlook.com [40.107.4.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D1CFF8075C
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 09:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D1CFF8075C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="tK3riVJh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHR/0vJ9DW+Tr9a7Xxa0r8CDIijW+9BsGtKkpiiJgpg=;
 b=tK3riVJh1c3Zx0M489pyCqsP9RipMHN3bipulWvW3T/hOZQRNZhx9CQvBWAABk2VW5RcC97e9/NC77j7GgShbaRwQL9KFMDeNeoQn4j5tHn6PiOuNsUJNJTN3jrQ8FJF4o4IKhk1hQNDB34eH8zkgCKFyDbX5xLY2Sr2RStf3/4=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB4150.eurprd05.prod.outlook.com (52.135.161.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 07:49:45 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::2c23:fdba:9ce4:7397]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::2c23:fdba:9ce4:7397%7]) with mapi id 15.20.2008.007; Tue, 25 Jun 2019
 07:49:45 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v2 0/6] VAG power control improvement for sgtl5000 codec
Thread-Index: AQHVKyqOVMQ54KRKhUyEgktDhHywAw==
Date: Tue, 25 Jun 2019 07:49:45 +0000
Message-ID: <20190625074937.2621-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR10CA0001.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::11) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b592082c-aae5-4036-ce2f-08d6f941b02d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB4150; 
x-ms-traffictypediagnostic: AM6PR05MB4150:
x-microsoft-antispam-prvs: <AM6PR05MB4150189D5D3FE0DDF2B392B9F9E30@AM6PR05MB4150.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(39850400004)(136003)(346002)(376002)(189003)(199004)(6436002)(86362001)(8936002)(6116002)(3846002)(186003)(6486002)(81166006)(81156014)(102836004)(6506007)(386003)(26005)(486006)(2616005)(478600001)(44832011)(8676002)(476003)(305945005)(71190400001)(7736002)(6512007)(54906003)(2906002)(316002)(4326008)(68736007)(71200400001)(66066001)(53936002)(25786009)(50226002)(66946007)(36756003)(73956011)(64756008)(66446008)(14454004)(66556008)(1076003)(66476007)(6916009)(5660300002)(52116002)(99286004)(256004)(14444005)(1411001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB4150;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fG8wenrS1ASyMNXxEaqmp8aKTpY/yCbzzUJgAzIk9krWv9LeoAqesacu9ToypRAl1oXS9gsgPCw/pKqorqbeqcHEM6sJoDWymN2u5VlXTpCxtA0OnRaHOTb8GfTeydB+yWLULbNSIn03s2zi68n5bqy9pnpykz6dqI70CYcxeAANNkcimVU/JdKaSC2AbpB9FRemqiIJ9AiGESWFJlKdWx/eNiVKvf2PxVQZlGXM7RPYMKMcFGhCfK2aJW5Mjx7C0nE3KSIjt1uHGtpB4ho0zfIO6FdQol1FNttvrMd5NnW19BLu5t+XbGGzjAPKSfz36TwZGrGWPv2PCU30FAeRKDi8zbUlQIcroFvI0C4q6EQAWnUtvO3V3bTN9TsnrtfrZPJGTOYkzc0YO31d6sVpkD/IytdCkfHX/HxORdgO+KM=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b592082c-aae5-4036-ce2f-08d6f941b02d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 07:49:45.4509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB4150
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v2 0/6] VAG power control improvement for
	sgtl5000 codec
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


VAG power control is improved to fit the manual. This fixes as
minimum one bug: if customer muxes Headphone to Line-In right after boot
w/o playing any sound, the VAG power remains off that leads to poor
sound quality from line-in.

I.e. after boot:
- Connect sound source to Line-In jack;
- Connect headphone to HP jack;
- Run following commands:
$ amixer set 'Headphone' 80%
$ amixer set 'Headphone Mux' LINE_IN

Also this series includes fixes of non-important bugs in sgtl5000 codec
driver.

Fix patch formatting in patchset v2.


Oleksandr Suvorov (6):
  ASoC: sgtl5000: Fix definition of VAG Ramp Control
  ASoC: sgtl5000: add ADC mute control
  ASoC: sgtl5000: Fix of unmute outputs on probe
  ASoC: sgtl5000: Fix charge pump source assignment
  ASoC: Define a set of DAPM pre/post-up events
  ASoC: sgtl5000: Improve VAG power and mute control

 include/sound/soc-dapm.h    |   2 +
 sound/soc/codecs/sgtl5000.c | 250 ++++++++++++++++++++++++++++++------
 sound/soc/codecs/sgtl5000.h |   2 +-
 3 files changed, 212 insertions(+), 42 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
