Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5FA693A68
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Feb 2023 23:10:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84600208;
	Sun, 12 Feb 2023 23:09:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84600208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676239830;
	bh=RhUr4WrJqb19Lu7kQ8DE5zbQ6A9O2NedCi45kcrBhYA=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ml8yHSG7UUvmrc5+VO/5EivH3GkkmjwauheTYulpXZdY1zToMIhfHI5KhiAJonA14
	 JtwENoHcBQHOVO/2l1uVZHN53uk6u1dZCYsuzEsK3Kl5Ewyp9GTakzWlr5USOJcFbR
	 gb2+Qt9DSpRXOwWgRu2qCI093kXivsA/xbx/F+KA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1B41F8012A;
	Sun, 12 Feb 2023 23:09:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8009FF804B0; Sun, 12 Feb 2023 23:09:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF15DF8001E
	for <alsa-devel@alsa-project.org>; Sun, 12 Feb 2023 23:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF15DF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ov1FWYDj
Received: by mail-wr1-x42a.google.com with SMTP id by3so9086546wrb.10
        for <alsa-devel@alsa-project.org>;
 Sun, 12 Feb 2023 14:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kuVlO+i53wZEGLDs4VE0wb6Kv/D3ZFKHSN/pP+HaO34=;
        b=Ov1FWYDjx785BvnGLnfe21+sXW+hRB8YPgRx0lBOAxM3HvLd3PCaCAdmt1SWTo6cw2
         SVXdIHtmwgVuc4oYieM8ZxfqmI4upcHxzXQ53eU21HwjVkhTckj8MQsnfQcfOly8lCZQ
         fCBvGqkFRgBlanIJE+8f4loy2Gi5FYIZ+M4WhLTkQoc+Yi5G2U0mCwaW9ail4ovKPnX2
         ICPhoe+aTxKO3SWH0T8qAUHxkDOvY3fHdsMfNTbPnNcldRdpMfKLGhkLrBcycIQ0Yt2c
         7qW7/Btp0aDG91732Iiurlj6LVR6DVdggMB3bAPp2y8irrWGYwweI5aTcshQUCat+8gg
         aaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuVlO+i53wZEGLDs4VE0wb6Kv/D3ZFKHSN/pP+HaO34=;
        b=jNrMcA+vl2S2N298ZhfRAU8kWUteJ6Jdj8Nn2OFhQdm28B39vg4EZ7deYtAE8Rtklc
         1MZzlr+UI+ruKbdDKwTmrcCBShhUnURclcEaD5tOFCb9bWdtVV14SwJTTAueSeO8DG8L
         nAbPkD96Lkm7ABsxcLropESMbllfonUPZboc3q6FDy72zqE0H3ewoZg3HyJc5riqYbxe
         16oIDENRx6667woUONNnsbuBVhqEV6CnTqxqIZeBC/8Ku4McHxtPLsnv7WWX6nxuTOm9
         yOBcZ6KjheB9RpTQs+h4GwE7zS4wBdiGrH66YJjcpZ5hoTmOLu6zO9KkWBl0BJ5XIIF8
         ApFQ==
X-Gm-Message-State: AO0yUKVhjNXumZX6/L8N/xvO+rvPCc6LvAhQM74MYGEqey+LU66MIvHi
	TJmDJAW4jbD9mAwRbUGtKV4xw+9G56VPng==
X-Google-Smtp-Source: 
 AK7set86lVK48ULoHmlJx2sYbsZZGgjWn80e7L94dMOFoAEZynWgx7pm6OhaL7b7E5RaGDx3sUFjrw==
X-Received: by 2002:adf:dcd2:0:b0:2c5:5a68:958 with SMTP id
 x18-20020adfdcd2000000b002c55a680958mr251528wrm.33.1676239766773;
        Sun, 12 Feb 2023 14:09:26 -0800 (PST)
Received: from localhost ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with UTF8SMTPSA id
 k2-20020a5d6d42000000b002c4061a687bsm9148656wri.31.2023.02.12.14.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 14:09:26 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: ep93xx: ignore 0 Hz sysclk
Date: Sun, 12 Feb 2023 23:09:23 +0100
Message-Id: <20230212220923.258414-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4JTZWZAI2HNR2DYNRKSFHKGEIAIGGK4T
X-Message-ID-Hash: 4JTZWZAI2HNR2DYNRKSFHKGEIAIGGK4T
X-MailFrom: alexander.sverdlin@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JTZWZAI2HNR2DYNRKSFHKGEIAIGGK4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 2458adb8f92a
("SoC: simple-card-utils: set 0Hz to sysclk when shutdown")
added a call to snd_soc_dai_set_sysclk() with 0 Hz frequency. Being
propagated further it causes a division by zero in clk-ep93xx driver:

Division by zero in kernel.
CPU: 0 PID: 52 Comm: aplay Tainted: G        W          6.2.0-rc4-... #1
Hardware name: Generic DT based system
 unwind_backtrace from show_stack+0x10/0x18
 show_stack from dump_stack_lvl+0x28/0x34
 dump_stack_lvl from __div0+0x10/0x1c
 __div0 from Ldiv0+0x8/0x1c
 Ldiv0 from ep93xx_mux_determine_rate+0x78/0x1d0
 ep93xx_mux_determine_rate from clk_core_round_rate_nolock+0x48/0xc8
 clk_core_round_rate_nolock from clk_core_set_rate_nolock+0x48/0x160
 clk_core_set_rate_nolock from clk_set_rate+0x30/0x8c
 clk_set_rate from ep93xx_i2s_set_sysclk+0x30/0x6c
 ep93xx_i2s_set_sysclk from snd_soc_dai_set_sysclk+0x3c/0xa4
 snd_soc_dai_set_sysclk from asoc_simple_shutdown+0xb8/0x164
 asoc_simple_shutdown from snd_soc_link_shutdown+0x44/0x54
 snd_soc_link_shutdown from soc_pcm_clean+0x78/0x180
 soc_pcm_clean from soc_pcm_close+0x28/0x40
 soc_pcm_close from snd_pcm_release_substream.part.0+0x3c/0x84
 snd_pcm_release_substream.part.0 from snd_pcm_release+0x40/0x88
 snd_pcm_release from __fput+0x74/0x278

There has been commit f1879d7b98dc ("ASoC: rockchip: ignore 0Hz sysclk"),
but it prepared by far not all drivers.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 sound/soc/cirrus/ep93xx-i2s.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 982151330c89..f41712df7994 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -359,6 +359,8 @@ static int ep93xx_i2s_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id,
 
 	if (dir == SND_SOC_CLOCK_IN || clk_id != 0)
 		return -EINVAL;
+	if (!freq)
+		return 0;
 
 	return clk_set_rate(info->mclk, freq);
 }
-- 
2.39.1

