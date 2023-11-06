Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B88F17E1EB3
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Nov 2023 11:43:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE3EF827;
	Mon,  6 Nov 2023 11:42:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE3EF827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699267380;
	bh=z8El7XnzsiVMEZRG8J2wsXjW2H7YOphx7Ff0K6YK5JA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KRwicma1GaISbl49mEnGF0gMnhXRJgVRvc3uY5i9prS1DRA3TBI8l6DKaS08cKS24
	 r9+RFeXFLpgiUP0jYT4pezsH27S+uLzOZWB1Pq0QItZ8uVrrQp0pfa5AJNxmzK/xkG
	 K8Bm9UjBO2T9NWq9IvbHNpjGhfBaEdFOYnG8/v/o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6208FF8056F; Mon,  6 Nov 2023 11:41:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 853EDF80169;
	Mon,  6 Nov 2023 11:41:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F476F8016D; Mon,  6 Nov 2023 11:37:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FFAAF80100
	for <alsa-devel@alsa-project.org>; Mon,  6 Nov 2023 11:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FFAAF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=m9V320iL
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32fb1d757f7so2244491f8f.0
        for <alsa-devel@alsa-project.org>;
 Mon, 06 Nov 2023 02:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699267048;
 x=1699871848; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9kyxum5YNhiGFDrnxvukFQjBtUh2qLRYWx5QnJK2YXc=;
        b=m9V320iLIVt7sI5Tc7qQPJTPfv2r4gVF7y0aEOXgXHD0kiVsVYKMyeCXmDsk0V2hUy
         QdApE9onhUFDm+wZgvZhSM8JKRjB/dt1G+t71cK8PsL/RriOpfoccDkf40/LsMsPOXK5
         hjbnoarK0bDH0v9+p4KEs7sE+/vQsTJnWoMaJOly8PUSXId9jHHugoEsttB66qAtu+yh
         OyMvR0cfYdVPwhR8QA0mj18UBB07FKJQ3Ka73H7TuL/IgLYdR8zQ10l7kH8pTOKp5b9h
         teYQcSMY9XvpF0vQFJufZ4iArscTZAjkKdzQscbTJS8Nd/c82TdXAlTqxCq5z0kjSFOW
         dVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699267048; x=1699871848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kyxum5YNhiGFDrnxvukFQjBtUh2qLRYWx5QnJK2YXc=;
        b=qBAtbjrygJWxw75AIC3yBjAadODYmi0POIdqELgqC1eudUYm1DtzMbMC1xBBraAgpx
         pHOhIOZY2Exww95wuzY695xQWHaTUs4nQW9/Leu/5sTd/4KijkgTUNCerEBEkOsSylL8
         ZyeeKDrZPJEuRp5C90zdOElMHUkY9r1TyNsqWRq0tqqnT00ZLRMNYYFNX3IjUHb7bpAT
         YJzrMTB4INmpPMbgp+K56H3LSqNjnlppBcSHXRVhuOq0az9sOsCQko08ekixn3Gcg31x
         zIvTlmbFpXGQqfXYQGPE41zygsbNtG+MV5NJPO8uAAZabyK1w0f8fKOIcywQcUdrdjXw
         8eTg==
X-Gm-Message-State: AOJu0YxNf4qq8KjH6o9xqH4g8DBLGHWsVwsXsEFi4Khr8kgd4Q3HSoEJ
	QtEAk37BHkvxdKmONyhTsJuExw==
X-Google-Smtp-Source: 
 AGHT+IHdcanmjp6niY0sMoZF7bwPXZ4XAjqJnCGHA2okTmCF7vPefs2OEigl43Ieu5XrrkMeoA4vXg==
X-Received: by 2002:adf:eb0a:0:b0:32d:884b:7403 with SMTP id
 s10-20020adfeb0a000000b0032d884b7403mr20244809wrn.66.1699267047784;
        Mon, 06 Nov 2023 02:37:27 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fabf:ec8c:b644:5d3])
        by smtp.googlemail.com with ESMTPSA id
 h3-20020a5d5043000000b0032dba85ea1bsm9106950wrt.75.2023.11.06.02.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 02:37:27 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dapm: fix clock get name
Date: Mon,  6 Nov 2023 11:37:09 +0100
Message-ID: <20231106103712.703962-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LSNBGRKFWNUDYJBK2SF7NHDJN2QE3YGA
X-Message-ID-Hash: LSNBGRKFWNUDYJBK2SF7NHDJN2QE3YGA
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSNBGRKFWNUDYJBK2SF7NHDJN2QE3YGA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The name currently used to get the clock includes the dapm prefix.
It should use the name as provided to the widget, without the prefix.

Fixes: 3caac759681e ("ASoC: soc-dapm.c: fixup snd_soc_dapm_new_control_unlocked() error handling")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-dapm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 4e2beda6f9bf..3844f777c87b 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3670,7 +3670,7 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 		dapm_pinctrl_event(w, NULL, SND_SOC_DAPM_POST_PMD);
 		break;
 	case snd_soc_dapm_clock_supply:
-		w->clk = devm_clk_get(dapm->dev, w->name);
+		w->clk = devm_clk_get(dapm->dev, widget->name);
 		if (IS_ERR(w->clk)) {
 			ret = PTR_ERR(w->clk);
 			goto request_failed;
-- 
2.42.0

