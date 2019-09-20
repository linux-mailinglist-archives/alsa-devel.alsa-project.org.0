Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB91B905F
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 15:09:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D50941671;
	Fri, 20 Sep 2019 15:08:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D50941671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568984952;
	bh=C8XjvR5ctKXfg5QoZRnY0y1Av0t+2E3VkaReFnLeJxA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=itgEXwAogwjSZzmbhR4km+d0Qy8R0nFsDoVlDrozBocPyAX4fnT/BMD8Fx8WA+Ln6
	 60fRnfeeKc3CFdFfZeX0fSVJuIIuhFOLwYPlUhimVe7LIi33dvJ0VhtKV5xfVaLHBU
	 tqPJrWh1FFE4+anoZAgUQadA9RNrYr2DF+Zfh7Rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3F38F80676;
	Fri, 20 Sep 2019 15:03:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83E33F80639; Fri, 20 Sep 2019 15:03:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDD53F8060D
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 15:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDD53F8060D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="FlSMdcyL"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190920130323euoutp0119603cb66669150bcffc763d9f87d5a0~GJy8S-2wh3045730457euoutp01d
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 13:03:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190920130323euoutp0119603cb66669150bcffc763d9f87d5a0~GJy8S-2wh3045730457euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568984603;
 bh=fCiCWDJV6hWzdPW9ipEdQhbwyGKQwzSf6QI+SV7DvCc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FlSMdcyLFSd1TfBqNcLbUqVUuqeXy1fMNoeqISQJldqkSyNOBEWoUD00kCWh3n/hJ
 3Gq5ubpfyjPoEsAPsOyRi2OBScEaHljouDtf7dMx5c2031mwSPLmi1iXKbUCuL2zPg
 dgXaMzRH/lezNQar+x9jbeXxdIUOTwjkcNpZXweI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190920130322eucas1p14cece5f41f00418f148cb398c25763a1~GJy71JQiy2912829128eucas1p16;
 Fri, 20 Sep 2019 13:03:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 25.DB.04309.A1EC48D5; Fri, 20
 Sep 2019 14:03:22 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190920130321eucas1p2efe85adb3df4c546a7d81326b4c75873~GJy69HB9R1573515735eucas1p2m;
 Fri, 20 Sep 2019 13:03:21 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190920130321eusmtrp2b1229a6e283cb8f4d92cde532508fb28~GJy6r4Wq51022710227eusmtrp2C;
 Fri, 20 Sep 2019 13:03:21 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-f1-5d84ce1af475
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 48.2B.04166.91EC48D5; Fri, 20
 Sep 2019 14:03:21 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190920130320eusmtip2b5d7b38fa30bc5b2b2282d90264af2c9~GJy6An3U51284812848eusmtip2e;
 Fri, 20 Sep 2019 13:03:20 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, krzk@kernel.org
Date: Fri, 20 Sep 2019 15:02:16 +0200
Message-Id: <20190920130218.32690-8-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920130218.32690-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSWUwTURSGvTOdztBYMhYSrsVAbDSyRLZYmQSCEn1o9AU1+iBpcJAJEKCQ
 DouoCVjKYhFEEYuAQkAilCC1EGILLimtlaBUFJUlhB2FQHgocQWRMqBv/zn/d/5zc3IJVNSA
 iYlERTqjVNDJEr6A1/nqp/2guF8tD6qf200NDpgR6kllG0ZVTM7wqcF8A6BqLf0YZbfrcerb
 YBFCGaY/YVSl/TlCtVrGcMqx/AKj8p9ZcKpnsRCjBppWkKOuMr1DxZcZq8ZwmUF3nS9rf5gj
 09asA1lphw7IHAavKPy8IDyOSU7MZJSBERcECaPtirS54Es9P1p4uUDnqwEuBCQPQf2v74gG
 CAgR2QSgpnSczxUrANo/3AVOSkQ6ALxW7bc9MdG1uNV/BODkmvTfQHehGXUafDIYllhLNyF3
 8gAcr1RhTggl5xFYZn2MOA03MgrOvVnf1DxyP6xecvA0gCCEZBg0Vflwy7xhi/7lZqYLGQ7n
 h+o3nwrJThze6WvGnTwkj8OGkhiOd4MLtg6c03vgurF2i88D8EbXKM4VZQCO2+oAR4XBHtsA
 5gxCSV/YZgrkMiNhQa4/J13h0NIuJ4xuyNudWpRrC2FRgYjL2Ad/67QIp8WweGadxyEyWG6U
 c9e5uXHb0Rq8DHhX/V9VB4AOeDAZbEo8w4YomKwAlk5hMxTxARdTUwxg4+v0/bGtPAWm1Vgz
 IAkg2Smse62WizA6k81OMQNIoBJ3YY1UJRcJ4+jsy4wyNUaZkcywZuBJ8CQewis7JqJFZDyd
 ziQxTBqj3HYRwkWcC2pbY0+jesJ/78eTFX7qEmnlSPHVhIU8t0ZVpJaJstdXTx0zJVUtNvfm
 Zw4fjqCX8RwLqwt5T3vXWM81Ts0Kpm8JZ/pClz972e4vV8fhsCDry9uJ3mHtWemZE92rntEj
 QeSq2jco75TkyNe1wogKxDgreRdSLrYqQn0etN6LkfDYBDrYD1Wy9F/0bX3uNgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjkeLIzCtJLcpLzFFi42I5/e/4PV3Jcy2xBje7FC2uXDzEZLFxxnpW
 i6kPn7BZXGndxGgx/8g5Vovz5zewW3y70sFksenxNVaLGef3MVmsPXKX3eLz+/2sFq17j7Bb
 HH7TzmpxccUXJgc+jw2fm9g8ds66y+6xaVUnm8fmJfUe0+f8Z/To27KK0ePzJrkA9ig9m6L8
 0pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jNub8wqeGVYc
 /rGapYFxlWYXIyeHhICJxIPdbxi7GLk4hASWMkr8nTaBuYuRAyghJTG/RQmiRljiz7UuNoia
 T4wSNxp2sYIk2AQMJXqP9jGC2CICmhId826zghQxC3xnkjjw+CTYIGEBP4kPe7VBalgEVCVm
 v/3MAhLmFbCW2DVLA2K+vMTqDQeYQWxOARuJlzcWMYHYQkAlp/ftZZ/AyLeAkWEVo0hqaXFu
 em6xoV5xYm5xaV66XnJ+7iZGYBxsO/Zz8w7GSxuDDzEKcDAq8fAuONESK8SaWFZcmXuIUYKD
 WUmEd45pU6wQb0piZVVqUX58UWlOavEhRlOgmyYyS4km5wNjNK8k3tDU0NzC0tDc2NzYzEJJ
 nLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA6Nnkc/kw3WyW2fmepTP/F9yfv2vh97PJjPeSC9N
 ezjNIoY1mqXKZovrxpnCXkElfbffpcpOOXE9v/NFjEq+SufL+ZsXstqarGz8u0LEMsU7Z7vK
 m0kv1gpMnLBO0/eDmv/TgFViD3a+z8zsujSj6sXGlGPbG6eb3/twRjTgysTelXO/etsln2tS
 YinOSDTUYi4qTgQATMwmcpkCAAA=
X-CMS-MailID: 20190920130321eucas1p2efe85adb3df4c546a7d81326b4c75873
X-Msg-Generator: CA
X-RootMTR: 20190920130321eucas1p2efe85adb3df4c546a7d81326b4c75873
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920130321eucas1p2efe85adb3df4c546a7d81326b4c75873
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130321eucas1p2efe85adb3df4c546a7d81326b4c75873@eucas1p2.samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v2 07/10] ASoC: samsung: arndale: Add support
 for WM1811 CODEC
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
index 004c84fafad9..1e8badb1b8f9 100644
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
 	.remove = arndale_audio_remove,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
