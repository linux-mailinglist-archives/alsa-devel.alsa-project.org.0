Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0330790587B
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:20:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71D7CEBE;
	Wed, 12 Jun 2024 18:20:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71D7CEBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209211;
	bh=zKXd+91xEq5pfFCX7DOuH5v5v4sMaD9C4FPc04gU9r4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qfkjGAHJSjNmS4dKRMCxx++LFwoHKb0Ols4INUvn5RkXXikIXbikbk5vif74t6OdF
	 lwdnH61nn35tYt7XKGZW56gZr4pWsJ7VFqQczZVLQCE2jL28mMDOCWnSex4IJqoiaG
	 XAO/45b3NReirLrTtEKGSdITIKH4cwpTg6mUpX+M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA3C0F80C6D; Wed, 12 Jun 2024 18:16:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D517F80C22;
	Wed, 12 Jun 2024 18:16:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CD68F806E5; Wed, 12 Jun 2024 18:16:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31C6EF80695
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:16:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31C6EF80695
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mNidMt+U
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a6efe62f583so6327166b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208964; x=1718813764;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SiX6Sbf9ddGFk6daznvxWZY69rEFKNMVZ2nde0CgHqI=;
        b=mNidMt+UxRoR5xz38p+rJBGIHKCUgLcv7enkCK7J07tRUy/swYxWZV+VItNBWkCm1/
         uW7beifqjy5vh0KilFJE6R21eUYvi+uEg1yZY66zcaMl7iIhpm0FzX3y5tIAVOH38KjZ
         5ZDNknk53Mf1oEHFUz06hE/m7pMI7x5bu6BBUt110ccShepWAlvH9D/rnI73ihhyjQQr
         xDKmMPeTQMpwtAl8L8MXs5X+x1a7Jkmxt9HlghN9j98cETGjz3Wy4LqQoe2ZpE9xEcXj
         d/Hvcpn693v+byyUndhh9CVJ7qX2hfNrZ20bWfWAc594OHAYQJDYYysYuj0FHOTmhKw3
         YiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208964; x=1718813764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiX6Sbf9ddGFk6daznvxWZY69rEFKNMVZ2nde0CgHqI=;
        b=VDf/Y+57VrbFlvI/rna6m30ySe1JVXmIfM74gIq/sPBwaRmhZy0+ij6jOh/eDN4zeo
         akHmPAKfS0618n2fn8nzX+F8YslHCDUuqwHEAvRtxfQBcbwwKJGMKgeLeeQQEHPXTcSV
         PZc/qVokSKE8HV9/DD2FwXtAoQqMc8ys2v0KjgYbcrcK04gBwFO+QFTjk5eAeiRDygjK
         ODClW2PkCoc04smGtfXosB9WsNvlCGuMp1oAqoqzl5VXSs7CZZmyvl8EHOZ/98A3++Ai
         shC2ERJIhSZ1YsXUJPYSNLPlaJJIyaUa7svx2FBsg1oxQjmWH0tzm3J3QQu/I+PKURfj
         Uk2g==
X-Gm-Message-State: AOJu0YyS3gz66uMR5HcjryLBtNdZiwwpHL/54BchlvJsqKx8b3Rkz5JE
	FV3jtiF7hMtaiXguBDfOWwE5N17t62GEKuudN97j5Z5nPA3nmo7JJKp5BS5EmJg=
X-Google-Smtp-Source: 
 AGHT+IGiiOo8DvyESFXAfcAnuf1NGFEdhUpYILJtrfGZXuVCuhwhQWT5bCBjkKfscjQ0XSUs8MlYHA==
X-Received: by 2002:a17:906:c349:b0:a6f:22ea:55b6 with SMTP id
 a640c23a62f3a-a6f47d5cf04mr139036266b.65.1718208964688;
        Wed, 12 Jun 2024 09:16:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:16:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:29 +0200
Subject: [PATCH 16/23] ASoC: codecs: wcd938x: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-16-0d15885b2a06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zKXd+91xEq5pfFCX7DOuH5v5v4sMaD9C4FPc04gU9r4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmlSsu/q1HO0eaUx9PgU+Dxz56B2dOlI+KPw
 SXkBY21VYKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJpQAKCRDBN2bmhouD
 1yyVD/sEH+iwt0IY8qp1uSeTqpdM8WJOxtJQKO07crLnieq69XT6lz0MVNvBufuf1+jprRqGX4v
 G+vYXNWTc2+wT34jYp4HAVPIkd5O/+jrCJ2Fvc+D+l7/guwa6h7qp1K+K+AHgbPnrpLd3yWalYp
 LX9cWjSDD3e5vaqhn6Aj8UCMdTTy6uSqdr+Eu+MxpJoUb0+bhxmiJoCuAd5VDvxWYh5RguxjN92
 aRShTmq5mkX7ivZVE40xXJs3SYstK17V5HnByrTJwLNBWVZGGtvGmgFk7XQbrUAz44kSvOmkiyy
 LmVGLnZXVsA34h8P6QhaIcQU1K5HS1nNqmVgOslpjqbgn8X2543TlhR6PwncLlfT+O/ZPwu3qb6
 pn7Pduxpcz3NZiNctj6N/5SxqJ/2//NN6UWsYqvTg8oVEJJlEKIxTx6fp+uDaf1Y6WsPNqhE5vr
 EWMkoZA5/sh6D6A8NS0lwMpO/bgUuyXUFVu+5+RhTuTp8PrfAmCsALZAHKj1ioheTwKbKzPOwh8
 eXFODdsxR3TlMLou1tiByjgTfS81dywRci/lTwsS8j8RKTLgiKdD+KkuVVaDcFG0BQ9XWkHAUdr
 WB7JMNouzyG8LBZYzEIxeT+tAtaamYudAG3LzvraWM1USEsCt0RbSul5XqhNbUr3ZmdgF5gmAFW
 gfuek37KPhyfRQw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: YBCXTEW5MYCSH4TGN3S2DWI6WZ3VC4CH
X-Message-ID-Hash: YBCXTEW5MYCSH4TGN3S2DWI6WZ3VC4CH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YBCXTEW5MYCSH4TGN3S2DWI6WZ3VC4CH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver does not modify few static data (MBHC reg fields, IRQ chip), so
make them const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 73387152ce02..124c18712422 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -221,7 +221,7 @@ struct wcd938x_mbhc_zdet_param {
 	u16 btn7;
 };
 
-static struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
+static const struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
 	WCD_MBHC_FIELD(WCD_MBHC_L_DET_EN, WCD938X_ANA_MBHC_MECH, 0x80),
 	WCD_MBHC_FIELD(WCD_MBHC_GND_DET_EN, WCD938X_ANA_MBHC_MECH, 0x40),
 	WCD_MBHC_FIELD(WCD_MBHC_MECH_DETECTION_TYPE, WCD938X_ANA_MBHC_MECH, 0x20),
@@ -3027,7 +3027,7 @@ static irqreturn_t wcd938x_wd_handle_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static struct irq_chip wcd_irq_chip = {
+static const struct irq_chip wcd_irq_chip = {
 	.name = "WCD938x",
 };
 

-- 
2.43.0

