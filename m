Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC33B777644
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 12:50:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2151F852;
	Thu, 10 Aug 2023 12:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2151F852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691664618;
	bh=dffqceKs75iUWUAgXZmLN8kdEHNrQvBCfQpDDFCxwTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aXl2JBSNSlbDmvtpO2oS6CRqX5Y4cxVIbzAOAklWw4yECdNOOMvJg6gP9Pt8y0mIv
	 TR0l9iEBwbY9rp9DpejgZu61lko3cGspu5qMXiiBe2Pft9VQdsMpvrgh76RcFi1/xH
	 2nyk8VCUBiXRRoCDupylYp4QwJrl9PkhtNFe8HRA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1FF3F805BA; Thu, 10 Aug 2023 12:48:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5015CF805BF;
	Thu, 10 Aug 2023 12:48:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3034F80579; Thu, 10 Aug 2023 12:48:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AF28F80578
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 12:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AF28F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ClILBq+M
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-523ba00a62aso7075a12.2
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Aug 2023 03:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691664483; x=1692269283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzMSq7HLSHN1HFLKAp83kiHFzC/dRhYUs++4UrDqaOA=;
        b=ClILBq+MRAloWpJfwnTeCf1bHZEDnZelIoj+A/axjmW1s+j+dR7FOxDjEF9I8PXXMG
         Tc/C6Gx1scvwjkKx98djoORst6Cl/ycaIodat9D0KfilMBRvN/MaESoqI9Ak9Z8YOvq8
         Drt7RbTwvMya7Xn2ck8jDeLdI/Z7sUH7nVGyIWw72YyEu8FIwQyDUF2+604OgUg5Qlo8
         KTzw8odQYPl7LwA7/7fNEKKen26+y7OwDK4lXPT/WxmIVFxgAll4Bs74be7u4YK0EZSR
         uDWOkSy5IvuHT6ViBxshwTxcHfylLOROqvd7FmX+lup7xXId0mPOyWI9lt1jUGL3LnMp
         YXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691664483; x=1692269283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzMSq7HLSHN1HFLKAp83kiHFzC/dRhYUs++4UrDqaOA=;
        b=CKi5tykSOtgv8s1PThtiE9nJ+c54Xq1q9rz/IAS+EfMjXAc/lsZ9+9rT74IxjbAq5E
         1CsSXZuNVQeNciHGAjyQG0ma+OcQ1puUm/f7ZbHclSIfRYXmgOdDW2AabfoAuDlAMwyS
         GTZmK3481uNQ+DlaG5Kdev3LfXtUR3bqR/pmJfuwuV6pPIIJsv0LEKADY7nnQqsepGez
         Ui1BhSsDASAQOewMfuyAdjXINNcHavlnuIC/if0lTQbIPraQ5Jsv7/x+8vHlyBHJK7xI
         sWACGroxN6BRaEHXp1ayYbLFzokrYa55wFZtxpigOTrI9BLmjSC3EMnXSGWVkkuGuqk9
         GcuQ==
X-Gm-Message-State: AOJu0Yx8mIdoyQniW3/nK+DDP3ZW4hbwBC5WSjul80UD0D2GvF4AQWi+
	NE58plFw2Cz3bac7nvZ5hN9eAg==
X-Google-Smtp-Source: 
 AGHT+IEm4GcDsfGX7LdWBqE4b5IJZoo0ChzDs3csIlSh1GyolAoj+48i33/6cKTWLD7egpAVJdszfA==
X-Received: by 2002:a50:fa84:0:b0:51e:2305:931 with SMTP id
 w4-20020a50fa84000000b0051e23050931mr1511310edr.22.1691664483233;
        Thu, 10 Aug 2023 03:48:03 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 x20-20020aa7cd94000000b0051dfa2e30b2sm653854edv.9.2023.08.10.03.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:48:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	llvm@lists.linux.dev
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] ASoC: rockchip: Fix Wvoid-pointer-to-enum-cast warning
Date: Thu, 10 Aug 2023 12:47:49 +0200
Message-Id: <20230810104749.164827-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
References: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UGJDLFJDU655VC6YLHKCRLC62XXX44CT
X-Message-ID-Hash: UGJDLFJDU655VC6YLHKCRLC62XXX44CT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UGJDLFJDU655VC6YLHKCRLC62XXX44CT/>
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

