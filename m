Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CBA1E870
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 08:45:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8014D1658;
	Wed, 15 May 2019 08:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8014D1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557902735;
	bh=lELm31qepnzEALg8lYKoFpRlSGC543Y6bXRu6LgBzlo=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pKSnlnTd6ydZ4HS3v1Sj7N1XCGRBnTh1jojR0DGYyHKCcKNpbLQ9mGofIsTMLishe
	 wi6SkKON//Gz4SKWaOito4vjD1kDN5FwPlY9aQBJglROZmc8PjJljnAP3rPQSOSyiz
	 s2ri9hr8X7DFg0F0MasglFkH8DpEVAEqINDprbHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE66BF8972D;
	Wed, 15 May 2019 08:42:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A489CF89713; Wed, 15 May 2019 08:42:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10064.outbound.protection.outlook.com [40.107.1.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04C19F89707
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 08:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04C19F89707
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="MVaTL+QZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JmSzAPQKN+QzL+RGTE9eLARP/11+3/amAwILeD9cD0=;
 b=MVaTL+QZADZBAj96oj9LhHYa+co5ksPAwBxQnFSCRbwe4o7MjY05lIFFCrMZcr/md9zjQIkLsCBJwLUPHrAV8Fw0wj+nVdyiSNBse5KiiENOJFwtGT8UDvQHHabcWcrIF5/BgJCIGWUNsmkanpPZk5UelU2b7Dce/G4fquVvCR4=
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com (20.179.253.81) by
 AM0PR04MB4513.eurprd04.prod.outlook.com (52.135.149.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Wed, 15 May 2019 06:42:23 +0000
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::659b:59f5:6a7e:1862]) by AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::659b:59f5:6a7e:1862%5]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 06:42:23 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "timur@kernel.org" <timur@kernel.org>, "nicoleotsuka@gmail.com"
 <nicoleotsuka@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH RESEND V6 2/3] ASoC: fsl_asrc: replace the process_option
 table with function
Thread-Index: AQHVCulZN6Zg9CWEL0yqCEiSG9fUHg==
Date: Wed, 15 May 2019 06:42:22 +0000
Message-ID: <7d683186c3de9314e361fd4ead42f9691968e65c.1557901312.git.shengjiu.wang@nxp.com>
References: <cover.1557901312.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1557901312.git.shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HK2PR03CA0054.apcprd03.prod.outlook.com
 (2603:1096:202:17::24) To AM0PR04MB6468.eurprd04.prod.outlook.com
 (2603:10a6:208:16e::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54625804-dfbc-4882-1f61-08d6d9007bd4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB4513; 
x-ms-traffictypediagnostic: AM0PR04MB4513:
x-microsoft-antispam-prvs: <AM0PR04MB45132BCF00D9061638CA1304E3090@AM0PR04MB4513.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(136003)(396003)(346002)(376002)(199004)(189003)(14454004)(26005)(71200400001)(71190400001)(110136005)(52116002)(54906003)(14444005)(256004)(5660300002)(316002)(3846002)(102836004)(68736007)(66946007)(73956011)(2906002)(64756008)(66556008)(66476007)(66446008)(476003)(186003)(76176011)(486006)(8936002)(81166006)(6512007)(8676002)(6486002)(2616005)(81156014)(50226002)(66066001)(4326008)(7736002)(11346002)(305945005)(6436002)(6116002)(36756003)(446003)(25786009)(6506007)(386003)(99286004)(2501003)(53936002)(86362001)(2201001)(118296001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB4513;
 H:AM0PR04MB6468.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eCH2kd5IHfFb7geOIF0azuof49DLaePslAPl0ZXdRl3QtLKv/r6C4Y5wTJRmsZ/Gyt0ivsvscYJananxnO73HXp1PZ/WNX7ZLDUKFjka1KLOI6CrFhzubz0JA6q10ldOTPlc0qm8FHVUqz15BlDlHuaqTaLxEIs/dGhmppxrTVH6oDSOsKvY48KGY683yZjWyevcuCBwkoJBcHAetq7A830n5aR9LGuKCbY2DUtLhu+u4wmLAQeAC+WCClgjiwKWsBIUe9DXchCIJBMmKi4tXq8493oWj/Pb7Qw0sUHdM2Zs2dMrUeuhLeiPoKHSn9OTpzcgy78Ff63cYRYYcNJPQLTnUToUoyzPSXS5Ump2ud1IIYMiEKJoTcM14xLFtv+LkuRXtXg88aXHEXCblQRCGQKd3X3F0AoZyVkDbx6HzM8=
Content-ID: <5C0AFBBD663E6B41ADF889F596EA3EFA@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54625804-dfbc-4882-1f61-08d6d9007bd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 06:42:22.4568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4513
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [PATCH RESEND V6 2/3] ASoC: fsl_asrc: replace the
 process_option table with function
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

When we want to support more sample rate, for example 12kHz/24kHz
we need update the process_option table, if we want to support more
sample rate next time, the table need to be updated again. which
is not flexible.

We got a function fsl_asrc_sel_proc to replace the table, which can
give the pre-processing and post-processing options according to
the sample rate.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 71 +++++++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 20 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index ea035c12a325..a8d6710f2541 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -26,24 +26,6 @@
 #define pair_dbg(fmt, ...) \
 	dev_dbg(&asrc_priv->pdev->dev, "Pair %c: " fmt, 'A' + index, ##__VA_ARGS__)
 
-/* Sample rates are aligned with that defined in pcm.h file */
-static const u8 process_option[][12][2] = {
-	/* 8kHz 11.025kHz 16kHz 22.05kHz 32kHz 44.1kHz 48kHz   64kHz   88.2kHz 96kHz   176kHz  192kHz */
-	{{0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0},},	/* 5512Hz */
-	{{0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0},},	/* 8kHz */
-	{{0, 2}, {0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0},},	/* 11025Hz */
-	{{1, 2}, {0, 2}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0},},	/* 16kHz */
-	{{1, 2}, {1, 2}, {0, 2}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0},},	/* 22050Hz */
-	{{1, 2}, {2, 1}, {2, 1}, {0, 2}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0}, {0, 0},},	/* 32kHz */
-	{{2, 2}, {2, 2}, {2, 1}, {2, 1}, {0, 2}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0},},	/* 44.1kHz */
-	{{2, 2}, {2, 2}, {2, 1}, {2, 1}, {0, 2}, {0, 2}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0},},	/* 48kHz */
-	{{2, 2}, {2, 2}, {2, 2}, {2, 1}, {1, 2}, {0, 2}, {0, 2}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 0},},	/* 64kHz */
-	{{2, 2}, {2, 2}, {2, 2}, {2, 2}, {1, 2}, {1, 2}, {1, 2}, {1, 1}, {1, 1}, {1, 1}, {1, 1}, {1, 1},},	/* 88.2kHz */
-	{{2, 2}, {2, 2}, {2, 2}, {2, 2}, {1, 2}, {1, 2}, {1, 2}, {1, 1}, {1, 1}, {1, 1}, {1, 1}, {1, 1},},	/* 96kHz */
-	{{2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 1}, {2, 1}, {2, 1}, {2, 1}, {2, 1},},	/* 176kHz */
-	{{2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 2}, {2, 1}, {2, 1}, {2, 1}, {2, 1}, {2, 1},},	/* 192kHz */
-};
-
 /* Corresponding to process_option */
 static int supported_input_rate[] = {
 	5512, 8000, 11025, 16000, 22050, 32000, 44100, 48000, 64000, 88200,
@@ -79,6 +61,52 @@ static unsigned char output_clk_map_imx53[] = {
 
 static unsigned char *clk_map[2];
 
+/**
+ * Select the pre-processing and post-processing options
+ * Make sure to exclude following unsupported cases before
+ * calling this function:
+ * 1) inrate > 8.125 * outrate
+ * 2) inrate > 16.125 * outrate
+ *
+ * inrate: input sample rate
+ * outrate: output sample rate
+ * pre_proc: return value for pre-processing option
+ * post_proc: return value for post-processing option
+ */
+static void fsl_asrc_sel_proc(int inrate, int outrate,
+			     int *pre_proc, int *post_proc)
+{
+	bool post_proc_cond2;
+	bool post_proc_cond0;
+
+	/* select pre_proc between [0, 2] */
+	if (inrate * 8 > 33 * outrate)
+		*pre_proc = 2;
+	else if (inrate * 8 > 15 * outrate) {
+		if (inrate > 152000)
+			*pre_proc = 2;
+		else
+			*pre_proc = 1;
+	} else if (inrate < 76000)
+		*pre_proc = 0;
+	else if (inrate > 152000)
+		*pre_proc = 2;
+	else
+		*pre_proc = 1;
+
+	/* Condition for selection of post-processing */
+	post_proc_cond2 = (inrate * 15 > outrate * 16 && outrate < 56000) ||
+			  (inrate > 56000 && outrate < 56000);
+	post_proc_cond0 = inrate * 23 < outrate * 8;
+
+	if (post_proc_cond2)
+		*post_proc = 2;
+	else if (post_proc_cond0)
+		*post_proc = 0;
+	else
+		*post_proc = 1;
+}
+
 /**
  * Request ASRC pair
  *
@@ -239,6 +267,7 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 	u32 inrate, outrate, indiv, outdiv;
 	u32 clk_index[2], div[2];
 	int in, out, channels;
+	int pre_proc, post_proc;
 	struct clk *clk;
 	bool ideal;
 
@@ -377,11 +406,13 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 			   ASRCTR_IDRi_MASK(index) | ASRCTR_USRi_MASK(index),
 			   ASRCTR_IDR(index) | ASRCTR_USR(index));
 
+	fsl_asrc_sel_proc(inrate, outrate, &pre_proc, &post_proc);
+
 	/* Apply configurations for pre- and post-processing */
 	regmap_update_bits(asrc_priv->regmap, REG_ASRCFG,
 			   ASRCFG_PREMODi_MASK(index) |	ASRCFG_POSTMODi_MASK(index),
-			   ASRCFG_PREMOD(index, process_option[in][out][0]) |
-			   ASRCFG_POSTMOD(index, process_option[in][out][1]));
+			   ASRCFG_PREMOD(index, pre_proc) |
+			   ASRCFG_POSTMOD(index, post_proc));
 
 	return fsl_asrc_set_ideal_ratio(pair, inrate, outrate);
 }
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
