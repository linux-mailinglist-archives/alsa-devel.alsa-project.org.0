Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B52A777643
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 12:50:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2499B84A;
	Thu, 10 Aug 2023 12:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2499B84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691664605;
	bh=dffqceKs75iUWUAgXZmLN8kdEHNrQvBCfQpDDFCxwTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m9iQAxdBXl9UQHK33PXM11fBtBvvY/OKFt22VPnugUsp51af6f7dhhv9KTiMCKzU3
	 74u/oYTm1vX3EIDgDHSYKqysMYquB61yxxKtX2mVMcOhR/wE36CFInOr4f7fTRirc+
	 q7gBsfKRbESWCOa6J0foCMlH3HnGHuK6Jg7UAves=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17520F80553; Thu, 10 Aug 2023 12:48:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51C4FF805BA;
	Thu, 10 Aug 2023 12:48:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2744F8057A; Thu, 10 Aug 2023 12:48:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFA31F8055C
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 12:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFA31F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UGqNEmNN
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fe11652b64so1132862e87.0
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Aug 2023 03:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691664481; x=1692269281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzMSq7HLSHN1HFLKAp83kiHFzC/dRhYUs++4UrDqaOA=;
        b=UGqNEmNN1GRZd/cQPQ8BSIM/P3HO1mpPaFsq5qWJJQp/cf2hqFCbXFb+QeRHXLlMKG
         7zasTTRuG7one9GfxqSB1uSZzw6Wy2owDcgscp2LVQ0ZEYKU/dIgcZ2X7SMvcCIuMvnP
         fT+UGY1nG6W+GX8JH8DDyNGJS0INeWEZe/xIc7W7rVuY1LUon1MxyAMsMXy/QaIJnAs5
         yOJES8JPBZNK0XFRdKrYta4LXxKYP8bpG35w5ltlkGbEGVbpp3kh+yoIZax3cM3SBv4E
         PjezXo8hgAwGpuJ1o+WPULiVfbGjx4KGX4Oer/736Jql6eOYkB/sibEnHmDbRKKrJh36
         Xrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691664481; x=1692269281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzMSq7HLSHN1HFLKAp83kiHFzC/dRhYUs++4UrDqaOA=;
        b=bKn+3u36+o2zP2x5Rnej7mINBndsWVjr2JcelUaItbyabxJtsjFrSesYRAA8SuiW/b
         KOsHlrNpBRgE9QbhV3pSYUpwKe0C42P5/so6VelAfSukrnWhyTajqraN+vqtVpthQ+LB
         sto/N+swAq0AFydEUJVuuEyWwQKtc7lmY3DkRblpF2k6zO4lZ39ZRwKc+bIIciFBCCWV
         vcfHNppH+gw09GjghlPOukp+usQYguol/inQlemHv4gz2nDSTsiVvh/q695kdPXa46Fp
         qvGmzf6UHDUjSnNPmcD+45uK94vKa0+UKUHpSuaz9CsHFAlBZT0RZbZeVwFXqgYXsnTr
         AuKw==
X-Gm-Message-State: AOJu0Yyn9x91mI69Mk8k+Q9a8weTr9Dy4th87F+PmnWUThrCXYEYuLEa
	jMaE2XaMkQj6DdtIrWVTzzfS2Q==
X-Google-Smtp-Source: 
 AGHT+IEP9ckwBL1/0mfPqosWIWOXy9uevpV0Iq3ArH10HdVvSOvTyx5j3EETKE0Mzgr1fyviNz4aeA==
X-Received: by 2002:a19:9159:0:b0:4fe:a2e:890c with SMTP id
 y25-20020a199159000000b004fe0a2e890cmr1439491lfj.49.1691664481535;
        Thu, 10 Aug 2023 03:48:01 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 x20-20020aa7cd94000000b0051dfa2e30b2sm653854edv.9.2023.08.10.03.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:48:01 -0700 (PDT)
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
Subject: [PATCH 4/4] ASoC: rockchip: fix Wvoid-pointer-to-enum-cast warning
Date: Thu, 10 Aug 2023 12:47:48 +0200
Message-Id: <20230810104749.164827-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
References: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3KOGAC4DHU4EPLP6BPAMUX7PZPBAXS3X
X-Message-ID-Hash: 3KOGAC4DHU4EPLP6BPAMUX7PZPBAXS3X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KOGAC4DHU4EPLP6BPAMUX7PZPBAXS3X/>
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

