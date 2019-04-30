Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B65AF1C7
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 10:08:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 135B6166B;
	Tue, 30 Apr 2019 10:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 135B6166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556611696;
	bh=RaNbiYYzIqEvROvLCPHS8Cjsp8VYGXCuEngfXEey6kw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SgRs8OcYwCrZq1IcpFUb9XtXOeYZHkTzwAQrdR/B5DEh6h8KJZhm+8TgrejEbE2uI
	 SBbRWTHKxV7KKIIecbV+vtXfw0uyDGnn1qhDXalpUteAT1xlZa8rFKOUa9AN4bN2Ct
	 jxyzh4XrVVA3OZDJ/veMjU4FxRWeBr40T4ebQ7tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F0A9F8971B;
	Tue, 30 Apr 2019 10:05:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EAA7F896E3; Tue, 30 Apr 2019 09:50:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FD21F8962C;
 Tue, 30 Apr 2019 09:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FD21F8962C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="iZs3jH4J"
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
 by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 44tYb70M9vz1XLDR3;
 Tue, 30 Apr 2019 09:49:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=2015-01-21; t=1556610595;
 bh=j9ghyqlcIsq1VvBEl8XAwe9fmi0UKdHNOBlJj7mLn+I=; l=10;
 h=From:From:Reply-To:Sender;
 b=iZs3jH4JPBjhblPYfuJcXLx5MQQe23XN9SyIJSG2cQjAgpo35UNg/tKpgf/5Tw6XI
 JjYD3KAiGOa6vK0WJ+sjXxr6I23HF9xyIq7TujVfxxmBynzh+s1GHTF1DVUMMqGRAi
 1gE0NHlw8jMR5e7kQp90N7Ly4Tfw2ADWsMtLXnlM=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
 by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 44tYb7044Yz6CjQSQ;
 Tue, 30 Apr 2019 09:49:55 +0200 (CEST)
X-AuditID: 0a3aad10-057ff70000007f88-62-5cc7fe2202b7
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id 47.07.32648.22EF7CC5;
 Tue, 30 Apr 2019 09:49:54 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
 by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 44tYb64P3YzR7N;
 Tue, 30 Apr 2019 09:49:54 +0200 (CEST)
Received: from localhost.localdomain (10.47.103.61) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5;
 Tue, 30 Apr 2019 09:49:53 +0200
From: <vanitha.channaiah@in.bosch.com>
To: <patch@alsa-project.org>
Date: Tue, 30 Apr 2019 13:08:40 +0530
Message-ID: <1556609923-14093-2-git-send-email-vanitha.channaiah@in.bosch.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556609923-14093-1-git-send-email-vanitha.channaiah@in.bosch.com>
References: <1556609923-14093-1-git-send-email-vanitha.channaiah@in.bosch.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.103.61]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Sf0wbZRzGee/646XybtejdV8KM3jLmBKH4HSCLMZoljCiYxr/2dJkHnK0
 jf2Bd4UAxgQNk9GRsZlaCw5SlxCXwbSQOGCZqdxQ4saQsVllUwyKuh+AktbMbeq8crD2D/+5
 fO/5Pp/3ee/JYZoN6y3Y4fYKopt3cjqDxvDUifWbuX/HrIXRUwXFly7IVPGJj5q0xUcDHdQz
 dFk49raurLOlV7+L2mPYViU4HXWC+OjTrxjs7zQv0TWyqX7o+BG6CXUZfSgdA/M4zF5u1/iQ
 AbNMkIKRX3v0PoSVlz4E/bSqK+Pd28N0AtAxeTAa/WPZY2JyoH2KJGSaEeHwB2EqMWcq87vf
 frZs1zAbYTLevjwTZif0h7q0au4DMD3RuqynMxUwHfXr1NidMHU+S7Ub4auOOY16PMDI1au0
 iuaCPxrUHkJMZ4qtM8UWQtRxZK4WCutcT5YUFReIlYLUWFhU8KrHNYDUCpkhNHy2WkYMRlwG
 cS2OWVktXyc1uGT0BKY4M6luVKQ1lZ6qBjsv2feKtU5B4iwkZ7Lcymbek6XaSpdDkhwet4wA
 05yJlI19YWVJFd/QKIgeFZNRNtZw64gNV1hZxsZ7hdcEoUYQV7elGHNASu4ogUZRsAn11Q6n
 d3XNrScoLS2NvT91kxpL4XQZbcEZSvbLiSOIVMO7JIdtBc9ScXZVTaJn0XN45OZsF81q3B63
 YFlH6L8Vnkk47bXuezew5BDgRq2sOWWRPOU6mkZKh5lEn4AzlD81mQ0kO1GXcUVMQo/1KAwT
 xdA99CeCK0cPaiH+6WkdTJ3q1MOtCx/rIXg4gGG8+5ABji1duw9iLaNrIXJunIHgtXlW8UXM
 EFzsAOibnciGGV88B460ns+FT5Zu5ELkvZsPQtvvV/LgzPz4QzB/7uLDEPutKR/GvxnIh5n5
 W49A/9yZzTAT/0l5+PcVwHddkUJY3O8vUSy3SyB0wFcKF79vfva6UiylFLu3+8tEsV7e+z/F
 rqjJr7M0oZ7tg/65l8j2hYk9uvwd24bX2Pt3Oy69UXFs8nO59PXy59+8IWnCur/KP+yLxQPy
 1I79I9G1kYNtSz8HfjQNzs3eXbjzlkFPXsz7YaO5ecDwT93Jfb31vT0toRdMAxsu44xY6P1f
 2rZk5U53h9O3brI4D3wdH/TY9BHX1oCxVTu5YOQ0kp0vyqdFif8Ps00rvUMEAAA=
X-Mailman-Approved-At: Tue, 30 Apr 2019 10:05:53 +0200
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
Subject: [alsa-devel] [PATCH 2/5] pcm: dshare: Added "hw_ptr_alignment"
	option in configuration for alignment of slave pointers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>

snd_pcm_wait() is waiting for longer time more than two periodic size as
avail is less than avail_min by few frames.
This is because the hw_ptr read from the kernel during snd_pcm_start()
is not period aligned which is ahead of few frames.

These changes are adaptation of same fix as given for dmix
commit ("6b058fda9dce8f416774ae54975f5706f3f5a6da")
("pcm-dmix-Add-option-to-allow-alignment-of-slave-poin.patch")

Signed-off-by: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
---
 src/pcm/pcm_dshare.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c
index f135b5d..45e2597 100644
--- a/src/pcm/pcm_dshare.c
+++ b/src/pcm/pcm_dshare.c
@@ -333,16 +333,16 @@ static int snd_pcm_dshare_reset(snd_pcm_t *pcm)
 	snd_pcm_direct_t *dshare = pcm->private_data;
 	dshare->hw_ptr %= pcm->period_size;
 	dshare->appl_ptr = dshare->last_appl_ptr = dshare->hw_ptr;
-	dshare->slave_appl_ptr = dshare->slave_hw_ptr = *dshare->spcm->hw.ptr;
+	snd_pcm_direct_reset_slave_ptr(pcm, dshare);
 	return 0;
 }
 
-static int snd_pcm_dshare_start_timer(snd_pcm_direct_t *dshare)
+static int snd_pcm_dshare_start_timer(snd_pcm_t *pcm, snd_pcm_direct_t *dshare)
 {
 	int err;
 
 	snd_pcm_hwsync(dshare->spcm);
-	dshare->slave_appl_ptr = dshare->slave_hw_ptr = *dshare->spcm->hw.ptr;
+	snd_pcm_direct_reset_slave_ptr(pcm, dshare);
 	err = snd_timer_start(dshare->timer);
 	if (err < 0)
 		return err;
@@ -364,7 +364,8 @@ static int snd_pcm_dshare_start(snd_pcm_t *pcm)
 	else if (avail < 0)
 		return 0;
 	else {
-		if ((err = snd_pcm_dshare_start_timer(dshare)) < 0)
+		err = snd_pcm_dshare_start_timer(pcm, dshare);
+		if (err < 0)
 			return err;
 		snd_pcm_dshare_sync_area(pcm);
 	}
@@ -547,7 +548,8 @@ static snd_pcm_sframes_t snd_pcm_dshare_mmap_commit(snd_pcm_t *pcm,
 		return 0;
 	snd_pcm_mmap_appl_forward(pcm, size);
 	if (dshare->state == STATE_RUN_PENDING) {
-		if ((err = snd_pcm_dshare_start_timer(dshare)) < 0)
+		err = snd_pcm_dshare_start_timer(pcm, dshare);
+		if (err < 0)
 			return err;
 	} else if (dshare->state == SND_PCM_STATE_RUNNING ||
 		   dshare->state == SND_PCM_STATE_DRAINING) {
@@ -755,6 +757,7 @@ int snd_pcm_dshare_open(snd_pcm_t **pcmp, const char *name,
 	dshare->slowptr = opts->slowptr;
 	dshare->max_periods = opts->max_periods;
 	dshare->var_periodsize = opts->var_periodsize;
+	dshare->hw_ptr_alignment = opts->hw_ptr_alignment;
 	dshare->sync_ptr = snd_pcm_dshare_sync_ptr;
 
  retry:
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
