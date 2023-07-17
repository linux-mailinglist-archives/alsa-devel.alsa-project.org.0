Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B0757406
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 08:26:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CCF0DEC;
	Tue, 18 Jul 2023 08:25:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CCF0DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689661602;
	bh=ALZFslAyMiHAe7aSKmIDL9U+he3f8IsYYUzSDJ7YOlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aMMjlOoHUVU5eYCphaNyauDdhMlJJ8aRVoTfHE5PJeAI2zQjWeDjPYPePHY14tKqd
	 xMNC/OWWtAqHsYjSPecUEH9bwQ3gkifaNnslbImo7NBfffC9pMUR7ZVqaKlcikRpVU
	 bgNaZlNtx9vdG78O8+8ugwoyJEHDXOYzZ9csu6fg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E1DDF80153; Tue, 18 Jul 2023 08:25:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DFD7F80544;
	Tue, 18 Jul 2023 08:25:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D4B8F80494; Mon, 17 Jul 2023 21:38:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D32DF8032D
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 21:38:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D32DF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=jzR2pq1r
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fdbfda94c4so2157180e87.0
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jul 2023 12:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1689622701; x=1692214701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoBLkK2LHNAZNFLTLXxtcr6P67HJOzOANhsGn4ic+bU=;
        b=jzR2pq1rlEtnzLkc6fPM1RWXYa6wSHQD98evZn4wQLLmBFtxJA1ve0TcRf++jhvjjH
         pLJqnm4FVaQXgItzn2zhGlwyxNeEKYaoxJSZiy37jipmOFbNrWAk+b36NKNMbb1Aos/2
         UVaFCgaMfWADG3Oqinf3kIxty8HH6Cq3BoSIm7j9GbU0krP7vcp5xXuBDwWgQtQKQwGS
         D+RSGRggJQAhFknA9/uiyY1E6bi8li6BNkSEBtq2CkgwYEygGyzUBN479HOBGoxPVHgU
         hKo/BJ4KJNfDn6SnB1UzymekuU4XH+D1muOxl+0W5G83rjv+HxCqBVR10YwkPo+PO/ZG
         1hcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689622701; x=1692214701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoBLkK2LHNAZNFLTLXxtcr6P67HJOzOANhsGn4ic+bU=;
        b=fOG4Dqz3LU4ttKUmzEVnjoTInN6mXoMddO4zA2wQWcqwgJhhUHI2xIRwzknwS6PjQb
         r7bEuEXrZ09RiSiegiz5d7Fr52HZyg+YiyZurhhecc4aUZFEfI4kSoOyJ3ZxCfsGyX2Y
         Enyd2QO18wPNX11j7xpuM7vBF/8/q/v4zBPKA38P6wchpIGAK71tzlCmZtLxd59uApMf
         V9dIN9WlQgs2H8aYST81IvG5ewFTxZa2DKOZXXZ+XZ+hbDNbHVUiak7K5RByVJfobox7
         jn+q4qxkKXQKRGXwwYbJSbw1uuuk3obM8/w5RVQa0XoeiZy6bAm25SoR5j9FHUP5t0bH
         Bwcg==
X-Gm-Message-State: ABy/qLayxBGeNCWZBidQkedRQjjBAjsWryXOt0XaoAQ4DlHu7Sc+Iy6q
	2mt08vvKAExOvliWVaiMG86UWA==
X-Google-Smtp-Source: 
 APBJJlH/MKKctcUXF27xz60W++Q/7HDTxaCCnfDK9CXhGPZoNN9C6dKQ9myhU9W6KvzgKg9ZUKCgnQ==
X-Received: by 2002:a05:6512:3d03:b0:4fb:8f79:631 with SMTP id
 d3-20020a0565123d0300b004fb8f790631mr16932345lfv.46.1689622700837;
        Mon, 17 Jul 2023 12:38:20 -0700 (PDT)
Received: from dmaluka.office.semihalf.net ([83.142.187.84])
        by smtp.gmail.com with ESMTPSA id
 e5-20020ac25465000000b004fb75943ab3sm53124lfn.258.2023.07.17.12.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 12:38:20 -0700 (PDT)
From: Dmytro Maluka <dmy@semihalf.com>
To: Support Opensource <support.opensource@diasemi.com>,
	DLG Support Opensource <DLG-Support.Opensource@lm.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Dmytro Maluka <dmy@semihalf.com>
Subject: [PATCH 2/2] ASoC: da7219: Check for failure reading AAD IRQ events
Date: Mon, 17 Jul 2023 21:37:37 +0200
Message-ID: <20230717193737.161784-3-dmy@semihalf.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
In-Reply-To: <20230717193737.161784-1-dmy@semihalf.com>
References: <20230717193737.161784-1-dmy@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: dmy@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: W5AS26TZPQLKJVRLSUJSRJER7MP6ZQ6P
X-Message-ID-Hash: W5AS26TZPQLKJVRLSUJSRJER7MP6ZQ6P
X-Mailman-Approved-At: Tue, 18 Jul 2023 06:23:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W5AS26TZPQLKJVRLSUJSRJER7MP6ZQ6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When handling an AAD interrupt, if IRQ events read failed (for example,
due to i2c "Transfer while suspended" failure, i.e. when attempting to
read it while DA7219 is suspended, which may happen due to a spurious
AAD interrupt), the events array contains garbage uninitialized values.
So instead of trying to interprete those values and doing any actions
based on them (potentially resulting in misbehavior, e.g. reporting
bogus events), refuse to handle the interrupt.

Signed-off-by: Dmytro Maluka <dmy@semihalf.com>
---
 sound/soc/codecs/da7219-aad.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index 202715b7bbea..581b334a6631 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -361,11 +361,15 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	u8 events[DA7219_AAD_IRQ_REG_MAX];
 	u8 statusa;
-	int i, report = 0, mask = 0;
+	int i, ret, report = 0, mask = 0;
 
 	/* Read current IRQ events */
-	regmap_bulk_read(da7219->regmap, DA7219_ACCDET_IRQ_EVENT_A,
-			 events, DA7219_AAD_IRQ_REG_MAX);
+	ret = regmap_bulk_read(da7219->regmap, DA7219_ACCDET_IRQ_EVENT_A,
+			       events, DA7219_AAD_IRQ_REG_MAX);
+	if (ret) {
+		dev_warn_ratelimited(component->dev, "Failed to read IRQ events: %d\n", ret);
+		return IRQ_NONE;
+	}
 
 	if (!events[DA7219_AAD_IRQ_REG_A] && !events[DA7219_AAD_IRQ_REG_B])
 		return IRQ_NONE;
-- 
2.41.0.255.g8b1d071c50-goog

