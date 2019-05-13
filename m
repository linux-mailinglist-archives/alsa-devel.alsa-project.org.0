Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F38A41B3A3
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 12:05:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83B4116CD;
	Mon, 13 May 2019 12:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83B4116CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557741956;
	bh=DlVhPkVqvubsPCUI0FGYO5k2NyQvYhwuKjbyFwz7tJM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X7b4d5woL16VsH+0HWmYKT8EK93lusT+hdyqMOuaEzvJ+W2pgOcpVj19vubqs+PA9
	 w120U1ylBYJAfgmLjlCRogQxgh0hgwYjUZl27mfkSxyVgaOg/71H/C2NH4QYzHAVCf
	 wk+zs3fYfVNmeWc9iRlA20RvVPKSaTgpQ5NTbU6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8E9DF8072A;
	Mon, 13 May 2019 12:02:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8ED61F8968A; Mon, 13 May 2019 12:02:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80044.outbound.protection.outlook.com [40.107.8.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3CB5F89633
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 12:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3CB5F89633
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="EC+mOskp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0T9VWgh602kpcI+RpnlVv1QjadhoZseZrLTppVQ4k2E=;
 b=EC+mOskpBCJOFENEOn2o0301aDxeSr7tb9E1eNrPmM5SKSez8DGNh/yxaMNFdExtigTDv63+V3uZ/H5WX5IR+hQ7pnSiIjdc6XsmCNkEk19O61algn57txd7ECFLjONBVWuKMWgTRQso4ZMO2yvS6iReIyfg7N6SMCHzZzZATz0=
Received: from VI1PR04MB4704.eurprd04.prod.outlook.com (20.177.48.157) by
 VI1PR04MB4800.eurprd04.prod.outlook.com (20.177.48.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Mon, 13 May 2019 10:02:44 +0000
Received: from VI1PR04MB4704.eurprd04.prod.outlook.com
 ([fe80::18d6:6f21:db62:4fe7]) by VI1PR04MB4704.eurprd04.prod.outlook.com
 ([fe80::18d6:6f21:db62:4fe7%2]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 10:02:44 +0000
From: Viorel Suman <viorel.suman@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Viorel Suman
 <viorel.suman@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Julia Lawall <Julia.Lawall@lip6.fr>, Colin Ian King
 <colin.king@canonical.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH V2 2/2] ASoC: ak4458: add return value for ak4458_probe
Thread-Index: AQHVCXMCzF054fnn0U+h7l73qDbc+A==
Date: Mon, 13 May 2019 10:02:44 +0000
Message-ID: <1557741724-6859-3-git-send-email-viorel.suman@nxp.com>
References: <1557741724-6859-1-git-send-email-viorel.suman@nxp.com>
In-Reply-To: <1557741724-6859-1-git-send-email-viorel.suman@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0227.eurprd08.prod.outlook.com
 (2603:10a6:802:15::36) To VI1PR04MB4704.eurprd04.prod.outlook.com
 (2603:10a6:803:52::29)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=viorel.suman@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36a22c84-9c01-49df-a9d2-08d6d78a24bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB4800; 
x-ms-traffictypediagnostic: VI1PR04MB4800:
x-microsoft-antispam-prvs: <VI1PR04MB480041252B0CE940802B877A920F0@VI1PR04MB4800.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(136003)(346002)(366004)(39860400002)(189003)(199004)(486006)(44832011)(446003)(66066001)(8936002)(8676002)(36756003)(4326008)(73956011)(66946007)(2501003)(86362001)(14454004)(478600001)(26005)(2201001)(102836004)(11346002)(476003)(2616005)(186003)(66446008)(64756008)(66556008)(66476007)(5660300002)(386003)(6506007)(305945005)(54906003)(7736002)(6116002)(316002)(110136005)(2906002)(99286004)(52116002)(25786009)(76176011)(6512007)(71200400001)(71190400001)(68736007)(81156014)(50226002)(81166006)(14444005)(256004)(53936002)(3846002)(6436002)(6486002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4800;
 H:VI1PR04MB4704.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ea/HqAHvS8Vx+qgg9X04zTeVjgKMhnokOT1Xb74nLEz7ps400r81QWk1XIf5Are49cx9doUEAQIbdlXe6Enw2k0X4yFeI67DXHA3upYxtAsZWTAuc5TJHMJy5Ad9oMNgOVD1pp1StuJCxYTZGJJbRAn4qmS7O/lDBrFjVabsDX9ktDtoaSeAjGgqBeQ2E8lclpVFCGHBG+/Pc+AevgztwovOclxtyuN2i18BBbvBRYvtUHACu7TlqlisdMFN5GBGAXcupmYHwbC6T3ht6O7y7qVR9EnvFSanON3Tf7o7nRd61UYL3W6/S3mBpDKWHGxTtupiIvO6xQohpzd7Bp5hddqCTScm0+R3tL1UM6fKSOJaVLy2PmseglmAG/HOcbNpqloGI7QCFmedovEln3w7hLcAMM+bQHPOG4lengdnFi0=
Content-ID: <C61FD3D585FC4C449B7408E138CAF8C6@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a22c84-9c01-49df-a9d2-08d6d78a24bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 10:02:44.3253 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4800
Cc: Viorel Suman <viorel.suman@gmail.com>, dl-linux-imx <linux-imx@nxp.com>
Subject: [alsa-devel] [PATCH V2 2/2] ASoC: ak4458: add return value for
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
index baf990a..7156215 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -539,9 +539,10 @@ static void ak4458_power_on(struct ak4458_priv *ak4458)
 	}
 }
 
-static void ak4458_init(struct snd_soc_component *component)
+static int ak4458_init(struct snd_soc_component *component)
 {
 	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	/* External Mute ON */
 	if (ak4458->mute_gpiod)
@@ -549,21 +550,21 @@ static void ak4458_init(struct snd_soc_component *component)
 
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
