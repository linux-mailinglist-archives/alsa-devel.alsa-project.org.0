Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6ADB61E6
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 12:53:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAAF01683;
	Wed, 18 Sep 2019 12:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAAF01683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568804012;
	bh=09ZGBb2M6cKxTxK0XjfpPMhgxFGY2oEgiCKoopcDBJs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=keQE6PsM8oXXjvTHNhdj2cOMZZ6tvtFHigT+MtNHAmPi1JFPAPrp/92LrkQ5yDf6i
	 gdC6mXepyePAx/LbI1YUbynHq7Sh8qxqVr61AlkEpRC5MUmGiJZuG5NOo4unsFyrLQ
	 aHVTwNllVmcynfWbAf7ksXdH2G2qdPWPY28tHv8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27149F80675;
	Wed, 18 Sep 2019 12:47:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A58C9F805F8; Wed, 18 Sep 2019 12:47:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 687A9F80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 12:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 687A9F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="n+LHMk7A"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190918104706euoutp01344b8806816e51dd38cdbc9cdaf20f31~FgpYyp68l1222412224euoutp010
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 10:47:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190918104706euoutp01344b8806816e51dd38cdbc9cdaf20f31~FgpYyp68l1222412224euoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568803626;
 bh=zPf3iyJ5rvQFeMs/AofhYQ7+/LnX80QFNAzKaPbWBoM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n+LHMk7Ac8cBDQ3OEL+cCCL2+2z1PAq3z7UFGuArFCliF2d9I31xoABvqyvxjuNXN
 KwhjiP4PRiz7LiKw9WlUQKA7dNdLa0XY4ynIhRre8Q7XZBrADsJvhv2BQKeS9gZoxZ
 xWLWbzPrAxI4lfMopPFOXfeZDWEbqriCnKf/eN74=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190918104706eucas1p1717baf670a17dfbc5289a270ddc64015~FgpYTIV9d2746227462eucas1p1U;
 Wed, 18 Sep 2019 10:47:06 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id A2.E3.04374.92B028D5; Wed, 18
 Sep 2019 11:47:05 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190918104705eucas1p1c01dc05bff199188677915e2bb8f7472~FgpXb8ZhL3005030050eucas1p1Z;
 Wed, 18 Sep 2019 10:47:05 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190918104705eusmtrp2b0eaedc41091611bf96adc1557480c80~FgpXMWQta1555615556eusmtrp20;
 Wed, 18 Sep 2019 10:47:05 +0000 (GMT)
X-AuditID: cbfec7f5-92d689c000001116-5e-5d820b29e7e7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 4F.B6.04166.92B028D5; Wed, 18
 Sep 2019 11:47:05 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190918104704eusmtip10418cadcb9932e28c2051890ec768463~FgpWlYNqI0585305853eusmtip1J;
 Wed, 18 Sep 2019 10:47:04 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org
Date: Wed, 18 Sep 2019 12:46:32 +0200
Message-Id: <20190918104634.15216-8-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918104634.15216-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djP87qa3E2xBvPP2lhcuXiIyWLjjPWs
 FlMfPmGzuNK6idFi/pFzrBbnz29gt/h2pYPJYtPja6wWM87vY7JYe+Quu8Xn9/tZLVr3HmG3
 OPymndXi4oovTA58Hhs+N7F57Jx1l91j06pONo/NS+o9ps/5z+jRt2UVo8fnTXIB7FFcNimp
 OZllqUX6dglcGf+n/mMtmKZbcXHqXvYGxpOqXYycHBICJhLda74wgthCAisYJT4fcOhi5AKy
 vzBK7Hp9jw0i8ZlR4kS7BUzD1jOr2CCKljNKLNo6lRWuY173JrAONgFDid6jfWBjRQTEJG7P
 6WQGKWIW+MMk8fbvLBaQhLCAj8S6ls2sIDaLgKrEpSmTweK8AtYSB84sZIVYJy+xesMBZhCb
 U8BG4tOFBywggyQEdrFLHHv3nwWiyEXi4srJULawxKvjW9ghbBmJ/zvnM0E0NDNK9Oy+zQ7h
 TGCUuH98ASNElbXE4eMXgdZxAN2nKbF+lz5E2FHi0LrZzCBhCQE+iRtvBUHCzEDmpG3TocK8
 Eh1tQhDVKhK/V01ngrClJLqfwJzmIXFo6nlmSAj1A8O0aTvTBEb5WQjLFjAyrmIUTy0tzk1P
 LTbOSy3XK07MLS7NS9dLzs/dxAhMP6f/Hf+6g3Hfn6RDjAIcjEo8vBJnG2KFWBPLiitzDzFK
 cDArifAG1NbHCvGmJFZWpRblxxeV5qQWH2KU5mBREuetZngQLSSQnliSmp2aWpBaBJNl4uCU
 amC0XfHis+ihdclB5zTrcj/9m6pr3mMWpvdRVnGyc5lc6JaFJoUMoT+6vvKlMFQ4P8qyZK8T
 qnpXN12Jf+OPiIWVNw3nWc9g868WPBrQ7hwZYMjcO4XzQjHrj2n9Zw++3FMustdae1kmn9KO
 B0p7dGaxKc7doMui678/+i7Xuuu6m9UUd1wvsFViKc5INNRiLipOBABqmzV6OwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4XV1N7qZYg/VTmS2uXDzEZLFxxnpW
 i6kPn7BZXGndxGgx/8g5Vovz5zewW3y70sFksenxNVaLGef3MVmsPXKX3eLz+/2sFq17j7Bb
 HH7TzmpxccUXJgc+jw2fm9g8ds66y+6xaVUnm8fmJfUe0+f8Z/To27KK0ePzJrkA9ig9m6L8
 0pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jP9T/7EWTNOt
 uDh1L3sD40nVLkZODgkBE4mtZ1axdTFycQgJLGWU+Lf2KHMXIwdQQkpifosSRI2wxJ9rXWwg
 tpDAJ0aJd6vlQWw2AUOJ3qN9jCC2iICYxO05ncwgc5gFupgl3u/4xQqSEBbwkVjXshnMZhFQ
 lbg0ZTILiM0rYC1x4MxCVogF8hKrNxxgBrE5BWwkPl14wAKxzFpiwbFpjBMY+RYwMqxiFEkt
 Lc5Nzy021CtOzC0uzUvXS87P3cQIjIVtx35u3sF4aWPwIUYBDkYlHt4DpxpihVgTy4orcw8x
 SnAwK4nwBtTWxwrxpiRWVqUW5ccXleakFh9iNAU6aiKzlGhyPjBO80riDU0NzS0sDc2NzY3N
 LJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MGaktHLV5K/Y3/fDLrGy+MOJTqY3YjO/yDHt
 6UqM5QgWl5DmSKwWyUq8eCv82Lb+r+svh3xT6Qs5/ai4KVNu8fvn7/647Reb83hP0538yUpy
 O/g7JuzV3dU7863hZiP3O4+DC1j33pTkvXL/215/3rsliqsjn1+8xit49ILCuWdMd3XNZXsy
 nymxFGckGmoxFxUnAgCQdq+WmwIAAA==
X-CMS-MailID: 20190918104705eucas1p1c01dc05bff199188677915e2bb8f7472
X-Msg-Generator: CA
X-RootMTR: 20190918104705eucas1p1c01dc05bff199188677915e2bb8f7472
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104705eucas1p1c01dc05bff199188677915e2bb8f7472
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104705eucas1p1c01dc05bff199188677915e2bb8f7472@eucas1p1.samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v1 7/9] ASoC: samsung: arndale: Add support for
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

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/arndale_rt5631.c | 86 +++++++++++++++++++++++++-----
 1 file changed, 73 insertions(+), 13 deletions(-)

diff --git a/sound/soc/samsung/arndale_rt5631.c b/sound/soc/samsung/arndale_rt5631.c
index c5c8e3b5772f..3744c47742b8 100644
--- a/sound/soc/samsung/arndale_rt5631.c
+++ b/sound/soc/samsung/arndale_rt5631.c
@@ -5,6 +5,7 @@
 //  Author: Claude <claude@insginal.co.kr>
 
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 
@@ -13,10 +14,11 @@
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
@@ -46,13 +48,45 @@ static int arndale_hw_params(struct snd_pcm_substream *substream,
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
@@ -62,11 +96,28 @@ static struct snd_soc_dai_link arndale_rt5631_dai[] = {
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
@@ -74,13 +125,21 @@ static struct snd_soc_card arndale_rt5631 = {
 	.num_links = ARRAY_SIZE(arndale_rt5631_dai),
 };
 
+static struct snd_soc_card arndale_wm1811 = {
+	.name = "Arndale WM1811",
+	.owner = THIS_MODULE,
+	.dai_link = arndale_wm1811_dai,
+	.num_links = ARRAY_SIZE(arndale_wm1811_dai),
+};
+
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
 
@@ -107,18 +166,19 @@ static int arndale_audio_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static const struct of_device_id samsung_arndale_rt5631_of_match[] __maybe_unused = {
-	{ .compatible = "samsung,arndale-rt5631", },
-	{ .compatible = "samsung,arndale-alc5631", },
+static const struct of_device_id arndale_audio_of_match[] __maybe_unused = {
+	{ .compatible = "samsung,arndale-rt5631",  .data = &arndale_rt5631 },
+	{ .compatible = "samsung,arndale-alc5631", .data = &arndale_rt5631 },
+	{ .compatible = "samsung,arndale-wm1811",  .data = &arndale_wm1811 },
 	{},
 };
-MODULE_DEVICE_TABLE(of, samsung_arndale_rt5631_of_match);
+MODULE_DEVICE_TABLE(of, arndale_of_match);
 
 static struct platform_driver arndale_audio_driver = {
 	.driver = {
-		.name   = "arndale-audio",
+		.name = "arndale-audio",
 		.pm = &snd_soc_pm_ops,
-		.of_match_table = of_match_ptr(samsung_arndale_rt5631_of_match),
+		.of_match_table = arndale_audio_of_match,
 	},
 	.probe = arndale_audio_probe,
 };
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
