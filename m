Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1080093C0CF
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 13:28:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 169FF10BE;
	Thu, 25 Jul 2024 13:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 169FF10BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721906909;
	bh=wCaY3kZbkwPEwo1WVvpupNrkPaJVQt2eCab1H4lT8xs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZuoFmPC2N323aJN8tbV6Ttl33Y7NqI5262T/E8mI4/HdQwKTo9WEDkIRz+serRw04
	 y6ZrHVIGOj3d2nQOWCg3jUTj3WWhwQzoqN4nBkFdzqaJy+yYkK6OPatFo3Y8YBqRa1
	 2wHsXT/hOTHCozPhiRYPv0r3hio+RS7A2hqAY9so=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CAB5F8063D; Thu, 25 Jul 2024 13:27:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74D00F8064C;
	Thu, 25 Jul 2024 13:27:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22663F801F5; Thu, 25 Jul 2024 13:26:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACADEF80482
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 13:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACADEF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kWHMnhFz
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-368440b073bso504420f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jul 2024 04:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721906640; x=1722511440;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xv4gNohsSEkyCVH7/4Ky3TaKWmsSwASlKN9kZ+B7LDs=;
        b=kWHMnhFzR3KY/fGgmnLFWDxondBRtzHcyNNBtQmDwMRmLHT0NR2I3MOxuCMGcOogyZ
         DOymhbC6Tw29bnkT5XvvD6PVZJqUA1mR6nWXVNRhnX5FxjjjO8xa0+Z29QGeauh+aULQ
         ptAUy4KVbE5vQjY1EWJcT+Wi2CWxZVFWBcKqAQUasGcW95bfOyntS0r+buIX93GlUUTQ
         l7PlU+5hb/boWS//dNmTLrevNHMOUChKB/eVrmAy8XvdnIRRcNm5kOpF/x4XmalENPAc
         clngVnDJy2TTnGYjCmkCdsVLZic5Bbj39OcpHuFoveUnarckjBa+ftrvVaIuuXxXi1Of
         OAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906640; x=1722511440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xv4gNohsSEkyCVH7/4Ky3TaKWmsSwASlKN9kZ+B7LDs=;
        b=hu31TEKCHmjEFk8tWq7tvk/CKxoBvFB/moI9OHocm8NAZIZIM2PAOt9yY1GJBNuLLF
         QnKXWMiC1RMv0h0rO893GovNaJ1kSc8g40/D+P/y2kzuextD2/vaRjs9Cxh5vrO/pjO2
         60tHWTOrwPi1Xyc1zL5UiTxIBuub/5A48bKOns4JefTV/y27reZ2J9mPT1dSB5Kx9FrI
         fkpdJXG1+oaRPTHVhlUkAp4Cx3uPik6Vn82v0QUSZV7MMjzhmUKOmDzAMnQBk6dgHU8E
         a14DGSatsX+exlJ5MIMz5abM0ZLY1B9fNUq3jskqUlq/yPe4xjR56TDMOgIUSBNVvsZJ
         lAKA==
X-Gm-Message-State: AOJu0YwhqWUQ6nrRgBen6p7XvOVrALN5n0JERTuXT9aZk489LqQ3E1e8
	OCP/1jDsUWSV1ncgFXsQJKxlcSCnA4b3joEG4JhkMnOhzit2B7gmlotnBunvwwU=
X-Google-Smtp-Source: 
 AGHT+IGm/CIUyj3+IUxZZKmv3H0osV1MgXdLb9MIQ274YozSOERMoI7OrS7UBo8OSd0d2d84LnemvA==
X-Received: by 2002:a05:6000:104b:b0:368:3ac6:1fff with SMTP id
 ffacd0b85a97d-36b31b4e832mr1771595f8f.20.1721906639826;
        Thu, 25 Jul 2024 04:23:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367e072asm1823607f8f.42.2024.07.25.04.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:23:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 25 Jul 2024 13:23:46 +0200
Subject: [PATCH 4/7] ASoC: codecs: wcd938x: Drop unused defines and enums
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-asoc-wsa88xx-port-arrays-v1-4-80a03f440c72@linaro.org>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wCaY3kZbkwPEwo1WVvpupNrkPaJVQt2eCab1H4lT8xs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmojXGE1G/y/P+dD388yi2q67mlhwNSH55Ia5ue
 J5SAo6TxlGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqI1xgAKCRDBN2bmhouD
 1+PMD/sFQvp0fm4/dgfL44ISNSNtPIJ7RtxpANkZKBEwpAWzGQSQkefWW9CsZA8BDIlWUUYhlZV
 yuDp+BuM0J2cRJuiIxoe+h4pVvk9ijZhZ/HUbJl8Zn96fIj4iBwTgKDAj1v9Gojlm715UiO09Ym
 79VxPoA3GGiUnqFApEknQU3e8IhPNT1ggN5Qtaa6BN3E3qlXDhhNzCek3rUyw7np4xZTKdXLI4P
 38TsivcJnOC3YyhSfTrxlz+XISWJUQMgcVkU3SgZ6+zGNIHvZmygrsWJdfnLZMhll0IvJRjjLFC
 9TtRqYeSTfudmgY8bIXPpD1+At+hnKzVqm+7xF6dTldfCiyxr8xXi7nKNeFqEPm1dTbM7uRugH9
 ewGgaUabGqqqMuw6OvuMPWrxS/r3AVHxrJJCfYZyFLT49oeEhMHIqQqnHT6iaimZ2BFFOSOCL7S
 dThi1bR5uh+J0V72HQKBDyznrkN01sUzgGCLIcEu+PxvBoE7laxHY0sB1anxQ8MbtL1YR49UgIc
 PYBDYsTvnJnVZV1aI+w+5OKqcHoHIALGrqdwJ7hAGtZEgCL4uMzjnoDZmHTzjKZx9HHvQU0aJCn
 12OD7k++dFbbnL+orZmmO20nLtyBxYreAA8WH5diGk2yG40iZTH2TT7MhaS9kCme+y4QB+OljfA
 +erd/NoxFy5UjOw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: VPONPXIOITRGVWZVPVOTERLMGRGIAFTY
X-Message-ID-Hash: VPONPXIOITRGVWZVPVOTERLMGRGIAFTY
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPONPXIOITRGVWZVPVOTERLMGRGIAFTY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Drop defines and enums not used in the driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 12b32d5dc580..aa92f1bfc921 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -29,7 +29,6 @@
 #define WCD938X_MAX_SUPPLY		(4)
 #define WCD938X_MBHC_MAX_BUTTONS	(8)
 #define TX_ADC_MAX			(4)
-#define WCD938X_TX_MAX_SWR_PORTS	(5)
 
 #define WCD938X_RATES_MASK (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 			    SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
@@ -39,8 +38,6 @@
 				 SNDRV_PCM_RATE_176400)
 #define WCD938X_FORMATS_S16_S24_LE (SNDRV_PCM_FMTBIT_S16_LE | \
 				    SNDRV_PCM_FMTBIT_S24_LE)
-/* Convert from vout ctl to micbias voltage in mV */
-#define  WCD_VOUT_CTL_TO_MICB(v)	(1000 + v * 50)
 #define SWR_CLK_RATE_0P6MHZ		(600000)
 #define SWR_CLK_RATE_1P2MHZ		(1200000)
 #define SWR_CLK_RATE_2P4MHZ		(2400000)
@@ -48,8 +45,6 @@
 #define SWR_CLK_RATE_9P6MHZ		(9600000)
 #define SWR_CLK_RATE_11P2896MHZ		(1128960)
 
-#define WCD938X_DRV_NAME "wcd938x_codec"
-#define WCD938X_VERSION_1_0		(1)
 #define EAR_RX_PATH_AUX			(1)
 
 #define ADC_MODE_VAL_HIFI		0x01
@@ -72,7 +67,6 @@
 /* Z value compared in milliOhm */
 #define WCD938X_MBHC_IS_SECOND_RAMP_REQUIRED(z) ((z > 400000) || (z < 32000))
 #define WCD938X_MBHC_ZDET_CONST         (86 * 16384)
-#define WCD938X_MBHC_MOISTURE_RREF      R_24_KOHM
 #define WCD_MBHC_HS_V_MAX           1600
 
 #define WCD938X_EAR_PA_GAIN_TLV(xname, reg, shift, max, invert, tlv_array) \
@@ -89,18 +83,6 @@ enum {
 	WCD9385 = 5,
 };
 
-enum {
-	TX_HDR12 = 0,
-	TX_HDR34,
-	TX_HDR_MAX,
-};
-
-enum {
-	WCD_RX1,
-	WCD_RX2,
-	WCD_RX3
-};
-
 enum {
 	/* INTR_CTRL_INT_MASK_0 */
 	WCD938X_IRQ_MBHC_BUTTON_PRESS_DET = 0,

-- 
2.43.0

