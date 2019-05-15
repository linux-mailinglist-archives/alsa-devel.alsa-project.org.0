Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC82B1E873
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 08:45:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37AFE1664;
	Wed, 15 May 2019 08:45:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37AFE1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557902759;
	bh=RLMhzVbZLBINY5qkO7G0I5O+jndATdq1R0UMXAsb/Bw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ow9iJVymEH6PlMImm2v0Bx2nRPJH34FQNMOGZb4PgNXiPO8efc7GQBgsmx66HYvo0
	 m2l4tEGm4TBh7x2oDG9JMSjsp8yZRQysui+rIDwoNAnoBGoL9Ad00fQ54s3AO9US6G
	 sMK8JCTDu8MMyqxDMU+DDnxoubaxasoD/T78yhNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D044BF89732;
	Wed, 15 May 2019 08:42:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DA8CF8972A; Wed, 15 May 2019 08:42:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10064.outbound.protection.outlook.com [40.107.1.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 540D7F806E5
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 08:42:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 540D7F806E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="qJTwKJck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrBCJR/pi4l5CwgpA5jeKYkdmYQ/+HUzRLqfZvrCOrs=;
 b=qJTwKJckGQKCYhdxK97k+GjKVaCkF/ppl7h3+lsuMRB8HDWNIjIOD5yqOnrjcg5chBceLf+TdxItHPiyc6k5tFS+IwUTAoVaLHUZuF74Rcnngrv4eUJxRxFNttI0o98PcvSEADIkyyPFS4uVHe7TiIFNe5aF04NbhOdWzwgAwbA=
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com (20.179.253.81) by
 AM0PR04MB4513.eurprd04.prod.outlook.com (52.135.149.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Wed, 15 May 2019 06:42:26 +0000
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::659b:59f5:6a7e:1862]) by AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::659b:59f5:6a7e:1862%5]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 06:42:26 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "timur@kernel.org" <timur@kernel.org>, "nicoleotsuka@gmail.com"
 <nicoleotsuka@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH RESEND V6 3/3] ASoC: fsl_asrc: Unify the supported input
 and output rate
Thread-Index: AQHVCulbnhsXIguBqEy1UhZj9WFJCA==
Date: Wed, 15 May 2019 06:42:26 +0000
Message-ID: <39916109c570791be514db4a3a7793a9467d6484.1557901312.git.shengjiu.wang@nxp.com>
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
x-ms-office365-filtering-correlation-id: 685db196-e528-402b-df45-08d6d9007e2f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB4513; 
x-ms-traffictypediagnostic: AM0PR04MB4513:
x-microsoft-antispam-prvs: <AM0PR04MB4513E8A90C5CEE5F9FB2BBA3E3090@AM0PR04MB4513.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(136003)(396003)(346002)(376002)(199004)(189003)(14454004)(19627235002)(26005)(71200400001)(71190400001)(110136005)(52116002)(54906003)(14444005)(256004)(5660300002)(316002)(3846002)(102836004)(68736007)(66946007)(73956011)(2906002)(64756008)(66556008)(66476007)(66446008)(476003)(186003)(76176011)(486006)(8936002)(81166006)(6512007)(8676002)(6486002)(2616005)(81156014)(50226002)(66066001)(4326008)(7736002)(11346002)(305945005)(6436002)(6116002)(36756003)(446003)(25786009)(6506007)(386003)(99286004)(2501003)(53936002)(86362001)(2201001)(118296001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB4513;
 H:AM0PR04MB6468.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LXkL7SIfJ0ns2doBVUrp3zZDYVTy56sFGRZEXPNYSNqKUwFDPZJdQsIL/JI9y9yxlUpLrvEGpIM3gkFH397tBT1AMKIAx0KWJntzkv02ZxRxRPaZ+TUYIPG6hqf7nRomyQcXPE8q11d8wxb8BB6qy4I26zXTmlRh9QRWq4Qts7CH1wEFFiF0r3oOTQO8J5Vzo2aF+kmPrLZJoMYLNQPpRa48XTzPkSLL7wVP0jKI7C45vmo9stUzqBaQddENBZeKQoSAj6gJlLfvdIerTnp9LBmoEh4Kx0xrHtUj9wItZP9+n6FpHNDEE1gHbj2e7QILSwmasWZB5jPU1gX0gDNXUbo6FFEsE9jr4fyMNtrX7LDM6PzM0a6TKo3Km/BYAr80+KxR/sfc3sIBpyfT7Z2aBvHDvQWvbf6tHTRZ/jyyDm8=
Content-ID: <CAEF29172E4829499F5499A0F3141F40@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685db196-e528-402b-df45-08d6d9007e2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 06:42:26.3465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4513
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [PATCH RESEND V6 3/3] ASoC: fsl_asrc: Unify the
 supported input and output rate
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

Unify the supported input and output rate, add the
12kHz/24kHz/128kHz to the support list

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index a8d6710f2541..cbbf6257f08a 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -27,13 +27,14 @@
 	dev_dbg(&asrc_priv->pdev->dev, "Pair %c: " fmt, 'A' + index, ##__VA_ARGS__)
 
 /* Corresponding to process_option */
-static int supported_input_rate[] = {
-	5512, 8000, 11025, 16000, 22050, 32000, 44100, 48000, 64000, 88200,
-	96000, 176400, 192000,
+static unsigned int supported_asrc_rate[] = {
+	5512, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000,
+	64000, 88200, 96000, 128000, 176400, 192000,
 };
 
-static int supported_asrc_rate[] = {
-	8000, 11025, 16000, 22050, 32000, 44100, 48000, 64000, 88200, 96000, 176400, 192000,
+static struct snd_pcm_hw_constraint_list fsl_asrc_rate_constraints = {
+	.count = ARRAY_SIZE(supported_asrc_rate),
+	.list = supported_asrc_rate,
 };
 
 /**
@@ -293,11 +294,11 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 	ideal = config->inclk == INCLK_NONE;
 
 	/* Validate input and output sample rates */
-	for (in = 0; in < ARRAY_SIZE(supported_input_rate); in++)
-		if (inrate == supported_input_rate[in])
+	for (in = 0; in < ARRAY_SIZE(supported_asrc_rate); in++)
+		if (inrate == supported_asrc_rate[in])
 			break;
 
-	if (in == ARRAY_SIZE(supported_input_rate)) {
+	if (in == ARRAY_SIZE(supported_asrc_rate)) {
 		pair_err("unsupported input sample rate: %dHz\n", inrate);
 		return -EINVAL;
 	}
@@ -311,7 +312,7 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 		return -EINVAL;
 	}
 
-	if ((outrate >= 8000 && outrate <= 30000) &&
+	if ((outrate >= 5512 && outrate <= 30000) &&
 	    (outrate > 24 * inrate || inrate > 8 * outrate)) {
 		pair_err("exceed supported ratio range [1/24, 8] for \
 				inrate/outrate: %d/%d\n", inrate, outrate);
@@ -486,7 +487,9 @@ static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
 		snd_pcm_hw_constraint_step(substream->runtime, 0,
 					   SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 
-	return 0;
+
+	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+			SNDRV_PCM_HW_PARAM_RATE, &fsl_asrc_rate_constraints);
 }
 
 static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
@@ -599,7 +602,6 @@ static int fsl_asrc_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
-#define FSL_ASRC_RATES		 SNDRV_PCM_RATE_8000_192000
 #define FSL_ASRC_FORMATS	(SNDRV_PCM_FMTBIT_S24_LE | \
 				 SNDRV_PCM_FMTBIT_S16_LE | \
 				 SNDRV_PCM_FMTBIT_S20_3LE)
@@ -610,14 +612,18 @@ static struct snd_soc_dai_driver fsl_asrc_dai = {
 		.stream_name = "ASRC-Playback",
 		.channels_min = 1,
 		.channels_max = 10,
-		.rates = FSL_ASRC_RATES,
+		.rate_min = 5512,
+		.rate_max = 192000,
+		.rates = SNDRV_PCM_RATE_KNOT,
 		.formats = FSL_ASRC_FORMATS,
 	},
 	.capture = {
 		.stream_name = "ASRC-Capture",
 		.channels_min = 1,
 		.channels_max = 10,
-		.rates = FSL_ASRC_RATES,
+		.rate_min = 5512,
+		.rate_max = 192000,
+		.rates = SNDRV_PCM_RATE_KNOT,
 		.formats = FSL_ASRC_FORMATS,
 	},
 	.ops = &fsl_asrc_dai_ops,
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
