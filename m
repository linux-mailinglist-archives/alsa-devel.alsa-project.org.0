Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F9D18AC6
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 15:33:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D84A1857;
	Thu,  9 May 2019 15:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D84A1857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557408830;
	bh=bEnN8L4ylu5gHNg5FfEyw3oae30aCiVDZ6H0EVLJFto=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LaQJVlLy+JttAopiCEzijrBmCYwX12fOrh6hb3B5YzFmMYYwjEAFsVoznEd1+eLhM
	 VsRebK9kgjF192ZcvNlMr9TQdjDI5XtOBh5EUNc8JruI2CMYFtVjPzaKEJxSXmD9re
	 WkbCFXLUOfd+Niejlx85JMKhSonZ7A8sZ7h+TJNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C0FAF89726;
	Thu,  9 May 2019 15:30:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15B7EF89674; Thu,  9 May 2019 15:30:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30052.outbound.protection.outlook.com [40.107.3.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 728E5F89673
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 15:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 728E5F89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="rdgXY4Sz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ccu23z7PQIRtufCGns6Zu/49zQBpnRCNdHOKoRigAh4=;
 b=rdgXY4SzJPirIRq4Q74mpjWHMuka0YBYutvPBhlfyylW95j8SAkBTtSmdxmbzp2jCendxd9ssLh0HsAv049mnUmEnDHFoOAu5E/mxUodsPCsE7KlKBcb4Tx98zBts8vzhJitaCYruj79XxJnUxb8CP90cPM6pLrcLzCKagzly5c=
Received: from VI1PR04MB4704.eurprd04.prod.outlook.com (20.177.48.157) by
 VI1PR04MB4029.eurprd04.prod.outlook.com (10.171.182.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Thu, 9 May 2019 13:30:37 +0000
Received: from VI1PR04MB4704.eurprd04.prod.outlook.com
 ([fe80::18d6:6f21:db62:4fe7]) by VI1PR04MB4704.eurprd04.prod.outlook.com
 ([fe80::18d6:6f21:db62:4fe7%2]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 13:30:36 +0000
From: Viorel Suman <viorel.suman@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Viorel Suman
 <viorel.suman@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, Julia Lawall
 <Julia.Lawall@lip6.fr>, Daniel Baluta <daniel.baluta@nxp.com>, Colin Ian King
 <colin.king@canonical.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH 2/2] ASoC: ak4458: add return value for ak4458_probe
Thread-Index: AQHVBmtiJYBm+RLPD0mXhUzjcOIfqg==
Date: Thu, 9 May 2019 13:30:36 +0000
Message-ID: <1557408607-25115-3-git-send-email-viorel.suman@nxp.com>
References: <1557408607-25115-1-git-send-email-viorel.suman@nxp.com>
In-Reply-To: <1557408607-25115-1-git-send-email-viorel.suman@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0102.eurprd04.prod.outlook.com
 (2603:10a6:803:64::37) To VI1PR04MB4704.eurprd04.prod.outlook.com
 (2603:10a6:803:52::29)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=viorel.suman@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e9f2f0d-a57c-4f72-2dca-08d6d4828539
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB4029; 
x-ms-traffictypediagnostic: VI1PR04MB4029:
x-microsoft-antispam-prvs: <VI1PR04MB40290E5697A374790139072A92330@VI1PR04MB4029.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(376002)(39860400002)(396003)(346002)(199004)(189003)(68736007)(36756003)(71200400001)(50226002)(66066001)(52116002)(2501003)(76176011)(5660300002)(8936002)(86362001)(6506007)(478600001)(71190400001)(81166006)(8676002)(386003)(81156014)(2906002)(53936002)(25786009)(4326008)(476003)(305945005)(256004)(6512007)(99286004)(7736002)(2201001)(66476007)(66556008)(64756008)(66446008)(26005)(66946007)(73956011)(110136005)(54906003)(44832011)(11346002)(446003)(486006)(14454004)(186003)(2616005)(316002)(14444005)(3846002)(6486002)(102836004)(6116002)(6436002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4029;
 H:VI1PR04MB4704.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fiMDnXA/6Rei85xSIWDK+pgKdQb2oiSxrmJenWeXT1gpN4ugu5kVbpXViYIHE5nyJ6d/oi2LB4wCHMOpt/RQRn0sf7OY6x6n2DOK02wLwHx/HhYE+WP6d5/k2b6u3XzlO6Tv3Qm3SP6d5PRzAmIWEsBvzGSO+0KoR1CKDF6mF6DC7/Nu6Gst7j6ZyxY2PgvcOY03g+9btqwacaEFqMGOB+3z8V2PGjnGiwHhPcrVHXBst7Uqg3UWr1l90bnvHyvQem9cq4iqp2GxkeDtA6A74yMctt6Rol2tASCL64LtlFZNt0ihFBx7KQYRkv9EHbCRXkbqtCUXuXfncbc+JAmHbSayXwp+6NambjYr6rJ2Wii7tG/crqCx9NIO/CyOVKIvE188ETUBVImT9HxE+NFMeKJLSrn6fzXFyGGIgyKCqnY=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9f2f0d-a57c-4f72-2dca-08d6d4828539
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 13:30:36.7929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4029
Cc: Viorel Suman <viorel.suman@gmail.com>, dl-linux-imx <linux-imx@nxp.com>
Subject: [alsa-devel] [PATCH 2/2] ASoC: ak4458: add return value for
	ak4458_probe
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

AK4458 is probed successfully even if AK4458 is not present - this
is caused by probe function returning no error on i2c access failure.
Return an error on probe if i2c access has failed.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
---
 sound/soc/codecs/ak4458.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 4795e32..d192774353 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -537,9 +537,10 @@ static void ak4458_power_on(struct ak4458_priv *ak4458)
 	}
 }
 
-static void ak4458_init(struct snd_soc_component *component)
+static int ak4458_init(struct snd_soc_component *component)
 {
 	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	/* External Mute ON */
 	if (ak4458->mute_gpiod)
@@ -547,21 +548,21 @@ static void ak4458_init(struct snd_soc_component *component)
 
 	ak4458_power_on(ak4458);
 
-	snd_soc_component_update_bits(component, AK4458_00_CONTROL1,
+	ret = snd_soc_component_update_bits(component, AK4458_00_CONTROL1,
 			    0x80, 0x80);   /* ACKS bit = 1; 10000000 */
+	if (ret < 0)
+		return ret;
 
-	ak4458_rstn_control(component, 1);
+	return ak4458_rstn_control(component, 1);
 }
 
 static int ak4458_probe(struct snd_soc_component *component)
 {
 	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
 
-	ak4458_init(component);
-
 	ak4458->fs = 48000;
 
-	return 0;
+	return ak4458_init(component);
 }
 
 static void ak4458_remove(struct snd_soc_component *component)
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
