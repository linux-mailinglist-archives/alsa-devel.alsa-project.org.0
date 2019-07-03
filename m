Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 126005E93C
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 18:35:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CFAE16A6;
	Wed,  3 Jul 2019 18:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CFAE16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562171737;
	bh=6s9286VBCiVvVw47gQlDT+PyyzvxwNVKAN/p+so7m0g=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t0nWlmr8sN9K1VtTtZj9UBj0w/HYEtifVOGAsDZi5R1ntjMOqGiuyEiVWGToJbEn9
	 TMOmzqPh/EiIMmelLMR0fsOVzOBMeAlnrBnwQc1AXOOTBkL/LJeIKeBixFy025c65N
	 gn6s/pYb07nbe6qPAC+v7SpookaHE5tX1UikLrxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0BBEF8011E;
	Wed,  3 Jul 2019 18:33:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6A96F8011C; Wed,  3 Jul 2019 18:33:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84DAFF800EA
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 18:33:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84DAFF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SuR+z0zE"
Received: by mail-pl1-x644.google.com with SMTP id b7so1532208pls.6
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=U7KSbZIhaI28wnIT5bzgBGt1Q6Og12wRpCuvNg/mCho=;
 b=SuR+z0zEL42DlQqsaZg4I77ZHO23CdkuuS0IYMLMM5r1xCGUmMXrQGfULOJS0e3C5x
 LL1OFtttNT+fGHqqnAhYDpGJ1nriG+ZdxgKfYIXHSQCz5kh2VGtkWgYdECgRGmPdiSIP
 joM+GMZO1KRAa/T8dJGAcLRwrr7gAD2d4WCb1ylDNsvVb/yvjXMWhTlD6h0S1dvbRG6U
 OVmaqQhjb9rHFunHzdTLAfkNZknlE0NvnveoqT9NbTmlgJJQU8rDNFCrZ48NsDQ75fhm
 B34cJJeuDMLJx2EocFIKZK0OhsYnXbqSvp4/9gOy/9wvxMD2WDxDXEkOSvHbhIa4Bu7s
 rIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=U7KSbZIhaI28wnIT5bzgBGt1Q6Og12wRpCuvNg/mCho=;
 b=jfTfO1bm8guWR4caKVGnA10H2rG19YIJrfQlRAYdkbwxzTYMIvrVTbengkjUdig6JE
 3M2F05yX5Cp4mDO71e7Bn28aKx+iDj4eK0TfDfZNLMnD7BcnFYI7om6koBDXAcXP/soj
 L4OIdfNOySRPw3JHM3cHKpi6xVZtFrKDbWZT/uXwV7OPnYOEVTzzA2SCSqg552+fFHOQ
 8G6cAdrSO7EUUDPbv9EBpNRpd8r+Ch10aw/as+EfekRs4U/+xYxGagOUNobZyx3lT2Ov
 LHVc8sAffSJQ04bCbKsvHBWcW9jkDkfLq4Y6dQhgvgFV9qZn1FNpaLsDZEvLwp0XNort
 TE5g==
X-Gm-Message-State: APjAAAVeh5PCWDUrilIh5P0VhiuQ6aaRkoK5ZQAUawAI1TkmA2CdAX/2
 3cB6fV+36UcFTVQ1c/h8yl0=
X-Google-Smtp-Source: APXvYqwbrzW2FI+ZK5kK9MhgSRlCP5sMz7ugl/FEXCALhFLjfcVqRMbBxoh61G97a73wSChRTzwoOQ==
X-Received: by 2002:a17:902:8c83:: with SMTP id
 t3mr42878572plo.93.1562171583217; 
 Wed, 03 Jul 2019 09:33:03 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id a18sm2319954pjq.0.2019.07.03.09.32.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 09:33:02 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Date: Thu,  4 Jul 2019 00:32:51 +0800
Message-Id: <20190703163251.1075-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [alsa-devel] [PATCH v2 35/35] sound/soc/intel: Use kmemdup rather
	than duplicating its implementation
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
  - Split into two patches

 sound/soc/intel/atom/sst/sst_loader.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

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
