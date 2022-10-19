Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 667E6603A77
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 09:17:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C197AB8B;
	Wed, 19 Oct 2022 09:17:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C197AB8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666163877;
	bh=6VPPAEhH7l54w7zVgAs4jVxcAI2UhyUZrqo7sDrimlo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uyFkS63PmVQkXGCwI83KorTbtnvSfWf7tLjPkzKptkGn0ivxZl8Dr0pb50SqmHhQ1
	 QuB+dcWeYSnIiHlYH/i3b2itS41f+QHg0R5o77X0tyxoe+7fasLnRKiq0NnMN/VyLE
	 tZW+E/aCFzfQSFGAio56GSqxIkrq1ylEkFwGiFW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C263FF80535;
	Wed, 19 Oct 2022 09:16:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 048ECF80528; Wed, 19 Oct 2022 09:16:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99708F80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 09:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99708F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lMLFv7po"
Received: by mail-wr1-x42e.google.com with SMTP id f11so27558353wrm.6
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 00:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ysf/zEngfFxJwaRTUXhnPtM52VvGSDLZl+NVWHEroaU=;
 b=lMLFv7po/8jJjZkjh9Z/E+yB141KW96EzmZi0xvJZ1wxGQiR6wWIMGW97TkhtZhQ9B
 olMRJ3EQfFlFXESbGyn1tNtBDNjB5rCLqJr5RYl6ZcqF+b2pTY0S1OJN/xNq2Jwrnqq7
 hr567rZY8Juc+5gu47BTxDlm84OtFzRk949KgqgPW3FOxnP5iP0q5vArf5iElxdz6Fxr
 kwMthtKK5sM9gdgL+TMO53Bi/3BKnNujPWvR8gIBHrNrxittCWKo0XQmWrSh64Qwql+h
 9KLGGnIRkRkyHtD6ps9s5O9V7PpeXTxIVLDk3a9qwong8qg82p+Ao0RUHchD9oYRVG7E
 PzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ysf/zEngfFxJwaRTUXhnPtM52VvGSDLZl+NVWHEroaU=;
 b=E3fb0Sj2hedMDoKiGmLQNh8axFLXwIog3KuZZ7syOdIkukll0VnYN5cxvwz5QTRDTM
 okOra8o5MHxA9vDxsnvhGyKtXGRm0qK6ED28vE59AM3yLZ7S/RbiqVeRrQcTjIZfBYOd
 6j43Nt9nj/4tg52xWjoE/8EEO6bTmv8zRidst4eusRadLuF4edMiq+ztJaHBXjmSYB+r
 QL2XdNof7kx5bCM2yBLwkbIJI+MRpuho4wJbtzFMdCTXUZfanImJM4fmo9ly8JKd28lF
 UO4bgVV/9XGnTGRyTWFTkMMjVMYGaXhJUvjM9UPufh7m3gptlPENlozcRXTyZ0wM9A9C
 9Vpw==
X-Gm-Message-State: ACrzQf30bSPNphf0jZCJga69NtWfhOOwK9Q47/0HNjDVv4UBa9YQw1S0
 GSjTd8o3/CmPeQs0CAvS7lw=
X-Google-Smtp-Source: AMsMyM4dwKmwe6ioEkSvwbefw+MiX9Z/Zh0ET0C4siBkA0rEKYqyfI+Vpyf0oRbeSYZdm/13uNUjBw==
X-Received: by 2002:a05:6000:154e:b0:230:45ad:fb87 with SMTP id
 14-20020a056000154e00b0023045adfb87mr4246989wry.270.1666163800825; 
 Wed, 19 Oct 2022 00:16:40 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c2ccc00b003c6f27d275dsm12285088wmc.33.2022.10.19.00.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 00:16:40 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-mips@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH][next][V2] ASoC: codecs: jz4725b: Fix spelling mistake "Sourc"
 -> "Source", "Routee" -> "Route"
Date: Wed, 19 Oct 2022 08:16:39 +0100
Message-Id: <20221019071639.1003730-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There are two spelling mistakes in codec routing description. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
V2: Fix "Routee" -> "Route" too
---
 sound/soc/codecs/jz4725b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 685ba1d3a644..64b14b1c74b9 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -359,7 +359,7 @@ static const struct snd_soc_dapm_route jz4725b_codec_dapm_routes[] = {
 
 	{"Mixer to ADC", NULL, "Mixer"},
 	{"ADC Source Capture Route", "Mixer", "Mixer to ADC"},
-	{"ADC Sourc Capture Routee", "Line In", "Line In"},
+	{"ADC Source Capture Route", "Line In", "Line In"},
 	{"ADC Source Capture Route", "Mic 1", "Mic 1"},
 	{"ADC Source Capture Route", "Mic 2", "Mic 2"},
 	{"ADC", NULL, "ADC Source Capture Route"},
-- 
2.37.3

