Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2220D905861
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:18:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD8F8E67;
	Wed, 12 Jun 2024 18:18:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD8F8E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209101;
	bh=g2xHVarXvyCS+YBEFCdlIQ1R2j746Vst49InZdmOz3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=emVgvg+CeVk/al/S2M9UDjH3RB/d4TtP+tqWe0sZ9DslDMbjiQLl46+GkDgncYKfu
	 cQK7RsA5lnz04v86qmMVnk+XEgODvuz1O6Xi3XVlOIbqkgD3pU9JwF1m1SPcSQpxu3
	 Aq+5KWombxNa9uWdrkG2740E/VXVcH7pMTVHwSuE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2EAFF806DF; Wed, 12 Jun 2024 18:16:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44FA0F806C1;
	Wed, 12 Jun 2024 18:16:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19CF3F80632; Wed, 12 Jun 2024 18:16:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF465F805C3
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF465F805C3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ddkyDnEb
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso8600866b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208953; x=1718813753;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8VimLKvT4ABsxFxevhxxNfg0qw4/IiIcQHT7uX7SMs=;
        b=ddkyDnEbGlEZ5lEPLo2Q5g3EM2Gee2Fn3ky/9Y9DY1HEoiW24etyq/oGLafcRrMIlj
         bwxVv6QiGrtlkmXo4kGw4HP8XdDDdFqgv/sNLVgPsecvJFpTcchxCPxAbqkqlXKHyQt1
         +ZX9kRTnA0Yl33v9Ciczy3Lpw0bAMYkkpySBZzf4TPsQqEe2zkWaD+00wm9RW8676pUW
         0I07py5M9mM+aDIEz++V4ViBcYctjbVO9z+bBseWDxXHYa95tAhJu7dNOkzeid7cyuV1
         aMPIUk81tiTBhuhT4Wm7nM8i20mi+9SoCUpqLRcSL+ivoAn46enRvNf2vVcPo/+t1rpu
         TQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208953; x=1718813753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8VimLKvT4ABsxFxevhxxNfg0qw4/IiIcQHT7uX7SMs=;
        b=fKfE5IOwpIplTGori94A/Ix+kW+RZk3qTezsrf+i29WGe3oqxTJ8j9Ui8lzlD2cdCs
         FSiscQjnVTj7MhM6SI1yPuimrwBQ/37ketHEJNcXbi7a9Pu16o/QncMgtmIgNm/SyZWm
         yIc+sww32p3qUBcv6bg584uzY8O8cD679IXnj2PidbasCyaMsuR4/X6ygF+OU9It0BZN
         CblNjL3gVU/Y7ViysaMf4t0FNPpvXP+FQHhMwmhJyyWZN3mL3O/mcM+FAi8lah+YtVV5
         q2YXjIL0pS7/QhpePq8iDicNpEaR4hmnEZdE83HqaFFGEOG0ZSq55WcxtS+p4P6UU4Ku
         hZ9w==
X-Gm-Message-State: AOJu0Yxwia2hyvhPToWpR4aMPDXJVlpO5R6pKF0gz65laBHWiI1wdgg2
	QNxHz132o5rIi3PILU6tyV5E7GnLFo8j91Xd3THlaoK25TZMATe6YRjlLjwdxYo=
X-Google-Smtp-Source: 
 AGHT+IGTfvvCQj+ZNaFMkZ6wx7TiN7Ii9ExBRfK9lmhqZIRybLOb+747kCSXpsZax+KK21ylmXhTPA==
X-Received: by 2002:a17:906:a20a:b0:a6f:16c4:a5c4 with SMTP id
 a640c23a62f3a-a6f47d52367mr134173866b.20.1718208952754;
        Wed, 12 Jun 2024 09:15:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:21 +0200
Subject: [PATCH 08/23] ASoC: codecs: wcd934x: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-8-0d15885b2a06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=g2xHVarXvyCS+YBEFCdlIQ1R2j746Vst49InZdmOz3I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmeSFE+f/zsNCHQgFuBYKnXqNHmd/j2SQ58e
 6jiG2sco7GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJngAKCRDBN2bmhouD
 1yzcD/4yxf5LOsAQ3mrol2YYLGKoGQIRXfK3WfZuxOS/lBU0ucumfmz1z+oqUzYIqmccjQeKaXq
 NlGKJmaMY04RD+gyEGukOUDwSNI0d77Pf6bkVyzNe5924vuhazpCb58XhPOaAclJM0M6L2qwXXh
 7aLnQeNr4LC1yEyXxV4hVfxFyJHgRi8utspCKZKvtfhnwfm0xfURtYHoIg934GdiVpmbA/efN01
 zlWiGLeJcUr8tuFrykdDTP26XZVJaugMn9TjdcW2u2fHOnjX8SE2HlkckuvGFaTLFzw/N3/m9cw
 P3ClaU3RhJX58wtvJBETIVAYFeQgN++2cs9JQzQkTZovfsIeDNXWWWu6o3jDJj3IC6wxWpqE8nO
 yzuKEO65UNfyzwaV54XBGJu5lE37s4OsHPTbpwgYg7p0pRAAKhEdMnzTvB6Jr+qrF4Me8JQ903f
 wPrmt5RRRd04oMegWBw11QtzQVD0fmkQ3+9bntUc8pSnD/r6pKf5NJ1/TtJlNF7Nuh3VtUWyjXV
 o71thRJ5S/EcXAFiXbBCN58Q/re7UFQ5l/XRnQsvOIPO+bXA4bscNaiFerHEeBVYO7Q226iBweK
 soCp0AordfiLwFZ/Uh27/z7SZ3hFY5Z/EAMbunvdFmPkp9gciDgVreTzA6ihJR96wDL+i7JGQYD
 xzK1fG79wxsrJow==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: RP6Y3Y4B45T7GFR4RXYXD5DT2SPRVIUY
X-Message-ID-Hash: RP6Y3Y4B45T7GFR4RXYXD5DT2SPRVIUY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RP6Y3Y4B45T7GFR4RXYXD5DT2SPRVIUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver does not modify few static data (arrays with sample rates, MBHC
reg fields, regmap config), so make them const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index cdb68f34e55a..7885aa423886 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -480,7 +480,7 @@ struct interp_sample_rate {
 	int rate_val;
 };
 
-static struct interp_sample_rate sr_val_tbl[] = {
+static const struct interp_sample_rate sr_val_tbl[] = {
 	{8000, 0x0},
 	{16000, 0x1},
 	{32000, 0x3},
@@ -522,7 +522,7 @@ static const struct regmap_range_cfg wcd934x_ifc_ranges[] = {
 	},
 };
 
-static struct regmap_config wcd934x_ifc_regmap_config = {
+static const struct regmap_config wcd934x_ifc_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
 	.max_register = 0xffff,
@@ -1212,7 +1212,7 @@ static const struct soc_enum cdc_if_tx13_mux_enum =
 	SOC_ENUM_SINGLE(WCD934X_DATA_HUB_SB_TX13_INP_CFG, 0,
 			ARRAY_SIZE(cdc_if_tx13_mux_text), cdc_if_tx13_mux_text);
 
-static struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
+static const struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
 	WCD_MBHC_FIELD(WCD_MBHC_L_DET_EN, WCD934X_ANA_MBHC_MECH, 0x80),
 	WCD_MBHC_FIELD(WCD_MBHC_GND_DET_EN, WCD934X_ANA_MBHC_MECH, 0x40),
 	WCD_MBHC_FIELD(WCD_MBHC_MECH_DETECTION_TYPE, WCD934X_ANA_MBHC_MECH, 0x20),

-- 
2.43.0

