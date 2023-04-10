Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 684336DCD99
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 00:40:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D05F5102C;
	Tue, 11 Apr 2023 00:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D05F5102C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681166455;
	bh=WvpbiUlY+1OBAuaKtGC9zbtP9lE4G4zdh1NCzFiZtv8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FIB+grloYClvaQ1loIR21NS/X/JHUIcAfcGfDoyIGTv4QPkcCyhxkATX6dpCPwkD8
	 Y+5vFCrMFPz22anXozK4Az+QScD3oyDdiHYGFrq6DfqQCQrqjG8L/tbH6gBBXJKqy4
	 0izcpMzV+OT9uW8TFgN+XoSACFin14gV+TO+HLOg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29A3FF8023A;
	Tue, 11 Apr 2023 00:39:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9489BF8049C; Tue, 11 Apr 2023 00:39:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F291DF80100
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 00:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F291DF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=F+gsdJ8f
Received: by mail-wr1-x42a.google.com with SMTP id o18so5721985wro.12
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Apr 2023 15:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681166346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNwzE4KtIR7VA8WEdFR1Y325MnwjNn/HP5LmgOvBXjw=;
        b=F+gsdJ8fCjBl/In9VkEjngqOT7Yuy4rIlgNTgygFtjvwflyMXmqET1mjhlBYH4h/hK
         UapCpXSmCP5mAkgUJkJ9xtllBixS1M7NeDhQJzNyzoakQgm7T49tE4pNAEm1YTrWbn8f
         i0L9R2NTth5sj0N2S1NoFjUb4Z+83LqH5dScPFvzIIZIAZ+zcbO/S2lhE1DNKnh3e/rt
         G4WcjnxgSToUUhOPlLr1ZtKawVIYKB1ltq9/PZyILVBqdYT+bQr+5IjeCwCazzV9C+Rn
         HRkjTJ9HhANlIzvKd3TacCbtXRJAs59ZcBBTdJnMu/joEG4yIQZ5+6rigL2hvk2P84Lz
         pBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681166346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNwzE4KtIR7VA8WEdFR1Y325MnwjNn/HP5LmgOvBXjw=;
        b=Y7Emosb0AbOQd2XejNy0/QLkDT7N8snpCajLvfqHDY/FAO6Ff8XLbgdzNlYd4ilMLT
         7sDjRROdvbyo5S2/nhJltzuVS30a+AKG4ixYUa1zTdhrTRiQ3AC8UtJQQXViug6YHo75
         Srk8Mq2UZq06Y9vs23CYz7t4Drt8yrpS7ZnYNxhovhm/510hoiYiku3OYLp9Msj58g/w
         d3AfNaYBavDJ84y9RQO83KarBJm/AbMF9WfbGonEEYH2/CuAo61tHfQsqONZYU9rDuV3
         hSVTtFRv+aWkU2Qoa13WJEAh5TBF/qqk/02WG49t9YKOd3VViOLdLuA/AuLoqphxNZZg
         WurA==
X-Gm-Message-State: AAQBX9fa29ZViGktI+5NwySrSUbTFHeF47mZ3SfwM22d2jXxLGCQR0ta
	phrXkln1Xk4SbwuVygWl4dRyrUKSuS4+wA==
X-Google-Smtp-Source: 
 AKy350Y/Jw0fJS5n1ttIDBcdNXFNA0aKae15RlsyioYA7N5Vk0r0ouA/4vMJ+EkD1ObVbRm/7DG4ew==
X-Received: by 2002:adf:f3cf:0:b0:2d5:2c7b:bc5f with SMTP id
 g15-20020adff3cf000000b002d52c7bbc5fmr8960195wrp.58.1681166345763;
        Mon, 10 Apr 2023 15:39:05 -0700 (PDT)
Received: from localhost ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with UTF8SMTPSA id
 m8-20020adffe48000000b002c55521903bsm12862966wrs.51.2023.04.10.15.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 15:39:05 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: ep93xx: i2s: move enable call to startup callback
Date: Tue, 11 Apr 2023 00:39:00 +0200
Message-Id: <20230410223902.2321834-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410223902.2321834-1-alexander.sverdlin@gmail.com>
References: <20230410223902.2321834-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YK2Z7DK6SM5GFHVDBYNASOXFYYNITA4K
X-Message-ID-Hash: YK2Z7DK6SM5GFHVDBYNASOXFYYNITA4K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YK2Z7DK6SM5GFHVDBYNASOXFYYNITA4K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Make startup/shutdown callbacks symmetric to avoid clock subsystem warnings
(reproduced with "aplay --dump-hw-params" + ctrl-c):

WARNING: CPU: 0 PID: 102 at drivers/clk/clk.c:1048 clk_core_disable
lrclk already disabled
CPU: 0 PID: 102 Comm: aplay Not tainted 6.2.0-rc4 #1
Hardware name: Generic DT based system
 ...
 clk_core_disable from clk_core_disable_lock
 clk_core_disable_lock from ep93xx_i2s_shutdown
 ep93xx_i2s_shutdown from snd_soc_dai_shutdown
 snd_soc_dai_shutdown from soc_pcm_clean
 soc_pcm_clean from soc_pcm_close
 soc_pcm_close from snd_pcm_release_substream.part.0
 snd_pcm_release_substream.part.0 from snd_pcm_release
 snd_pcm_release from __fput
 __fput from task_work_run
 ...

WARNING: CPU: 0 PID: 102 at drivers/clk/clk.c:907 clk_core_unprepare
lrclk already unprepared
CPU: 0 PID: 102 Comm: aplay Tainted: G        W          6.2.0-rc4 #1
Hardware name: Generic DT based system
 ...
 clk_core_unprepare from clk_unprepare
 clk_unprepare from ep93xx_i2s_shutdown
 ep93xx_i2s_shutdown from snd_soc_dai_shutdown
 snd_soc_dai_shutdown from soc_pcm_clean
 soc_pcm_clean from soc_pcm_close
 soc_pcm_close from snd_pcm_release_substream.part.0
 snd_pcm_release_substream.part.0 from snd_pcm_release
 snd_pcm_release from __fput
 __fput from task_work_run
 ...

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 sound/soc/cirrus/ep93xx-i2s.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 200d18060f7c..bbbb1065b2f1 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -209,6 +209,16 @@ static int ep93xx_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static int ep93xx_i2s_startup(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct ep93xx_i2s_info *info = snd_soc_dai_get_drvdata(dai);
+
+	ep93xx_i2s_enable(info, substream->stream);
+
+	return 0;
+}
+
 static void ep93xx_i2s_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
@@ -349,7 +359,6 @@ static int ep93xx_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (err)
 		return err;
 
-	ep93xx_i2s_enable(info, substream->stream);
 	return 0;
 }
 
@@ -398,6 +407,7 @@ static int ep93xx_i2s_resume(struct snd_soc_component *component)
 #endif
 
 static const struct snd_soc_dai_ops ep93xx_i2s_dai_ops = {
+	.startup	= ep93xx_i2s_startup,
 	.shutdown	= ep93xx_i2s_shutdown,
 	.hw_params	= ep93xx_i2s_hw_params,
 	.set_sysclk	= ep93xx_i2s_set_sysclk,
-- 
2.40.0

