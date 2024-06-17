Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6604590AE9E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 15:04:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38204839;
	Mon, 17 Jun 2024 15:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38204839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718629481;
	bh=oC0pfgVa3Dlx6z7hG0aXQvQ0Zxw02RemJzxb8+JzjIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MUo2kH5WtufiQdq1AJP8kmHrIvR2ARHMP5I9hyqMKPbB2zpKBrj2o7jdz0YzNpFIg
	 wumqbWMsvz7mh4Y9wyzhSXPbI2iqqFDGPR2XXsh4eE1tAFw68xhn0LQ2tv2xTuUqZn
	 WTMJOTmdBcOaT0/d1rcnvQ9V0PKdNeEcmLv9XG+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E07BFF80578; Mon, 17 Jun 2024 15:04:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E5C9F805B1;
	Mon, 17 Jun 2024 15:04:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1372F80587; Mon, 17 Jun 2024 15:03:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 846B0F801EB
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 15:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 846B0F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ebI9zZv5
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57c83100bd6so5244127a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629419; x=1719234219;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXtYDqlssObtluhwd5yYfudjspyFdWITZQVCGqmtTl4=;
        b=ebI9zZv5Jo0II9JcmvHFWMDY47NO/QrA2iAQsLqAHoYRzXL6tSZ8bKL2lY+TwSeSFz
         +PFOQCJOtqR6bH4dAj+yYQ27GRyepKJdFcRFJ/STlxOoaXFnQ2Czu5sUji1KHTLwUdA2
         c3cIZWF7rWpl1lW9Agmv8GfgoGzfi1P+tD1e42PzqyfZXj144ZYnO8i/eawnVQxFmMiJ
         diAhvEEipZj93AtNT7+WSnneGTPP8xCR7RNN0N/ASxeMZZD/T3W6wFxRqznfYeNmKs18
         feMQnv03cIxrPhqTLY1E1UMru6XWktdITWum+sbAHvJSwkePGYtRvG3uI6xZvIcFG98x
         o3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629419; x=1719234219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXtYDqlssObtluhwd5yYfudjspyFdWITZQVCGqmtTl4=;
        b=BH2TTHsWrEI+Hr1oy4rRz4o/j57uJooP9kEMBURT9IQjdTdV6eRo3vvtDmxm5uWc1K
         wGS9JjLMZmf4y4yvT6Ac77sIE3rKRXg1Jjy6IfjEKdYWn3J9kCGEC34cpKOo7jIFkAwO
         IrZebZBpOe0MldYGUTl3QWguaD0Gj/WmrstfwZc4FCy5Fx0jsluSSOOMRCjVmLyH6e6u
         jjHAzaxO+379DyoYhtGBT7Oj4dCHNvUNWt7lbxe1NiAjc7iTPBpSZJI/j8kqYIjUknlU
         mF4sWcgsEi3SIEslmeeCzKeu8VqQqP5d8RGW2LGWeI3Wqr9n6lsdaIjM6D3xXdp9YdF+
         XTeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM9o1xTsexKCNTNG3CvR6a2W/3txWerfxm/k5D2wPeKeXAnBtR30aRbM4LcLftJ91Bi/hx1sq2pVGP+knfPHGALn0efmbZW1CRp5Y=
X-Gm-Message-State: AOJu0Ywu2SN1neMx5LUUsiW19s3R9uUV7vR8GjxJ5XFO++nWnyd1DQnq
	gkeKHZ+7c3gZRYndSZeKYnd85hT/7fT4KIsDNkJmEyrtDV37HZiYlwrR43lF8pA=
X-Google-Smtp-Source: 
 AGHT+IEaoNxxPiL1V9qAIPqtvGf7T8Fbc2bl94L6pFSRARPNikz+7tsmf13GahUrnRzW8iYLJeAUBg==
X-Received: by 2002:a50:d793:0:b0:57c:ab22:18a8 with SMTP id
 4fb4d7f45d1cf-57cbd651ceemr5891279a12.7.1718629419361;
        Mon, 17 Jun 2024 06:03:39 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72daa67sm6404349a12.38.2024.06.17.06.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:03:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Jun 2024 15:03:22 +0200
Subject: [PATCH 4/6] ASoC: Constify DAI passed to get_channel_map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-4-8004f346ee38@linaro.org>
References: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
In-Reply-To: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5852;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oC0pfgVa3Dlx6z7hG0aXQvQ0Zxw02RemJzxb8+JzjIA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmcDQhZuPcn9ycaEh5vyXfhKSTEwcApSHfOOgdW
 25ck4WYxLmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnA0IQAKCRDBN2bmhouD
 19WrD/9V0R1cp/MPvW47yAqk0nllwL/C2Pr4G0NMN0Q+vspSHXfzVxM/L2H5DM9CFGGP62GAj7S
 QF732eixnRp80gLfuEus2r9lU+V6X/ml2amoLnGT44cAOkWnMKUkpxznzLLB7h82tNO2nv7VWFD
 IeLEoZ2QsgTwGaX2OZNlcfFbseN/4XgRXmXSg1yoVyZIMnqcVH8V5wH6JyQhE+oZ4Gdp3xtvMWO
 QA5SGFFitEFNg+ThMHAn4H42opusXekUhBo+olBE9ITJlu+GVKn/EnEywhuIWbIdkEgbOglOrh6
 bCAD3AfKSRVyWR3uaaEBaVtpozUoOYoQOphVtMgNZSPsHSb8K7wqYIQa8rmc106xEMNIHdoAOpF
 zFgaSAnE2dZDXiB2DKvXZdUucFkiIal8DdOZmm/TDKjHWCXLzk/k6ieZMCrSJ4kkvYYM9iInMIr
 ENakyrKoJa2K0S3+ddn5/ROVDgP7i70OMZhqUJIVGv7y3xpdyuzdy2uirPuAvrJjdjFqqjLvfSI
 +Exl+BZfTshQ5dFT4i6cH6iDJ/p+CCIL49B7B4gsxxmecQBtUAOmpEr4Dc78HA/SHIDmPfAmpH3
 VTvCmQf0+yfwSzHwgoH1kFNCK2DN+YM3n5fKLiO1ohQBDJrzoR1eNvmIONEO9y2K60arvDtUZpo
 4vAcuxBe3YAQ/bw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: QKYKZLQKSS2SGNXDLN7DLXRPUEZ3BJQJ
X-Message-ID-Hash: QKYKZLQKSS2SGNXDLN7DLXRPUEZ3BJQJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKYKZLQKSS2SGNXDLN7DLXRPUEZ3BJQJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

get_channel_map() is supposed to obtain map of channels without
modifying the state of the given DAI, so make the pointer to 'struct
snd_soc_dai' as pointing to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/soc-dai.h            | 4 ++--
 sound/soc/codecs/lpass-rx-macro.c  | 2 +-
 sound/soc/codecs/lpass-tx-macro.c  | 2 +-
 sound/soc/codecs/lpass-va-macro.c  | 2 +-
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 sound/soc/codecs/wcd9335.c         | 2 +-
 sound/soc/codecs/wcd934x.c         | 2 +-
 sound/soc/soc-dai.c                | 4 ++--
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index dccda9f1b160..e9751cc94f8c 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -198,7 +198,7 @@ int snd_soc_dai_digital_mute(struct snd_soc_dai *dai, int mute,
 			     int direction);
 
 
-int snd_soc_dai_get_channel_map(struct snd_soc_dai *dai,
+int snd_soc_dai_get_channel_map(const struct snd_soc_dai *dai,
 		unsigned int *tx_num, unsigned int *tx_slot,
 		unsigned int *rx_num, unsigned int *rx_slot);
 
@@ -307,7 +307,7 @@ struct snd_soc_dai_ops {
 	int (*set_channel_map)(struct snd_soc_dai *dai,
 		unsigned int tx_num, const unsigned int *tx_slot,
 		unsigned int rx_num, const unsigned int *rx_slot);
-	int (*get_channel_map)(struct snd_soc_dai *dai,
+	int (*get_channel_map)(const struct snd_soc_dai *dai,
 			unsigned int *tx_num, unsigned int *tx_slot,
 			unsigned int *rx_num, unsigned int *rx_slot);
 	int (*set_tristate)(struct snd_soc_dai *dai, int tristate);
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index dfb7e4c69683..723d460daa1e 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1648,7 +1648,7 @@ static int rx_macro_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int rx_macro_get_channel_map(struct snd_soc_dai *dai,
+static int rx_macro_get_channel_map(const struct snd_soc_dai *dai,
 				    unsigned int *tx_num, unsigned int *tx_slot,
 				    unsigned int *rx_num, unsigned int *rx_slot)
 {
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index c98b0b747a92..209c12ec16dd 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1167,7 +1167,7 @@ static int tx_macro_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int tx_macro_get_channel_map(struct snd_soc_dai *dai,
+static int tx_macro_get_channel_map(const struct snd_soc_dai *dai,
 				    unsigned int *tx_num, unsigned int *tx_slot,
 				    unsigned int *rx_num, unsigned int *rx_slot)
 {
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 6eceeff10bf6..832648b362ef 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -892,7 +892,7 @@ static int va_macro_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int va_macro_get_channel_map(struct snd_soc_dai *dai,
+static int va_macro_get_channel_map(const struct snd_soc_dai *dai,
 				    unsigned int *tx_num, unsigned int *tx_slot,
 				    unsigned int *rx_num, unsigned int *rx_slot)
 {
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6ce309980cd1..1e19c2b28a4f 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -992,7 +992,7 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int wsa_macro_get_channel_map(struct snd_soc_dai *dai,
+static int wsa_macro_get_channel_map(const struct snd_soc_dai *dai,
 				     unsigned int *tx_num, unsigned int *tx_slot,
 				     unsigned int *rx_num, unsigned int *rx_slot)
 {
diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 42a99978fe5a..fc0ab00a253f 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -2014,7 +2014,7 @@ static int wcd9335_set_channel_map(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static int wcd9335_get_channel_map(struct snd_soc_dai *dai,
+static int wcd9335_get_channel_map(const struct snd_soc_dai *dai,
 				   unsigned int *tx_num, unsigned int *tx_slot,
 				   unsigned int *rx_num, unsigned int *rx_slot)
 {
diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index fcad2c9fba55..b5a929659dc8 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1960,7 +1960,7 @@ static int wcd934x_set_channel_map(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static int wcd934x_get_channel_map(struct snd_soc_dai *dai,
+static int wcd934x_get_channel_map(const struct snd_soc_dai *dai,
 				   unsigned int *tx_num, unsigned int *tx_slot,
 				   unsigned int *rx_num, unsigned int *rx_slot)
 {
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 55d1a5a099df..0c3a834e504d 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -11,7 +11,7 @@
 #include <sound/soc-link.h>
 
 #define soc_dai_ret(dai, ret) _soc_dai_ret(dai, __func__, ret)
-static inline int _soc_dai_ret(struct snd_soc_dai *dai,
+static inline int _soc_dai_ret(const struct snd_soc_dai *dai,
 			       const char *func, int ret)
 {
 	/* Positive, Zero values are not errors */
@@ -327,7 +327,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dai_set_channel_map);
  * @rx_slot: pointer to an array which imply the RX slot number channel
  *           0~num-1 uses
  */
-int snd_soc_dai_get_channel_map(struct snd_soc_dai *dai,
+int snd_soc_dai_get_channel_map(const struct snd_soc_dai *dai,
 				unsigned int *tx_num, unsigned int *tx_slot,
 				unsigned int *rx_num, unsigned int *rx_slot)
 {

-- 
2.43.0

