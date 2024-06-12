Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B083E90586F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:19:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AD18E68;
	Wed, 12 Jun 2024 18:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AD18E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209162;
	bh=LTstfjn1hMHMf+Q8MdqFM/YRF0Q4UyK8wtDcQ2OvBmk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b/WdFMtJ1x89lf3Tp0vvSWnv0H1U9g+nQ+81rB6OdgcTkcp57L3XIACUBpr84AEJr
	 2Hi5bqR0q9Q4/VjHibLaGwgFvwmOr1UrY0f0R9kc8yeN9QJWQkjp33P/JKgmls3O1W
	 AKscgYTx2FTBfkVAm31Tz9HQS7N1yZ1Ll8mJdBxM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13F27F80814; Wed, 12 Jun 2024 18:16:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB123F8080A;
	Wed, 12 Jun 2024 18:16:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12D20F80698; Wed, 12 Jun 2024 18:16:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DD83F8061A
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DD83F8061A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QI2jxZWK
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a6f09b457fdso4717266b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208958; x=1718813758;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0RoCwzR24DTjnx5Ae0LKefqJtZxwLkqbFaLkQ97nAo=;
        b=QI2jxZWK7b2W/dzCVy0KYM0sJ3AcAg4CsvlPvQLY7MtXnhYmmzQL3XKvetsaSuaIlJ
         S3ieja6LE0O/nF5hUzUVmy5LLegUJ1dynJSB1klvN7LgQa0bl4JaRIoPSsH2RwBcY8oS
         fF2R97vaeeCY319oZGJH0kohL4yhSJeS5p5g3SgBw0Xk+C2HKpAFCNCPXRpBD/zVX9pz
         zFI/CRI+bG6/mza7lzOn9rg1PKPoxwLjFoGjKn2eXMUtUO54i8vbKOudyjy9Xr2D/oUD
         zyUnVKMGtKUWkATnO5RfKkjNNiIsRGLF1KA7m3+zbDmgdAMGuFzWu4mXfgPLxQ4JeKRs
         VU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208958; x=1718813758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0RoCwzR24DTjnx5Ae0LKefqJtZxwLkqbFaLkQ97nAo=;
        b=V5kUMdA4ztZqA+NJztg6V0Td6LZjNRexDzbeUctOFi2ENfGmj+m6xZyjz8tk6PAAGo
         Obkh641/T6bmy4v8/+T1OcQZA9pkQCQUU7AOwoP9S6dYqlYtBEppSCWctFB3avWAqZ3p
         QxFPXBsD63OtpEpYC58U0bOFf+k6ISugATaWnZA8RxfdHxTGAdiUdeadcNRYxXpzI+Ba
         qchKsip5GyvN9iYhfm8QG+9/wQkLnsQ4PCAZJpa5g0gwxlxiIGsnymdCavE8bW1vwDww
         62bzEQkk1Me5qHUSUxP6YEecVo/HwfHt/0QVkehoKl5u7EwtocbKDXo3bEbFdVVrvTpX
         VUgQ==
X-Gm-Message-State: AOJu0YyFILMEgH0VB8QYGkn0jizUnUfsRGJ5BUNeCZz7c2u/uxe00jGE
	/qtC4aTLSKOHEX9VaDkK4n7W/i/RITyCBVpB2XRFwwJ5K+AwIRHOJT1e9a/uixU=
X-Google-Smtp-Source: 
 AGHT+IEHT7fjxNIbBkv5TRIIRZ6myoWuerWmlXjHIwCrkRZNl6xan8/1FVtMhhGq1x0G45gcVVc3LA==
X-Received: by 2002:a17:906:756:b0:a6f:4a5c:4ba9 with SMTP id
 a640c23a62f3a-a6f4a5c4e2dmr136376666b.39.1718208958141;
        Wed, 12 Jun 2024 09:15:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:25 +0200
Subject: [PATCH 12/23] ASoC: codecs: wcd937x: Constify wcd937x_sdw_ch_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-12-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2590;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LTstfjn1hMHMf+Q8MdqFM/YRF0Q4UyK8wtDcQ2OvBmk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmhBBzVRShUj1VYQpmrpSMRLxtLFx+CLMBIR
 JATHB9laYKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJoQAKCRDBN2bmhouD
 17KNEACKbYdkfoppv6n+mBfwN8E80Bvdy7+v/7JJre6HAW4Z6Z6RgRdCLEAxh05k7fBgq4/UAfj
 jSxcu7pXOKCgUvlkBMbA1/OjwGIq0+qB6t7R7RMS8OW72dlYEnJc5gz+SG1hTVybKfpkbXcN5y2
 ivhTJfyi0bQeYCftqgRR6Dhzy7goc+Vd28khWHuP3k+zolV6qTXfmSskz818mWDjP7aoP9d/57k
 gFRgmyvHtpRHs8AOr9rPQSwmG+al98s8M4+oHnmfgyO/xBT/k0VvLJgj54etrGpsyiFbp1XG9YU
 FKsecBbhHyPa+LNUVGIlEQ/qIn8exFoy6hfVGLEDQGcrz6HpwDZEbnPIi17fw5PNCmbkAaOUQRM
 HUhdZgjG2HSsiAAL5cr+drtIoD4Fkpj83PFFvWOP2cnCPMAO9s6gDJj3FQl2AEhc5ppiHGsJNBA
 B/SsxDtfZ9jxvgi4PitAUd1KnfwBLZ+Zs1yqLDPdqnG/6o6S2rfP/3jLS38vkmZUWU8O9T2oJ88
 KHIqlsWzayMzsvh4w/OqekWzHmwAl2yOdm+b2FOtdF92gvcfO5D0wlGg0a1cTkMrFCdyIbE+RUN
 5SzOTH1/xvQslhNtKqRQHYcvUwmyIaA8HtW0kY5rPyje0N2h/e6GmNVRX1H8iPgeBrxYTTeMZS6
 mFNdzhmp5tQTS3g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: J6LC25C4ENPN3VUGKAYRSP6OILX5APYE
X-Message-ID-Hash: J6LC25C4ENPN3VUGKAYRSP6OILX5APYE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J6LC25C4ENPN3VUGKAYRSP6OILX5APYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver does not modify static wcd937x_sdw_ch_info array, so it can be
made const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x-sdw.c | 4 ++--
 sound/soc/codecs/wcd937x.c     | 2 +-
 sound/soc/codecs/wcd937x.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index a45025bf96c6..a24d6c620dba 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -19,7 +19,7 @@
 #include <sound/soc.h>
 #include "wcd937x.h"
 
-static struct wcd937x_sdw_ch_info wcd937x_sdw_rx_ch_info[] = {
+static const struct wcd937x_sdw_ch_info wcd937x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD937X_HPH_L, WCD937X_HPH_PORT, BIT(0)),
 	WCD_SDW_CH(WCD937X_HPH_R, WCD937X_HPH_PORT, BIT(1)),
 	WCD_SDW_CH(WCD937X_CLSH, WCD937X_CLSH_PORT, BIT(0)),
@@ -30,7 +30,7 @@ static struct wcd937x_sdw_ch_info wcd937x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD937X_DSD_R, WCD937X_DSD_PORT, BIT(1)),
 };
 
-static struct wcd937x_sdw_ch_info wcd937x_sdw_tx_ch_info[] = {
+static const struct wcd937x_sdw_ch_info wcd937x_sdw_tx_ch_info[] = {
 	WCD_SDW_CH(WCD937X_ADC1, WCD937X_ADC_1_PORT, BIT(0)),
 	WCD_SDW_CH(WCD937X_ADC2, WCD937X_ADC_2_3_PORT, BIT(0)),
 	WCD_SDW_CH(WCD937X_ADC3, WCD937X_ADC_2_3_PORT, BIT(0)),
diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 4cf17d62a0bc..8b000ba9a469 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -1244,7 +1244,7 @@ static int wcd937x_codec_enable_micbias_pullup(struct snd_soc_dapm_widget *w,
 static int wcd937x_connect_port(struct wcd937x_sdw_priv *wcd, u8 port_idx, u8 ch_id, bool enable)
 {
 	struct sdw_port_config *port_config = &wcd->port_config[port_idx - 1];
-	struct wcd937x_sdw_ch_info *ch_info = &wcd->ch_info[ch_id];
+	const struct wcd937x_sdw_ch_info *ch_info = &wcd->ch_info[ch_id];
 	u8 port_num = ch_info->port_num;
 	u8 ch_mask = ch_info->ch_mask;
 
diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index e6e1ad5926d5..6f857ce7d8b7 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -522,7 +522,7 @@ struct wcd937x_sdw_priv {
 	struct sdw_stream_config sconfig;
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WCD937X_MAX_SWR_PORTS];
-	struct wcd937x_sdw_ch_info *ch_info;
+	const struct wcd937x_sdw_ch_info *ch_info;
 	bool port_enable[WCD937X_MAX_SWR_CH_IDS];
 	int active_ports;
 	int num_ports;

-- 
2.43.0

