Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 415EE93C0C9
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 13:28:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6982EF2;
	Thu, 25 Jul 2024 13:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6982EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721906879;
	bh=V8vd4iZFObHif1p5HOQA8sXHu2YEJwGEScZnEYASwyc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZIbXZ8UBq5l3L84PU7Mu3+qMUd/U5a43z0SxqNmkK2HkB+FZstquf7pLEU0x5P2tp
	 VReGW1OqJSsejLCThKNhfH0yjrrDSNj1DlUxk+cNViczC/Nt7+V7kEdFj3sfHnjewM
	 BtvVJulhO0VZzdnhOY+La/O6PvaOZgt2jmplX8Ks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D437F80606; Thu, 25 Jul 2024 13:26:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88451F805FE;
	Thu, 25 Jul 2024 13:26:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE630F8057A; Thu, 25 Jul 2024 13:26:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4845EF80579
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 13:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4845EF80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nUbuYRDn
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3687f8fcab5so377663f8f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jul 2024 04:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721906641; x=1722511441;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=him59Jh0Za/FpncLD54ryW3nFixGnrEeRbEKdwDMQEw=;
        b=nUbuYRDnJJct5Q8tjPdMtHKP3to4SuJQsbpHtQBKs7bMQXshsE8FBJeBlRFcpwgofO
         9QibkHbTX58C0LQuiFRPPTTt9LfOXMOFDD1FHL64EWOIhlrJ16ShDbOu0QWZINPT+3ZC
         XMi9s2xV+LoEvAOzLJeTu85UKEiF6dyLA407unRBIFTBWKTxEvGu64XrhL28yw4AKlYL
         Wj+EA8em4Czu4hPWZ92P0ey5AZsqotwswnPquwMk88N2ovYcxKXT9bvLl9xqRjPbakcz
         JlrI/suS/85BNLlLMAW8ZnwfE+UF66/4mv+3P+0GBe4wGlRceCipquwH3E41+dI6Rh3c
         TYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906641; x=1722511441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=him59Jh0Za/FpncLD54ryW3nFixGnrEeRbEKdwDMQEw=;
        b=nzMGJpboNeBdmhhvyRv85wFC6iHfXklq0e5BvR3rVJQ9d1jhxagoQSUEKcF76c01BT
         UxekvN2iHjXkNGOYXtGHUYZfgnFIGyLJI8qvRzlWvFmUqHgZEI/Y4xOBhPTRdPH9VBwI
         j2GxjHK0zY1NSjUrlrlq/DTOvufye8U+p/ERdcXp2HQhZk3itquE7uQEYZBLMiF2NeDr
         KpjBEIMV5UZw6IyzQ3Bp3xpJV8PurZ8v4HRWezraKOgkDZN2me5lDKGyj7rkILAZ83nU
         V3aAfbTjcOsaejG8VC7VGi+bMxZN7vD2b9UXssFDFT49lynkSVLa9CIoFrMUDP3UF4li
         pMHQ==
X-Gm-Message-State: AOJu0YzFrpdhAYL8f84Z4ozQys+p2AbI+5D1mtdk/6DL/dpyG+WGNbXI
	qGlqw9Z++yyJc97xaZsMXCz+NS9Df+ESbSBJV+00/6odVOmHS5Fgd/LiRpqrWVE=
X-Google-Smtp-Source: 
 AGHT+IE2/MDS0EvvoNMsY4tzNjk68cr5dxij8RbWrbzM/zyGhZ/Yw33L8LYx0zf/UyaMoZNqXyZL0g==
X-Received: by 2002:a5d:6a51:0:b0:367:9904:e6b9 with SMTP id
 ffacd0b85a97d-36b36421ab2mr1215212f8f.44.1721906641227;
        Thu, 25 Jul 2024 04:24:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367e072asm1823607f8f.42.2024.07.25.04.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:24:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 25 Jul 2024 13:23:47 +0200
Subject: [PATCH 5/7] ASoC: codecs: wcd937x: Move max port number defines to
 enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-asoc-wsa88xx-port-arrays-v1-5-80a03f440c72@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2085;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=V8vd4iZFObHif1p5HOQA8sXHu2YEJwGEScZnEYASwyc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmojXHiWSSUY3gTrQtwvbi3XTqFF5y9M+V6TBdA
 UjzT+daecWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqI1xwAKCRDBN2bmhouD
 10BoD/9s4CyMl1vgd0j2Wq1A1AtT/gXwWXp0KYUGAtiYtOHBYxeqlx3cigfTNWTPVh/nSVaRmQr
 Fsdau1R9aTSu2uGyVHaqRk9V9V/Zg9tMQ3IOwzX6HZqgdwgBjQ89kstBVfsIwr5wQ4Xd2g04fcN
 lwA3Yed9dKQXJdkx20InzbWvK8YtuS4fvjU5t/rbLwDzrwgfHjlVLcFurBdHyhi+ubvFjCLxXiJ
 VEbYYDtAE3+CKRl+YLuZeqclG7zbkj3+vSHBatrEzwICkF8x2MARCH4tdKnvwC4lkJP1mLfEi9p
 yk5psVzerdgGGIKEGOINLAjA7vBNeZCrWeEcswBQGu0wkqA7gqPI1+I1wDdTZRGiiQkWWXQGMKz
 iHDXbdTobDgxjcDtQAqUGK4Ioz/NfmIwJWkJooFevfSqbMYivOJG/V2Jtj13G/F6aoXrxiSE4DS
 jPwOvKNQl0kmOqUawrTw+Nsvd4fn5CUAm4agfba9Xs8fxAjCzZgdBi1vn0VihKFiI5p64zfgIoD
 GmBo1ytrBslM8x/1o8+iLXNib07en48TsLulNL23bAHPp0+l6VsCiNfJsyqy2jDTTyV9CA+5wIr
 C0yKnVstuVTUkv3lES2ereAS4UrGpCknu6F8Wwmel9YC8kKHeXwZNDsMBPu6rUBv5AO6oR5P2G7
 f2vn3sq0fsshdvA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 2J5QAL3ZY3OQYOK57YRK4JM54SUMHWGR
X-Message-ID-Hash: 2J5QAL3ZY3OQYOK57YRK4JM54SUMHWGR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2J5QAL3ZY3OQYOK57YRK4JM54SUMHWGR/>
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

WCD937X_MAX_SWR_PORTS is used in one of structures in the header, so
entire enum must be moved to the top of the header file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x.h | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 37bff16e88dd..35f3d48bd7dd 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -484,10 +484,25 @@
 
 #define WCD937X_MAX_MICBIAS			3
 #define WCD937X_MAX_BULK_SUPPLY			4
-#define WCD937X_MAX_TX_SWR_PORTS		4
-#define WCD937X_MAX_SWR_PORTS			5
 #define WCD937X_MAX_SWR_CH_IDS			15
 
+enum wcd937x_tx_sdw_ports {
+	WCD937X_ADC_1_PORT = 1,
+	WCD937X_ADC_2_3_PORT,
+	WCD937X_DMIC_0_3_MBHC_PORT,
+	WCD937X_DMIC_4_6_PORT,
+	WCD937X_MAX_TX_SWR_PORTS = WCD937X_DMIC_4_6_PORT,
+};
+
+enum wcd937x_rx_sdw_ports {
+	WCD937X_HPH_PORT = 1,
+	WCD937X_CLSH_PORT,
+	WCD937X_COMP_PORT,
+	WCD937X_LO_PORT,
+	WCD937X_DSD_PORT,
+	WCD937X_MAX_SWR_PORTS = WCD937X_DSD_PORT,
+};
+
 struct wcd937x_sdw_ch_info {
 	int port_num;
 	unsigned int ch_mask;
@@ -581,13 +596,6 @@ enum {
 	WCD937X_NUM_IRQS,
 };
 
-enum wcd937x_tx_sdw_ports {
-	WCD937X_ADC_1_PORT = 1,
-	WCD937X_ADC_2_3_PORT,
-	WCD937X_DMIC_0_3_MBHC_PORT,
-	WCD937X_DMIC_4_6_PORT,
-};
-
 enum wcd937x_tx_sdw_channels {
 	WCD937X_ADC1,
 	WCD937X_ADC2,
@@ -602,14 +610,6 @@ enum wcd937x_tx_sdw_channels {
 	WCD937X_DMIC6,
 };
 
-enum wcd937x_rx_sdw_ports {
-	WCD937X_HPH_PORT = 1,
-	WCD937X_CLSH_PORT,
-	WCD937X_COMP_PORT,
-	WCD937X_LO_PORT,
-	WCD937X_DSD_PORT,
-};
-
 enum wcd937x_rx_sdw_channels {
 	WCD937X_HPH_L,
 	WCD937X_HPH_R,

-- 
2.43.0

