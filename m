Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEB723BBD2
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 16:12:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75B0A1664;
	Tue,  4 Aug 2020 16:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75B0A1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596550373;
	bh=rCMRia30kYYrLV/FsLenN74juQJ8gCoBi5G0IhJ19Yg=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Boig0srq1+n3Xsg3kyLCpjaxpT/tXFRh3oPGHZYEVLMBNDG/0Zv7XQTI2nCCtLaXk
	 wfSefUfN2eV86m1PUwDsWEHhGbWn2//f1+BLX5HqxRGzF1kSOg9bku9nVd+2q4nYju
	 hkSZUp2LrfWA59KXuBQ9EHUO4e6zEKucGpatfHIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EECAF80124;
	Tue,  4 Aug 2020 16:11:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 826F1F8015A; Tue,  4 Aug 2020 16:11:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43569F8014C
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 16:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43569F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="r7+0ZaQS"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200804141056euoutp02a7dfc75c44405a164dac5a8f18912365~oFf-uX_zA0103301033euoutp02k
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 14:10:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200804141056euoutp02a7dfc75c44405a164dac5a8f18912365~oFf-uX_zA0103301033euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1596550256;
 bh=BFvTDh4BdTw0MLyllcfsMnFQkszdp2eQK4Cq2TqIzos=;
 h=From:To:Cc:Subject:Date:References:From;
 b=r7+0ZaQScHUmTvkKiVwfDnVsYVkVFleQHnQMUZdcoC6Trviojhid7Ksbgbi9Bqwdt
 CRttJXlJx582Oy+K+9CGrseo53Zg97zrlcY+uLVsylTFTnK18DM3uoRqV7gWQ7r0TN
 0LhIm+F0RzlE6cl4MPdJYyWTt8jICqN9pmahn5zg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200804141056eucas1p11e6c43ab449d22bce2799fa764fcfea7~oFf-bW2xM1240812408eucas1p1K;
 Tue,  4 Aug 2020 14:10:56 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 20.EB.06318.07C692F5; Tue,  4
 Aug 2020 15:10:56 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200804141056eucas1p176f970fa509a9caa677837118c7ed50c~oFf-G65Fh0986309863eucas1p1e;
 Tue,  4 Aug 2020 14:10:56 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200804141056eusmtrp220cbf9abfc2a7e3fdfbb663b639338ec~oFf-F6gCY2142021420eusmtrp23;
 Tue,  4 Aug 2020 14:10:56 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-ac-5f296c702db9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 16.D6.06017.07C692F5; Tue,  4
 Aug 2020 15:10:56 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200804141055eusmtip2fd5ae19e784fd14e86899ea4348ba751~oFf_pyqzN0775507755eusmtip2J;
 Tue,  4 Aug 2020 14:10:55 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: wm8994: Prevent access to invalid VU register bits on
 WM1811
Date: Tue,  4 Aug 2020 16:10:43 +0200
Message-Id: <20200804141043.11425-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNIsWRmVeSWpSXmKPExsWy7djP87oFOZrxBg/uyFhcuXiIyWLjjPWs
 FlMfPmGzuNK6idHi25UOJou1R+6yW3x+v5/V4vCbdlaLLWduszlwemz43MTmsXPWXXaPTas6
 2Txa1m9i85g+5z+jR9+WVYwBbFFcNimpOZllqUX6dglcGWdv2hWs1KrovPKAsYFxjnIXIyeH
 hICJxMT9TYwgtpDACkaJqx2CEPYXIPt+fBcjF5D9mVHi29fT7DANs27MYoEoWs4osfh8DkQR
 UEP/yi5WkASbgKFE79E+sKkiAmISt+d0MoMUMQu8Y5T4/vw+WJGwQKjE3/33wGwWAVWJ98uW
 gzXwClhLfDt1jwlim7zE6g0HwJolBD6zSTyftg/I4QByXCRWnqmCqBGWeHV8C9R1MhL/d85n
 gqhvZpTo2X2bHcKZwChx//gCRogqa4k7536xgQxiFtCUWL9LHyLsKPFs/wR2iPl8EjfegoOC
 GcictG061FpeiY42IYhqFYnfq6ZDnSkl0f3kPwtEiYfE+svSkPCJlbg5bTfrBEa5WQirFjAy
 rmIUTy0tzk1PLTbOSy3XK07MLS7NS9dLzs/dxAhMEqf/Hf+6g3Hfn6RDjAIcjEo8vCdCNOOF
 WBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIhRmoNFSZzXeNHLWCGB9MSS1OzU
 1ILUIpgsEwenVAOjc+3X/I8cNq/lHFgTDW37nh5ITJypfOTlJfnzzFf/y9e+fPLkoh9jt6/6
 xAX+HIuD7JdlJC0VmqyW77lzie0fhvIZ+qsLZ1rPP7/7jlt7eW0gX8NDjqSwHbdr/3w9qmsq
 nXaDX/1vbPb1eRnfmyZpKviorql++Jr9zbHrtw8WJpgzlDc+MopXYinOSDTUYi4qTgQAou92
 sw4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsVy+t/xe7oFOZrxBk0HOCyuXDzEZLFxxnpW
 i6kPn7BZXGndxGjx7UoHk8XaI3fZLT6/389qcfhNO6vFljO32Rw4PTZ8bmLz2DnrLrvHplWd
 bB4t6zexeUyf85/Ro2/LKsYAtig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNT
 JX07m5TUnMyy1CJ9uwS9jLM37QpWalV0XnnA2MA4R7mLkZNDQsBEYtaNWSxdjFwcQgJLGSUO
 XF3F2sXIAZSQkpjfogRRIyzx51oXG0TNJ0aJS8uuMoIk2AQMJXqP9oHZIgJiErfndDKDFDEL
 fGOUeL3tLgtIQlggWGLJojVMIDaLgKrE+2XLwRp4Bawlvp26xwSxQV5i9YYDzBMYeRYwMqxi
 FEktLc5Nzy020itOzC0uzUvXS87P3cQIDNFtx35u2cHY9S74EKMAB6MSD++JEM14IdbEsuLK
 3EOMEhzMSiK8TmdPxwnxpiRWVqUW5ccXleakFh9iNAVaPpFZSjQ5Hxg/eSXxhqaG5haWhubG
 5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGFfZuX957J+dmbyqL/+3/fQ/YhqmP2K3
 r61ck3ae/cKMnY/33d5V/1vT5/NDmUkhb6dH7//0//y/hacFRDae13J+fX9nxk/jl2zKEW8l
 Otr0hHx5jGJm+J6fnjN3Um77Kbk5KVs29jAmh5wueht0vl3i0bu3wn8/PnN1f8PN9t+3kzfP
 Obv7/iklluKMREMt5qLiRADntcaEZwIAAA==
X-CMS-MailID: 20200804141056eucas1p176f970fa509a9caa677837118c7ed50c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200804141056eucas1p176f970fa509a9caa677837118c7ed50c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200804141056eucas1p176f970fa509a9caa677837118c7ed50c
References: <CGME20200804141056eucas1p176f970fa509a9caa677837118c7ed50c@eucas1p1.samsung.com>
Cc: simon@lineageos.org, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, m.szyprowski@samsung.com
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

The ADC2 and DAC2 are not available on WM1811 device. This patch moves
the ADC2, DAC2 VU bitfields to a separate array so we can skip accessing
them and avoid unreadable register access on WM1811.

This allows to get rid of warnings during boot like:
wm8994-codec: ASoC: error at soc_component_read_no_lock on wm8994-codec: -5

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/codecs/wm8994.c | 60 ++++++++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index a84ae879d37e..038be667c1a6 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -43,10 +43,12 @@
 #define WM8994_NUM_DRC 3
 #define WM8994_NUM_EQ  3

-static struct {
+struct wm8994_reg_mask {
 	unsigned int reg;
 	unsigned int mask;
-} wm8994_vu_bits[] = {
+};
+
+static struct wm8994_reg_mask wm8994_vu_bits[] = {
 	{ WM8994_LEFT_LINE_INPUT_1_2_VOLUME, WM8994_IN1_VU },
 	{ WM8994_RIGHT_LINE_INPUT_1_2_VOLUME, WM8994_IN1_VU },
 	{ WM8994_LEFT_LINE_INPUT_3_4_VOLUME, WM8994_IN2_VU },
@@ -60,14 +62,10 @@ static struct {

 	{ WM8994_AIF1_DAC1_LEFT_VOLUME, WM8994_AIF1DAC1_VU },
 	{ WM8994_AIF1_DAC1_RIGHT_VOLUME, WM8994_AIF1DAC1_VU },
-	{ WM8994_AIF1_DAC2_LEFT_VOLUME, WM8994_AIF1DAC2_VU },
-	{ WM8994_AIF1_DAC2_RIGHT_VOLUME, WM8994_AIF1DAC2_VU },
 	{ WM8994_AIF2_DAC_LEFT_VOLUME, WM8994_AIF2DAC_VU },
 	{ WM8994_AIF2_DAC_RIGHT_VOLUME, WM8994_AIF2DAC_VU },
 	{ WM8994_AIF1_ADC1_LEFT_VOLUME, WM8994_AIF1ADC1_VU },
 	{ WM8994_AIF1_ADC1_RIGHT_VOLUME, WM8994_AIF1ADC1_VU },
-	{ WM8994_AIF1_ADC2_LEFT_VOLUME, WM8994_AIF1ADC2_VU },
-	{ WM8994_AIF1_ADC2_RIGHT_VOLUME, WM8994_AIF1ADC2_VU },
 	{ WM8994_AIF2_ADC_LEFT_VOLUME, WM8994_AIF2ADC_VU },
 	{ WM8994_AIF2_ADC_RIGHT_VOLUME, WM8994_AIF1ADC2_VU },
 	{ WM8994_DAC1_LEFT_VOLUME, WM8994_DAC1_VU },
@@ -76,6 +74,14 @@ static struct {
 	{ WM8994_DAC2_RIGHT_VOLUME, WM8994_DAC2_VU },
 };

+/* VU bitfields for ADC2, DAC2 not available on WM1811 */
+static struct wm8994_reg_mask wm8994_adc2_dac2_vu_bits[] = {
+	{ WM8994_AIF1_DAC2_LEFT_VOLUME, WM8994_AIF1DAC2_VU },
+	{ WM8994_AIF1_DAC2_RIGHT_VOLUME, WM8994_AIF1DAC2_VU },
+	{ WM8994_AIF1_ADC2_LEFT_VOLUME, WM8994_AIF1ADC2_VU },
+	{ WM8994_AIF1_ADC2_RIGHT_VOLUME, WM8994_AIF1ADC2_VU },
+};
+
 static int wm8994_drc_base[] = {
 	WM8994_AIF1_DRC1_1,
 	WM8994_AIF1_DRC2_1,
@@ -1030,6 +1036,26 @@ static bool wm8994_check_class_w_digital(struct snd_soc_component *component)
 	return true;
 }

+static void wm8994_update_vu_bits(struct snd_soc_component *component)
+{
+	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
+	struct wm8994 *control = wm8994->wm8994;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(wm8994_vu_bits); i++)
+		snd_soc_component_write(component, wm8994_vu_bits[i].reg,
+					snd_soc_component_read(component,
+						       wm8994_vu_bits[i].reg));
+	if (control->type == WM1811)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(wm8994_adc2_dac2_vu_bits); i++)
+		snd_soc_component_write(component,
+				wm8994_adc2_dac2_vu_bits[i].reg,
+				snd_soc_component_read(component,
+					wm8994_adc2_dac2_vu_bits[i].reg));
+}
+
 static int aif_mclk_set(struct snd_soc_component *component, int aif, bool enable)
 {
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
@@ -1076,7 +1102,7 @@ static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	struct wm8994 *control = wm8994->wm8994;
 	int mask = WM8994_AIF1DAC1L_ENA | WM8994_AIF1DAC1R_ENA;
-	int ret, i;
+	int ret;
 	int dac;
 	int adc;
 	int val;
@@ -1144,10 +1170,7 @@ static int aif1clk_ev(struct snd_soc_dapm_widget *w,
 		break;

 	case SND_SOC_DAPM_POST_PMU:
-		for (i = 0; i < ARRAY_SIZE(wm8994_vu_bits); i++)
-			snd_soc_component_write(component, wm8994_vu_bits[i].reg,
-				      snd_soc_component_read(component,
-						   wm8994_vu_bits[i].reg));
+		wm8994_update_vu_bits(component);
 		break;

 	case SND_SOC_DAPM_PRE_PMD:
@@ -1181,7 +1204,7 @@ static int aif2clk_ev(struct snd_soc_dapm_widget *w,
 		      struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	int ret, i;
+	int ret;
 	int dac;
 	int adc;
 	int val;
@@ -1237,10 +1260,7 @@ static int aif2clk_ev(struct snd_soc_dapm_widget *w,
 		break;

 	case SND_SOC_DAPM_POST_PMU:
-		for (i = 0; i < ARRAY_SIZE(wm8994_vu_bits); i++)
-			snd_soc_component_write(component, wm8994_vu_bits[i].reg,
-				      snd_soc_component_read(component,
-						   wm8994_vu_bits[i].reg));
+		wm8994_update_vu_bits(component);
 		break;

 	case SND_SOC_DAPM_PRE_PMD:
@@ -4346,6 +4366,14 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 				    wm8994_vu_bits[i].mask,
 				    wm8994_vu_bits[i].mask);

+	if (control->type != WM1811) {
+		for (i = 0; i < ARRAY_SIZE(wm8994_adc2_dac2_vu_bits); i++)
+			snd_soc_component_update_bits(component,
+					wm8994_adc2_dac2_vu_bits[i].reg,
+					wm8994_adc2_dac2_vu_bits[i].mask,
+					wm8994_adc2_dac2_vu_bits[i].mask);
+	}
+
 	/* Set the low bit of the 3D stereo depth so TLV matches */
 	snd_soc_component_update_bits(component, WM8994_AIF1_DAC1_FILTERS_2,
 			    1 << WM8994_AIF1DAC1_3D_GAIN_SHIFT,
--
2.17.1

