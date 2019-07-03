Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAF85E549
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 15:21:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41D5C16AC;
	Wed,  3 Jul 2019 15:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41D5C16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562160079;
	bh=0StWaiw7L12boYdR4OMIedQT6LL3qJ83X0t6LQltylw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mPF7YIcmlq66rMBOSqI5oEoF94OY2a+B0ip9JpCAh6Fr4zADrsuuuXFmucKEqXZrn
	 yW+V4/9bVRIYTtsn4DXCaERWSM8qgZb14odj0LP7pBVSNG6RhjXlOAvDngW7FDnE0o
	 EegycTzah4U5Q3JAfecDCORzYHJr1aqaI1e1y/MA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94122F80114;
	Wed,  3 Jul 2019 15:19:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6404EF80112; Wed,  3 Jul 2019 15:18:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFC7EF800C5
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 15:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFC7EF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aosT7HgR"
Received: by mail-pf1-x441.google.com with SMTP id m30so1271848pff.8
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 06:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=maPFzMJxkxDi9/pzkIAhWooIBm7u3WPHY1fXuOXs5zg=;
 b=aosT7HgRTdAbUppuudBPEzJ5pAmqaRAM0pjZ5iT+PWRrWYST1xeX6Xg/S/8RoHVDUm
 4Xm8U8hXNZEcomAuxcorC3N4GyZ8WxFaFUQ/5HtbxaeEYQCH5WWczrE/QcbClgcko6B3
 9kXHOCMR/9EsFpDnkT2jNADO7Pj8UR/UsKWkZsti/bmm5ZZf2Y3K9ue5eSO1LGT/i5mL
 mIXWsl+tNvt4VwOAS4ueIwoKhVcnXGXRnzs1h9TePUhSTwYP4EgWn6AJumJ9XHsliVvz
 CpEpd205rEkSkJK4oCUyn4k76oP1BcszDg3hnJY7MNXl3bDVJA50IllerePntRebQNK9
 Y5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=maPFzMJxkxDi9/pzkIAhWooIBm7u3WPHY1fXuOXs5zg=;
 b=OyPfi84vr3q5kLEajWSUtE+dysAQC8MMyYtCG5GrkX9VmRBB4XVx1VSWemJNW9dWgr
 7FOB+qTdlYMGVlUxX3ECyZh0BYtSHfU/EuFLIBYmiowjlYMEGVnsG3X8I6S2wufOBVYu
 A0C2f1HxgVqo4Lclm+tWkG0A1wAmFP2KY6z6l4r5Ix4wEgsiNEx/dXzY3ZbqZ288lSp4
 0QOUnwfZIlywLMfMfhSgxnY7lWCqUBUB9PUm8ik6i9IGcWtipWIuz5Fcz3UbNZL5o5vT
 b9GERvwm0Kp+XA831eta8jEUTaEeQ43F7ktZlZhxxLdf+BOv3RFQL/ZuIgMlvJusALRL
 bVdA==
X-Gm-Message-State: APjAAAW5iGK27WbU1S9pHr8E2AOP3kC3GIRy5ALuKQURQCiqsE4DUfvi
 cQE/TcRW+Oj/xFItdJtO6jU=
X-Google-Smtp-Source: APXvYqxo3SWL87xvyOihIZ6tX+GIYgZ0rb8EldB2PBtlU5U2zf9aHiucu/yYrAvdt0jDdkhJJGdVAg==
X-Received: by 2002:a63:b547:: with SMTP id u7mr38243790pgo.322.1562159934678; 
 Wed, 03 Jul 2019 06:18:54 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id
 n140sm2562504pfd.132.2019.07.03.06.18.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 06:18:54 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Date: Wed,  3 Jul 2019 21:18:42 +0800
Message-Id: <20190703131842.26082-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Fuqian Huang <huangfq.daxian@gmail.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 30/30] sound/soc: Use kmemdup rather than
	duplicating its implementation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memset, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memset.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 sound/soc/codecs/wm0010.c             | 4 +---
 sound/soc/intel/atom/sst/sst_loader.c | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 727d6703c905..807826f30f58 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -515,7 +515,7 @@ static int wm0010_stage2_load(struct snd_soc_component *component)
 	dev_dbg(component->dev, "Downloading %zu byte stage 2 loader\n", fw->size);
 
 	/* Copy to local buffer first as vmalloc causes problems for dma */
-	img = kzalloc(fw->size, GFP_KERNEL | GFP_DMA);
+	img = kmemdup(&fw->data[0], fw->size, GFP_KERNEL | GFP_DMA);
 	if (!img) {
 		ret = -ENOMEM;
 		goto abort2;
@@ -527,8 +527,6 @@ static int wm0010_stage2_load(struct snd_soc_component *component)
 		goto abort1;
 	}
 
-	memcpy(img, &fw->data[0], fw->size);
-
 	spi_message_init(&m);
 	memset(&t, 0, sizeof(t));
 	t.rx_buf = out;
diff --git a/sound/soc/intel/atom/sst/sst_loader.c b/sound/soc/intel/atom/sst/sst_loader.c
index ce11c36848c4..cc95af35c060 100644
--- a/sound/soc/intel/atom/sst/sst_loader.c
+++ b/sound/soc/intel/atom/sst/sst_loader.c
@@ -288,14 +288,13 @@ static int sst_cache_and_parse_fw(struct intel_sst_drv *sst,
 {
 	int retval = 0;
 
-	sst->fw_in_mem = kzalloc(fw->size, GFP_KERNEL);
+	sst->fw_in_mem = kmemdup(fw->data, fw->size, GFP_KERNEL);
 	if (!sst->fw_in_mem) {
 		retval = -ENOMEM;
 		goto end_release;
 	}
 	dev_dbg(sst->dev, "copied fw to %p", sst->fw_in_mem);
 	dev_dbg(sst->dev, "phys: %lx", (unsigned long)virt_to_phys(sst->fw_in_mem));
-	memcpy(sst->fw_in_mem, fw->data, fw->size);
 	retval = sst_parse_fw_memcpy(sst, fw->size, &sst->memcpy_list);
 	if (retval) {
 		dev_err(sst->dev, "Failed to parse fw\n");
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
