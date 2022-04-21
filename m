Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F71150A4E3
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 17:59:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F104A1663;
	Thu, 21 Apr 2022 17:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F104A1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650556752;
	bh=EmXhH7yPQ/mFCZIud6jCoApUBmjCGTPr+E0gsUOT10s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VYoWQAojmnZRfynrQcDnvAJJLsuOVqkk5Ck8QzBDkHACiMs9UkQaWFkXE7ZZKIsK0
	 HgqcLSmuxDw+QnejR9KqXIMegh+7P0s1YXUqRa35qbFAN6NCsmkxx6sXZjY2sLpxw1
	 yXWN+xy+NAOKd+k00Rwl5ipu2x2WuDD7yQTJCdV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A089F804F3;
	Thu, 21 Apr 2022 17:57:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0A31F804DA; Thu, 21 Apr 2022 17:57:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29BAEF80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 17:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29BAEF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="x7mIAao/"
Received: by mail-wr1-x42b.google.com with SMTP id v12so527667wrv.10
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 08:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c5v2dcbpfIREeY44tdPJXPJiKXCQO1isQe1PN8hnmtA=;
 b=x7mIAao/XjRhFqxaq69esUVD9gaSAFe7pBZaCn5vqPJ7FGAfIcxMddEd/ZwhipP4xe
 adLF8gMXeI+5Lr2Vr6CL40gna2y9IIhkZ19d1Kk17qzehiOtRLwt0VEWd5VamUDeaQMs
 xzeNByKjw9cAqJpO9CPiyjTLidYUSP84vxCflxxes3yEc40nRsQS7DNzcbMT6FyGVp4A
 ajm565I5vOTyqmV9Vqb9UHeQZhhoHlk9JHUiTrC/fEuvyTkAZ3XGkhwi8Cc75rAs9/qJ
 Brkd+R0DlIuzJ878hwMF9F8pQg9hkmzm8h6EoiAyMKBBplvmBjqaw2Mrq/Fo7uODcUhH
 HGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c5v2dcbpfIREeY44tdPJXPJiKXCQO1isQe1PN8hnmtA=;
 b=cJL/AXDg2nKaPRFKSeJYiorrFLjfvqf2Cxx74jDDaeGJ0WMsISozGUcTaROFG/YwEU
 bzHfsIV1cmhtA6N82UZxPdMzUjvMeq0gpJeBZspIELCeqWAvU70QkcQ0RQmGu3JV934u
 CU53yYjxj/dld2M0mwd3jaUJwovrko2FWHknKYahL/Jg90snh4iO98kklUcHDOeNjWZ8
 9VWfUOzlwAU1vQKCXAKWgT4tJzECjobG6i11XMjL0VIPbm5bX5fOztjJpsRVfpH55wIJ
 rS/YwbRIOvL/btTey30yNqt4k1+BHCx+K2JnRuUyG6lhiLwWW9Yd7F2+FJe1KQV57Xov
 1PMA==
X-Gm-Message-State: AOAM531AgJtn4BCLWkaL6lY4/3lUqc/7EVJyF770pXYbuvqyYqUB5DKg
 WuMQ/tkG1cy6jMRQJZe3mD5ryQ==
X-Google-Smtp-Source: ABdhPJz8PBGJzTWGkvR9SDIvidKwEabWHonllUxUaq2TEm4JZ76WETtMHbtWwFFwMYrsLL0Ek3CKbw==
X-Received: by 2002:a05:6000:713:b0:20a:92f1:c057 with SMTP id
 bs19-20020a056000071300b0020a92f1c057mr289175wrb.241.1650556651171; 
 Thu, 21 Apr 2022 08:57:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:35ba:2677:956:980d])
 by smtp.gmail.com with ESMTPSA id
 61-20020adf8143000000b002061d8d807esm2623140wrm.87.2022.04.21.08.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:57:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	broonie@kernel.org
Subject: [PATCH 2/2] Revert "ASoC: meson: axg-card: make links nonatomic"
Date: Thu, 21 Apr 2022 17:57:25 +0200
Message-Id: <20220421155725.2589089-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421155725.2589089-1-narmstrong@baylibre.com>
References: <20220421155725.2589089-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Dmitry Shmidt <dimitrysh@google.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

This commit e138233e56e9829e65b6293887063a1a3ccb2d68 causes the
following system crash when using audio on G12A/G12B & SM1 systems:
 BUG: sleeping function called from invalid context at kernel/locking/mutex.c:282
  in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapper/0
 preempt_count: 10001, expected: 0
 RCU nest depth: 0, expected: 0
 Preemption disabled at:
 schedule_preempt_disabled+0x20/0x2c
 CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.17.0-rc6-03747-gd403c3588f77-dirty #957
 Hardware name: SEI Robotics SEI610 (DT)
 Call trace:
 dump_backtrace+0xd8/0xf4
 show_stack+0x18/0x30
 dump_stack_lvl+0x70/0x8c
 dump_stack+0x18/0x38
 __might_resched+0x154/0x164
 __might_sleep+0x48/0x78
 mutex_lock+0x24/0x60
 _snd_pcm_stream_lock_irqsave+0x20/0x3c
 snd_pcm_period_elapsed+0x24/0xa4
 axg_fifo_pcm_irq_block+0x64/0xdc
 __handle_irq_event_percpu+0x104/0x264
 handle_irq_event+0x48/0xb4
 ...
 start_kernel+0x3f0/0x484
 __primary_switched+0xc0/0xc8

Revert this commit until the crash is fixed.

Reported-by: Dmitry Shmidt <dimitrysh@google.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 sound/soc/meson/axg-card.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index cbbaa55d92a6..2b77010c2c5c 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -320,7 +320,6 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 
 	dai_link->cpus = cpu;
 	dai_link->num_cpus = 1;
-	dai_link->nonatomic = true;
 
 	ret = meson_card_parse_dai(card, np, &dai_link->cpus->of_node,
 				   &dai_link->cpus->dai_name);
-- 
2.25.1

