Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CE68B3BAC
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:34:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17855DF9;
	Fri, 26 Apr 2024 17:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17855DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145678;
	bh=twiWpSK9Cb/9sMit7KrauKpyDpxWaybLQZDeq8xxcKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pnQ9mn8iLInvfN7g1+V9jGg1BAiSQuOD+GEeEAaf8P0WnWYIiDqmSO3VZ+GmhpUHm
	 KuzkaS36lWmYoJ5F9WlfrxC53UvQ3SUZJt1RSzatVirugfjN5DE1LA9Aeuxz89jILX
	 f4av6P92C8wPJ+1csM72m+wi5SsbO3zlZkC0Y7f4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95FB1F806DA; Fri, 26 Apr 2024 17:30:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C244F806CF;
	Fri, 26 Apr 2024 17:30:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53390F8065A; Fri, 26 Apr 2024 17:30:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13BFBF805CB
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:29:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13BFBF805CB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=KFYaVpcH
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41ba1ba5591so4043495e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Apr 2024 08:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714145396;
 x=1714750196; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vj88fGfTuV4/ceY0CRDNjfucEqH3NJ0Iz+8z4tgOcCE=;
        b=KFYaVpcH85jFkilqqc8p78NFHIxEMz/wDvMiXWQf4Sek+nMfrbSQEUcJgv2uT/cqG9
         tNaqmBkmHMbdsLchmVuI82Fp7wDrfKcQlENuRo4Yab3SlpRv0Sc+taOici/VNr0quHPQ
         0oUPTEK3hrDcyRP8lgzvORQz/XvQKNfSv7feL75+O93/62y8UMM6rKwLsOlNuMiWr3qN
         qOAl3NWp2YYgp0bseeibyuf0n5bn/eh047niVZvrs0CXu65gkybzBuEZZnz0AYiqrG2K
         4H12WuMwj19Ercyuu4/ULT5334+QqDP6vIS79ELNCoq+iN+K+UVhtRwBGoKGwE6CLyqA
         Ogzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145396; x=1714750196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vj88fGfTuV4/ceY0CRDNjfucEqH3NJ0Iz+8z4tgOcCE=;
        b=Rtlc3lZlBidAXcITFa7PbDenSimLtnQWUMGZOCw4YJ9FQHkCZD9Xu4uLZOWsxOUTbt
         F41sHDnmbIGC0RoFHTVMOyz6Gb1x72g/q9cKkuLB72oBZCylnXR78airPhbD43lsrnxb
         Q/iMDEVBIhENYKVmh1jJM6QreLr9q6jLLghtaW/0eg/PA7jOsDhPqiEHp20GXli8A4u2
         Eeb94mSD0kVY/s4+rRarDuDU/3hpUqJLlK+1LJDMTEQS/CwHP8vJDFpiVwdypKb0eRhn
         djrRVZGVvec93Yo1Xt7rKs1GKhZP1nUkAP3gsPue+IG/UoIol/h19H9G5vRt894BO62Y
         /B/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrvovZZiTRQ975eUtbkBq24FjwUJM6YiM+kXsE2DKkp/qXCYqikSqneiilCWPV3uClc90Q7N9u7DFoi1bzPqncTN1Fk9CeTF/ZlrQ=
X-Gm-Message-State: AOJu0YxjTda/CSxVXBDRrTM6C7CP29MF14lcTOLvKnTD7dlp9dKqvOoZ
	RjHfAttH8piuYdwnSjU1a3NXjsnLp0vDq+/kMV9UvOCphWccxMni3b0EZGHuS3c=
X-Google-Smtp-Source: 
 AGHT+IEJkZy/zcyYjS/mRx4ZV80tXFjeoyE7of0nB7BlzZ+4FKV/1yBAljbeQBu73IdnjR2X5uGAvA==
X-Received: by 2002:a05:600c:b88:b0:418:f991:8ad4 with SMTP id
 fl8-20020a05600c0b8800b00418f9918ad4mr113607wmb.6.1714145396564;
        Fri, 26 Apr 2024 08:29:56 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
        by smtp.googlemail.com with ESMTPSA id
 i13-20020a05600c354d00b00419fba938d8sm22628687wmq.27.2024.04.26.08.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:29:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/4] ASoC: meson: axg-card: make links nonatomic
Date: Fri, 26 Apr 2024 17:29:39 +0200
Message-ID: <20240426152946.3078805-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426152946.3078805-1-jbrunet@baylibre.com>
References: <20240426152946.3078805-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3O4FQKU2LIZ3MCXPUAHUAADZ6UJ7AKDX
X-Message-ID-Hash: 3O4FQKU2LIZ3MCXPUAHUAADZ6UJ7AKDX
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3O4FQKU2LIZ3MCXPUAHUAADZ6UJ7AKDX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Non atomic operations need to be performed in the trigger callback
of the TDM interfaces. Those are BEs but what matters is the nonatomic
flag of the FE in the DPCM context. Just set nonatomic for everything so,
at least, what is done is clear.

Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 3180aa4d3a15..8c5605c1e34e 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -318,6 +318,7 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 
 	dai_link->cpus = cpu;
 	dai_link->num_cpus = 1;
+	dai_link->nonatomic = true;
 
 	ret = meson_card_parse_dai(card, np, dai_link->cpus);
 	if (ret)
-- 
2.43.0

