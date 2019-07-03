Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B18D45E932
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 18:34:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29F9F16AC;
	Wed,  3 Jul 2019 18:33:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29F9F16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562171651;
	bh=fBw14G8E2lySAJeoFihkPc0Sb7OnYkk0jKXKhR4Y3Oo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z9pp+nhNL9SQxFZTUM/WMNkBnz52YzdD290Y1O9SMyK1HnP9KmUoD9CFwdh3Xb51n
	 cexSNXLCkmz/aqpkvozyoc8cEJifszxwGBkboy/gYovZVa4vlqyFtp/pePwEgCVrHf
	 A9oXJ1n/gbMqQWmqIYFy9+eT0cWG+6MlwlnfNSgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 341A2F80058;
	Wed,  3 Jul 2019 18:32:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6577DF800EA; Wed,  3 Jul 2019 18:32:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F04FF800E8
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 18:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F04FF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vJUvklVE"
Received: by mail-pg1-x543.google.com with SMTP id g15so1514912pgi.4
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 09:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MCqMV61NT0BMmX6Fho6eWqPzt3K0aDZuWTbDCpVsXg4=;
 b=vJUvklVEWOje9plOQWmkgMd6LPxQbDPJiXUs7nd/tN99P4Fgce3N04lgxpoh2kvBde
 2Fwgt6TDdRpNjRxC2bNiJAn+mldjNvG8EoYiYLY88avJySuQiMuiV5e+52EbkBjbWqos
 iLdsSmcjump8t6f/u/yZJgTN4cIGxTWqIztSWthJTNriyvvAqwg6/zXwqE7z4/TJD7bU
 9tdy+9+WNRlojHWJBg/1F/BfaCDM0UGmvQ2h10e/p0SGrP/dWOQVEwu6gFRb80mfF8nJ
 ta+djES2kNC9DWqi9irBzFZmndX5aiu1AEIm4aXIt8Q+3c8HYlZby/pun8LKo0bXC2a6
 QI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MCqMV61NT0BMmX6Fho6eWqPzt3K0aDZuWTbDCpVsXg4=;
 b=jZ6TVUWHezvIt822MP6RvnHvCBp+aoRsBdd/kLomPiPpAKxtlHdp4PrX9YMX7S40pC
 XTbPZGAL5L2sn5wOWpt+aCBYpkbyhaCJQ6Vwetc0qXD8VVXhzZnUgrR5L6/IUnD7l2L/
 w7910vAUwgFwABNHJItUhauab+hMne1WX6eFrfrUw+4NJlzd+i5JOOn1YoYBLCP4gmc7
 9mwJ1RYhs+ocLvnOZmbRU3pQO6DMmi32lRG+OTSthDoqFtuj2/ZKrfadxGhyYar1yLXC
 LH5hXSu52jXYsuTV6NvffFEPPuAPQogGCupJiVbd04MMkJ6uJ4w86w9XDDOPOR3yYERK
 uSBA==
X-Gm-Message-State: APjAAAWm5OJXaV4h3hHP3sJV8jN7H2+UnUDBlmKkapAXWxRwu0I0FQv2
 ivkHXrj9ZTlpzZ5OHYPAbAk=
X-Google-Smtp-Source: APXvYqx9GpVL2Bu58gTxRuCwso/86Y6z+4rkZRsGNZDYLI0KH5vJXcyuP5jqo5pqwCu+oDVe42pwGA==
X-Received: by 2002:a17:90b:8cd:: with SMTP id
 ds13mr13034487pjb.141.1562171538615; 
 Wed, 03 Jul 2019 09:32:18 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id o12sm2270041pjr.22.2019.07.03.09.32.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 09:32:18 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Date: Thu,  4 Jul 2019 00:32:10 +0800
Message-Id: <20190703163210.983-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Fuqian Huang <huangfq.daxian@gmail.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] [PATCH v2 33/35] sound/pci: Use kmemdup rather than
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
Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v2:
  - Fix a typo in commit message (memset -> memcpy)

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
