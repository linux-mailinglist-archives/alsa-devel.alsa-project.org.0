Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 597F2D0D8E
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 13:21:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D89231657;
	Wed,  9 Oct 2019 13:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D89231657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570620094;
	bh=AzlN1Z3VA+yTNjV/YrviBuH6Vg/roCvT9CF4D/ep6T8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KDtBjJZBEY6wFnB+gSpr76Wac9i0lzA7evVfSHB9AbUGHyvznCERr3lIQjm5GHtAn
	 UC47X3QoF5+hBxC80SSxd3bDvASch/Jh8Jl5KaUqExeRb9p5QWZwjHU/etj8YsGpb/
	 jxi+724YDqwOkg1hJZOEe1zg/jAdPFdw1FcZjumc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E21FF80323;
	Wed,  9 Oct 2019 13:20:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 219C7F802FB; Wed,  9 Oct 2019 13:20:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6685F800BF
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 13:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6685F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IYUqb/h3"
Received: by mail-wr1-x444.google.com with SMTP id q9so2407570wrm.8
 for <alsa-devel@alsa-project.org>; Wed, 09 Oct 2019 04:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NiFi50FuqI1VBpxzFdOXo/50+9I/uAkHDK87JHPscnU=;
 b=IYUqb/h35TlOVvANFhPXRwdzAJit1HS7e8FL86O0yeE6P8hgNfhos27Ng6uveFyPyw
 2mf36pEI87UXaGXeLkOr1yOQe+onbuyQ/DoIL+nFkyGAj+kHFjN+IB4PCfv9KVrqE6aM
 /kyYvCbklhWGYbmsUeHdoeqo9DmeJslfqOY4o+nqx5s9dYQe4dthhWF4WR/b8KLIPZPo
 BKUZiaSLr/lOFjOStbueSEKq81bBBjh+TAU3v/QFaHcIkEYyrv3ID0DRMg3suNM2xeMf
 R36IjldPLxPfA+siJfNs9KxyUMDN/U3ihcuYGO4THYVe2AC94XI26aN2mgrVhRcYhz6z
 AZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NiFi50FuqI1VBpxzFdOXo/50+9I/uAkHDK87JHPscnU=;
 b=MAs2HnVLBx+PJ+HzpbI5Hqh57K9p/y5HFxXAslyGKZjK4sKY0F56nnB+GrSZiNl851
 3GaHCbKdc5t3sGZ/zr5l5VyhRFq3X7VULC12vUhAaIPegSfAffvT4wxW0DuGvJATIOpr
 yXdNxlW5od7R7yJ+aAYOv3tCqSifBaYV4mI3NxwxjjnfWvyK9ZcSR5Haw/btUw4sLav8
 zDV9lQIYd/acw29YXo4PBUNNODeGgX6GypCWcqXgKfjzR3cpep54z+3kXHyyQP0bcr/C
 WpYd7782pMfuAF9ZdZdW70dpwe28EdgS4PvAPprremjK/1DehCz+pWBISiakm4laT6nz
 AZag==
X-Gm-Message-State: APjAAAXs7ZGeVWt8rt8mjeePHrBcffe/X6BD2PPZ2ONMjonmHB5vWTac
 xrpq/u75bCizKPc0eCdQwnpDJA==
X-Google-Smtp-Source: APXvYqxfoIMEQHrCYevrzZsV5a92ggMZZsyuGPNKm0meavL9E991mpyYRdC345pA/uJsZsgpQ5WMbQ==
X-Received: by 2002:adf:fa88:: with SMTP id h8mr2392734wrr.89.1570620008255;
 Wed, 09 Oct 2019 04:20:08 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id q15sm3197470wrg.65.2019.10.09.04.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 04:20:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Wed,  9 Oct 2019 12:19:44 +0100
Message-Id: <20191009111944.28069-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
 lgirdwood@gmail.com
Subject: [alsa-devel] [PATCH] ASoC: msm8916-wcd-digital: add missing MIX2
	path for RX1/2
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

This patch adds missing MIX2 path on RX1/2 which take IIR1 and
IIR2 as inputs.

Without this patch sound card fails to intialize with below warning:

 ASoC: no sink widget found for RX1 MIX2 INP1
 ASoC: Failed to add route IIR1 -> IIR1 -> RX1 MIX2 INP1
 ASoC: no sink widget found for RX2 MIX2 INP1
 ASoC: Failed to add route IIR1 -> IIR1 -> RX2 MIX2 INP1
 ASoC: no sink widget found for RX1 MIX2 INP1
 ASoC: Failed to add route IIR2 -> IIR2 -> RX1 MIX2 INP1
 ASoC: no sink widget found for RX2 MIX2 INP1
 ASoC: Failed to add route IIR2 -> IIR2 -> RX2 MIX2 INP1

Reported-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/codecs/msm8916-wcd-digital.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
index 9fa5d44fdc79..58b2468fb2a7 100644
--- a/sound/soc/codecs/msm8916-wcd-digital.c
+++ b/sound/soc/codecs/msm8916-wcd-digital.c
@@ -243,6 +243,10 @@ static const char *const rx_mix1_text[] = {
 	"ZERO", "IIR1", "IIR2", "RX1", "RX2", "RX3"
 };
 
+static const char * const rx_mix2_text[] = {
+	"ZERO", "IIR1", "IIR2"
+};
+
 static const char *const dec_mux_text[] = {
 	"ZERO", "ADC1", "ADC2", "ADC3", "DMIC1", "DMIC2"
 };
@@ -270,6 +274,16 @@ static const struct soc_enum rx3_mix1_inp_enum[] = {
 	SOC_ENUM_SINGLE(LPASS_CDC_CONN_RX3_B2_CTL, 0, 6, rx_mix1_text),
 };
 
+/* RX1 MIX2 */
+static const struct soc_enum rx_mix2_inp1_chain_enum =
+	SOC_ENUM_SINGLE(LPASS_CDC_CONN_RX1_B3_CTL,
+		0, 3, rx_mix2_text);
+
+/* RX2 MIX2 */
+static const struct soc_enum rx2_mix2_inp1_chain_enum =
+	SOC_ENUM_SINGLE(LPASS_CDC_CONN_RX2_B3_CTL,
+		0, 3, rx_mix2_text);
+
 /* DEC */
 static const struct soc_enum dec1_mux_enum = SOC_ENUM_SINGLE(
 				LPASS_CDC_CONN_TX_B1_CTL, 0, 6, dec_mux_text);
@@ -309,6 +323,10 @@ static const struct snd_kcontrol_new rx3_mix1_inp2_mux = SOC_DAPM_ENUM(
 				"RX3 MIX1 INP2 Mux", rx3_mix1_inp_enum[1]);
 static const struct snd_kcontrol_new rx3_mix1_inp3_mux = SOC_DAPM_ENUM(
 				"RX3 MIX1 INP3 Mux", rx3_mix1_inp_enum[2]);
+static const struct snd_kcontrol_new rx1_mix2_inp1_mux = SOC_DAPM_ENUM(
+				"RX1 MIX2 INP1 Mux", rx_mix2_inp1_chain_enum);
+static const struct snd_kcontrol_new rx2_mix2_inp1_mux = SOC_DAPM_ENUM(
+				"RX2 MIX2 INP1 Mux", rx2_mix2_inp1_chain_enum);
 
 /* Digital Gain control -38.4 dB to +38.4 dB in 0.3 dB steps */
 static const DECLARE_TLV_DB_SCALE(digital_gain, -3840, 30, 0);
@@ -740,6 +758,10 @@ static const struct snd_soc_dapm_widget msm8916_wcd_digital_dapm_widgets[] = {
 			 &rx3_mix1_inp2_mux),
 	SND_SOC_DAPM_MUX("RX3 MIX1 INP3", SND_SOC_NOPM, 0, 0,
 			 &rx3_mix1_inp3_mux),
+	SND_SOC_DAPM_MUX("RX1 MIX2 INP1", SND_SOC_NOPM, 0, 0,
+			 &rx1_mix2_inp1_mux),
+	SND_SOC_DAPM_MUX("RX2 MIX2 INP1", SND_SOC_NOPM, 0, 0,
+			 &rx2_mix2_inp1_mux),
 
 	SND_SOC_DAPM_MUX("CIC1 MUX", SND_SOC_NOPM, 0, 0, &cic1_mux),
 	SND_SOC_DAPM_MUX("CIC2 MUX", SND_SOC_NOPM, 0, 0, &cic2_mux),
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
