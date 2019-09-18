Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5C4B61D5
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 12:51:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B033168D;
	Wed, 18 Sep 2019 12:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B033168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568803892;
	bh=3XjLpMw/VVWeRyCeuURc9XU5jjYA0a6Y32FKkzMJ1c0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OagUSLYkVvmcBdBwwwyno2u+s9Xg6w9r7wisa9h9QQWu/DFmQPx0vicg7pdT/x2sD
	 VVjt2eqpCw2YKBIemgU1IOcOK/uu018BIB7oqCfVOiDaOCcfBVM+Uamr439OgjO2Ru
	 JSGiioJ7rJylCvk6x91KEfeEIoPr5q21awOEyMDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38E34F8063D;
	Wed, 18 Sep 2019 12:47:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 452E3F80506; Wed, 18 Sep 2019 12:47:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15F78F804FF
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 12:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15F78F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="C9+sH1mK"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190918104702euoutp01ab0c7065748f64f14f605f7c32aecdb7~FgpUbWycV1218112181euoutp016
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 10:47:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190918104702euoutp01ab0c7065748f64f14f605f7c32aecdb7~FgpUbWycV1218112181euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568803622;
 bh=UDuCs4g0QkMfxFJ4eGthD7cU7Dhgt1rusdkVHQ4ZNek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C9+sH1mKLOPMQ5UfJe+uFIDM82FqVL6xZZfaYaKLaBuU/zkRF1Q9/y9XjNG910cnc
 /aE/Ocekxyd0HXCUB79yT2jvW/0uW8YuUTuDMXLQ58vNDpykzbAzrYyEgIoehQhjfM
 6OiQk3VcdiZAG6wCYXiBJASXMIXF5ShiIUzHQKBQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190918104701eucas1p27ee7a7485a0394a8cd5020d60a6a578f~FgpTpHPhX2379323793eucas1p2Z;
 Wed, 18 Sep 2019 10:47:01 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id F4.B4.04309.42B028D5; Wed, 18
 Sep 2019 11:47:00 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190918104700eucas1p1ef0775632f5c7259fb54cab8efc96c50~FgpS3ciPt2008120081eucas1p1k;
 Wed, 18 Sep 2019 10:47:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190918104700eusmtrp269c1ae9be3fb96c6174655fdb5018121~FgpSn27QN1555615556eusmtrp2b;
 Wed, 18 Sep 2019 10:47:00 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-0f-5d820b24280c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 8B.B6.04166.42B028D5; Wed, 18
 Sep 2019 11:47:00 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190918104659eusmtip1b787771d09277d09e79b4ff03353b428~FgpR9w-Nu0494604946eusmtip1_;
 Wed, 18 Sep 2019 10:46:59 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org
Date: Wed, 18 Sep 2019 12:46:29 +0200
Message-Id: <20190918104634.15216-5-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918104634.15216-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSbUhTYRjtvXd3u86mtzn0xSRhWZGZZkRccEaDflwKSiGkEquZN5Wc2qZO
 C3VZKz9KxTJlGJoV2so2l4hf5WeuNJ2iRU40TemHKIpbSmy2Nu+sf+ec55z3OTy8OMrXYL54
 YnIaLUuWJAnZXFZz/2/jwQD3vJhDtxpE5PhoD0I2Vmoxsnx2nk2Oq/SArO4bxkijUcch18bz
 EVI/9xUjK43vEbKhb4pDmpc7MVL1ro9D9i7ew8jRegty3IPSmfPYVKt6ikPpNQVs6u3zXKqi
 yg6o4iYNoMz6XRGcC1xRHJ2UmEHLQo5d5iZ02tfR1JXATHVrB6IE5cJC4IZD4gi0vmwBhYCL
 84l6AEc6u13EAmCJ7Y6LmAH8WavkbEV+PFNjzKAOwF+rb7B/ke8WFXC62EQofPCheBMLCG84
 WVWAOk0oYUPg0oaa5Rx4ERScMDRhTswi9kC7aWNT5xFh0KI1YMw6f/hK14U6sRshgqsjMyzn
 Q5Bo5sBh0xCbMZ2Ag+3TLAZ7wQVDk6urH7S3ViNM4DaA99snOQwpdXQ11ADGFQZ7DaOOdbij
 336obQthZDHM1zWynTIkPOC3pR1OGXXAsuYKlJF5MP8un3EHQKumAmGwLyyat7vqUNDeve66
 UAmAJtsAVgr81f+X1QCgAT50ulwaT8sPJ9OKYLlEKk9Pjg++kiLVA8cPGvxjsLSANltsDyBw
 INzO6xpQxvAxSYY8S9oDII4KBbyI7NwYPi9OknWDlqVckqUn0fIesBNnCX14N7fNRPOJeEka
 fY2mU2nZ1hTB3XyVIGHfyTjhtI9t5SGh8DlTZNWeqhsS1x0VUKiHu6rfQ9yoOR/lHbWQLbgY
 EyswLSeYIq8ue+aX8amgAwMqRfSXT62FgjGxNYjrV6U4K1p7vHtu/oVnYm3HRFR/zscO695+
 0ZOxyNXTZYLrTy2LpeJMfVr47CPjZ1F6TvhIybnXjUKWPEESGojK5JK/oYE9AT0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42I5/e/4XV0V7qZYg9XnWS2uXDzEZLFxxnpW
 i6kPn7BZXGndxGgx/8g5Vovz5zewW3y70sFksenxNVaLGef3MVmsPXKX3eLz+/2sFq17j7Bb
 HH7TzmpxccUXJgc+jw2fm9g8ds66y+6xaVUnm8fmJfUe0+f8Z/To27KK0ePzJrkA9ig9m6L8
 0pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jP3/vzMXfNCq
 mLVzD1MD41SlLkZODgkBE4lHi2exdjFycQgJLGWUOP75HlMXIwdQQkpifgtUjbDEn2tdbBA1
 nxglrn27xwaSYBMwlOg92scIYosIiEncntPJDFLELNDFLPF+xy9WkISwgIfEzeNbwGwWAVWJ
 /7f+soDYvALWEl/WH2eF2CAvsXrDAWYQm1PARuLThQdgNUJANQuOTWOcwMi3gJFhFaNIamlx
 bnpusaFecWJucWleul5yfu4mRmA0bDv2c/MOxksbgw8xCnAwKvHwHjjVECvEmlhWXJl7iFGC
 g1lJhDegtj5WiDclsbIqtSg/vqg0J7X4EKMp0FETmaVEk/OBkZpXEm9oamhuYWlobmxubGah
 JM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoFRvu7si+YLu9ec2z7JN5Z5zxfNLvGinZe779nN
 m/DyxJd3zF0nbjbwCl3xk1hdZvDzLYt7qLP0ntfxpvPr1mgditw2bZL+/8WuXNNPWkX/f8Zz
 20I6jeml24McvkgB9o0vFy2K/711/3SeV59uLGuMZE+tUbluZrLgz7LixRP99H04nz2+L/C/
 VomlOCPRUIu5qDgRACYsqtKcAgAA
X-CMS-MailID: 20190918104700eucas1p1ef0775632f5c7259fb54cab8efc96c50
X-Msg-Generator: CA
X-RootMTR: 20190918104700eucas1p1ef0775632f5c7259fb54cab8efc96c50
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104700eucas1p1ef0775632f5c7259fb54cab8efc96c50
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104700eucas1p1ef0775632f5c7259fb54cab8efc96c50@eucas1p1.samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v1 4/9] ASoC: wm8994: Add support for MCLKn
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
 sound/soc/codecs/wm8994.c | 91 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 87 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index b6b0842ae1fc..bf02e8908d5a 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -1038,6 +1038,46 @@ static bool wm8994_check_class_w_digital(struct snd_soc_component *component)
 	return true;
 }
 
+static int aif_mclk_set(struct snd_soc_component *component, int aif, bool enable)
+{
+	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
+	struct wm8994 *control = wm8994->wm8994;
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
+		ret = clk_prepare_enable(control->mclk[clk_idx].clk);
+		if (ret < 0) {
+			dev_err(component->dev,	"Failed to enable MCLK%d\n",
+				clk_idx);
+			return ret;
+		}
+	} else {
+		clk_disable_unprepare(control->mclk[clk_idx].clk);
+	}
+
+	return 0;
+}
+
 static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 		      struct snd_kcontrol *kcontrol, int event)
 {
@@ -1045,7 +1085,7 @@ static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	struct wm8994 *control = wm8994->wm8994;
 	int mask = WM8994_AIF1DAC1L_ENA | WM8994_AIF1DAC1R_ENA;
-	int i;
+	int ret, i;
 	int dac;
 	int adc;
 	int val;
@@ -1061,6 +1101,10 @@ static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		ret = aif_mclk_set(component, 0, true);
+		if (ret < 0)
+			return ret;
+
 		/* Don't enable timeslot 2 if not in use */
 		if (wm8994->channels[0] <= 2)
 			mask &= ~(WM8994_AIF1DAC2L_ENA | WM8994_AIF1DAC2R_ENA);
@@ -1133,6 +1177,12 @@ static int aif1clk_ev(struct snd_soc_dapm_widget *w,
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
 
@@ -1140,13 +1190,17 @@ static int aif2clk_ev(struct snd_soc_dapm_widget *w,
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
@@ -1218,6 +1272,12 @@ static int aif2clk_ev(struct snd_soc_dapm_widget *w,
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
 
@@ -1623,10 +1683,10 @@ SND_SOC_DAPM_POST("Late Disable PGA", late_disable_ev)
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
@@ -2141,6 +2201,7 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 	u16 reg, clk1, aif_reg, aif_src;
 	unsigned long timeout;
 	bool was_enabled;
+	struct clk *mclk;
 
 	switch (id) {
 	case WM8994_FLL1:
@@ -2260,8 +2321,28 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 	/* Clear any pending completion from a previous failure */
 	try_wait_for_completion(&wm8994->fll_locked[id]);
 
+	switch (src) {
+	case WM8994_FLL_SRC_MCLK1:
+		mclk = control->mclk[0].clk;
+		break;
+	case WM8994_FLL_SRC_MCLK2:
+		mclk = control->mclk[1].clk;
+		break;
+	default:
+		mclk = NULL;
+	}
+
 	/* Enable (with fractional mode if required) */
 	if (freq_out) {
+		if (mclk) {
+			ret = clk_prepare_enable(mclk);
+			if (ret < 0) {
+				dev_err(component->dev,
+					"Failed to enable MCLK for FLL%d\n",
+					id + 1);
+				return ret;
+			}
+		}
 		/* Enable VMID if we need it */
 		if (!was_enabled) {
 			active_reference(component);
@@ -2315,6 +2396,8 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 
 			active_dereference(component);
 		}
+		if (mclk)
+			clk_disable_unprepare(mclk);
 	}
 
 out:
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
