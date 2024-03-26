Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C288B67B
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 02:03:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A445A2369;
	Tue, 26 Mar 2024 02:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A445A2369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711415032;
	bh=Yci2u2Nqawj66kr/KUuXF0uP69vmsVBHA/4TkrHnOOc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qED6XAkuGeVinPKsg26QyksHDHGecw0VaBbyuG8+MJXJOsjJ3jwJR5upAuoNkT9jh
	 vSJwDFoC5H9lpuJfELsAACnGAFCQcDXCZtpOycco9DB1Y+2CxL3T6WAJ8MueLLHi+/
	 ycr9zXUtZdoglAfZGZF+q/JGHSkURFsoiD1lzur8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE204F80587; Tue, 26 Mar 2024 02:03:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A38E0F80578;
	Tue, 26 Mar 2024 02:03:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7C61F8025F; Tue, 26 Mar 2024 02:03:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD903F80093
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 02:02:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD903F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SoyR1vjf
Received: by mail-oi1-x241.google.com with SMTP id
 5614622812f47-3c1e992f060so2085653b6e.0
        for <alsa-devel@alsa-project.org>;
 Mon, 25 Mar 2024 18:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711414962; x=1712019762;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LKf2jwKRUBghsb1hb9noFEqyR7Wc63fp95/WXgHPqo=;
        b=SoyR1vjfocBZGvVES7sGm7YxIu2pN26kxqGXyNFCme0f/zdQlte3AXou+e4kifRrGD
         W7qJYS+hqtwZcg5aXbJpZi4pL+g3b9MFKFFw/hokX66ooNQcsUnswyym2Dxro6yF7q8V
         6QNskK7kYPYt2OQG15j19kJuqqaNYdB+XU0h4e7kxfH6DvFGGKP7d5xnpkjobfuvAze9
         hILJj0USLNtHuxllwHR2rtFyiC+qdxZNjfFquP0glmBLDDDDaTtFFBJlEQ+x0w2wwr+U
         SUIu3Yln7T8ZpqMriF1tjB6YPPwRbho+2hi88m9Kw/6Rpw6n1+yrdsv+SefzLZzMVrU0
         ax5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711414962; x=1712019762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LKf2jwKRUBghsb1hb9noFEqyR7Wc63fp95/WXgHPqo=;
        b=L+jpbwm+R2c/SUBrXhgTPyvEL5UaIGrN4mQ+50c2gRTyg4c77SNoWurWe9ObkadwXf
         B41oUEFNsZ1G0phsHVpRs23YoSAJfdBQz7sPPc9FT9Mlca9yoq0UsLa6HhBQpnb+IvwR
         ODUVd47MXIcjwSBfYYqkhE5SWArADgfVt+OGFX3Qh+Bt5r88LCXjSXobF44nnlx7SKOj
         vpaKlOBnx7mF2k7Jgovu3lGrHPjEJPug+RNq7xOxbsB9NudYMvkGNzyKKTTEdLXcc1HX
         3rP6ctEGmEvoX1AvTqw79/enmM99/R6iO27pvqL042qvvSLs8/qs6JRN6drlw3I8p3vn
         u9lQ==
X-Gm-Message-State: AOJu0YyN9GPZw09Y5C3HGXEyNFQ3z4I3WZRLF2ZMFJaj6Mk+LrQpHQXZ
	rufgW6fJbJr/knwp0tYL2xdxnkjEFj/ZCIYIcIqGQIw8U/62tsAg
X-Google-Smtp-Source: 
 AGHT+IHgnz7INBk3M0+aautZT3lb/GWvYXaiIL5Ynv4roLiKyMREkBYvBKQKsQBqPvMl2x17AEXJ3w==
X-Received: by 2002:a05:6358:3996:b0:17c:1da1:aa8f with SMTP id
 b22-20020a056358399600b0017c1da1aa8fmr9438563rwe.24.1711414962405;
        Mon, 25 Mar 2024 18:02:42 -0700 (PDT)
Received: from C02ZT45ZLVDL.corp.robot.car
 (c-98-42-213-84.hsd1.ca.comcast.net. [98.42.213.84])
        by smtp.gmail.com with ESMTPSA id
 b21-20020a631b15000000b005dc8c301b9dsm6647878pgb.2.2024.03.25.18.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 18:02:42 -0700 (PDT)
From: Stephen Lee <slee08177@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	roman.gushchin@linux.dev,
	dennis@kernel.org,
	Stephen Lee <slee08177@gmail.com>
Subject: [PATCH] ASoC: ops: Fix wraparound for mask in snd_soc_get_volsw
Date: Mon, 25 Mar 2024 18:01:31 -0700
Message-Id: <20240326010131.6211-1-slee08177@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5OWPVEMII3QUL2L2OJ62DV5YX3PXWUJ7
X-Message-ID-Hash: 5OWPVEMII3QUL2L2OJ62DV5YX3PXWUJ7
X-MailFrom: slee08177@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5OWPVEMII3QUL2L2OJ62DV5YX3PXWUJ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In snd_soc_info_volsw(), mask is generated by figuring out the index of
the most significant bit set in max and converting the index to a
bitmask through bit shift 1. Unintended wraparound occurs when max is an
integer value with msb bit set. Since the bit shift value 1 is treated
as an integer type, the left shift operation will wraparound and set
mask to 0 instead of all 1's. In order to fix this, we type cast 1 as
`1ULL` to prevent the wraparound.

Fixes: 7077148fb50a ("ASoC: core: Split ops out of soc-core.c")
Signed-off-by: Stephen Lee <slee08177@gmail.com>
---

This seems to show up in quite a few places in the alsa subsystem,
should they be addressed altogether?

---
 sound/soc/soc-ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 2d25748ca706..b27e89ff6a16 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -263,7 +263,7 @@ int snd_soc_get_volsw(struct snd_kcontrol *kcontrol,
 	int max = mc->max;
 	int min = mc->min;
 	int sign_bit = mc->sign_bit;
-	unsigned int mask = (1 << fls(max)) - 1;
+	unsigned int mask = (1ULL << fls(max)) - 1;
 	unsigned int invert = mc->invert;
 	int val;
 	int ret;
-- 
2.43.2

