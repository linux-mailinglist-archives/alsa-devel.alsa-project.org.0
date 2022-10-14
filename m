Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E19A75FFDEF
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 09:32:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C22B88F9;
	Sun, 16 Oct 2022 09:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C22B88F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665905577;
	bh=ekzfx7VYA6L+QdfxIidKIp1ZBLJqpsL3UQsAmwLEdnA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=by03YSxKKH8pG6bK8nxSH3OMiXAJARMXO/2HX7UI5HhbedpN/vdYFY/s3xfr0JUr/
	 2UbO18KyrIj6SQFea+ytcvtbjctwZuw5dp+bY91Dtf6uBelvo3SPk5QQXnZKrL42XI
	 e9vInarHpAI7/CU3cT99V026HJPLych9vPked9dQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FCC6F805A8;
	Sun, 16 Oct 2022 09:28:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A80D5F80224; Fri, 14 Oct 2022 13:10:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEC20F800F3
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 13:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEC20F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="IAvFc8WE"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20221014111005epoutp038c2dd456bf02524aca437b6a9fe4bcd0~d6vwYVkrr1465814658epoutp03X
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 11:10:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20221014111005epoutp038c2dd456bf02524aca437b6a9fe4bcd0~d6vwYVkrr1465814658epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1665745805;
 bh=b0SpkS4ju/nMLrPXxPclPFQEAVxgNqmow5paQbtJPUc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IAvFc8WEXoPQHIaf4SOoerpBC6qz3yjazYtvSl297qUiYa8THSc/Iw3NUreHN6VuI
 hiWXFpjNZag9LYIgDSz7baMfhM4ysjOHNnz4iBMj/ezPh9Qu5VHlxGbQWBlHxAh0v9
 BF3dpr+rGlINjAMzfC7VsmJDVHeoItH0myRxOde8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20221014111005epcas5p16b721de3063b2aa36be8030e23076149~d6vv7bzYX0967309673epcas5p1H;
 Fri, 14 Oct 2022 11:10:05 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.176]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4MpkF63nhqz4x9Pt; Fri, 14 Oct
 2022 11:10:02 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 31.3E.56352.A8349436; Fri, 14 Oct 2022 20:10:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20221014104850epcas5p1a707b9d407a0947c3519077cf7fca5ff~d6dMcJ3X02013820138epcas5p1w;
 Fri, 14 Oct 2022 10:48:50 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221014104850epsmtrp1b40bf3b4a9eb9bf0311fb12133d443dc~d6dMbRuoq3160431604epsmtrp1p;
 Fri, 14 Oct 2022 10:48:50 +0000 (GMT)
X-AuditID: b6c32a4b-5f7fe7000001dc20-e3-6349438aeec3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 A5.2C.18644.19E39436; Fri, 14 Oct 2022 19:48:50 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
 [107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221014104847epsmtip1a09b60df02bcbbdd501ba89313fa8bc1~d6dKT-h8_2736427364epsmtip1Z;
 Fri, 14 Oct 2022 10:48:47 +0000 (GMT)
From: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com, perex@perex.cz,
 tiwai@suse.com, pankaj.dubey@samsung.com, alim.akhtar@samsung.com,
 rcsekar@samsung.com, aswani.reddy@samsung.com
Subject: [PATCH 1/6] ASoC: samsung: i2s: TDM Support for CPU DAI driver
Date: Fri, 14 Oct 2022 15:51:46 +0530
Message-Id: <20221014102151.108539-2-p.rajanbabu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221014102151.108539-1-p.rajanbabu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNJsWRmVeSWpSXmKPExsWy7bCmlm6Xs2eywfOf0hYP5m1js7hy8RCT
 xaHNW9ktpj58wmYx/8g5Vou+Fw+ZLb5d6WCyuLxrDpvFjPP7mCyObgy2WLT1C7tF565+VotZ
 F3awWrTuPcJucfhNO6vFhu9rGR0EPDZ8bmLz2DnrLrvHplWdbB53ru1h89j3dhmbR9+WVYwe
 67dcZfH4vEkugCMq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnF
 J0DXLTMH6AMlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToFJgV5xYm5xaV66Xl5q
 iZWhgYGRKVBhQnbGgjdRBT+MK3aeeczewNit1cXIySEhYCLx+9Jjli5GLg4hgd2MEpcnd7NB
 OJ8YJZo6OpkhnM+MEvcunWCDabl1+CwjRGIXo8T+lXNYIZxWJonL7/qYQKrYBEwlVs1pBEuI
 CDQxSbS9mQi2hVlgI6PE6WMPgao4OIQF3CW+zCgBaWARUJW4/P0GG0iYV8BW4swqY4ht8hKr
 NxxgBrE5Bewknrc0gc2UEFjIIfH82zuok1wkvrx6zwphC0u8Or6FHcKWknjZ3wZl50tM+9gM
 VV8h0fZxAxOEbS9x4MocFpC9zAKaEut36UOEZSWmnloHVsIswCfR+/sJVDmvxI55MLaqxPrl
 mxghbGmJfdf3QtkeEltnTYUG3URGiR9dP9gnMMrNQlixgJFxFaNkakFxbnpqsWmBcV5qOTzW
 kvNzNzGCU6mW9w7GRw8+6B1iZOJgPMQowcGsJML7WskzWYg3JbGyKrUoP76oNCe1+BCjKTD8
 JjJLiSbnA5N5Xkm8oYmlgYmZmZmJpbGZoZI47+IZWslCAumJJanZqakFqUUwfUwcnFINTDxZ
 UyRtRe8pmlvf1q/RmHXKJ+H2POlJx9Iykws+FT58z+oa9OYi96k68WeHOrhKNm/+X2HM3rIy
 3slrS+HFN9yWt1+enuAUGysh/aZhGlerny/vklNPtv2qZTF43JfFlG2xl++io9fUzsRZTYum
 pzZuv8a5s7ty3VH3XSu6L/NMOMT/nm1R5sva1dtSN2acvpajEsIrUmMXcbHF5f7H6pe9DIH1
 kZZePw4fW737h5g2x/wni9fs8Wvz6pDYJ+HeqjQtbsfLfM3vm8XiTqlY6qTPn//rYH3HnBbx
 GsfTcnkpOlZr3XcUWHEsXFCwM1Yu3ysqyfegVaRSSWTNtD0CNumWn1TYkzl0pqysTn6sxFKc
 kWioxVxUnAgAHYrL+y4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsWy7bCSnO4kO89kg9unGC0ezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW3y70sFkcXnXHDaLGef3MVkc3RhssWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEcUl01Kak5mWWqRvl0CV8aCN1EFP4wrdp55zN7A2K3VxcjJISFgInHr8FnG
 LkYuDiGBHYwSZx5cZodISEtM79/DBmELS6z895wdoqiZSeLFv6WMIAk2AVOJVXMaWUESIgIT
 mCROvjvGApJgFtjKKDH1s1EXIweHsIC7xJcZJSBhFgFVicvfb7CBhHkFbCXOrDKGmC8vsXrD
 AWYQm1PATuJ5SxMriC0EVPL8/DvGCYx8CxgZVjFKphYU56bnFhsWGOWllusVJ+YWl+al6yXn
 525iBAe6ltYOxj2rPugdYmTiYDzEKMHBrCTC+1rJM1mINyWxsiq1KD++qDQntfgQozQHi5I4
 74Wuk/FCAumJJanZqakFqUUwWSYOTqkGJoMta28y5p7bVXTmRj3zjCIzn6J7s/mTL++8/TNu
 0c/n8Sn8DtceNBrf0ppRaTWvaLrpzTc7u28U70ldY92978WZrXUZ50tOPDKV7DjbNj9+sYSx
 eL2Ki8y7mg5RnYUPrn3rkb6+/JjKm6bChMsmNd5+ul3Hjpx6tHVBSwHrvFaWZ7/my9V9yAj4
 IRQf9G2yldDivFvJS5oTeVwmv+va2cEte5+R6UCwrkaJwxvTJT9lGbvv3lml8mwpZ3DGK9dF
 on9LVNV9056pRuz8zJKWeVjZIcZ0q1PdlABdAZlb1yx//VvXpbLj+JII49S+c7mfnsh+CFYw
 fLrouXm1wEd314r2W/ySF36U8k+XtmI5r8RSnJFoqMVcVJwIAHNuNmnjAgAA
X-CMS-MailID: 20221014104850epcas5p1a707b9d407a0947c3519077cf7fca5ff
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221014104850epcas5p1a707b9d407a0947c3519077cf7fca5ff
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104850epcas5p1a707b9d407a0947c3519077cf7fca5ff@epcas5p1.samsung.com>
X-Mailman-Approved-At: Sun, 16 Oct 2022 09:28:43 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support to configure samsung I2S CPU DAI in TDM mode.

Signed-off-by: Chandrasekar R <rcsekar@samsung.com>
Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
---
 sound/soc/samsung/i2s-regs.h | 15 +++++++
 sound/soc/samsung/i2s.c      | 84 +++++++++++++++++++++++++++++++++++-
 2 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/i2s-regs.h b/sound/soc/samsung/i2s-regs.h
index b4b5d6053503..cb2be4a3b70b 100644
--- a/sound/soc/samsung/i2s-regs.h
+++ b/sound/soc/samsung/i2s-regs.h
@@ -154,4 +154,19 @@
 #define I2SSIZE_TRNMSK		(0xffff)
 #define I2SSIZE_SHIFT		(16)
 
+#define TDM_LRCLK_WIDTH_SHIFT	12
+#define TDM_LRCLK_WIDTH_MASK	0xFF
+#define TDM_RX_SLOTS_SHIFT	8
+#define TDM_RX_SLOTS_MASK	7
+#define TDM_TX_SLOTS_SHIFT	4
+#define TDM_TX_SLOTS_MASK	7
+#define TDM_MODE_MASK		1
+#define TDM_MODE_SHIFT		1
+#define TDM_MODE_DSPA		0
+#define TDM_MODE_DSPB		1
+#define TDM_ENABLE		(1 << 0)
+
+/* stereo default */
+#define TDM_DEFAULT_SLOT_NUM_DIVIDER	2
+
 #endif /* __SND_SOC_SAMSUNG_I2S_REGS_H */
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 9505200f3d11..fb806b0af6ab 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -117,6 +117,8 @@ struct samsung_i2s_priv {
 	struct clk *clk_table[3];
 	struct clk_onecell_data clk_data;
 
+	int tdm_slots;
+
 	/* Spinlock protecting member fields below */
 	spinlock_t lock;
 
@@ -625,15 +627,19 @@ static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
 	struct i2s_dai *i2s = to_info(dai);
 	int lrp_shift, sdf_shift, sdf_mask, lrp_rlow, mod_slave;
+	int tdm_mod_mask, tdm_mod_shift;
+	u32 tdm = 0, tdm_tmp = 0;
 	u32 mod, tmp = 0;
 	unsigned long flags;
 
 	lrp_shift = priv->variant_regs->lrp_off;
 	sdf_shift = priv->variant_regs->sdf_off;
+	tdm_mod_shift = TDM_MODE_SHIFT;
 	mod_slave = 1 << priv->variant_regs->mss_off;
 
 	sdf_mask = MOD_SDF_MASK << sdf_shift;
 	lrp_rlow = MOD_LR_RLOW << lrp_shift;
+	tdm_mod_mask = TDM_MODE_MASK << tdm_mod_shift;
 
 	/* Format is priority */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -648,6 +654,20 @@ static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	case SND_SOC_DAIFMT_I2S:
 		tmp |= (MOD_SDF_IIS << sdf_shift);
 		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		if (!(priv->quirks & QUIRK_SUPPORTS_TDM)) {
+			dev_err(&i2s->pdev->dev, "TDM mode not supported\n");
+			return -EINVAL;
+		}
+		tdm_tmp |= (TDM_MODE_DSPA << tdm_mod_shift);
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		if (!(priv->quirks & QUIRK_SUPPORTS_TDM)) {
+			dev_err(&i2s->pdev->dev, "TDM mode not supported\n");
+			return -EINVAL;
+		}
+		tdm_tmp |= (TDM_MODE_DSPB << tdm_mod_shift);
+		break;
 	default:
 		dev_err(&i2s->pdev->dev, "Format not supported\n");
 		return -EINVAL;
@@ -693,12 +713,17 @@ static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	pm_runtime_get_sync(dai->dev);
 	spin_lock_irqsave(&priv->lock, flags);
 	mod = readl(priv->addr + I2SMOD);
+
+	if (priv->quirks & QUIRK_SUPPORTS_TDM)
+		tdm = readl(priv->addr + I2STDM);
 	/*
 	 * Don't change the I2S mode if any controller is active on this
 	 * channel.
 	 */
 	if (any_active(i2s) &&
-		((mod & (sdf_mask | lrp_rlow | mod_slave)) != tmp)) {
+		(((mod & (sdf_mask | lrp_rlow | mod_slave)) != tmp) ||
+		((priv->quirks & QUIRK_SUPPORTS_TDM) &&
+		 ((tdm & tdm_mod_mask) != tdm_tmp)))) {
 		spin_unlock_irqrestore(&priv->lock, flags);
 		pm_runtime_put(dai->dev);
 		dev_err(&i2s->pdev->dev,
@@ -706,6 +731,12 @@ static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EAGAIN;
 	}
 
+	if (priv->quirks & QUIRK_SUPPORTS_TDM) {
+		tdm &= ~(tdm_mod_mask);
+		tdm |= tdm_tmp;
+		writel(tdm, priv->addr + I2STDM);
+	}
+
 	mod &= ~(sdf_mask | lrp_rlow | mod_slave);
 	mod |= tmp;
 	writel(mod, priv->addr + I2SMOD);
@@ -812,6 +843,47 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int i2s_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
+				unsigned int rx_mask, int slots, int slot_width)
+{
+	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
+	struct i2s_dai *i2s = to_info(dai);
+	u32 tdm = 0, mask = 0, val = 0;
+	unsigned long flags;
+
+	if (!(priv->quirks & QUIRK_SUPPORTS_TDM)) {
+		dev_err(&i2s->pdev->dev, "Invalid request: TDM not enabled\n");
+		return -EINVAL;
+	}
+
+	mask |= (TDM_ENABLE);
+	mask |= (TDM_TX_SLOTS_MASK << TDM_TX_SLOTS_SHIFT);
+	mask |= (TDM_RX_SLOTS_MASK << TDM_RX_SLOTS_SHIFT);
+
+	if (slots) {
+		val |= ((slots-1) & TDM_TX_SLOTS_MASK) << TDM_TX_SLOTS_SHIFT;
+		val |= ((slots-1) & TDM_RX_SLOTS_MASK) << TDM_RX_SLOTS_SHIFT;
+
+		dev_info(&i2s->pdev->dev,
+			"TDM Mode Configured - TX and RX Slots: %d\n", slots);
+
+		val |= TDM_ENABLE;
+
+		priv->tdm_slots = slots;
+	} else {
+		val = 0;
+		priv->tdm_slots = 0;
+	}
+
+	spin_lock_irqsave(&priv->lock, flags);
+	tdm = readl(priv->addr + I2STDM);
+	tdm = (tdm & ~mask) | val;
+	writel(tdm, priv->addr + I2STDM);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
 /* We set constraints on the substream according to the version of I2S */
 static int i2s_startup(struct snd_pcm_substream *substream,
 	  struct snd_soc_dai *dai)
@@ -879,6 +951,9 @@ static int config_setup(struct i2s_dai *i2s)
 	if (!bfs && other)
 		bfs = other->bfs;
 
+	if (!bfs && (priv->quirks & QUIRK_SUPPORTS_TDM) && priv->tdm_slots)
+		bfs = blc * priv->tdm_slots;
+
 	/* Select least possible multiple(2) if no constraint set */
 	if (!bfs)
 		bfs = blc * 2;
@@ -899,6 +974,9 @@ static int config_setup(struct i2s_dai *i2s)
 			rfs = 256;
 		else
 			rfs = 384;
+
+		if ((priv->quirks & QUIRK_SUPPORTS_TDM) && priv->tdm_slots)
+			rfs /= (priv->tdm_slots / TDM_DEFAULT_SLOT_NUM_DIVIDER);
 	}
 
 	/* If already setup and running */
@@ -1110,6 +1188,7 @@ static const struct snd_soc_dai_ops samsung_i2s_dai_ops = {
 	.set_fmt = i2s_set_fmt,
 	.set_clkdiv = i2s_set_clkdiv,
 	.set_sysclk = i2s_set_sysclk,
+	.set_tdm_slot = i2s_set_tdm_slot,
 	.startup = i2s_startup,
 	.shutdown = i2s_shutdown,
 	.delay = i2s_delay,
@@ -1464,6 +1543,9 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to enable clock: %d\n", ret);
 		return ret;
 	}
+
+	priv->tdm_slots = 0;
+
 	pri_dai->dma_playback.addr = regs_base + I2STXD;
 	pri_dai->dma_capture.addr = regs_base + I2SRXD;
 	pri_dai->dma_playback.chan_name = "tx";
-- 
2.17.1

