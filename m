Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AFE66DA83
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 11:02:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C8FD6518;
	Tue, 17 Jan 2023 11:01:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C8FD6518
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673949767;
	bh=ir46ViK9S3KaDwxZVrmKPveivB7CD64h5r4li+9QoEc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GpO9Tr+kusznRzFgkw1ypyCQcU3DVtrl0jln1FHP6j4+B8SOeOes9+G09z7a3tkS+
	 RSRT9dwqBp23rGddQj/IrzlmdzZoU2u+g1UJkwM+JwQDp/Jg43W0J5gAngyNotjfMq
	 /rYn9Pe9r5PUsYXWAph8zxBGD3beEca0rINczOm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1030BF80083;
	Tue, 17 Jan 2023 11:01:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD3DAF8047B; Tue, 17 Jan 2023 11:01:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6479F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 11:01:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6479F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=hbB0dlmI
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230117100143epoutp027bbe5b57c9a7281a0dfbc08e4bd89d28~7EGLiJmiI1296712967epoutp02Y
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 10:01:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230117100143epoutp027bbe5b57c9a7281a0dfbc08e4bd89d28~7EGLiJmiI1296712967epoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673949703;
 bh=wWGnNGV0K80my33qdYO+3w0zAebtUViujp9+aBWfQaw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hbB0dlmIY/8FunfVLNV5dLcOQJrgtV24SjEK/M4rW7V9JftYgVQwj113aSxysYmAM
 UJ/NbjEpHimcgL65v2BozAaI0yIjyHncI7hK+amI9lEKEg2i4JBxipuyQGZzkp+TlY
 osKN75CoU3VsFbRRuBsPmJYFaHXVGkbjFESrOg1U=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20230117100142epcas5p18a0e24b14047e04fb38c136175a55d2e~7EGLAPhM41092410924epcas5p1p;
 Tue, 17 Jan 2023 10:01:42 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.175]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Nx4DP07W7z4x9Q8; Tue, 17 Jan
 2023 10:01:41 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 69.27.02301.40276C36; Tue, 17 Jan 2023 19:01:40 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20230116103856epcas5p3dea4b4a1e6073257c66b7562f263b5b1~6w9ZRBb_11961519615epcas5p3F;
 Mon, 16 Jan 2023 10:38:56 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230116103856epsmtrp12850d3beb00a71dafa28ffefe08f4ac9~6w9ZQHjqK2177121771epsmtrp1O;
 Mon, 16 Jan 2023 10:38:56 +0000 (GMT)
X-AuditID: b6c32a49-201ff700000108fd-42-63c67204d94c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 E6.F8.10542.04925C36; Mon, 16 Jan 2023 19:38:56 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
 [107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230116103854epsmtip11cd3f6db3ef6b880833cddc265a5d32a~6w9W7RZFY0462804628epsmtip1-;
 Mon, 16 Jan 2023 10:38:54 +0000 (GMT)
From: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com, perex@perex.cz,
 tiwai@suse.com, pankaj.dubey@samsung.com, alim.akhtar@samsung.com,
 rcsekar@samsung.com, aswani.reddy@samsung.com
Subject: [PATCH v4 2/5] ASoC: samsung: i2s: add support for FSD I2S
Date: Mon, 16 Jan 2023 16:08:20 +0530
Message-Id: <20230116103823.90757-3-p.rajanbabu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230116103823.90757-1-p.rajanbabu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNJsWRmVeSWpSXmKPExsWy7bCmui5L0bFkg3MvrSwezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW3y70sFkcXnXHDaLGef3MVkc3RhssWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEdUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKL
 T4CuW2YO0AdKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnAKTAr3ixNzi0rx0vbzU
 EitDAwMjU6DChOyMo1Ousxc8Vq5ofnmWuYHxsGwXIyeHhICJxL/ZzWxdjFwcQgK7GSUmLNnE
 2sXIAeR8YpQ4pQgR/8wo8WjhFiaYhieXDkI17GKU6Fl5jwnCaWWSWLJxDTtIFZuAqcSqOY2s
 IAkRgSYmibY3E1lAHGaBjYwSp489BJslLOAsceHid7B9LAKqEv82GYOEeQVsJC5f7oNaJy+x
 esMBZhCbU8BW4uveG8wgcyQEFnJInJ/3mB2iyEXi2ORNULawxKvjW6BsKYmX/W1Qdr7EtI8g
 j4LYFRJtHzdALbCXOHBlDgvIDcwCmhLrd+lDhGUlpp5aB1bCLMAn0fv7CVQ5r8SOeTC2qsT6
 5ZsYIWxpiX3X90LZHhIHZ1+BhsoERolZS8+zTGCUm4WwYgEj4ypGydSC4tz01GLTAsO81HJ4
 rCXn525iBKdSLc8djHcffNA7xMjEwXiIUYKDWUmE12/X4WQh3pTEyqrUovz4otKc1OJDjKbA
 8JvILCWanA9M5nkl8YYmlgYmZmZmJpbGZoZK4rypW+cnCwmkJ5akZqemFqQWwfQxcXBKNTAp
 LT8ltD1Ov1vw/s2Oi3qbfj5X3CtnxxgZ/nDx2tYIh98njl41elG6ujPho8aEyaYS06QOvt74
 M0dNf2NFxVauhbkHyxXlNhx5WO7NZhR5/sNSZVOOZ8ftK9/7f5FiC+Mw+rHl+4q3QaqBvUtu
 W9b1bGfYuU5y+To17Vf9bz+ur15WqVm8vr9/ok792n/tP1dfYcla+t4ruj6Vo2mu4wmlJRen
 zG5nrVCaYFi2S//lQbPlbH9vup19dOPw962WRxraLdas0gtN4wpvWcx/8xLL9rBr9scWPX15
 MTln2/qob4829Ryq3nMm/+bDyutOqja9ykaf7/jcnL6vd2eiZ/K+tTsXerU+6j81da56/qOt
 ekosxRmJhlrMRcWJAC29pI8uBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWy7bCSnK6D5tFkg85lqhYP5m1js7hy8RCT
 xaHNW9ktpj58wmYx/8g5Vou+Fw+ZLb5d6WCyuLxrDpvFjPP7mCyObgy2WLT1C7tF565+VotZ
 F3awWrTuPcJucfhNO6vFhu9rGR0EPDZ8bmLz2DnrLrvHplWdbB53ru1h89j3dhmbR9+WVYwe
 67dcZfH4vEkugCOKyyYlNSezLLVI3y6BK+PolOvsBY+VK5pfnmVuYDws28XIySEhYCLx5NJB
 ti5GLg4hgR2MElvWTWWESEhLTO/fwwZhC0us/PecHaKomUni5OXZ7CAJNgFTiVVzGllBEiIC
 E4AS746xgCSYBbYySkz9bARiCws4S1y4+B2oiIODRUBV4t8mY5Awr4CNxOXLfUwQC+QlVm84
 wAxicwrYSnzdewPMFgKqeTLhPOMERr4FjAyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNz
 NzGCg11LawfjnlUf9A4xMnEwHmKU4GBWEuH123U4WYg3JbGyKrUoP76oNCe1+BCjNAeLkjjv
 ha6T8UIC6YklqdmpqQWpRTBZJg5OqQam2PJ1545N/N2+vDReJWXjFLPnm50/b9iconl+tuc/
 sw/GkVMX+GVrfd9j3X3gufyu4vzLv+J+Osx8mvn37cnrp9gnzohd3dB3VNZh2tzG8IezZ7Gb
 JUetUVwqub+zTejgdHPWsvjUHU+FCplXrE5+cTAy9+lkF+HJNU+d5l35ue7ZrvU1+itvLOcz
 0xaMnfvr4fMTS/bFXwsTuM+lLtERPiHzjll6w9v+U4tDb80M+f7tuxbHE4/d7kKXrOaEdHkm
 swd+qWE6XCefqPisPKbH0kizfMtSg6TL/0N73B6ZPJj4O+jFhlyDY8wrnn3yfMlRF7ZpEWvm
 k4P1AZmaPy62x/18aHlNjj0k8duny5JvzZRYijMSDbWYi4oTAZSwgF/lAgAA
X-CMS-MailID: 20230116103856epcas5p3dea4b4a1e6073257c66b7562f263b5b1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230116103856epcas5p3dea4b4a1e6073257c66b7562f263b5b1
References: <20230116103823.90757-1-p.rajanbabu@samsung.com>
 <CGME20230116103856epcas5p3dea4b4a1e6073257c66b7562f263b5b1@epcas5p3.samsung.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for enabling I2S controller on FSD platform.

FSD I2S controller is based on Exynos7 I2S controller, supporting
2CH playback/capture in I2S mode and 7.1CH playback/capture in TDM
mode.

Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
---
 sound/soc/samsung/i2s-regs.h |  1 +
 sound/soc/samsung/i2s.c      | 53 ++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/sound/soc/samsung/i2s-regs.h b/sound/soc/samsung/i2s-regs.h
index b4b5d6053503..138e95581979 100644
--- a/sound/soc/samsung/i2s-regs.h
+++ b/sound/soc/samsung/i2s-regs.h
@@ -132,6 +132,7 @@
 #define EXYNOS7_MOD_RCLK_192FS	7
 
 #define PSR_PSREN		(1 << 15)
+#define PSR_PSVAL(x)		((((x) - 1) << 8) & 0x3f00)
 
 #define FIC_TX2COUNT(x)		(((x) >>  24) & 0xf)
 #define FIC_TX1COUNT(x)		(((x) >>  16) & 0xf)
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 9505200f3d11..6f96032090de 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -50,6 +50,10 @@ struct samsung_i2s_dai_data {
 	u32 quirks;
 	unsigned int pcm_rates;
 	const struct samsung_i2s_variant_regs *i2s_variant_regs;
+	void (*fixup_early)(struct snd_pcm_substream *substream,
+					struct snd_soc_dai *dai);
+	void (*fixup_late)(struct snd_pcm_substream *substream,
+					struct snd_soc_dai *dai);
 };
 
 struct i2s_dai {
@@ -111,6 +115,10 @@ struct samsung_i2s_priv {
 	u32 suspend_i2spsr;
 
 	const struct samsung_i2s_variant_regs *variant_regs;
+	void (*fixup_early)(struct snd_pcm_substream *substream,
+						struct snd_soc_dai *dai);
+	void (*fixup_late)(struct snd_pcm_substream *substream,
+						struct snd_soc_dai *dai);
 	u32 quirks;
 
 	/* The clock provider's data */
@@ -940,6 +948,10 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		pm_runtime_get_sync(dai->dev);
+
+		if (priv->fixup_early)
+			priv->fixup_early(substream, dai);
+
 		spin_lock_irqsave(&priv->lock, flags);
 
 		if (config_setup(i2s)) {
@@ -947,6 +959,9 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 
+		if (priv->fixup_late)
+			priv->fixup_late(substream, dai);
+
 		if (capture)
 			i2s_rxctrl(i2s, 1);
 		else
@@ -1410,6 +1425,8 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 
 	if (np) {
 		priv->quirks = i2s_dai_data->quirks;
+		priv->fixup_early = i2s_dai_data->fixup_early;
+		priv->fixup_late = i2s_dai_data->fixup_late;
 	} else {
 		if (!i2s_pdata) {
 			dev_err(&pdev->dev, "Missing platform data\n");
@@ -1563,6 +1580,31 @@ static int samsung_i2s_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void fsd_i2s_fixup_early(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct i2s_dai *i2s = to_info(asoc_rtd_to_cpu(rtd, 0));
+	struct i2s_dai *other = get_other_dai(i2s);
+
+	if (!is_opened(other)) {
+		i2s_set_sysclk(dai, SAMSUNG_I2S_CDCLK, 0, SND_SOC_CLOCK_OUT);
+		i2s_set_sysclk(dai, SAMSUNG_I2S_OPCLK, 0, MOD_OPCLK_PCLK);
+	}
+}
+
+static void fsd_i2s_fixup_late(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
+	struct i2s_dai *i2s = to_info(asoc_rtd_to_cpu(rtd, 0));
+	struct i2s_dai *other = get_other_dai(i2s);
+
+	if (!is_opened(other))
+		writel(PSR_PSVAL(2) | PSR_PSREN, priv->addr + I2SPSR);
+}
+
 static const struct samsung_i2s_variant_regs i2sv3_regs = {
 	.bfs_off = 1,
 	.rfs_off = 3,
@@ -1652,6 +1694,14 @@ static const struct samsung_i2s_dai_data i2sv5_dai_type_i2s1 __maybe_unused = {
 	.i2s_variant_regs = &i2sv5_i2s1_regs,
 };
 
+static const struct samsung_i2s_dai_data fsd_dai_type __maybe_unused = {
+	.quirks = QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR | QUIRK_SUPPORTS_TDM,
+	.pcm_rates = SNDRV_PCM_RATE_8000_192000,
+	.i2s_variant_regs = &i2sv7_regs,
+	.fixup_early = fsd_i2s_fixup_early,
+	.fixup_late = fsd_i2s_fixup_late,
+};
+
 static const struct platform_device_id samsung_i2s_driver_ids[] = {
 	{
 		.name           = "samsung-i2s",
@@ -1678,6 +1728,9 @@ static const struct of_device_id exynos_i2s_match[] = {
 	}, {
 		.compatible = "samsung,exynos7-i2s1",
 		.data = &i2sv5_dai_type_i2s1,
+	}, {
+		.compatible = "tesla,fsd-i2s",
+		.data = &fsd_dai_type,
 	},
 	{},
 };
-- 
2.17.1

