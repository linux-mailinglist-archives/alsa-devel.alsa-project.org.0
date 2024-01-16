Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2D682EBC5
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 10:42:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 748517F4;
	Tue, 16 Jan 2024 10:42:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 748517F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705398145;
	bh=giZJPjzHIAgbfcWBFZIpouzW5e8CYSbpzSOMlA3D6XM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Neo8jMlXrhgv2YsFS1kGOEoxZfKGPzNYRh0XrITMQKiymJS0sWX92w5D7HG9H/9UF
	 3BIss0CEWSvbfsXO5+Stujp2e+eJmI33OCp5al4cIiooKdruz7nWWEDw4B89/cfYTK
	 OyGd2yhmIW0YsY83IgIVQaiBYV57N4opmcObMM9g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ACA4F806BE; Tue, 16 Jan 2024 10:40:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08DBBF806C3;
	Tue, 16 Jan 2024 10:40:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74ABCF805ED; Tue, 16 Jan 2024 10:39:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98602F8028D
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 10:39:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98602F8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jlvOdhA0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9987B6114A;
	Tue, 16 Jan 2024 09:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9666AC433B1;
	Tue, 16 Jan 2024 09:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705397981;
	bh=giZJPjzHIAgbfcWBFZIpouzW5e8CYSbpzSOMlA3D6XM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jlvOdhA0zQtwZG5lzcUOSlPuXQDc/qCeZA8RaccbofgGVxpFhv6Q5rwq1FUwI/Jy8
	 oXAZj8+b2auxyE/HJrTlvLXK+r5Kie1TVZUQKq6sMTz90IZgs42pLF70ki/9ZrdDPB
	 /Gqc6aY0tBhyCJV3OOoKZkgEmw11C38GjUaprBbJw7cSuHK8KDixDHhqdiMSK4RyfJ
	 ZGEWfbnXGVgGjBBtFYjcSIxHU8vYdsBxqs6BuMs/DZdNOcL2ANf6+z9eMRUNznUZj5
	 8bMq//F8nOLHX7PWBy/9CpglUpYXxWrZ07+nbyWKXjEeit6pzR98pEFaXc1so7e6NV
	 Y7+Qgcj+Ce06Q==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rPfv6-00053b-1y;
	Tue, 16 Jan 2024 10:39:44 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 6/7] ASoC: codecs: wcd934x: drop dead gain hacks
Date: Tue, 16 Jan 2024 10:39:02 +0100
Message-ID: <20240116093903.19403-7-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240116093903.19403-1-johan+linaro@kernel.org>
References: <20240116093903.19403-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4WUPIFD5EL7IRKWDON5BOAL67JBVMO3T
X-Message-ID-Hash: 4WUPIFD5EL7IRKWDON5BOAL67JBVMO3T
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4WUPIFD5EL7IRKWDON5BOAL67JBVMO3T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The vendor driver appears to be modifying the gain settings behind the
back of user space but these hacks never made it upstream except for
some essentially dead code that reads out the gain and writes it back
again on DAPM events.

Drop these incomplete and pointless hacks.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd934x.c | 102 ++++++++-----------------------------
 1 file changed, 22 insertions(+), 80 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 1b6e376f3833..34e97d39a146 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -4357,12 +4357,8 @@ static int wcd934x_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
 					 struct snd_kcontrol *kc, int event)
 {
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
-	int offset_val = 0;
-	u16 gain_reg, mix_reg;
-	int val = 0;
+	u16 mix_reg;
 
-	gain_reg = WCD934X_CDC_RX0_RX_VOL_MIX_CTL +
-					(w->shift * WCD934X_RX_PATH_CTL_OFFSET);
 	mix_reg = WCD934X_CDC_RX0_RX_PATH_MIX_CTL +
 					(w->shift * WCD934X_RX_PATH_CTL_OFFSET);
 
@@ -4373,12 +4369,6 @@ static int wcd934x_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
 					      WCD934X_CDC_RX_MIX_CLK_EN_MASK,
 					      WCD934X_CDC_RX_MIX_CLK_ENABLE);
 		break;
-
-	case SND_SOC_DAPM_POST_PMU:
-		val = snd_soc_component_read(comp, gain_reg);
-		val += offset_val;
-		snd_soc_component_write(comp, gain_reg, val);
-		break;
 	}
 
 	return 0;
@@ -4418,26 +4408,6 @@ static int wcd934x_codec_set_iir_gain(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int wcd934x_codec_enable_main_path(struct snd_soc_dapm_widget *w,
-					  struct snd_kcontrol *kcontrol,
-					  int event)
-{
-	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
-	u16 gain_reg;
-
-	gain_reg = WCD934X_CDC_RX0_RX_VOL_CTL + (w->shift *
-						 WCD934X_RX_PATH_CTL_OFFSET);
-
-	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
-		snd_soc_component_write(comp, gain_reg,
-				snd_soc_component_read(comp, gain_reg));
-		break;
-	}
-
-	return 0;
-}
-
 static int wcd934x_codec_ear_dac_event(struct snd_soc_dapm_widget *w,
 				       struct snd_kcontrol *kc, int event)
 {
@@ -5238,32 +5208,25 @@ static const struct snd_soc_dapm_widget wcd934x_dapm_widgets[] = {
 
 	SND_SOC_DAPM_MUX_E("RX INT0_2 MUX", SND_SOC_NOPM, INTERP_EAR, 0,
 			   &rx_int0_2_mux, wcd934x_codec_enable_mix_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_POST_PMD),
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX_E("RX INT1_2 MUX", SND_SOC_NOPM, INTERP_HPHL, 0,
 			   &rx_int1_2_mux, wcd934x_codec_enable_mix_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_POST_PMD),
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX_E("RX INT2_2 MUX", SND_SOC_NOPM, INTERP_HPHR, 0,
 			   &rx_int2_2_mux, wcd934x_codec_enable_mix_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_POST_PMD),
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX_E("RX INT3_2 MUX", SND_SOC_NOPM, INTERP_LO1, 0,
 			   &rx_int3_2_mux, wcd934x_codec_enable_mix_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_POST_PMD),
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX_E("RX INT4_2 MUX", SND_SOC_NOPM, INTERP_LO2, 0,
 			   &rx_int4_2_mux, wcd934x_codec_enable_mix_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_POST_PMD),
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX_E("RX INT7_2 MUX", SND_SOC_NOPM, INTERP_SPKR1, 0,
 			   &rx_int7_2_mux, wcd934x_codec_enable_mix_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_POST_PMD),
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX_E("RX INT8_2 MUX", SND_SOC_NOPM, INTERP_SPKR2, 0,
 			   &rx_int8_2_mux, wcd934x_codec_enable_mix_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_POST_PMD),
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_MUX("RX INT0_1 MIX1 INP0", SND_SOC_NOPM, 0, 0,
 			 &rx_int0_1_mix_inp0_mux),
@@ -5389,41 +5352,20 @@ static const struct snd_soc_dapm_widget wcd934x_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("RX INT2 DEM MUX", SND_SOC_NOPM, 0, 0,
 			 &rx_int2_dem_inp_mux),
 
-	SND_SOC_DAPM_MUX_E("RX INT0_1 INTERP", SND_SOC_NOPM, INTERP_EAR, 0,
-			   &rx_int0_1_interp_mux,
-			   wcd934x_codec_enable_main_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_MUX_E("RX INT1_1 INTERP", SND_SOC_NOPM, INTERP_HPHL, 0,
-			   &rx_int1_1_interp_mux,
-			   wcd934x_codec_enable_main_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_MUX_E("RX INT2_1 INTERP", SND_SOC_NOPM, INTERP_HPHR, 0,
-			   &rx_int2_1_interp_mux,
-			   wcd934x_codec_enable_main_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_MUX_E("RX INT3_1 INTERP", SND_SOC_NOPM, INTERP_LO1, 0,
-			   &rx_int3_1_interp_mux,
-			   wcd934x_codec_enable_main_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_MUX_E("RX INT4_1 INTERP", SND_SOC_NOPM, INTERP_LO2, 0,
-			   &rx_int4_1_interp_mux,
-			   wcd934x_codec_enable_main_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_MUX_E("RX INT7_1 INTERP", SND_SOC_NOPM, INTERP_SPKR1, 0,
-			   &rx_int7_1_interp_mux,
-			   wcd934x_codec_enable_main_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_MUX_E("RX INT8_1 INTERP", SND_SOC_NOPM, INTERP_SPKR2, 0,
-			   &rx_int8_1_interp_mux,
-			   wcd934x_codec_enable_main_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("RX INT0_1 INTERP", SND_SOC_NOPM, INTERP_EAR, 0,
+			   &rx_int0_1_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT1_1 INTERP", SND_SOC_NOPM, INTERP_HPHL, 0,
+			   &rx_int1_1_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT2_1 INTERP", SND_SOC_NOPM, INTERP_HPHR, 0,
+			   &rx_int2_1_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT3_1 INTERP", SND_SOC_NOPM, INTERP_LO1, 0,
+			   &rx_int3_1_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT4_1 INTERP", SND_SOC_NOPM, INTERP_LO2, 0,
+			   &rx_int4_1_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT7_1 INTERP", SND_SOC_NOPM, INTERP_SPKR1, 0,
+			   &rx_int7_1_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT8_1 INTERP", SND_SOC_NOPM, INTERP_SPKR2, 0,
+			   &rx_int8_1_interp_mux),
 
 	SND_SOC_DAPM_MUX("RX INT0_2 INTERP", SND_SOC_NOPM, 0, 0,
 			 &rx_int0_2_interp_mux),
-- 
2.41.0

