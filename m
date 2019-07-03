Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC775E540
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 15:20:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 068E016A6;
	Wed,  3 Jul 2019 15:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 068E016A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562160032;
	bh=Y2kC/pmcesZbWXVpmauhoMWFvuc500z0qIsqksSSjPo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I5yc1+IoyXkSPoKiqtpj+SrVWJM+jeE8oAVcwypuOVZmDDgT8BhddGRfczfro1mc/
	 I/Bcdyz3/ymlJFGvC9ExdR4I1knmHWskF1HVm3XKt3Qqe6Hp4Wy0zDIpjuvlIYTTDk
	 SoZ4EFbabMFHGnXeeO+DCgxpo7mN3YAE7QGkzHhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E4FAF800EA;
	Wed,  3 Jul 2019 15:18:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9091AF800EA; Wed,  3 Jul 2019 15:18:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B9E2F80058
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 15:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B9E2F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="O7xWJ/l1"
Received: by mail-pf1-x443.google.com with SMTP id j2so1278827pfe.6
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 06:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Nj/3gkFpbOs8TwYJH6jtpLzU/5n2yTiUnG69zoLMmRY=;
 b=O7xWJ/l115TO6HXFLmdL4uE8BcJQnt35GkuZIG1XCxNxs6L3gacLowdoXt9u6WIYTU
 EOK/YOV+16ah1UKJoABmyB3IooXCj6oJmKCq71iviTUc/n4soQ8ou4F71QG1r51qVM3o
 m2wmULGU7CC+2UZeaFywAd7EDHv/BhfMgPyZMaA6WGTG9eGzhohXVDXB8pA4KJU+uJEp
 Y7YAuSrbuNzwa8wJ6eoAiCPBXhchYSBEf9q7wm4IWjG46Iypw1dd/Gdb1ait60ej7cGq
 RcvCGGyYLDADJmpZpT0fGNz+mg7/kVWybhffL95VOiLrOJD5Mtbo2VR7BrE1HF2c3bUz
 c7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Nj/3gkFpbOs8TwYJH6jtpLzU/5n2yTiUnG69zoLMmRY=;
 b=R/6KMUwgVwGvjrEPf9oBWV7m3jfKdF8axhg9MJ9shkfXXrC5ipdt36athGmIwUCgTP
 ohrHzjoaEKqe4qHnKXcQIbg773uJzK4Hk7Tn4HUcFOQnalDnX6oM5lIZvQy42y6ea8lJ
 KICMigmwUNDrTIj/1NeOWwsoaiHmK++JR28ATYYCfYoE2e82z5iLAeDptQ4CfW2BLQ5Z
 v8XrYylUfD36Do8HeWg48pYAy/iyGpacNPphdXSuVjaMtsbH0kDez0CY6b54S8qk2R3t
 ZZdAq/yJaCP9B1sKFTTRzNmcdHx5VutLo7XbKVpywbMjjfRBW/zYaYSd83gFlN0EvnnO
 be9g==
X-Gm-Message-State: APjAAAWJ+yCF5O2FgjnWB7Kuff9TbT294WFK7nLUMWyry1hJXYezDceU
 CLEInx1NGPa0u9mC8nG4w4c=
X-Google-Smtp-Source: APXvYqyH8+m3SiHlSWz1oreEGq5P1R0Ctjbe5y1tP/RvYuh+7FEST3gsLwJwYp+LaRjpdoFD47a8WA==
X-Received: by 2002:a17:90a:21d0:: with SMTP id
 q74mr12981198pjc.12.1562159920457; 
 Wed, 03 Jul 2019 06:18:40 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id s66sm3981430pgs.39.2019.07.03.06.18.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 06:18:40 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Date: Wed,  3 Jul 2019 21:18:31 +0800
Message-Id: <20190703131831.26013-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Fuqian Huang <huangfq.daxian@gmail.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] [PATCH 29/30] sound/pci: Use kmemdup rather than
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
 sound/pci/echoaudio/echoaudio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index b612a536a5a1..35bd3e7c8ce1 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -2189,11 +2189,10 @@ static int snd_echo_resume(struct device *dev)
 	u32 pipe_alloc_mask;
 	int err;
 
-	commpage_bak = kmalloc(sizeof(*commpage), GFP_KERNEL);
+	commpage_bak = kmemdup(commpage, sizeof(*commpage), GFP_KERNEL);
 	if (commpage_bak == NULL)
 		return -ENOMEM;
 	commpage = chip->comm_page;
-	memcpy(commpage_bak, commpage, sizeof(*commpage));
 
 	err = init_hw(chip, chip->pci->device, chip->pci->subsystem_device);
 	if (err < 0) {
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
