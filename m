Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C89493C0C4
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 13:27:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93F58E8E;
	Thu, 25 Jul 2024 13:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93F58E8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721906844;
	bh=Z4sl3UsaDoDW0qIaCARjl/i/ur/SZTyjyXlvlMhISio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OXPDrJvXgZ4CyT6sL1kajRc1pkNSwCUGhhra8XHWi9oIj7Om37FcHmLT3Bxmd9B5f
	 Nm8Njc2KZfiDtfVpxRk4eCfhQDOBVW8ZM/YGLBUSUSweGJUloLSH249H7SBPpSYqHZ
	 NhWZwXmGJSDZ7mhJV/bDhgMX00bx8uYIkEiorNx4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6E34F805BE; Thu, 25 Jul 2024 13:26:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08D96F805AA;
	Thu, 25 Jul 2024 13:26:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCCF4F80580; Thu, 25 Jul 2024 13:24:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C576F8057A
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 13:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C576F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZulGFCdO
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-369f68f63b1so463011f8f.2
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jul 2024 04:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721906642; x=1722511442;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8qPNmhqMV5uO1WWAeGcfg+Xje+HVJGnsDnxifCQEj4=;
        b=ZulGFCdONuMZ/eZ4XWjNnWLEvFzARTHgI0NBPaFSEOyr3yyRsy7sCWSNVGBfSL7KfU
         fsvTUnm+FaSpELyQmDKFPESr+QjsVN8MZlHwYNRzZ9wjRdEyjTCQNyLrPwcsBP9fvL3P
         dv6RuDOxUiisKfFcVHDLBDCODYC2/ysYb6l/xCwtZvA/wXVCiSM1+G6Bk0m0TR6Aw2pb
         hMew96wwwHSE8QsGhKYKFrcptqQqBt/VaNkQgR4C6aD5qk+3iFXWMtGZwsLMNRhq+2Ly
         u5J94ixBKghKExXvXrA8YPuoIuTkjEMwwNx3nuLTQ0M1hwE2gTK77trGyA+tpT1wR/78
         4vUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906642; x=1722511442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8qPNmhqMV5uO1WWAeGcfg+Xje+HVJGnsDnxifCQEj4=;
        b=L+x6mosykeymJajRRJvZ8DcVe59E+PsxI+yDdl8/nOAH6A4uy0uRidrolxusUJgxya
         9n08zaWljn+rwBDrghc1SAoLnhwPy06MyuUXsKQlbyRiXZ2vuDSou0OoXqkRc2uAgRC7
         B20x3EVHWORDOALxBdclMGlYLl/a9pwbCvHK/cCdxeDEeSNpxk+OI23Kl1zCNkgktVvB
         bVP7LV9C/yQpvjkgHIhTBi0HFkgjSOCl0gMKyoVQgkv38ji4g1YMNlTqu2IdV+Gt3vkh
         0Cg3PXdJHFzH96/jB7G15EUa4FykPKaw8y60lTb+BD9MGUN9/CxuGE4jDmHq81mln4NE
         Wv6A==
X-Gm-Message-State: AOJu0Yw+mKEGh1etacQC+l0MUdEp2mnZrkbt8hU2d+mxCe/yFrzQXytc
	c01P7wyeuoDgwOFtSsvfyy3jMfwLEf/3dd91GaF+4Kh9BhJUbZG7nhsgjxj5ydE=
X-Google-Smtp-Source: 
 AGHT+IFHswFHg9qmycJf/sCn7iOfKPi40kcr6NaDof8fg3mdrjY/DuoYO/J2eafkoWqxIU+1HxAapA==
X-Received: by 2002:a5d:5491:0:b0:367:94a7:12c8 with SMTP id
 ffacd0b85a97d-36b3637efaemr1166676f8f.6.1721906642614;
        Thu, 25 Jul 2024 04:24:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367e072asm1823607f8f.42.2024.07.25.04.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:24:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 25 Jul 2024 13:23:48 +0200
Subject: [PATCH 6/7] ASoC: codecs: wcd938x: Move max port number defines to
 enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-asoc-wsa88xx-port-arrays-v1-6-80a03f440c72@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Z4sl3UsaDoDW0qIaCARjl/i/ur/SZTyjyXlvlMhISio=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmojXHFok6viGl1t4tqCGW8JGde7k+DNzVVWwgU
 3NqGUpxprCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqI1xwAKCRDBN2bmhouD
 1wdtD/9b3CBdXYwVtROD9UQpPesni0OskgB0SQJW7DEily9DHVNcaKvnwyguS7HHt6uoRedT09y
 0w2vb7l1TxEms5pi1ntoFI05ZHtU12m23kxLITMfYOFshfCL/4rz38IFgstCyWEJOY7qvecqC0m
 bPMv0eynywhZdWD/kn6z+IzdtRfUmxVL6ann7pvf+ELOmn5xl2Dui4YwAFzIPwhwV4M8G96MLj7
 NF3cvmIbE1tNr2eJbGIlJV8aZJkcV9eaGVFwUdeHxQ1kQMGhmvlbbzGJfgCHCiZfi3tf4XDECPe
 BGP+VhExGXM7DzhrMlHG3cg7H6dE8lrg4222cgvDiE7r5QwO2MTKVpwW2H4h+2Es5yEOafabJ3C
 vcUxFmpkZmfaQIu1O/NpjGyX2Z2NQLmYjDhFJYyL7W6IYVAEajpWoU/QLA+7Gn23WrJH9wfs7IW
 emOew4ct4ILK46h4qCLfGXtIiiGEpHMD9gIig4HvVxiKcTw3ZyrWjA1SNMkV4/igeHVzbj4ycei
 LmOjWh3I9P/QAD7KIsSPg0uEtcJFdiGvWAywG2BtrudfE/SaIivPaiPBq6umH7A9f7Fj1xhidQr
 eBFyBvYxheeshYPAH+/5GIGP8hePYktBgEPoV6nBXuM8rUXCHwoxSztqMZPf8ZKcynUCDLW7tlG
 iMZ7OHWB8i8ZzaQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: VHL6CV6S553YXHRH7ZCKHBJOGQNZ4HP4
X-Message-ID-Hash: VHL6CV6S553YXHRH7ZCKHBJOGQNZ4HP4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VHL6CV6S553YXHRH7ZCKHBJOGQNZ4HP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of having separate define to indicate number of TX and RX
Soundwire ports, move it to the enums defining actual port
indices/values.  This makes it more obvious why such value was chosen as
number of TX/RX ports.
Note: the enums start from 1, thus number of ports equals to the last
vaue in the enum.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index b2ad98026ae2..fb6a0e4ef337 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -585,8 +585,6 @@
 #define WCD938X_DIGITAL_DEM_BYPASS_DATA3        (0x34D8)
 #define WCD938X_MAX_REGISTER			(WCD938X_DIGITAL_DEM_BYPASS_DATA3)
 
-#define WCD938X_MAX_SWR_PORTS	5
-#define WCD938X_MAX_TX_SWR_PORTS 4
 #define WCD938X_MAX_SWR_CH_IDS	15
 
 struct wcd938x_sdw_ch_info {
@@ -606,6 +604,7 @@ enum wcd938x_tx_sdw_ports {
 	/* DMIC0_0, DMIC0_1, DMIC1_0, DMIC1_1 */
 	WCD938X_DMIC_0_3_MBHC_PORT,
 	WCD938X_DMIC_4_7_PORT,
+	WCD938X_MAX_TX_SWR_PORTS = WCD938X_DMIC_4_7_PORT,
 };
 
 enum wcd938x_tx_sdw_channels {
@@ -630,6 +629,7 @@ enum wcd938x_rx_sdw_ports {
 	WCD938X_COMP_PORT,
 	WCD938X_LO_PORT,
 	WCD938X_DSD_PORT,
+	WCD938X_MAX_SWR_PORTS = WCD938X_DSD_PORT,
 };
 
 enum wcd938x_rx_sdw_channels {

-- 
2.43.0

