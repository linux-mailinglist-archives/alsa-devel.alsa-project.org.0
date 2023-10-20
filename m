Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0E97D14AA
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 19:16:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A2C482B;
	Fri, 20 Oct 2023 19:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A2C482B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697822204;
	bh=sgY8Hzz4KpEZRUtWg3mgR3LKipxJYjDTr98YwbSwluk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Pu5IfZSxTVJrMpp7EzKcwv6F70Vgzpn4TA04cEcgsiEsoIql1JyR+okLvB7RmQgsI
	 sWIlWfeCj/SwwC9HX7PLMkKf6Me4nRyyCQvVc4QPJIpf7bZHqpHPXi7wSDWzDLG3Pc
	 OqaZlnZK2D3TR7Z/3bKC20wtISuopjmYfcAH534o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAF3CF8019B; Fri, 20 Oct 2023 19:15:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B91EF8024E;
	Fri, 20 Oct 2023 19:15:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30C16F8025F; Fri, 20 Oct 2023 19:15:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E65EF8019B
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 19:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E65EF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RAgXuXKh
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6ce2d4567caso692597a34.2
        for <alsa-devel@alsa-project.org>;
 Fri, 20 Oct 2023 10:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697822144; x=1698426944;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pk35P/kkGXTEGbB5HLyakFG56HpX318Y+q1SgCir8+o=;
        b=RAgXuXKhZslrCt/km5PVG5F3A6ThBWGCWifPYHgIZwphv4xEuq/NAT2l5p/2Q9gdh4
         sawbezJbL3SEmjURaBzjdm4wNAe5dg9n3IVcNetEbdIx3jYrdazUOPkUTDgi9OJHzWaM
         UDFP0BoHNo2UtYcadibhN16OgR/6vqZ/mvSxmhsJPqxvmh8S/aDUxwA6R3Tzr9jO6WRh
         he4knuK4CtzNjA8zG1ybGoNNtZlKtO5RbdON6D7xlUyxkUlhuBxIMD7772dfMn0YvHYw
         0BS4d1FmeKsVxJqpT5RL9G+cGhgSOOMYKvg1wEOkLv/JnFjhjKNCz2IGFif8iVOhY1v/
         ulxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697822144; x=1698426944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pk35P/kkGXTEGbB5HLyakFG56HpX318Y+q1SgCir8+o=;
        b=SVkfQJW0LDaRLcKzjnllUIYCuabQWrfLf5t4dIheEQGRyPpgc2/gtCqy6Ojy18mi/2
         IPP/K5t5n0JsK0urYbM9/yo9lVsD/mkHOYAdCv6/Wv8yCmHT3BxdFfuYqKm0/pbeTFpG
         gBJFRBThbla/QV3yKyBsBE8EVMV03OSEP2bWDYoyyrXgBMh+5PJl/2771a+PAK79GHSC
         GAcD1n3bHPOnxMh/13B1aNAp7qDl3LbmY7OxXsGeCrxaDaQ2juHoll9SkM/CjBF29Bk3
         7CfhmFDWY9Uqa0vetpvqePdszt0Km+6PUQdvR3JBKsoR9jHZvN+GA9v2iWx2XMVlJkfe
         ku4A==
X-Gm-Message-State: AOJu0YzxqNMCE//rFYQGNEJkPAUJkwMLT/N26Ne1uS9IdGUww4gQY30f
	gkBgbHDyXFBLfNh2RkRVXyXzNJFRYWM=
X-Google-Smtp-Source: 
 AGHT+IGvIzdWYX97IioagGjzieuALCQDvQGXPvFqN5epcuM7wKIUjTMgqZ/kuoo3fTelHHfdrk/MJw==
X-Received: by 2002:a05:6830:442a:b0:6c6:4473:6f05 with SMTP id
 q42-20020a056830442a00b006c644736f05mr2318164otv.9.1697822143795;
        Fri, 20 Oct 2023 10:15:43 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id
 k14-20020a056830168e00b006ce2e464a45sm389682otr.29.2023.10.20.10.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 10:15:43 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH] ASoC: es8328: Use rounded rate for es8328_set_sysclk()
Date: Fri, 20 Oct 2023 12:15:39 -0500
Message-Id: <20231020171539.65513-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K2LXBOWFDDG36T4BYG3A3LJT2TIBYLBP
X-Message-ID-Hash: K2LXBOWFDDG36T4BYG3A3LJT2TIBYLBP
X-MailFrom: macroalpha82@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K2LXBOWFDDG36T4BYG3A3LJT2TIBYLBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chris Morgan <macromorgan@hotmail.com>

I have a board (RK3588 based) that sets the sysclk to 12287999. The
es8328 driver fails to match this to the 12288000 rate and fails to
load. Allow the rate comparison to work if the frequency is within
100hz by dividing it by 100 and rounding it, then multiplying it back
by 100.

Note the 100hz value was chosen arbitrarily by me, but it has only
been tested with a 1hz difference.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 sound/soc/codecs/es8328.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 0bd9ba5a11b4..22e7a9312732 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -557,8 +557,15 @@ static int es8328_set_sysclk(struct snd_soc_dai *codec_dai,
 	struct snd_soc_component *component = codec_dai->component;
 	struct es8328_priv *es8328 = snd_soc_component_get_drvdata(component);
 	int mclkdiv2 = 0;
+	unsigned int round_freq;
 
-	switch (freq) {
+	/*
+	 * Allow a small tolerance for frequencies within 100hz. Note
+	 * this value is chosen arbitrarily.
+	 */
+	round_freq = DIV_ROUND_CLOSEST(freq, 100) * 100;
+
+	switch (round_freq) {
 	case 0:
 		es8328->sysclk_constraints = NULL;
 		es8328->mclk_ratios = NULL;
-- 
2.34.1

