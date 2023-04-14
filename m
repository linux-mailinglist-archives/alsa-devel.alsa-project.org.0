Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CC76E2FFD
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Apr 2023 11:12:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC83FA4C;
	Sat, 15 Apr 2023 11:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC83FA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681549938;
	bh=r3y+U3995t0uw4Qh+bshi8KZ43w075GnTe/mIOHQg6I=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=F//bRVob6/yqB4c4Os+mrvsWdeXd/hcnVvQjxd20GipkA2pRZyq5CnejnWMQzLKfC
	 5fTOaXgv8LLXabHaLU28ucMstwHIWhBulaaWd/lVUn3w9ewNqtUfZwkbsxV6J2V3Oz
	 41qGejkCJ9X1HhOkHZjahpqmPvYJb3G5kRy5CuCA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 489EEF8055B;
	Sat, 15 Apr 2023 11:09:33 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 6/9] ASoC: ssm2602: Add support for CLKDIV2
Date: Fri, 14 Apr 2023 16:02:00 +0200
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:08:57 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O25IGMQLW3ZVOYFGFCD33AV7NAKPTYFW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168154977254.26.16999760858506591055@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB4FFF8032B; Fri, 14 Apr 2023 16:03:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5260BF80149
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 16:02:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5260BF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=OXpk08I1
Received: by mail-lj1-x22d.google.com with SMTP id bx15so17066512ljb.7
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1681480970; x=1684072970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/pTs4z9rhsBzBw4ml9qs5JBHN4WLKpluPzA9XU/6Jk=;
        b=OXpk08I1AC9etobtye7i60c27lC4lj7/SZW9B5ttLpNUFKqf0S6rQ6xjLnu0O6h2DD
         rSG1RCCO6BeNy6NOLso/6J68yWcbnJ4MCO0bFEEK07LPLj66vlhIql0CIAKOAdAb9GMf
         /mNuvuM+bh5rghs6+bfmEU/hQmU6MFLUkIopX7dNWDZ6k3DniD+TkQlzdYDFlPRKdMRM
         VVi4SQyrVEx3XqVLJdWk9o2XfkRdnTfEoxMRjBRchUg5BfUo55RQiZHWx9feBm8xe4C1
         rbpklvVxxNTe6IeiPG1crcrDS90TCgdjp2ZjVW3NeU8bR+s7SwN0MdYEJuGEgYZNRO7B
         LujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681480970; x=1684072970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/pTs4z9rhsBzBw4ml9qs5JBHN4WLKpluPzA9XU/6Jk=;
        b=IBO9Y22n5yfofYS3u+rvJ2mkfi20Q2AEQ3X4Hd+U/l2hKJbA4wZpPbkrylkmkSmPlN
         9HlRG9Q/dauGPHERt21/pa6sdNHdEBULlfUgBD26v8rz6TBqhQLxmJzBlhLzCde9XHB+
         eGShzkCvruPwd1+7SwuWhpGrYZgjmDkpVCrA3CauYsJ3EbScPq2pe93IOoNWEpohuzPJ
         FTrw6LzsLZyvMjaXAnf9vgthqEqQDcL493WRHVKtiay0aGS6/GdihG1t3nP/qtH6nXnw
         mH4ub/GaWfspT+NbExxizI4sQytiRkSe3/ScxcXG8L5iCldq5Z1DYQBYvaWGLKci6bNs
         gdiQ==
X-Gm-Message-State: AAQBX9eLseojoXRR9hxMRx1jl4/pkXiInVaeHDHuR/sGWKctm22GpV1x
	qJkOVdZy4QyaMgL/uhv6YWs89TEr3uLYXAhTQsfx9A==
X-Google-Smtp-Source: 
 AKy350a2jetYlrjNvabc9jILg3C4DgASyuZ+RZVm6baefXeSjrRJTfnzHFRX467sNw55w+dKiuBNqg==
X-Received: by 2002:a2e:978a:0:b0:2a8:ad32:3d59 with SMTP id
 y10-20020a2e978a000000b002a8ad323d59mr770788lji.9.1681480970216;
        Fri, 14 Apr 2023 07:02:50 -0700 (PDT)
Received: from panikiel.roam.corp.google.com
 (staticline-31-182-201-26.toya.net.pl. [31.182.201.26])
        by smtp.gmail.com with ESMTPSA id
 15-20020a2eb2cf000000b002a76e2dedbcsm828684ljz.139.2023.04.14.07.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:02:49 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 6/9] ASoC: ssm2602: Add support for CLKDIV2
Date: Fri, 14 Apr 2023 16:02:00 +0200
Message-ID: <20230414140203.707729-7-pan@semihalf.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: O25IGMQLW3ZVOYFGFCD33AV7NAKPTYFW
X-Message-ID-Hash: O25IGMQLW3ZVOYFGFCD33AV7NAKPTYFW
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:08:57 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O25IGMQLW3ZVOYFGFCD33AV7NAKPTYFW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SSM260x chips have an internal MCLK /2 divider (bit D7 in register
R8). Add logic that allows for more MCLK values using this divider.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 sound/soc/codecs/ssm2602.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/ssm2602.c b/sound/soc/codecs/ssm2602.c
index 021e0c860fa1..35c4743e756e 100644
--- a/sound/soc/codecs/ssm2602.c
+++ b/sound/soc/codecs/ssm2602.c
@@ -280,9 +280,12 @@ static inline int ssm2602_get_coeff(int mclk, int rate)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(ssm2602_coeff_table); i++) {
-		if (ssm2602_coeff_table[i].rate == rate &&
-			ssm2602_coeff_table[i].mclk == mclk)
-			return ssm2602_coeff_table[i].srate;
+		if (ssm2602_coeff_table[i].rate == rate) {
+			if (ssm2602_coeff_table[i].mclk == mclk)
+				return ssm2602_coeff_table[i].srate;
+			if (ssm2602_coeff_table[i].mclk == mclk / 2)
+				return ssm2602_coeff_table[i].srate | SRATE_CORECLK_DIV2;
+		}
 	}
 	return -EINVAL;
 }
@@ -365,18 +368,24 @@ static int ssm2602_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		switch (freq) {
 		case 12288000:
 		case 18432000:
+		case 24576000:
+		case 36864000:
 			ssm2602->sysclk_constraints = &ssm2602_constraints_12288000;
 			break;
 		case 11289600:
 		case 16934400:
+		case 22579200:
+		case 33868800:
 			ssm2602->sysclk_constraints = &ssm2602_constraints_11289600;
 			break;
 		case 12000000:
+		case 24000000:
 			ssm2602->sysclk_constraints = NULL;
 			break;
 		default:
 			return -EINVAL;
 		}
+
 		ssm2602->sysclk = freq;
 	} else {
 		unsigned int mask;
-- 
2.40.0.634.g4ca3ef3211-goog

