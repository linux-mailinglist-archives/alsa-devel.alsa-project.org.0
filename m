Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3D177108C
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Aug 2023 18:26:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B68082B;
	Sat,  5 Aug 2023 18:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B68082B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691252782;
	bh=KD1gnX5/eGkeMKLvC989RkR9cLRTLcOZsmWQGd4KHB0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pjt/L3ZxU217wKqipo8oQSz8B8yvHQX9hy/kU5HhExkxcCqnvdNiwnhrCUm8Du8F3
	 gbk/krAigg5gqX/U9PLyOFX3nuPLjWoEShG5rli7p6jP4iErKPo29o0mnxsWQ/kcZl
	 JHDCU5hVHk0JgIZrpWwi7mjnEa3L3Yf/l27W1zJE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D14AF801D5; Sat,  5 Aug 2023 18:25:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3AA7F801D5;
	Sat,  5 Aug 2023 18:25:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 322CAF8025A; Sat,  5 Aug 2023 18:22:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F6D0F80087
	for <alsa-devel@alsa-project.org>; Sat,  5 Aug 2023 18:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F6D0F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=niWJpZG0
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fe426b8583so24513615e9.2
        for <alsa-devel@alsa-project.org>;
 Sat, 05 Aug 2023 09:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691252549; x=1691857349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SNfDyfwYBpzfaoZbAIE6EgJYECHgCylif4C/yupq9CQ=;
        b=niWJpZG0OU/zQcYy9oz1AuH4Rjto9ldCL8tUU8Y3Bzn+B8AjIgiBpFJt00QELZHSjD
         RrBstF67mpu+EHTtmVoIuCJAkCpNtRKGSCXqgT7hN8j+5+CVwNXRjB3QvW4ikRwGGtLS
         qEgtK7P4ZOg6gX3g14oN5+IYZXkMwKS22pKqZ3+I3wItRser25ryzmS4FqDlRXs0E/0K
         7APPoo6PU7JC1ife9DgkOT2bBpPdZn71URlDeBzyyYrMEN0ZzkK7GIfOzMSfrbz9838M
         6ttO8QP3HvLG9ViVCQrbrZSuBs85pC4VclwY1bb5SQ0tVNY9bT6IQ67dY0hxY3O2cDOZ
         3P1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691252549; x=1691857349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNfDyfwYBpzfaoZbAIE6EgJYECHgCylif4C/yupq9CQ=;
        b=TjT/ZJcX/kKOV10OuCXddChcOd8r+eTodxh2KbL7vUp9Njpy5GeDCxTrhApNhQe2pl
         uNMxCqWLRHAg7PtYR/0KnJLvp5+eWv3JJ8qRlYRpwdC9Z3T67np73drX+9jYio1LWRk6
         X3FckEfL//sguKuw7kvGbzDMzF+Pv8jdms8H9xj6oSVK4MkBR3YURjYHLTgynxpNoPGI
         38G9uGkPuK5dU5HXdOr36hUDBTNfVOsLiT8sKGub2bmzcJH4B7PZI3UFqT4l3HazREuJ
         4KW9ZUT4npU44fIJGLlD2Zsb4BsYCXPIajRbDUH81j55Y1mWJcfP33F2K6nseMDx5ftq
         F2dA==
X-Gm-Message-State: AOJu0Yw8u0ckeubKmiOE0nuKvgPjrgkA/URbYMOrJqyktXzDP1qpT09O
	WuZsNT4hY4ieQbSWqHVybd1hQTg0VVI=
X-Google-Smtp-Source: 
 AGHT+IFV27M6Ye2RYbBMYwaesczoiT6wmLBTABsbL3gUj4lS4oWUaB3lniwbPRZtWNUdbUQRVSoN1w==
X-Received: by 2002:a7b:cb95:0:b0:3fe:374f:f7fd with SMTP id
 m21-20020a7bcb95000000b003fe374ff7fdmr4008716wmi.33.1691252548785;
        Sat, 05 Aug 2023 09:22:28 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 q7-20020a1cf307000000b003fa98908014sm9733202wmq.8.2023.08.05.09.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 09:22:27 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH] ASoC: amd: acp3x-rt5682-max9836: Configure jack as not
 detecting Line Out
Date: Sat,  5 Aug 2023 19:22:16 +0300
Message-Id: <20230805162216.441410-1-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PJDQWIGUKJFPINNOCK6A3XRT3BIXMV2G
X-Message-ID-Hash: PJDQWIGUKJFPINNOCK6A3XRT3BIXMV2G
X-MailFrom: alpernebiyasak@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PJDQWIGUKJFPINNOCK6A3XRT3BIXMV2G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The RT5682, RT1015 and RT1015p codecs used in this driver do not seem
capable of distinguishing Line Out connections from Headphone, but
the driver configures its jack object as if it can. Remove the wrong
value from the jack creation call to avoid any confusion.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
Depends on [1] which applies onto of linux-next. Untested, see [2]:
[1] https://lore.kernel.org/alsa-devel/20230802175737.263412-5-alpernebiyasak@gmail.com/
[2] https://lore.kernel.org/alsa-devel/3d6794c9-60d3-b8f3-99d2-afdc69593d9f@gmail.com/

 sound/soc/amd/acp3x-rt5682-max9836.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 3bf7e1e83c36..28ad5f5b9a76 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -98,7 +98,7 @@ static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 	rt5682_dai_bclk = clk_get(component->dev, "rt5682-dai-bclk");
 
 	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
-					 SND_JACK_HEADSET | SND_JACK_LINEOUT |
+					 SND_JACK_HEADSET |
 					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
 					 &pco_jack,

base-commit: 626c67169f9972fffcdf3bc3864de421f162ebf5
prerequisite-patch-id: 7158530856f8f97324906b342528a5ffe7b4032b
-- 
2.40.1

