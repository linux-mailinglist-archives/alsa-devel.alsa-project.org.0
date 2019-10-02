Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3372EC86D3
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 12:59:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A874B1692;
	Wed,  2 Oct 2019 12:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A874B1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570013944;
	bh=3c+IeaY7f4EVFxsVD0JBj4ta1DFMmZkuq6drm+WVbDE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EHkh0q0x1Q9stMzhO/hkDewd/YrSrOv9xGzr1sg8AhieixAHZWob8c4vOmuc1btML
	 lnPvwWmvBgdYvsXdhN/skUVsaDDRqT11puR01yqaYdUyDmdF7i+GluGPmGyX05Fazv
	 cExjjpDLcf7xk+ue6dYFV5jUhtSXap64BXLmMq74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 328A8F805FC;
	Wed,  2 Oct 2019 12:57:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C5E5F805FA; Wed,  2 Oct 2019 12:57:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43D2FF80377
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 12:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D2FF80377
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="RYd4qBpK"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191002105712euoutp01264b0fdad174609a27542d12f78af259~Jz0MSMwNS1365313653euoutp017
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 10:57:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191002105712euoutp01264b0fdad174609a27542d12f78af259~Jz0MSMwNS1365313653euoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1570013832;
 bh=JKUgJmIBdrp6LGKbDKmIjCJNaR3zlarn3qoVxpc53Xs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RYd4qBpKdB69nIY57AffDfLjcT6ttvloxu0DtQAnRsv3hqTj4om22Tf03t/Mmv2DN
 PNsNvW1YGzlvHe5iscv62QThCji//YXVevuCiWRPBjoFiomJ7vcxw99gk6AFlqWajv
 cG7+b/58vMF1Z5ItmuzD93tphPwbSWdxjd7NyBGU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191002105711eucas1p1b532f453b23420a69b6070ecae32c799~Jz0MBz19g1834918349eucas1p1b;
 Wed,  2 Oct 2019 10:57:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 50.4F.04469.782849D5; Wed,  2
 Oct 2019 11:57:11 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191002105711eucas1p199322dc928a0ea4724fe0e0f5e6cb156~Jz0LxfDlz1786817868eucas1p1D;
 Wed,  2 Oct 2019 10:57:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191002105711eusmtrp1ad17d5b1849c365a52fc32651664bc0a~Jz0Lw5jtN0038900389eusmtrp1b;
 Wed,  2 Oct 2019 10:57:11 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-af-5d9482871dd9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8F.15.04117.782849D5; Wed,  2
 Oct 2019 11:57:11 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191002105710eusmtip2b1cc63df16db8b23a331c650adc51076~Jz0LPPKeK0236902369eusmtip23;
 Wed,  2 Oct 2019 10:57:10 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org
Date: Wed,  2 Oct 2019 12:56:51 +0200
Message-Id: <20191002105652.24821-2-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002105652.24821-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djPc7rtTVNiDVa2GlhcuXiIyWLjjPWs
 FlMfPmGzuNK6idHi/PkN7BbfrnQwWWx6fI3VYsb5fUwWa4/cZbf4/H4/q8XhN+2sFhdXfGFy
 4PHY8LmJzWPnrLvsHptWdbJ5bF5S7zF9zn9Gj74tqxg9Pm+SC2CP4rJJSc3JLEst0rdL4Mp4
 tnYbW8Fi44qtk7pZGhjPa3UxcnJICJhIzNl8lrWLkYtDSGAFo8SBnpOsIAkhgS+MEqcmC0Ek
 PjNKHFsxlx2m4/zzhWwQieWMEotWXGWEcIA69txYzAhSxSZgKNF7tA/MFhEQk7g9p5MZxGYW
 OMUk8eSNDYgtLOAjsXLPerB1LAKqEosfnQCr5xWwlrh06ycbxDZ5idUbDoD1cgrYSFzuewW2
 TEJgFbtE15c/jBBFLhKb9u1jgrCFJV4d3wJ1qozE6ck9LBANzYwSPbtvs0M4Exgl7h9fANVt
 LXH4+EWgMziAztOUWL9LH8SUEHCUOHmZE8Lkk7jxVhDifj6JSdumM0OEeSU62oQgZqhI/F41
 HeoCKYnuJ/9ZIGwPiXPXX7BAwqefUeLyjC/sExjlZyHsWsDIuIpRPLW0ODc9tdgwL7Vcrzgx
 t7g0L10vOT93EyMw0Zz+d/zTDsavl5IOMQpwMCrx8N4ImRwrxJpYVlyZe4hRgoNZSYTX5s+k
 WCHelMTKqtSi/Pii0pzU4kOM0hwsSuK81QwPooUE0hNLUrNTUwtSi2CyTBycUg2MArFq55+/
 DUmS/3ryZm2UmirrRKaJzDl623vk93L8CvrHEz+5Xf2NpeaEB+95NKKuLGy+ePXf/MnbJ14I
 0T2t0ydy0c/8XwGDUPDGqbNKtNkttuzKlkvTS85+xnY99O3x7MfKR1reb3lmmmXOXb9oX/jS
 99PDnR5+W7njq3xpuSpvxNJ2tU0ZSizFGYmGWsxFxYkAChSydTADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsVy+t/xe7rtTVNiDVa+lbO4cvEQk8XGGetZ
 LaY+fMJmcaV1E6PF+fMb2C2+Xelgstj0+BqrxYzz+5gs1h65y27x+f1+VovDb9pZLS6u+MLk
 wOOx4XMTm8fOWXfZPTat6mTz2Lyk3mP6nP+MHn1bVjF6fN4kF8AepWdTlF9akqqQkV9cYqsU
 bWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJfxbO02toLFxhVbJ3WzNDCe1+pi
 5OSQEDCROP98IVsXIxeHkMBSRonWprNMXYwcQAkpifktShA1whJ/rnVB1XxilOi/+JwdJMEm
 YCjRe7SPEcQWERCTuD2nkxmkiFngGpPEplmPWUASwgI+Eiv3rGcFsVkEVCUWPzoB1sArYC1x
 6dZPNogN8hKrNxxgBrE5BWwkLve9AqsRAqpZ9fE66wRGvgWMDKsYRVJLi3PTc4uN9IoTc4tL
 89L1kvNzNzECA3/bsZ9bdjB2vQs+xCjAwajEw9sQNDlWiDWxrLgy9xCjBAezkgivzZ9JsUK8
 KYmVValF+fFFpTmpxYcYTYGOmsgsJZqcD4zKvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJ
 JanZqakFqUUwfUwcnFINjJP3PVj6UiiH6/Icu4V/jgmd27FTnWNVaMlnVcMlfYJyTVJ6CXVZ
 Tt5SxtzX7qleVyrofv/sbMlbV67cvAqv9cx3Xm7fdvJtGIP3DzGWs0e6ovtbmv57Xp+85c32
 ggUztxz46v5byX1B/7ffxnJ8gSc/fLeLPXiwn3lK362k8tMTM8sPfXzpeEyJpTgj0VCLuag4
 EQCY5qH2kgIAAA==
X-CMS-MailID: 20191002105711eucas1p199322dc928a0ea4724fe0e0f5e6cb156
X-Msg-Generator: CA
X-RootMTR: 20191002105711eucas1p199322dc928a0ea4724fe0e0f5e6cb156
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191002105711eucas1p199322dc928a0ea4724fe0e0f5e6cb156
References: <20191002105652.24821-1-s.nawrocki@samsung.com>
 <CGME20191002105711eucas1p199322dc928a0ea4724fe0e0f5e6cb156@eucas1p1.samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, krzk@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v4 2/3] ASoC: samsung: arndale: Add support for
	WM1811 CODEC
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The Arndale boards come with different types of the audio daughter
board.  In order to support the WM1811 one we add new definition of
an ASoC card which will be registered when the driver matches on
"samsung,arndale-wm1811" compatible.  There is no runtime detection of
the audio daughter board type at the moment, compatible string of the
audio card needs to be adjusted in DT, e.g. by the bootloader,
depending on actual audio board (CODEC) used.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v3:
 - fixed the MODULE_DEVICE_TABLE entry declaration

Changes since v1:
 - removed unneeded __maybe_used attribute
---
 sound/soc/samsung/Kconfig          |  2 +
 sound/soc/samsung/arndale_rt5631.c | 85 +++++++++++++++++++++++++-----
 2 files changed, 74 insertions(+), 13 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 638983123d8f..6803cbfa9e46 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -199,6 +199,8 @@ config SND_SOC_ARNDALE_RT5631_ALC5631
         depends on I2C
         select SND_SAMSUNG_I2S
         select SND_SOC_RT5631
+	select MFD_WM8994
+	select SND_SOC_WM8994
 
 config SND_SOC_SAMSUNG_TM2_WM5110
 	tristate "SoC I2S Audio support for WM5110 on TM2 board"
diff --git a/sound/soc/samsung/arndale_rt5631.c b/sound/soc/samsung/arndale_rt5631.c
index 004c84fafad9..d64602950cbd 100644
--- a/sound/soc/samsung/arndale_rt5631.c
+++ b/sound/soc/samsung/arndale_rt5631.c
@@ -14,10 +14,11 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 
+#include "../codecs/wm8994.h"
 #include "i2s.h"
 
-static int arndale_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
+static int arndale_rt5631_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
@@ -47,13 +48,45 @@ static int arndale_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops arndale_ops = {
-	.hw_params = arndale_hw_params,
+static struct snd_soc_ops arndale_rt5631_ops = {
+	.hw_params = arndale_rt5631_hw_params,
+};
+
+static int arndale_wm1811_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	unsigned int rfs, rclk;
+
+	/* Ensure AIF1CLK is >= 3 MHz for optimal performance */
+	if (params_width(params) == 24)
+		rfs = 384;
+	else if (params_rate(params) == 8000 || params_rate(params) == 11025)
+		rfs = 512;
+	else
+		rfs = 256;
+
+	rclk = params_rate(params) * rfs;
+
+	/*
+	 * We add 1 to the frequency value to ensure proper EPLL setting
+	 * for each audio sampling rate (see epll_24mhz_tbl in drivers/clk/
+	 * samsung/clk-exynos5250.c for list of available EPLL rates).
+	 * The CODEC uses clk API and the value will be rounded hence the MCLK1
+	 * clock's frequency will still be exact multiple of the sample rate.
+	 */
+	return snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_MCLK1,
+					rclk + 1, SND_SOC_CLOCK_IN);
+}
+
+static struct snd_soc_ops arndale_wm1811_ops = {
+	.hw_params = arndale_wm1811_hw_params,
 };
 
 SND_SOC_DAILINK_DEFS(rt5631_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5631-hifi")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5631-aif1")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 static struct snd_soc_dai_link arndale_rt5631_dai[] = {
@@ -63,11 +96,28 @@ static struct snd_soc_dai_link arndale_rt5631_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S
 			| SND_SOC_DAIFMT_NB_NF
 			| SND_SOC_DAIFMT_CBS_CFS,
-		.ops = &arndale_ops,
+		.ops = &arndale_rt5631_ops,
 		SND_SOC_DAILINK_REG(rt5631_hifi),
 	},
 };
 
+SND_SOC_DAILINK_DEFS(wm1811_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif1")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link arndale_wm1811_dai[] = {
+	{
+		.name = "WM1811 HiFi",
+		.stream_name = "Primary",
+		.dai_fmt = SND_SOC_DAIFMT_I2S
+			| SND_SOC_DAIFMT_NB_NF
+			| SND_SOC_DAIFMT_CBM_CFM,
+		.ops = &arndale_wm1811_ops,
+		SND_SOC_DAILINK_REG(wm1811_hifi),
+	},
+};
+
 static struct snd_soc_card arndale_rt5631 = {
 	.name = "Arndale RT5631",
 	.owner = THIS_MODULE,
@@ -75,6 +125,13 @@ static struct snd_soc_card arndale_rt5631 = {
 	.num_links = ARRAY_SIZE(arndale_rt5631_dai),
 };
 
+static struct snd_soc_card arndale_wm1811 = {
+	.name = "Arndale WM1811",
+	.owner = THIS_MODULE,
+	.dai_link = arndale_wm1811_dai,
+	.num_links = ARRAY_SIZE(arndale_wm1811_dai),
+};
+
 static void arndale_put_of_nodes(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *dai_link;
@@ -89,10 +146,11 @@ static void arndale_put_of_nodes(struct snd_soc_card *card)
 static int arndale_audio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct snd_soc_card *card = &arndale_rt5631;
+	struct snd_soc_card *card;
 	struct snd_soc_dai_link *dai_link;
 	int ret;
 
+	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
 	card->dev = &pdev->dev;
 	dai_link = card->dai_link;
 
@@ -134,18 +192,19 @@ static int arndale_audio_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id samsung_arndale_rt5631_of_match[] __maybe_unused = {
-	{ .compatible = "samsung,arndale-rt5631", },
-	{ .compatible = "samsung,arndale-alc5631", },
+static const struct of_device_id arndale_audio_of_match[] = {
+	{ .compatible = "samsung,arndale-rt5631",  .data = &arndale_rt5631 },
+	{ .compatible = "samsung,arndale-alc5631", .data = &arndale_rt5631 },
+	{ .compatible = "samsung,arndale-wm1811",  .data = &arndale_wm1811 },
 	{},
 };
-MODULE_DEVICE_TABLE(of, samsung_arndale_rt5631_of_match);
+MODULE_DEVICE_TABLE(of, arndale_audio_of_match);
 
 static struct platform_driver arndale_audio_driver = {
 	.driver = {
-		.name   = "arndale-audio",
+		.name = "arndale-audio",
 		.pm = &snd_soc_pm_ops,
-		.of_match_table = of_match_ptr(samsung_arndale_rt5631_of_match),
+		.of_match_table = arndale_audio_of_match,
 	},
 	.probe = arndale_audio_probe,
 	.remove = arndale_audio_remove,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
