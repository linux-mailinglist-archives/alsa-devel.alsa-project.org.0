Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 118A3830950
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jan 2024 16:13:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 684FD85D;
	Wed, 17 Jan 2024 16:13:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 684FD85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705504397;
	bh=CEoOOu3lx1F0t2DXMRp7Dd+POoFYCjzJbOK7DJcvqdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=riE5HUtTk4oCiv4Y6ixHgkcbUTf2DAL7gIKA+fMSLts2VPR+chcxS5XD1dZTfE2fY
	 SvK5fT11T47qI+jwbSwcyY3N+fboRuY0DLsix1SbbMRmNSvGTExdtll+/eZxof3jo6
	 2tkV6y3hYIR62Gfd3qr43ouSvZ+YpeR97QXwG8gw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3423F805A1; Wed, 17 Jan 2024 16:12:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CD18F805C2;
	Wed, 17 Jan 2024 16:12:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13BE5F801F5; Wed, 17 Jan 2024 16:12:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7522EF800F5
	for <alsa-devel@alsa-project.org>; Wed, 17 Jan 2024 16:12:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7522EF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TLBEClB9
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-7831389c7daso960434085a.2
        for <alsa-devel@alsa-project.org>;
 Wed, 17 Jan 2024 07:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705504340; x=1706109140;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvT4DYI0xpteMdP3q2s5kHm3KTUWGSKMdy7WHIRX+6Q=;
        b=TLBEClB9aytjG28U8c6JdKnZI9q05F3jQyV2xWKNAtEyjXMEBFjzr5fPCn4WC3d69b
         Rqa13Hd/4TXOj2bmNsw7R/CcqdMO4h2hJIdQ+BuCq7jT/TvdftOnR1GOTxMZFy7whlC7
         DNnKLNgMdfPLW2X2bWVm1uHm8tMkBVhpl4lLQ+tGJSyPPyBeNQcbq/W24yClNYnuf9pN
         yS8n6lmqV+HjRRl1Ck8+e3wk96Mexj5HkTzYeLc+1So8yjHQb8h1VnqNFZ1HkRrZyCoU
         AJHvA3j8x2r3Dc+8XRpuKLnkXg62i9a91RNvuiZz9whnM+9q7OFninqTUxlSaAPf7P5p
         0hQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705504340; x=1706109140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvT4DYI0xpteMdP3q2s5kHm3KTUWGSKMdy7WHIRX+6Q=;
        b=E71rKpY4Bo1CznidWgaCSat5sdo/6o6SqKY1CdgAxoiYPtx/6v+3ptaBN0mqCtexFR
         po7Wz+tm9Q1YckpKkI9Vsc2tTSzoDVG3+R9lTUq/GX9JSYzzXicecJfxGeggXcViHcIe
         KZisei9mVLY9FxFo74iT8chgYCJp4b7ZTo3BEgNKYQt79roJopX5+U00DAlTfzVXnqOG
         Xb+44t5NiLj9vFBf2TYAuc0SkPElHVi9lt18g5zdbjpj0uEHvhc3pMU2D77ToWN5WkbE
         jNZdgIp65fXRhJE6YS/2ygXm5W39F3WJyde/YQaZLertN3FnCujVareooeiwpdI/toXW
         exWA==
X-Gm-Message-State: AOJu0YzZUmgyd+diVuFS7fVaYqEHBh7TD5d7qkrJMGJu3CSfSH5o3wPC
	3EnldYqY3Jc3NBTkYh1jTlEXO0C2qm2f5A==
X-Google-Smtp-Source: 
 AGHT+IH39mkNRZQTB7lr0OTpjPsUCqmf9g+mw8wVtjmr6UAff5u+AAbQ2wJeHKe/MhvIiKUuawEWmw==
X-Received: by 2002:a05:620a:10b4:b0:783:4e8a:6b19 with SMTP id
 h20-20020a05620a10b400b007834e8a6b19mr7348059qkk.14.1705504340607;
        Wed, 17 Jan 2024 07:12:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a05620a24c700b007816cf21f7asm4519337qkn.76.2024.01.17.07.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 07:12:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] ASoC: codecs: wcd938x: skip printing deferred probe
 failuers
Date: Wed, 17 Jan 2024 16:12:07 +0100
Message-Id: <20240117151208.1219755-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117151208.1219755-1-krzysztof.kozlowski@linaro.org>
References: <20240117151208.1219755-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SAML5AYNA7RSVACPTIWRTZ356DLQLBBJ
X-Message-ID-Hash: SAML5AYNA7RSVACPTIWRTZ356DLQLBBJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SAML5AYNA7RSVACPTIWRTZ356DLQLBBJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Probe calls wcd938x_populate_dt_data() which already prints all the
error cases with dev_err_probe(), so skip the additional dev_err().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 0aaf494844aa..54a21d2f5c40 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3587,10 +3587,8 @@ static int wcd938x_probe(struct platform_device *pdev)
 	mutex_init(&wcd938x->micb_lock);
 
 	ret = wcd938x_populate_dt_data(wcd938x, dev);
-	if (ret) {
-		dev_err(dev, "%s: Fail to obtain platform data\n", __func__);
+	if (ret)
 		return ret;
-	}
 
 	ret = wcd938x_add_slave_components(wcd938x, dev, &match);
 	if (ret)
-- 
2.34.1

