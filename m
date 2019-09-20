Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3468AB9054
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 15:07:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C20CB74C;
	Fri, 20 Sep 2019 15:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C20CB74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568984830;
	bh=CwNq0fFQ2ZDd4e8vk3TburXT1VTbz/1XKsgHFYYlClw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o+xhb5SECQ6ld+i7ZnsVa9DXIquDe6D37nZ3qtzXqMoGQLr8epUIgKilJM+C0Pz01
	 eNEVt0dCQDHWyzvDRp9APOVB0m8DudSkJcwHHpHZxhsckHNJ6W1i7T4ZSoLB463+K6
	 /bbPRy/pTzkiOR2N3B8/1NTk2YbyPataAJf+qlCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E246AF80637;
	Fri, 20 Sep 2019 15:03:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D35FAF805FC; Fri, 20 Sep 2019 15:03:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C15AF80527
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 15:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C15AF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="i15ajaJ/"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190920130319euoutp01344b31a12f555aa417af4fe8a7e69e0f~GJy4YL1ty3045730457euoutp01Y
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 13:03:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190920130319euoutp01344b31a12f555aa417af4fe8a7e69e0f~GJy4YL1ty3045730457euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568984599;
 bh=IG9aCUpkb0C0GY0PPxLQ1iORcwSzlQcY4xdiM6gKoI8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i15ajaJ/KFHXFBUaLOCPFR1tDw2owWQ5VbH8nOf22PDwNO1m8vAjilP34jiwUQNV+
 Hwy3B1CCSyuKJJg7DNkf78LmM0CtbcnoYQ0hFUXKc1NAj+XesF/W9ZLEw+3AeCkrLm
 FPg9zQ19A5xpZsTzLg9s3b7yz0dBIxfaVlCXQjgw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190920130318eucas1p156104b46606a060bd072a6e6f11aeafb~GJy38FL7A2596425964eucas1p1O;
 Fri, 20 Sep 2019 13:03:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id CC.7A.04374.61EC48D5; Fri, 20
 Sep 2019 14:03:18 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190920130317eucas1p188d724710077d704f768798c6555c741~GJy3BFm9X2911529115eucas1p15;
 Fri, 20 Sep 2019 13:03:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190920130317eusmtrp16b78b1f48999d384e18ddb1881338181~GJy2vn7m_0476604766eusmtrp1W;
 Fri, 20 Sep 2019 13:03:17 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-32-5d84ce16f1b3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 3D.01.04117.51EC48D5; Fri, 20
 Sep 2019 14:03:17 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190920130316eusmtip205c8a75816f8ed3648877c26c6490308~GJy2D0jwE1287812878eusmtip2S;
 Fri, 20 Sep 2019 13:03:16 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, krzk@kernel.org
Date: Fri, 20 Sep 2019 15:02:13 +0200
Message-Id: <20190920130218.32690-5-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920130218.32690-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsWy7djPc7pi51piDe7MFbK4cvEQk8XGGetZ
 LaY+fMJmcaV1E6PF/CPnWC3On9/AbvHtSgeTxabH11gtZpzfx2Sx9shddovP7/ezWrTuPcJu
 cfhNO6vFxRVfmBz4PDZ8bmLz2DnrLrvHplWdbB6bl9R7TJ/zn9Gjb8sqRo/Pm+QC2KO4bFJS
 czLLUov07RK4Mjo6P7MUfDCo6J27l7GBsV29i5GTQ0LAROLMz2WMILaQwApGiclrBLsYuYDs
 L4wSiz7uYoVwPjNKHG/YxQ7TsXL5KajEckaJabfOMcG17Fh0hw2kik3AUKL3aB/YXBEBdYn7
 M5rAOpgFXjJJTDi6jgkkISzgJbH5+kqwBhYBVYkFvxaA2bwC1hK/9v5hhVgnL7F6wwFmEJtT
 wEbi5Y1FTBDxbewSrw4oQdguEktutrNA2MISr45vgTpVRuL05B4WkMUSAs2MEj27b7NDOBMY
 Je4fX8AIUWUtcfj4RaBtHEDnaUqs36UPEXaU6Lq7iwUkLCHAJ3HjrSBImBnInLRtOjNEmFei
 o00IolpF4veq6VCnSUl0P/kP1ekh8aYpBBI+/YwS6zZPYJvAKD8LYdcCRsZVjOKppcW56anF
 xnmp5XrFibnFpXnpesn5uZsYgcnn9L/jX3cw7vuTdIhRgINRiYfX41hLrBBrYllxZe4hRgkO
 ZiUR3jmmTbFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeasZHkQLCaQnlqRmp6YWpBbBZJk4OKUa
 GPWdEjIcpHcY7El8eYgpaWvXC3mnZWFs7nrVykJHTxyPE0uQyShU1ePZ/8dfpPuowV+FlDb7
 iSUfXshxPpXRufy4a8GS9rbjKp2zuHmz7PWMjHdE1rsLXJtu2OWbqepxeX8fa7mSakHMPcF/
 O6fHfmXWKmW6Iu9ow7t/yoR9Iav4bqybGL1EiaU4I9FQi7moOBEA8uyqPDoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42I5/e/4PV3Rcy2xBs+6hSyuXDzEZLFxxnpW
 i6kPn7BZXGndxGgx/8g5Vovz5zewW3y70sFksenxNVaLGef3MVmsPXKX3eLz+/2sFq17j7Bb
 HH7TzmpxccUXJgc+jw2fm9g8ds66y+6xaVUnm8fmJfUe0+f8Z/To27KK0ePzJrkA9ig9m6L8
 0pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jI7OzywFHwwq
 eufuZWxgbFfvYuTkkBAwkVi5/BRrFyMXh5DAUkaJV7d7gRwOoISUxPwWJYgaYYk/17rYIGo+
 MUqcX7WPBSTBJmAo0Xu0jxHEFhHQlOiYdxtsELPAdyaJA49PMoMkhAW8JDZfX8kGYrMIqEos
 +LUAzOYVsJb4tfcPK8QGeYnVGw6A1XMK2Ei8vLGICcQWAqo5vW8v+wRGvgWMDKsYRVJLi3PT
 c4uN9IoTc4tL89L1kvNzNzECo2HbsZ9bdjB2vQs+xCjAwajEw+txrCVWiDWxrLgy9xCjBAez
 kgjvHNOmWCHelMTKqtSi/Pii0pzU4kOMpkBHTWSWEk3OB0ZqXkm8oamhuYWlobmxubGZhZI4
 b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGxhajKzNFc3N1pU691717vyhCZ5dYr++tOe5KIj8X
 6X9+MkUr7ftWnnVFGm083xYu7lhc8yGqRN/S/93R/20r7Wac8a+d86t/34O5cWlfVbZe1Fpw
 U1dhr92XbxpekYfDNFkuaK/tO9cou9u+4DTbzLXVMyNzfu+f65+t4j01IH+1wrpbTgd/iyix
 FGckGmoxFxUnAgBuipennAIAAA==
X-CMS-MailID: 20190920130317eucas1p188d724710077d704f768798c6555c741
X-Msg-Generator: CA
X-RootMTR: 20190920130317eucas1p188d724710077d704f768798c6555c741
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920130317eucas1p188d724710077d704f768798c6555c741
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130317eucas1p188d724710077d704f768798c6555c741@eucas1p1.samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v2 04/10] ASoC: wm8994: Add support for MCLKn
	clock gating
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

As an intermediate step before covering the clocking subsystem
of the CODEC entirely by the clk API add handling of external CODEC's
master clocks in DAPM events when the AIFn clocks are sourced directly
from MCLKn; when FLLn are used we enable/disable respective MCLKn
before/after FLLn is enabled/disabled.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - addressed review comments from Charles
---
 sound/soc/codecs/wm8994.c | 108 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 104 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index f69545dced25..15ce64a48a87 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -1038,6 +1038,45 @@ static bool wm8994_check_class_w_digital(struct snd_soc_component *component)
 	return true;
 }
 
+static int aif_mclk_set(struct snd_soc_component *component, int aif, bool enable)
+{
+	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
+	unsigned int offset, val, clk_idx;
+	int ret;
+
+	if (aif)
+		offset = 4;
+	else
+		offset = 0;
+
+	val = snd_soc_component_read32(component, WM8994_AIF1_CLOCKING_1 + offset);
+	val &= WM8994_AIF1CLK_SRC_MASK;
+
+	switch (val) {
+	case 0:
+		clk_idx = WM8994_MCLK1;
+		break;
+	case 1:
+		clk_idx = WM8994_MCLK2;
+		break;
+	default:
+		return 0;
+	}
+
+	if (enable) {
+		ret = clk_prepare_enable(wm8994->mclk[clk_idx].clk);
+		if (ret < 0) {
+			dev_err(component->dev,	"Failed to enable MCLK%d\n",
+				clk_idx);
+			return ret;
+		}
+	} else {
+		clk_disable_unprepare(wm8994->mclk[clk_idx].clk);
+	}
+
+	return 0;
+}
+
 static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 		      struct snd_kcontrol *kcontrol, int event)
 {
@@ -1045,7 +1084,7 @@ static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	struct wm8994 *control = wm8994->wm8994;
 	int mask = WM8994_AIF1DAC1L_ENA | WM8994_AIF1DAC1R_ENA;
-	int i;
+	int ret, i;
 	int dac;
 	int adc;
 	int val;
@@ -1061,6 +1100,10 @@ static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		ret = aif_mclk_set(component, 0, true);
+		if (ret < 0)
+			return ret;
+
 		/* Don't enable timeslot 2 if not in use */
 		if (wm8994->channels[0] <= 2)
 			mask &= ~(WM8994_AIF1DAC2L_ENA | WM8994_AIF1DAC2R_ENA);
@@ -1133,6 +1176,12 @@ static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMD:
+		aif_mclk_set(component, 0, false);
+		break;
+	}
+
 	return 0;
 }
 
@@ -1140,13 +1189,17 @@ static int aif2clk_ev(struct snd_soc_dapm_widget *w,
 		      struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	int i;
+	int ret, i;
 	int dac;
 	int adc;
 	int val;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		ret = aif_mclk_set(component, 1, true);
+		if (ret < 0)
+			return ret;
+
 		val = snd_soc_component_read32(component, WM8994_AIF2_CONTROL_1);
 		if ((val & WM8994_AIF2ADCL_SRC) &&
 		    (val & WM8994_AIF2ADCR_SRC))
@@ -1218,6 +1271,12 @@ static int aif2clk_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMD:
+		aif_mclk_set(component, 1, false);
+		break;
+	}
+
 	return 0;
 }
 
@@ -1623,10 +1682,10 @@ SND_SOC_DAPM_POST("Late Disable PGA", late_disable_ev)
 static const struct snd_soc_dapm_widget wm8994_lateclk_widgets[] = {
 SND_SOC_DAPM_SUPPLY("AIF1CLK", WM8994_AIF1_CLOCKING_1, 0, 0, aif1clk_ev,
 		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-		    SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("AIF2CLK", WM8994_AIF2_CLOCKING_1, 0, 0, aif2clk_ev,
 		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-		    SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_PGA("Direct Voice", SND_SOC_NOPM, 0, 0, NULL, 0),
 SND_SOC_DAPM_MIXER("SPKL", WM8994_POWER_MANAGEMENT_3, 8, 0,
 		   left_speaker_mixer, ARRAY_SIZE(left_speaker_mixer)),
@@ -2141,6 +2200,7 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 	u16 reg, clk1, aif_reg, aif_src;
 	unsigned long timeout;
 	bool was_enabled;
+	struct clk *mclk;
 
 	switch (id) {
 	case WM8994_FLL1:
@@ -2216,6 +2276,27 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 	snd_soc_component_update_bits(component, WM8994_FLL1_CONTROL_1 + reg_offset,
 			    WM8994_FLL1_ENA, 0);
 
+	/* Disable MCLK if needed before we possibly change to new clock parent */
+	if (was_enabled) {
+		reg = snd_soc_component_read32(component, WM8994_FLL1_CONTROL_5
+							+ reg_offset);
+		reg = ((reg & WM8994_FLL1_REFCLK_SRC_MASK)
+			>> WM8994_FLL1_REFCLK_SRC_SHIFT) + 1;
+
+		switch (reg) {
+		case WM8994_FLL_SRC_MCLK1:
+			mclk = wm8994->mclk[WM8994_MCLK1].clk;
+			break;
+		case WM8994_FLL_SRC_MCLK2:
+			mclk = wm8994->mclk[WM8994_MCLK2].clk;
+			break;
+		default:
+			mclk = NULL;
+		}
+
+		clk_disable_unprepare(mclk);
+	}
+
 	if (wm8994->fll_byp && src == WM8994_FLL_SRC_BCLK &&
 	    freq_in == freq_out && freq_out) {
 		dev_dbg(component->dev, "Bypassing FLL%d\n", id + 1);
@@ -2260,10 +2341,29 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 	/* Clear any pending completion from a previous failure */
 	try_wait_for_completion(&wm8994->fll_locked[id]);
 
+	switch (src) {
+	case WM8994_FLL_SRC_MCLK1:
+		mclk = wm8994->mclk[WM8994_MCLK1].clk;
+		break;
+	case WM8994_FLL_SRC_MCLK2:
+		mclk = wm8994->mclk[WM8994_MCLK2].clk;
+		break;
+	default:
+		mclk = NULL;
+	}
+
 	/* Enable (with fractional mode if required) */
 	if (freq_out) {
+		ret = clk_prepare_enable(mclk);
+		if (ret < 0) {
+			dev_err(component->dev, "Failed to enable MCLK for FLL%d\n",
+				id + 1);
+			return ret;
+		}
+
 		/* Enable VMID if we need it */
 		if (!was_enabled) {
+
 			active_reference(component);
 
 			switch (control->type) {
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
