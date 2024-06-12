Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 999C690587E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:20:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BBB1A4B;
	Wed, 12 Jun 2024 18:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BBB1A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209232;
	bh=j1T2EZc5hy8lhjfjDFFJirW2r0PITpoz1SZidS75cJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iHuBm1xtAsX1MnvFFOjTCzLquyyBC8dIpsu9dnV8H8u3aaA2ZhDWh22YiizD67+a2
	 OO8pYcE6PzB2qik5Ypa0/O/Mi0lbqYjhjih5c0pNGrOujsBiIJsRn/0EtRlAW43DW4
	 1HcXRzGVw04GKX1bvDodW50dNxD8REqu6cyBM8tM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91404F80C8D; Wed, 12 Jun 2024 18:16:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A770DF80C72;
	Wed, 12 Jun 2024 18:16:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0BD0F805A0; Wed, 12 Jun 2024 18:16:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 552D8F806C9
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:16:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 552D8F806C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cns3/MU6
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2eaea28868dso71924571fa.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208968; x=1718813768;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rn1wCxSzpGhMj3lz649lAS7ysUYN5adwkzVT1CE950E=;
        b=cns3/MU6lJRQELTfz28uTrD5mhuZ6XCQnmYbwezaMEu+5ckzeA9nLH+OHap84JVGgL
         LGK0/Pc7gs3b1oXro81jLVmt1KxirpPVLfs/oDs+p2AMbs+mBAfklON8dhxV7QyFvKGn
         cihQFXLdptoNQ+yG5TpZo2A14Zm4Dv2VD7v7hticHpAqidt4V/w179a4r2Hk5HuTLlZn
         iWVMBguyu4imaSy330hdn+BjywfqDmN+YzRB09bK9l9oQDYvtQ+5v9JsEGgrtlCSZcDS
         AtYVLmuXGNsgqAWL451gwl36EQ4NGRfl7e0CYTzeXqKC/NelvnCvrALR7AwKAU1Gl4zZ
         Golw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208968; x=1718813768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rn1wCxSzpGhMj3lz649lAS7ysUYN5adwkzVT1CE950E=;
        b=V2xYITeLKNjJ0UNiH3BZhclSeepFofTCDQsO1p305Spq2hN9nh0se/Z3i7Jm89nMRk
         MQUPNhAZolM1juCDKTW3TMoyvjQwKxVOGMbwW0d/CMM0D2vqMjIoPe8lm/nAyDwRU75r
         EjYvCWODI6yqZZclMbPiepp/1BxCrK2DA+S85PHddQu59/JEXfaNDiwysjuypok5EVyR
         8Qvw+oOGeQHjNFi7+yjjcdJOQa2vWsgwAzpoD4t9Xl0Gtx4DoSEI6DSqIU8v2ylvqhh8
         Zi7B9QwVTVF3TplFI9/rcm9vV1ggKcltQ5pGek/kxWC3WrlRAGXmf8pLnjqTkIL4+fQZ
         d1Xw==
X-Gm-Message-State: AOJu0Yz/dSaVO1auK/xGtRFxjSuXu3UA2FKKnkaqaUObd0WoJRbsEgH4
	+IiUxEknGoP4Y6aVD6CqJzjB+L7EV4dURM+sbGehj7z0aBVyzF0HpPJOTK36fCY=
X-Google-Smtp-Source: 
 AGHT+IGF8tDc6fkHQhj8N0hBjM0u1nGROYuT7Ky5zocWTWK4ZZ4FhkHBtm3BgA4jMGwDrmWzo/tEWw==
X-Received: by 2002:a05:6512:3045:b0:52c:8909:bd35 with SMTP id
 2adb3069b0e04-52c9a3bfb2amr2359349e87.10.1718208968108;
        Wed, 12 Jun 2024 09:16:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:16:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:30 +0200
Subject: [PATCH 17/23] ASoC: codecs: wcd938x: Constify wcd938x_sdw_ch_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-17-0d15885b2a06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=j1T2EZc5hy8lhjfjDFFJirW2r0PITpoz1SZidS75cJA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmmYxa/plx5aUYu0Ka2ucFGIRTRrFo7Zs0gg
 7Q9/bMif+uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJpgAKCRDBN2bmhouD
 11tkEACYAHc9bdHHeVS2Gv1XjeucTe9X7Oo2WPwk6KJYcaNsU2AiC9XpS12sBTLgeH2jxck69ON
 ENyisZlJPK6YD7pIj6ZMCVrYz8wwURZD9ude5K8SbcL2I4vldJgFAZrb4L6SdQhbQ7fzJGl9rJG
 v4OLP9QG4IYMPYyGzvYCFv4aHDfRJ3/0aYCi51mL0BwAlzfwLYO0/kFQDXx82PO0MqpJ0KUDq3Z
 9sLczZ0XAEODYAoMGn8pnRMqxeliLNlY88AerigAwL4jDwpA8gKG7rFFyJSaRc3OHUNZ6NDUOO8
 VCk/lWCtLumTJHzUuL/1PEQ7Bc45I4hq+9OIONgD2YFfI1HjkaE7VH7+qiNqfcScDPN5qLiiYev
 ZkYbFf4gbmn0wmVAnbxPCT1C8WmaUATtVghp/P1/uI0C0A7JfoRtDqewr3/qyOEbSgqTTs4t09R
 8/xA2VwxD0Z96StDjow5IL8yp9sSJQIW4agyeog0qrBVbn+LHHEQnfR7FaTbZpE9eZu7XV8d2gh
 6ynIgcvHcUh4BAKO4+GgRyMewsUl8UDTkfyqztiHEidhz3yKMKmB78Zl9ldXv+1DFdQ9eb8MY+B
 vgbNO0b3GslqnljwB6pCcjbNPFaHP0DLmJRJm3Pi3vTuIBNvMIspwaBr3Bsa0txzjJcz7oETcIn
 5ZIrsZyzehWULHA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: JKFXXQIMICPI2HSYAMMZE4HQXRFSGCUD
X-Message-ID-Hash: JKFXXQIMICPI2HSYAMMZE4HQXRFSGCUD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKFXXQIMICPI2HSYAMMZE4HQXRFSGCUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver does not modify static wcd938x_sdw_ch_info array, so it can be
made const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x-sdw.c | 4 ++--
 sound/soc/codecs/wcd938x.c     | 2 +-
 sound/soc/codecs/wcd938x.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index a1f04010da95..c995bcc59ead 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -21,7 +21,7 @@
 
 #define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
 
-static struct wcd938x_sdw_ch_info wcd938x_sdw_rx_ch_info[] = {
+static const struct wcd938x_sdw_ch_info wcd938x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD938X_HPH_L, WCD938X_HPH_PORT, BIT(0)),
 	WCD_SDW_CH(WCD938X_HPH_R, WCD938X_HPH_PORT, BIT(1)),
 	WCD_SDW_CH(WCD938X_CLSH, WCD938X_CLSH_PORT, BIT(0)),
@@ -32,7 +32,7 @@ static struct wcd938x_sdw_ch_info wcd938x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD938X_DSD_R, WCD938X_DSD_PORT, BIT(1)),
 };
 
-static struct wcd938x_sdw_ch_info wcd938x_sdw_tx_ch_info[] = {
+static const struct wcd938x_sdw_ch_info wcd938x_sdw_tx_ch_info[] = {
 	WCD_SDW_CH(WCD938X_ADC1, WCD938X_ADC_1_2_PORT, BIT(0)),
 	WCD_SDW_CH(WCD938X_ADC2, WCD938X_ADC_1_2_PORT, BIT(1)),
 	WCD_SDW_CH(WCD938X_ADC3, WCD938X_ADC_3_4_PORT, BIT(0)),
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 124c18712422..12b32d5dc580 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -418,7 +418,7 @@ static int wcd938x_io_init(struct wcd938x_priv *wcd938x)
 
 }
 
-static int wcd938x_sdw_connect_port(struct wcd938x_sdw_ch_info *ch_info,
+static int wcd938x_sdw_connect_port(const struct wcd938x_sdw_ch_info *ch_info,
 				    struct sdw_port_config *port_config,
 				    u8 enable)
 {
diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index 0d332cb555ac..09e39a19fbe4 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -653,7 +653,7 @@ struct wcd938x_sdw_priv {
 	struct sdw_stream_config sconfig;
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WCD938X_MAX_SWR_PORTS];
-	struct wcd938x_sdw_ch_info *ch_info;
+	const struct wcd938x_sdw_ch_info *ch_info;
 	bool port_enable[WCD938X_MAX_SWR_CH_IDS];
 	int active_ports;
 	int num_ports;

-- 
2.43.0

