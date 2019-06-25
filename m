Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E4C52569
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 09:53:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16E441670;
	Tue, 25 Jun 2019 09:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16E441670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561449206;
	bh=tZcYVxVnyqf3CEHqnMgx2Xx7bALIteHoUB5fNb4/WNM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ue0I+sQoKwz0Anl5Wm9ilkm3ZOkhgOmdWU9cUD1SNSKCVr8Y1+AeuYEQHFSocQyHH
	 wNQueXcYvlAOUy+47uDL18cfP9gb4B4MiA3DOW/5JpcV2Z3PuGfKZYf2h3aVbVAzTN
	 TMgX9R4SJSoSRuM2dtEzN9JTXIL3VNrQ53MnENOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF60EF89735;
	Tue, 25 Jun 2019 09:50:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB503F89721; Tue, 25 Jun 2019 09:49:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140137.outbound.protection.outlook.com [40.107.14.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D845EF896FD
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 09:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D845EF896FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="JBO9nOnr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gf5nvvR9LrPigaH67L4LIaaoXletuhguZISx8ggsOa4=;
 b=JBO9nOnrs8rDGBf8WFyddXyiP5G7Qmq4MkiF7LViPV7c1S1UCHHtbj5/dTBaUqA9/97BC/fzXrXzo468HphNjNrbdq7L3QAj5KgJYfVTPM6rm8QosmkT22M6REyajduoZ4umxMltNhkowPenRxgUoDwWRmQM96QG6TVWZdA18I0=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB5352.eurprd05.prod.outlook.com (20.177.197.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Tue, 25 Jun 2019 07:49:51 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::2c23:fdba:9ce4:7397]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::2c23:fdba:9ce4:7397%7]) with mapi id 15.20.2008.007; Tue, 25 Jun 2019
 07:49:51 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v2 3/6] ASoC: sgtl5000: Fix of unmute outputs on probe
Thread-Index: AQHVKyqRNsGfUx+RZUSiM76rxvu/oA==
Date: Tue, 25 Jun 2019 07:49:51 +0000
Message-ID: <20190625074937.2621-4-oleksandr.suvorov@toradex.com>
References: <20190625074937.2621-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190625074937.2621-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0402CA0005.eurprd04.prod.outlook.com
 (2603:10a6:208:15::18) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16ec7df5-ea4b-435a-04af-08d6f941b42c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB5352; 
x-ms-traffictypediagnostic: AM6PR05MB5352:
x-microsoft-antispam-prvs: <AM6PR05MB5352C30DCAEC2348EBA949CDF9E30@AM6PR05MB5352.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(396003)(136003)(39850400004)(376002)(199004)(189003)(26005)(5660300002)(1076003)(54906003)(71190400001)(1411001)(71200400001)(2906002)(36756003)(305945005)(86362001)(53936002)(6486002)(8676002)(478600001)(6512007)(25786009)(50226002)(14454004)(6436002)(6116002)(3846002)(7736002)(316002)(68736007)(44832011)(486006)(476003)(2616005)(66556008)(81166006)(4326008)(6916009)(256004)(66476007)(81156014)(64756008)(66446008)(8936002)(66946007)(73956011)(14444005)(386003)(102836004)(6506007)(52116002)(11346002)(446003)(76176011)(99286004)(186003)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB5352;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e8vGEqrjFDSxcrrFXRbFXdP2cYQe2SN4412HMLbTB5ISTREtw9IBGmAS7ohwtUF/otKOACXlgphI7blzcHRmyKFhJwY03MqJMe9WxylMW6GHHdPbw1BuQi/LshaA2uYTbzx6/R9wmiqxSQIWlZaEUW7j21Lwg6CV0bzFlZ2G2MbN0R7sGOTAWXkPZceGJwVpzJLcKB/eB70KuNf/1iqiOpAdsTGjSFUqiit0gzxraA6hI/iKaXY2Lj0FyzINrUFazT/+74qIIBBbue3vdSntXk5X/JTyT+Wdi/gxo7PqUm6OOUIBA4XrSXQ6C17lesQk5itDMU+cveLSV/14IfkgActqTQSUV19ODWNiYPPb+7J1iauvyJNElEdlgS/u8iJhm3LH/v8Gsvl6vsDkD6Dwh81pam2ogbXxSd4qjPpg1nU=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ec7df5-ea4b-435a-04af-08d6f941b42c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 07:49:51.2326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5352
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v2 3/6] ASoC: sgtl5000: Fix of unmute outputs
	on probe
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

To enable "zero cross detect" for ADC/HP, change
HP_ZCD_EN/ADC_ZCD_EN bits only instead of writing the whole
CHIP_ANA_CTRL register.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---

 sound/soc/codecs/sgtl5000.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index bb58c997c6914..e813a37910af4 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1289,6 +1289,7 @@ static int sgtl5000_probe(struct snd_soc_component *component)
 	int ret;
 	u16 reg;
 	struct sgtl5000_priv *sgtl5000 = snd_soc_component_get_drvdata(component);
+	unsigned int zcd_mask = SGTL5000_HP_ZCD_EN | SGTL5000_ADC_ZCD_EN;
 
 	/* power up sgtl5000 */
 	ret = sgtl5000_set_power_regs(component);
@@ -1316,9 +1317,8 @@ static int sgtl5000_probe(struct snd_soc_component *component)
 	       0x1f);
 	snd_soc_component_write(component, SGTL5000_CHIP_PAD_STRENGTH, reg);
 
-	snd_soc_component_write(component, SGTL5000_CHIP_ANA_CTRL,
-			SGTL5000_HP_ZCD_EN |
-			SGTL5000_ADC_ZCD_EN);
+	snd_soc_component_update_bits(component, SGTL5000_CHIP_ANA_CTRL,
+		zcd_mask, zcd_mask);
 
 	snd_soc_component_update_bits(component, SGTL5000_CHIP_MIC_CTRL,
 			SGTL5000_BIAS_R_MASK,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
