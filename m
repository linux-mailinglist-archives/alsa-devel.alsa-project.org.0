Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF82F16562
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 16:08:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85884180A;
	Tue,  7 May 2019 16:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85884180A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557238126;
	bh=zweplhvbQAytXazFEtOjCKvYPMmxJPlj0PiEiJ6xLNI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qnCCoIE307uriWwb+QCXNwl287Iay8qmsXD/833HE0X2Ryb2M8bmfWePwnhY7ntkT
	 W9pn9p7+GFm/qT4LI6HvuS4uQ9PQcW9x07UXXrqa6pKQLfgQ4i+QSHZTUGui3L4N7v
	 NKYo/IQF15QsJj9xZtW1rIDzQv+I2Iut/V4c6Q60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1EAFF89671;
	Tue,  7 May 2019 16:07:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55875F89674; Tue,  7 May 2019 16:06:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60047.outbound.protection.outlook.com [40.107.6.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CD8BF807B5
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 16:06:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CD8BF807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="iCOuUwdz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHwVkI/rL8cUi4WR5Q4QgjbWA04b5Cj9H2DLGKwWRGk=;
 b=iCOuUwdzIBBL/YlOvlhMdRFsoWhwX4EVLJkqDCQwrXeYzH/PRbWkTfX0Kv7RCvqBszFe3bjDcJ01zqQZSlup30K259GIuEKxZMlmwnpGQRuEZ+m+HIsKMSU8AUQQowE09U3MklX0it9iotdRNx4AZkTrsGkrO3djI3mZS65Vkr4=
Received: from VI1PR0402MB3357.eurprd04.prod.outlook.com (52.134.1.18) by
 VI1PR0402MB2863.eurprd04.prod.outlook.com (10.175.23.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 14:06:52 +0000
Received: from VI1PR0402MB3357.eurprd04.prod.outlook.com
 ([fe80::c16b:662d:9299:6be6]) by VI1PR0402MB3357.eurprd04.prod.outlook.com
 ([fe80::c16b:662d:9299:6be6%6]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 14:06:52 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Thread-Topic: [RESEND PATCH v3] ASoC: fsl_sai: Move clock operation to PM
 runtime
Thread-Index: AQHVBN4eGvra8iOf9kOYNpic21nAcg==
Date: Tue, 7 May 2019 14:06:52 +0000
Message-ID: <20190507140632.15996-1-daniel.baluta@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0302CA0003.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::13) To VI1PR0402MB3357.eurprd04.prod.outlook.com
 (2603:10a6:803:2::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e20964f4-a6d1-4ba5-f638-08d6d2f54113
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB2863; 
x-ms-traffictypediagnostic: VI1PR0402MB2863:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR0402MB286305F44D3A59D9F12C7B9FF9310@VI1PR0402MB2863.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:203;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(396003)(346002)(39860400002)(366004)(189003)(199004)(2351001)(86362001)(1730700003)(6512007)(6306002)(8676002)(81166006)(81156014)(36756003)(44832011)(25786009)(99286004)(71200400001)(71190400001)(4326008)(52116002)(66476007)(64756008)(66556008)(66446008)(486006)(7736002)(476003)(73956011)(2616005)(66946007)(305945005)(386003)(5640700003)(2501003)(966005)(256004)(186003)(5660300002)(2906002)(26005)(6506007)(6436002)(54906003)(316002)(50226002)(1076003)(478600001)(68736007)(3846002)(66066001)(53936002)(8936002)(6486002)(6916009)(14454004)(6116002)(14444005)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB2863;
 H:VI1PR0402MB3357.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2Xr8G6GS41cuYOW7fEnZ4Z0leyG1GhWEcGEE5L8pDuI9ffkFP37lywtoC8HfnJO4Vf10356a2BjwlBmnBetIU2sO0uA9+mLsBcZw8QNwWPU+HkdQOZg75tJmCwd9c98PWmuRUy7eGOEfLOB5hof7zYHH3I3sE9FI59OICIdHZkDVgUug6t1VuKYQ+5lTCotq/OjJ3wnbM+X5088iBhGLv1k7gKE2QKtrG8DA0ZmBRzRGL0WCpXi9EVozwJEsEpYYjh+B4Dx6nMRR4vWxeOV9iZHtGxTmbnxmup3MSqL1pcWG+MVnrwnhmhp7Q/8EYlc6V3jqWQGVKL9KN+u/PKG8CWtzOsNd7WeFL/CQKcT+Up12VRTigfmANV4A+xaGvol+p8G34HI9NQaj+1CtoTz8H8PiJkq6Z6f2HeFLUaHUVfo=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e20964f4-a6d1-4ba5-f638-08d6d2f54113
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 14:06:52.2973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2863
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>
Subject: [alsa-devel] [RESEND PATCH v3] ASoC: fsl_sai: Move clock operation
	to PM runtime
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

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Turn off/on clocks when device enters suspend/resume. This
can help saving power.

As a further optimization, we turn off/on mclk only when SAI
is in master mode because otherwise mclk is externally provided.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Viorel Suman <viorel.suman@nxp.com>
---
- initially part of this 3 patch series https://patchwork.kernel.org/cover/10911519/
- first 2 patches were merged

 sound/soc/fsl/fsl_sai.c | 54 +++++++++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 8593269156bd..d58cc3ae90d8 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -596,15 +596,8 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	struct device *dev = &sai->pdev->dev;
 	int ret;
 
-	ret = clk_prepare_enable(sai->bus_clk);
-	if (ret) {
-		dev_err(dev, "failed to enable bus clock: %d\n", ret);
-		return ret;
-	}
-
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx), FSL_SAI_CR3_TRCE,
 			   FSL_SAI_CR3_TRCE);
 
@@ -621,8 +614,6 @@ static void fsl_sai_shutdown(struct snd_pcm_substream *substream,
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx), FSL_SAI_CR3_TRCE, 0);
-
-	clk_disable_unprepare(sai->bus_clk);
 }
 
 static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
@@ -935,6 +926,14 @@ static int fsl_sai_runtime_suspend(struct device *dev)
 {
 	struct fsl_sai *sai = dev_get_drvdata(dev);
 
+	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_CAPTURE))
+		clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[0]]);
+
+	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_PLAYBACK))
+		clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[1]]);
+
+	clk_disable_unprepare(sai->bus_clk);
+
 	regcache_cache_only(sai->regmap, true);
 	regcache_mark_dirty(sai->regmap);
 
@@ -944,6 +943,25 @@ static int fsl_sai_runtime_suspend(struct device *dev)
 static int fsl_sai_runtime_resume(struct device *dev)
 {
 	struct fsl_sai *sai = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(sai->bus_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable bus clock: %d\n", ret);
+		return ret;
+	}
+
+	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_PLAYBACK)) {
+		ret = clk_prepare_enable(sai->mclk_clk[sai->mclk_id[1]]);
+		if (ret)
+			goto disable_bus_clk;
+	}
+
+	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_CAPTURE)) {
+		ret = clk_prepare_enable(sai->mclk_clk[sai->mclk_id[0]]);
+		if (ret)
+			goto disable_tx_clk;
+	}
 
 	regcache_cache_only(sai->regmap, false);
 	regmap_write(sai->regmap, FSL_SAI_TCSR, FSL_SAI_CSR_SR);
@@ -951,7 +969,23 @@ static int fsl_sai_runtime_resume(struct device *dev)
 	usleep_range(1000, 2000);
 	regmap_write(sai->regmap, FSL_SAI_TCSR, 0);
 	regmap_write(sai->regmap, FSL_SAI_RCSR, 0);
-	return regcache_sync(sai->regmap);
+
+	ret = regcache_sync(sai->regmap);
+	if (ret)
+		goto disable_rx_clk;
+
+	return 0;
+
+disable_rx_clk:
+	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_CAPTURE))
+		clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[0]]);
+disable_tx_clk:
+	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_PLAYBACK))
+		clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[1]]);
+disable_bus_clk:
+	clk_disable_unprepare(sai->bus_clk);
+
+	return ret;
 }
 #endif /* CONFIG_PM */
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
