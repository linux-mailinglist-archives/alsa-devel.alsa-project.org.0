Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D00F48B38BD
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 15:42:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08874162E;
	Fri, 26 Apr 2024 15:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08874162E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714138967;
	bh=PUHy0Ja0SSf7b3oUZ8tvjV0ut6Sih45TvCcp2ik+qp8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=C9mSQuQ3O//QaYvhJ6U4uUH6iqKvEiYNxYQESlTxU1YlH6VcN/5kNZh1JY0+EEiEb
	 aRx6vAi8SpGMkiBIjSzEBfupVlhIUPFA0JjvLpw6Sk5+mYTwNJrFZvAoo5v4VJUd0v
	 v+lVlKLYdo+n2tyQ2yq2bUWnCfY48iatKEQnZz5g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96EB9F8057B; Fri, 26 Apr 2024 15:42:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C09FF8059F;
	Fri, 26 Apr 2024 15:42:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33F21F80423; Fri, 26 Apr 2024 15:42:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 225A9F8003C
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 15:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 225A9F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=g+/WU9ka
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51abf1a9332so2944940e87.3
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Apr 2024 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714138920;
 x=1714743720; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZoPAqs/FsSRU0VmqAIyUDeL5k+oeAlm1vs0Pwv/KPc=;
        b=g+/WU9kaEV3SRuIqfI6/lObl1bUWytEQUyZCUHC7mxtrABeZQu2/2FztKGY7C43f4B
         CK5AVBWrvzPcA5p+mAGKtEQem+mqKbCGhHH9OaZ2z0kFkmZeSlYKr+J42zvUahjHp5k+
         wB9IsCv77CsyhOe2ICmTvBdOhhzEYwd1zSD6uqMrjD2OJzqkVLy+xQzZociSiJVWM+t0
         uW1fkhwIBiCeTfglW1f1e2VC5omHjy+aBkneiOfgn7ssMNpLKaN0kINhCyFCuqg3hPRn
         4bqg6o54DMfVsdbo//lbc2W9joJCYdfGUiI5eATRJVDsjF8mn4jkvQ5wmNExkPSPYvmt
         6zEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714138920; x=1714743720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZoPAqs/FsSRU0VmqAIyUDeL5k+oeAlm1vs0Pwv/KPc=;
        b=kCdqi9Zem3UTm4dMh4WOybCg5vTRUmcuBMSKoIxiTgzdiSSv0y4jF40B8nykqoVD0k
         dVZtwFOWE9ZBsm3fZqjWMka9kQk+HIDMD7pZlskEbP+lEINEWACQjL5Z5wRGHrxHc6J4
         /5tZ5UAiPAKrwbvbprebg+t3H9jqqP+RFeiXWZkDjURk1ARXs8XonKu0vDl5CPtQyVfs
         ihrF6FGNzMngvDlbaRa4HuvxHpSqKX0hRDwGhSUS2c/YPHw2pvcS7trAp/B5i7EJI1N3
         ICaqoaChJr55XujEcC0jyEf2d3vHq/AebW6hENp+JOD3E7JpmXHtzNqKBgXTtFJMa7aY
         pfiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBsRPqpXRd/dBugrbJFu6fWZZa61605mL06btnBM6KoyGaMEdJ9mSa8D91cwyPxUAvCmzJUbzR+z5sN3w+6xsqyTR9XNEZd3OIXrs=
X-Gm-Message-State: AOJu0YxpO5HPg98yu662+f85UarP0L6Lf0JEdvfnciyw1xHxfviUHTvy
	yDY0Bc21ZLWmr3dYuW0elTMD3o8I6ufi5Axc/pps8V+EMbDhggpjPZKb3Ojswsc=
X-Google-Smtp-Source: 
 AGHT+IGPLKZcerp3MvuJR5uN1npoHSmtLy+7WTMWioCuEvXXFNm30DQl5IWvmOoTb1lmO9LmLUtnzw==
X-Received: by 2002:a05:6512:3609:b0:51b:7c36:da61 with SMTP id
 f9-20020a056512360900b0051b7c36da61mr1513968lfs.56.1714138919541;
        Fri, 26 Apr 2024 06:41:59 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
        by smtp.googlemail.com with ESMTPSA id
 jg1-20020a05600ca00100b0041b25a70a85sm7558852wmb.30.2024.04.26.06.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 06:41:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] ASoC: meson: cards: select SND_DYNAMIC_MINORS
Date: Fri, 26 Apr 2024 15:41:47 +0200
Message-ID: <20240426134150.3053741-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WUXFMWBP2YYAA6CE54FL7NZHTRQECDWF
X-Message-ID-Hash: WUXFMWBP2YYAA6CE54FL7NZHTRQECDWF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WUXFMWBP2YYAA6CE54FL7NZHTRQECDWF/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Amlogic sound cards do create a lot of pcm interfaces, possibly more than
8. Some pcm interfaces are internal (like DPCM backends and c2c) and not
exposed to userspace.

Those interfaces still increase the number passed to snd_find_free_minor(),
which eventually exceeds 8 causing -EBUSY error on card registration if
CONFIG_SND_DYNAMIC_MINORS=n and the interface is exposed to userspace.

select CONFIG_SND_DYNAMIC_MINORS for Amlogic cards to avoid the problem.

Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

NOTE: This problem was found while toying with a minimal configuration
which disabled CONFIG_SND_DYNAMIC_MINORS and DT overlays. Overlays
prepend nodes instead of doing append. This changes the order in which
the links are parsed by the card driver, which in turn changes the pcm
numbers. The userpace pcm number then got over 8 triggering the problem.

 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index b93ea33739f2..6458d5dc4902 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -99,6 +99,7 @@ config SND_MESON_AXG_PDM
 
 config SND_MESON_CARD_UTILS
 	tristate
+	select SND_DYNAMIC_MINORS
 
 config SND_MESON_CODEC_GLUE
 	tristate
-- 
2.43.0

