Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2039177CE29
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 16:34:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E75FF84B;
	Tue, 15 Aug 2023 16:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E75FF84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692110048;
	bh=dffqceKs75iUWUAgXZmLN8kdEHNrQvBCfQpDDFCxwTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BX9YnSk879SKcA5H8I720bCbI5sxoW2LjdcgU0YdiCl3hwfYjpQTIkv5E8baKZx8D
	 Njxvr2SfSKg34+MjR8sloDWp/yftjIxS6TwlzLWDQ4Z6JijwkVmxyt3RZ0YzBzeHcp
	 pYBb/c/MxLZgeIpuiNhygo9vhu10SGYMDH/v/L54=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B9C3F8056F; Tue, 15 Aug 2023 16:32:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23BE9F80570;
	Tue, 15 Aug 2023 16:32:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73199F8016D; Tue, 15 Aug 2023 16:32:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA7D0F8016A
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 16:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA7D0F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=L1iV0sMz
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-319559fd67dso4078881f8f.3
        for <alsa-devel@alsa-project.org>;
 Tue, 15 Aug 2023 07:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692109935; x=1692714735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzMSq7HLSHN1HFLKAp83kiHFzC/dRhYUs++4UrDqaOA=;
        b=L1iV0sMzPMso3PSr1XH+y5/B8gyuV5pYEWqlU8NARJdqLI4hZ3F6s321hi7/VG8oLE
         phF5PpbnKhgxxQhD3n7lKAk/avrkQIoh6ll4b0iLamniMrti4GKXu1vdJsELmnaHYnmy
         dXW9fqkfSZo2Oc4ZLpAhuO/5waWLbDsOiufUm5OjYPAP2tQG98GYDqdKTERblKPMEH0F
         K+aDkrfeKeuhJAlzYWKgLsBOO9SDk0kp07/kNYdsC8nGGGUqwun4YursEJrylhuJxp0/
         n+Ka3lwGrr4oaw4/KSAIokrbKf8wPNLPfVHq2FCcb72KkDxaRhRl5by6WCpyi0ILqMwc
         OgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692109935; x=1692714735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzMSq7HLSHN1HFLKAp83kiHFzC/dRhYUs++4UrDqaOA=;
        b=PVDtNj+a61js8+KJ3U8pcUMMSq5z0CXYX9FpMiI5ZT5lqOhTKtBmGro2BhlRLxMTuw
         XtOznC+5WqpjlO+1U2SMm6aKOS9JaBPMXnAy/nX497j6ar7vKIGjQAFEHVhl++irY4Yh
         i/d3sHpeM+42BhbLa45iJ0w5Om+lAwHyXmlihYDZqsEbD7CztDVksy7cV9ERLZjENH99
         D3kNAy3JzSR6wmH3KP4nxROywskzsQtWMH9xFC68ZA3DcbYdZmnaOdXpGNyTqFbuFKU/
         Sjw3S9bfS31rAKSLS9vFLFX19TtwQMiC+i6fNWQmYYdCEyi7UQiaf6jiqNKemy0RJmdx
         41HQ==
X-Gm-Message-State: AOJu0YyDDhj2zcS3Fo4SGGMP0GWgOdKJ2L2Ni2CtW+ccaPwH7qVYMjKd
	c69Lnct6UNBPlwx7trIa3DqsAQ==
X-Google-Smtp-Source: 
 AGHT+IH7QnBMIW+PVYhiQDxK0D6EQk2b+8pkoH7NcQ2NFAHzAWryQ2DVu/uXHuscNAunX53Tk+bXPw==
X-Received: by 2002:a05:6000:42:b0:317:e3a0:92c6 with SMTP id
 k2-20020a056000004200b00317e3a092c6mr9135862wrx.18.1692109934723;
        Tue, 15 Aug 2023 07:32:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id
 l11-20020a05600012cb00b003177f57e79esm5851481wrx.88.2023.08.15.07.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 07:32:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND 3/3] ASoC: rockchip: Fix Wvoid-pointer-to-enum-cast
 warning
Date: Tue, 15 Aug 2023 16:32:04 +0200
Message-Id: <20230815143204.379708-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815143204.379708-1-krzysztof.kozlowski@linaro.org>
References: <20230815143204.379708-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CH2W6NABZ6J24EQR2B3WRQHBIPN4HV4E
X-Message-ID-Hash: CH2W6NABZ6J24EQR2B3WRQHBIPN4HV4E
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CH2W6NABZ6J24EQR2B3WRQHBIPN4HV4E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

'version' is an enum, thus cast of pointer on 64-bit compile test with
W=1 causes:

  rockchip_pdm.c:587:18: error: cast to smaller integer type 'enum rk_pdm_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/rockchip/rockchip_pdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 52f9aae60be8..678989b25e57 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -584,7 +584,7 @@ static int rockchip_pdm_probe(struct platform_device *pdev)
 
 	match = of_match_device(rockchip_pdm_match, &pdev->dev);
 	if (match)
-		pdm->version = (enum rk_pdm_version)match->data;
+		pdm->version = (uintptr_t)match->data;
 
 	if (pdm->version == RK_PDM_RK3308) {
 		pdm->reset = devm_reset_control_get(&pdev->dev, "pdm-m");
-- 
2.34.1

