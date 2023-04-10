Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6A76DCD9A
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 00:40:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0640E1033;
	Tue, 11 Apr 2023 00:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0640E1033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681166458;
	bh=5gUvVLDFgf47Y88ib4FD2TGQCEMYFnFnuUTa4o4oLwQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ilatD6gr2bwMOJ2BpHnuVOMdkBMjyyN3owSAxG+Xk6l8U8U7uDUxgKlMgW/YRQg+s
	 CjUE9YK5LRLahGlZmkQp0IBXXoYgOBoghp7mYsJ3G3Mu6DeVolQagoG5sW6pLyT2YZ
	 pvdcgL1A0pwyXSiAvou0tbBdGupLZwiWoKYn13TQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B24F9F8052D;
	Tue, 11 Apr 2023 00:39:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB11DF80524; Tue, 11 Apr 2023 00:39:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FE9CF8025E
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 00:39:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FE9CF8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qgUiirri
Received: by mail-wr1-x42c.google.com with SMTP id i27so5688542wrc.1
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Apr 2023 15:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681166346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2w9r/FCSQOhLas4fRq9UxlUyxuMVk8X58MVQxfpTJY=;
        b=qgUiirriVGu7ZTWcizKlhTrvCVkKMTVcuahYo/fWk86tr/5Mgb2EeTrIDJ0GjBvcCW
         JiQrRDBs2nv+Gp54bItYKqJOqXu4v5BssEQSHsFTu/NR2/l0TY4pKKWBf/6BWoNsMxO0
         Li7LYx6r9FzhoPFoXGvrqt+0IcJ6RqFGtcJX7L1ZDoy3fBYGyPgotTfJKh8WdMj5UWnI
         CwaEyVqz/CPyu0rFJ9FPZp6CnWr5hcLaPT/rlOYJyexpe9buQN+llXpnXzXBDWbrddWG
         +X1x/12gIpo8wsaM6riuoH9YxVkne2OwgpmQB/zOFdhe4uJINP+IJ135yPVjBypp93oK
         0A3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681166346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2w9r/FCSQOhLas4fRq9UxlUyxuMVk8X58MVQxfpTJY=;
        b=V52Ou+10xD1C4SWGP31hA+L9NTwtY6NRYCnznxzKyK3gdq4ZJcyafBolcspOjC/p4W
         ufEM4n7PCfBalMK6KcS+b/BGYssg6HfL9wSR9fk5bAXX8GlX5sKILcCks2ZAW/tOPZJZ
         9xZLSxPn7GzxjEsdeJFk9W74pPyfGN35l7qZ8luTBdG2Q9FxpDVUi73vszpbtSgF+jcM
         znZs6Fu1qYopzqAkXJAkgrHXbueaL7aRhl4FCCKG6MMFpI3PLf3ZP/gvUPGnAIos72w8
         twwEgnERq529VFpI3iEYft465xFKeuRAFRcs1C3Oo2PLr/yGErvUWmGB2lmUAnjvrtPm
         7wlQ==
X-Gm-Message-State: AAQBX9cBlWtAMGu6RxUbukeQiHjbj/+pnSBdEjgHYMIFDfntVtXepx/Q
	2b2Nrz1hMY8TdpGLGzf+J4jHoWgeS2qRZg==
X-Google-Smtp-Source: 
 AKy350YR9fr6IYcnFe1oSanOl6H+YPUhDRizE112VA61/3/A/9UbnKcTLtOq4N8oFX8K3PspiyZPBQ==
X-Received: by 2002:a5d:61c2:0:b0:2ee:c582:a67d with SMTP id
 q2-20020a5d61c2000000b002eec582a67dmr524431wrv.31.1681166346742;
        Mon, 10 Apr 2023 15:39:06 -0700 (PDT)
Received: from localhost ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with UTF8SMTPSA id
 m14-20020a5d6a0e000000b002f01cb41b0bsm5093614wru.60.2023.04.10.15.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 15:39:06 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: cs4271: flat regcache, trivial simplifications
Date: Tue, 11 Apr 2023 00:39:01 +0200
Message-Id: <20230410223902.2321834-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410223902.2321834-1-alexander.sverdlin@gmail.com>
References: <20230410223902.2321834-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NHILDX3DRZLDDMFHYJJQLFD7V5UZOKYB
X-Message-ID-Hash: NHILDX3DRZLDDMFHYJJQLFD7V5UZOKYB
X-MailFrom: alexander.sverdlin@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>,
 David Rhodes <david.rhodes@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NHILDX3DRZLDDMFHYJJQLFD7V5UZOKYB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

- Switch to REGCACHE_FLAT, the whole overhead of RBTREE is not worth it
  with non sparse register set in the address range 1..7.
- Move register width to central location

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 sound/soc/codecs/cs4271-i2c.c | 1 -
 sound/soc/codecs/cs4271-spi.c | 1 -
 sound/soc/codecs/cs4271.c     | 4 ++--
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs4271-i2c.c b/sound/soc/codecs/cs4271-i2c.c
index 0e8a7cf0da50..4033be1c3bc1 100644
--- a/sound/soc/codecs/cs4271-i2c.c
+++ b/sound/soc/codecs/cs4271-i2c.c
@@ -17,7 +17,6 @@ static int cs4271_i2c_probe(struct i2c_client *client)
 
 	config = cs4271_regmap_config;
 	config.reg_bits = 8;
-	config.val_bits = 8;
 
 	return cs4271_probe(&client->dev,
 			    devm_regmap_init_i2c(client, &config));
diff --git a/sound/soc/codecs/cs4271-spi.c b/sound/soc/codecs/cs4271-spi.c
index 7ef0a66b7778..4feb80436bd9 100644
--- a/sound/soc/codecs/cs4271-spi.c
+++ b/sound/soc/codecs/cs4271-spi.c
@@ -17,7 +17,6 @@ static int cs4271_spi_probe(struct spi_device *spi)
 
 	config = cs4271_regmap_config;
 	config.reg_bits = 16;
-	config.val_bits = 8;
 	config.read_flag_mask = 0x21;
 	config.write_flag_mask = 0x20;
 
diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index 2021cf442606..188b8b43c524 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -689,8 +689,8 @@ const struct regmap_config cs4271_regmap_config = {
 
 	.reg_defaults = cs4271_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(cs4271_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
-
+	.cache_type = REGCACHE_FLAT,
+	.val_bits = 8,
 	.volatile_reg = cs4271_volatile_reg,
 };
 EXPORT_SYMBOL_GPL(cs4271_regmap_config);
-- 
2.40.0

