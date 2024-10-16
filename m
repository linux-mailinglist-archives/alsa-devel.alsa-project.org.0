Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB9C9A5E5B
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 10:14:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB9ACB6A;
	Mon, 21 Oct 2024 10:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB9ACB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729498444;
	bh=DnqN0GYxTQTNhr1sTx2f2oTCRxAX06WOtWLVVwvY7mU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZG/X3zitzXhqulwtDuDZtqDQvqc0DJcQEDwGQwNprDirFYGiigP98i1WPWk/rq95E
	 uUrh0ChqgiQqUQFFmRqFI9R40AmwkPEuNaJoxqxKylYbPnf4J5rKJ4ydg00lghxHYU
	 FydeLjEHVnVSmlKYJGkoWo8+9H0/HK/lx9WVCAmM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CE91F80579; Mon, 21 Oct 2024 10:13:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7130F805AC;
	Mon, 21 Oct 2024 10:13:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C386F80448; Thu, 17 Oct 2024 00:10:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5EB24F80149
	for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2024 00:10:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EB24F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eCQeHTD2
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4314311959aso2699035e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 16 Oct 2024 15:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729116652; x=1729721452;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zkmU+TMQPcdZQQS44rLXxdRUirokbMiNxtTTnsu7A1M=;
        b=eCQeHTD2eS/tr6XFUwlwLu1ETIjpNTDeAfBpf9CaUSDWOyieIQTo2ZdnsmFaf1k9ti
         i2tMMgyLOlANDLuG92LQJytQ6Js966MpLVXq/7uXo9frMHbjUxlQsyZ589lNHfb11EZQ
         QMj2RDX+eZ8fTQM9OHAc2Tsau4HPRatYdb4GWH7KIQ2B30YWbq73Xm4Ut+0LdD8ocAZQ
         UTPlGtZMj80ys4xjNnXcRG6TUG76G5PKCk5wqKSTPrjPg2oxa0Loi5qX79esZavaiDBJ
         ZcUZamvYrt/7YB2Ua9dgZ3JUW7no4i1q/8Oc+MyB/5RzrxU1OTM+wYBidqykF08+kF4k
         o+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729116652; x=1729721452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkmU+TMQPcdZQQS44rLXxdRUirokbMiNxtTTnsu7A1M=;
        b=nTP4cP6Lrtdkp2Y/feKUbt9USPOTgjMFw2cABEJbOQCiJaB48tN11N/ESNxLpGoFPw
         k+UIF0Dn3ozYK5b9bzff/ciJLvPGppQ+yjayDQl2qp7OZvbxsrWt4TVKbTefCeieI9Bf
         TpSlZ222QAm3DnK78FU2TQBfF1cX5n9vBKt+w3UXytjETnR9J0n54mhWJASIED92mpTr
         MA5XBI8aZULcJSbomxWQpLU5v3Z/O5sDhBXSwEIhb++zyz6orffLbwxenVERck19WCcd
         ZNEAE17/5Co3VFq0GBiGD0SAM2ygvPNV72LRQbXYyWvCBB6yrxxUY2yn4mTy41kGO4hZ
         ePVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUamVCGoHnkaZYdKkG+l1nmRd8lAyZmMFk8x9TTcGxmGqKSgWRMLITPXyZmXev3ukIDQBGAmdv9e1P2@alsa-project.org
X-Gm-Message-State: AOJu0YxG8Y7v05yRL0s5kj7KioVII1K5t4fhCpT4B3Ee8u5lNBp157n/
	d1hsmFRbpe5URYGuKqVxttGtwXLIBG7nWNuXdHw2b7TbfVljbBJh+Rr/hyZpR38=
X-Google-Smtp-Source: 
 AGHT+IE/7GB+laIBn4fQ2eRBjGrY2BLeDRMpZT3OgDpcIf9Rc1ybtQP6yIC4+eEfg4Ir/JeWq7i1xA==
X-Received: by 2002:a05:600c:1d0b:b0:42f:8fcd:486c with SMTP id
 5b1f17b1804b1-4312561a417mr140028865e9.33.1729116651788;
        Wed, 16 Oct 2024 15:10:51 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43158c38b39sm6267325e9.6.2024.10.16.15.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 15:10:50 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: srinivas.kandagatla@linaro.org,
	a39.skl@gmail.com,
	linux-sound@vger.kernel.org,
	broonie@kernel.org,
	dmitry.baryshkov@linaro.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	vkoul@kernel.org
Subject: [PATCH v2] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n) macro for
 DSM_CTL and SEC7 regs
Date: Wed, 16 Oct 2024 23:10:49 +0100
Message-ID: <20241016221049.1145101-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PSRA2GEHWANQKAGM5TT6I4CQNB2D2YTS
X-Message-ID-Hash: PSRA2GEHWANQKAGM5TT6I4CQNB2D2YTS
X-Mailman-Approved-At: Mon, 21 Oct 2024 08:13:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PSRA2GEHWANQKAGM5TT6I4CQNB2D2YTS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Turns out some registers of pre-2.5 version of rxmacro codecs are not
located at the expected offsets but 0xc further away in memory. So far
the detected registers are CDC_RX_RX2_RX_PATH_SEC7 and
CDC_RX_RX2_RX_PATH_DSM_CTL.

CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n) macro incorrectly generates the address
0x540 for RX2 but it should be 0x54C and it also overwrites
CDC_RX_RX2_RX_PATH_SEC7 which is located at 0x540.
The same goes for CDC_RX_RXn_RX_PATH_SEC7(rx, n).

Fix this by introducing additional rxn_reg_stride2 offset. For 2.5 version
and above this offset will be equal to 0.
With such change the corresponding RXn() macros will generate the same
values for 2.5 codec version for all RX paths and the same old values
for pre-2.5 version for RX0 and RX1. However for the latter case with
RX2 path it will also add rxn_reg_stride2 on top.

While at this, also remove specific if-check for INTERP_AUX from
rx_macro_digital_mute() and rx_macro_enable_interp_clk(). These if-check
was used to handle such special offset for AUX interpolator but since
CDC_RX_RXn_RX_PATH_SEC7(rx, n) and CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)
macros will generate the correst addresses of dsm register, they are no
longer needed.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---

Changes in v2:
- updated macros as suggested by Mark and Dmitry;
- removed INTERP_AUX if-check in two functions;

Link to previous patch: https://lore.kernel.org/lkml/20240925043823.520218-1-alexey.klimov@linaro.org/

 sound/soc/codecs/lpass-rx-macro.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index ef7a70fa6966..febbbe073962 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -202,12 +202,14 @@
 #define CDC_RX_RXn_RX_PATH_SEC3(rx, n)	(0x042c  + rx->rxn_reg_stride * n)
 #define CDC_RX_RX0_RX_PATH_SEC4		(0x0430)
 #define CDC_RX_RX0_RX_PATH_SEC7		(0x0434)
-#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)	(0x0434  + rx->rxn_reg_stride * n)
+#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)		\
+	(0x0434 + (rx->rxn_reg_stride * n) + ((n > 1) ? rx->rxn_reg_stride2 : 0))
 #define CDC_RX_DSM_OUT_DELAY_SEL_MASK	GENMASK(2, 0)
 #define CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE	0x2
 #define CDC_RX_RX0_RX_PATH_MIX_SEC0	(0x0438)
 #define CDC_RX_RX0_RX_PATH_MIX_SEC1	(0x043C)
-#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	(0x0440  + rx->rxn_reg_stride * n)
+#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	\
+	(0x0440 + (rx->rxn_reg_stride * n) + ((n > 1) ? rx->rxn_reg_stride2 : 0))
 #define CDC_RX_RXn_DSM_CLK_EN_MASK	BIT(0)
 #define CDC_RX_RX0_RX_PATH_DSM_CTL	(0x0440)
 #define CDC_RX_RX0_RX_PATH_DSM_DATA1	(0x0444)
@@ -645,6 +647,7 @@ struct rx_macro {
 	int rx_mclk_cnt;
 	enum lpass_codec_version codec_version;
 	int rxn_reg_stride;
+	int rxn_reg_stride2;
 	bool is_ear_mode_on;
 	bool hph_pwr_mode;
 	bool hph_hd2_mode;
@@ -1929,9 +1932,6 @@ static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 							      CDC_RX_PATH_PGA_MUTE_MASK, 0x0);
 			}
 
-			if (j == INTERP_AUX)
-				dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, 2);
-
 			int_mux_cfg0 = CDC_RX_INP_MUX_RX_INT0_CFG0 + j * 8;
 			int_mux_cfg1 = int_mux_cfg0 + 4;
 			int_mux_cfg0_val = snd_soc_component_read(component, int_mux_cfg0);
@@ -2702,9 +2702,6 @@ static int rx_macro_enable_interp_clk(struct snd_soc_component *component,
 
 	main_reg = CDC_RX_RXn_RX_PATH_CTL(rx, interp_idx);
 	dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, interp_idx);
-	if (interp_idx == INTERP_AUX)
-		dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, 2);
-
 	rx_cfg2_reg = CDC_RX_RXn_RX_PATH_CFG2(rx, interp_idx);
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
@@ -3821,6 +3818,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_0:
 	case LPASS_CODEC_VERSION_2_1:
 		rx->rxn_reg_stride = 0x80;
+		rx->rxn_reg_stride2 = 0xc;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
 		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
 		if (!reg_defaults)
@@ -3834,6 +3832,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
 		rx->rxn_reg_stride = 0xc0;
+		rx->rxn_reg_stride2 = 0x0;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
 		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
 		if (!reg_defaults)
-- 
2.45.2

