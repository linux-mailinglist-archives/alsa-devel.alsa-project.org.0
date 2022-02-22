Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9145F4BF7BF
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:03:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27744181C;
	Tue, 22 Feb 2022 13:03:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27744181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645531436;
	bh=fETT2PX6LWrH6I39NlaWrqZkrrIzaqOETURVoO7FZvI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wksz7ZICrNHkfGNaH4RgtorJCbBGtTRpfBUGnn/9Q/zbTQqczKzJ5qYl8GDyLDxNb
	 DEGQETT9DE+hlnhEI3i7Tv4GCgd5lz6gvGmnu8obscE237XcqGyqgfeaVDwI4nGFph
	 zJg/Ix/cmJrrb6n3MHbzeIvO5XEv4wIgGyQInoeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B291F80539;
	Tue, 22 Feb 2022 13:00:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43874F80527; Tue, 22 Feb 2022 13:00:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3902F8012C
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 12:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3902F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NFB3RliS"
Received: by mail-wr1-x436.google.com with SMTP id p9so32695192wra.12
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 03:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FmiJNex1ot8tDEQkrlMDikI8ft3IlZn2sN6gtT8TTKk=;
 b=NFB3RliSVCvIj1utGaE/jSklWt1AArhvVYfiMhiGpoNLoRv65H7F7COpmVqkX/CmKk
 D88sHc4WmVJ5AQlccvWS/rDejHhplBiTj6CYQVahEKJFZ3MUNg8ByGToogl9GHCbs7St
 qQtjocyj7dMI/0dXBEN3DFVvFWAtlu4XysqdruQ3xlv9dmlLXdKshOrhekswoHG2Lq4X
 jlHzhyBFFuFWkLpxDFIgkBC6VrhbQwOQoqvRdiIwShMkD8mCCOow/iMu9Q7dVitNSGoD
 UmL+1Q58u6wBi5owCaGJSHaGtvutHULTfMpGF+n6lE15gKDVSaRdzFf47XnKRzKDypjs
 NwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FmiJNex1ot8tDEQkrlMDikI8ft3IlZn2sN6gtT8TTKk=;
 b=g7IvKkGQpwi0LlRFuY+euIxz4pcQdLWpnxAYaWm3v98Qp2D3QylIAMrUpff5AjVQsG
 HpL3uHDjmwZRvNUAssM9ge+kFvZPgISG7EJKG1LyhdE+Qd5hBPEMRssNx8iuxRpet9GT
 oAjqd2eNAGp6ZE6Ksmrk3UgGXltJWNyBaufDg0ycmo7g4x4Fz7W7Ey1hMoS33SgiL7ZY
 eOyuoTTPHZ0I2pbq/bemGCWyPDAnnRZUdoCRXCfB8KAFcwQ2t71iiKajdsTdQf7hC0dt
 0CdJThF63c/91LGPozdPUyYVf6LAP0rWQVSYwi18ZD+ygvgwmepI4GIRc42JPcrFn2ks
 noeQ==
X-Gm-Message-State: AOAM531XUzArYuOSUAEoibtljIIwu9NyU8RpvXBGKY4ZD55pbnVsCWgs
 uzSAj2m2GroIjqyDCX9UEGNSFA==
X-Google-Smtp-Source: ABdhPJz4PUmhR2AT0PBVCIOTknderZ9Je7FIrmTupP/bK0KhlsEDdjeHurgqYXa+WjyF7LnxbZiDaw==
X-Received: by 2002:a05:6000:154c:b0:1ea:76b7:20c4 with SMTP id
 12-20020a056000154c00b001ea76b720c4mr4529319wry.626.1645531197891; 
 Tue, 22 Feb 2022 03:59:57 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id a18sm50014661wrg.13.2022.02.22.03.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:59:57 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 10/16] ASoC: codecs: rx-macro: fix tlv min max range
Date: Tue, 22 Feb 2022 11:59:27 +0000
Message-Id: <20220222115933.9114-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
References: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

on Qualcomm codecs gain tlv control specifies min max range as both
negative to positive numbers like

SOC_SINGLE_S8_TLV("... Volume", ..,  -84, 40, gain)

However with recent boundary checks added in commit 817f7c9335ec0
("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw())
setting a value above 40 gain will fail.

So fix this min max range correctly to
SOC_SINGLE_S8_TLV("... Volume", ..,  0, 124, gain)
so that users can now set gain correctly

Fixes: af3d54b99764 ("ASoC: codecs: lpass-rx-macro: add support for lpass rx macro")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 058d8634ce40..d31d4d45ba01 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2800,17 +2800,17 @@ static int rx_macro_iir_filter_info(struct snd_kcontrol *kcontrol,
 
 static const struct snd_kcontrol_new rx_macro_snd_controls[] = {
 	SOC_SINGLE_S8_TLV("RX_RX0 Digital Volume", CDC_RX_RX0_RX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX_RX1 Digital Volume", CDC_RX_RX1_RX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX_RX2 Digital Volume", CDC_RX_RX2_RX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX_RX0 Mix Digital Volume", CDC_RX_RX0_RX_VOL_MIX_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX_RX1 Mix Digital Volume", CDC_RX_RX1_RX_VOL_MIX_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("RX_RX2 Mix Digital Volume", CDC_RX_RX2_RX_VOL_MIX_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 
 	SOC_SINGLE_EXT("RX_COMP1 Switch", SND_SOC_NOPM, RX_MACRO_COMP1, 1, 0,
 		rx_macro_get_compander, rx_macro_set_compander),
@@ -2834,28 +2834,28 @@ static const struct snd_kcontrol_new rx_macro_snd_controls[] = {
 			rx_macro_aux_hpf_mode_put),
 
 	SOC_SINGLE_S8_TLV("IIR0 INP0 Volume",
-		CDC_RX_SIDETONE_IIR0_IIR_GAIN_B1_CTL, -84, 40,
+		CDC_RX_SIDETONE_IIR0_IIR_GAIN_B1_CTL, 0, 124,
 		digital_gain),
 	SOC_SINGLE_S8_TLV("IIR0 INP1 Volume",
-		CDC_RX_SIDETONE_IIR0_IIR_GAIN_B2_CTL, -84, 40,
+		CDC_RX_SIDETONE_IIR0_IIR_GAIN_B2_CTL, 0, 124,
 		digital_gain),
 	SOC_SINGLE_S8_TLV("IIR0 INP2 Volume",
-		CDC_RX_SIDETONE_IIR0_IIR_GAIN_B3_CTL, -84, 40,
+		CDC_RX_SIDETONE_IIR0_IIR_GAIN_B3_CTL, 0, 124,
 		digital_gain),
 	SOC_SINGLE_S8_TLV("IIR0 INP3 Volume",
-		CDC_RX_SIDETONE_IIR0_IIR_GAIN_B4_CTL, -84, 40,
+		CDC_RX_SIDETONE_IIR0_IIR_GAIN_B4_CTL, 0, 124,
 		digital_gain),
 	SOC_SINGLE_S8_TLV("IIR1 INP0 Volume",
-		CDC_RX_SIDETONE_IIR1_IIR_GAIN_B1_CTL, -84, 40,
+		CDC_RX_SIDETONE_IIR1_IIR_GAIN_B1_CTL, 0, 124,
 		digital_gain),
 	SOC_SINGLE_S8_TLV("IIR1 INP1 Volume",
-		CDC_RX_SIDETONE_IIR1_IIR_GAIN_B2_CTL, -84, 40,
+		CDC_RX_SIDETONE_IIR1_IIR_GAIN_B2_CTL, 0, 124,
 		digital_gain),
 	SOC_SINGLE_S8_TLV("IIR1 INP2 Volume",
-		CDC_RX_SIDETONE_IIR1_IIR_GAIN_B3_CTL, -84, 40,
+		CDC_RX_SIDETONE_IIR1_IIR_GAIN_B3_CTL, 0, 124,
 		digital_gain),
 	SOC_SINGLE_S8_TLV("IIR1 INP3 Volume",
-		CDC_RX_SIDETONE_IIR1_IIR_GAIN_B4_CTL, -84, 40,
+		CDC_RX_SIDETONE_IIR1_IIR_GAIN_B4_CTL, 0, 124,
 		digital_gain),
 
 	SOC_SINGLE("IIR1 Band1 Switch", CDC_RX_SIDETONE_IIR0_IIR_CTL,
-- 
2.21.0

