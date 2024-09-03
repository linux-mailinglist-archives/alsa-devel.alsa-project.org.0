Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C09BC96C189
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 16:59:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C92E993A;
	Wed,  4 Sep 2024 16:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C92E993A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725461945;
	bh=G8HaXciLzp4DpHHJ4lF1nDYZc6owSxrwtcIJdBGOaow=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cyi3TDUyaTCP2eSAhSwBF6OjSXn5s69CvxeTJhVrVxP0Kmwhtkbj/Z1c1advSgdic
	 dZLUqiF3zCXIlQwRxTnhxiG/xSFeJ56Wk3tQj4nkZA/pOrCmjNmhwy6GKqbGkxLUDL
	 CqIqk+Ku5jBo3q2nC9/KB6H7qG3MgXkEy6pVURtU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59E3DF805C2; Wed,  4 Sep 2024 16:58:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11A93F805BB;
	Wed,  4 Sep 2024 16:58:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE87FF80199; Tue,  3 Sep 2024 16:32:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 272DDF800E9
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 16:32:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 272DDF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YiCLJbkM
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2059204f448so12614805ad.0
        for <alsa-devel@alsa-project.org>;
 Tue, 03 Sep 2024 07:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725373933; x=1725978733;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YIjSe+i6rXNVHkXPvRaS+Rvq2j7U9uYFImded3/VtFE=;
        b=YiCLJbkMBn0Qi3QPmVwHHJkCZBzxHf+adc5cxtQsiassul1CRkpSmH1HMgkr+qE9oy
         wxyi9kYqGVGrvV09bzVdBMj3UuqZrZNKf+rWPZu6oxio+Lf0gxgSjfPLKK5d19otllsZ
         4YfWJ8FQz0+kEAFKRWX1R35OW1NQKPecoXbNSP3JV8w27cKvWYFCof0YjwwvNzKu5/5g
         1/CWjeTj9I952gAooLLe1RX8kexHVqMMNkS4izIXeQRy/iSmwuXSDnrKahPsHMMfPawO
         Zs0BVKLsAjL1MtRQzlOuGKsav9M+N86FqNhxy1trVWnXdMHlnN+c08+aQKFygXPLFeQE
         qEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725373933; x=1725978733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIjSe+i6rXNVHkXPvRaS+Rvq2j7U9uYFImded3/VtFE=;
        b=Bu9BpcLFzQFI6zDlQyKzSX7Ny028ABr1irWpZ177L3rTQnojWS4mfiMQS/AofL72pN
         BMZEaXYNRynHakP0wHknCgacorISE6wsScn4Qag+w/W5lkKXrcHFqMr7ajByDEblJcKg
         x+fus/0AEERrM+psk54sS4a5ZM2xsEjBKqhnfnW5VcQsq6bNoOhI1lcIzTfFvyhKsUfg
         xROSO+F3uhDeaEIoK+oQMlscMcMgu7BJuXWG8XjkmUqhg9tHDePqB6VWxSkX/hzdD1gI
         u2pYqHFXktVljXc5voThTyUBrWQuwv59ZFTUcYR0sT2GkXfZdZh73tldXHcLO3obUPfy
         lftA==
X-Gm-Message-State: AOJu0YxmjaIML0ed8tFXuO8DWYmAdtavy8flzt9SpV2i9xXexIGgms0u
	ry1zZzI2+fGLB88jnOGvV+TmkcAFqeVXrnTtL09lsEPeWgs0Vr7m
X-Google-Smtp-Source: 
 AGHT+IG66vfhTieaPqKoMJl/Vz6d3RJjOUslhRVu7JOgNiEKw3CvpRH/KGu3jzUxEh2G12ZtOwcwBA==
X-Received: by 2002:a17:902:d2ce:b0:202:3e52:e124 with SMTP id
 d9443c01a7336-2054451b9f9mr90570385ad.31.1725373933064;
        Tue, 03 Sep 2024 07:32:13 -0700 (PDT)
Received: from fedora.. ([106.219.162.224])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-205152cd4dbsm81525575ad.64.2024.09.03.07.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 07:32:12 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] ASOC: Intel: fix parenthesis alignment and space after cast
 coding style issue
Date: Tue,  3 Sep 2024 20:01:13 +0530
Message-ID: <20240903143113.18382-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: riyandhiman14@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KVJQ6OXXG2UXHGFYSBYYZ24JN64IR45A
X-Message-ID-Hash: KVJQ6OXXG2UXHGFYSBYYZ24JN64IR45A
X-Mailman-Approved-At: Wed, 04 Sep 2024 14:58:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KVJQ6OXXG2UXHGFYSBYYZ24JN64IR45A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adhere to Linux kernel coding style.

Reported by checkpatch:
- CHECK: Alignment should match open parenthesis
- CHECK: No space is necessary after a cast

It has no functional changes.

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 sound/soc/intel/atom/sst/sst.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index e0357d257c6c..38d29d545b52 100644
--- a/sound/soc/intel/atom/sst/sst.c
+++ b/sound/soc/intel/atom/sst/sst.c
@@ -50,7 +50,7 @@ static irqreturn_t intel_sst_interrupt_mrfld(int irq, void *context)
 	union sst_imr_reg_mrfld imr;
 	struct ipc_post *msg = NULL;
 	unsigned int size;
-	struct intel_sst_drv *drv = (struct intel_sst_drv *) context;
+	struct intel_sst_drv *drv = (struct intel_sst_drv *)context;
 	irqreturn_t retval = IRQ_HANDLED;
 
 	/* Interrupt arrived, check src */
@@ -60,7 +60,7 @@ static irqreturn_t intel_sst_interrupt_mrfld(int irq, void *context)
 		/* Clear done bit */
 		spin_lock(&drv->ipc_spin_lock);
 		header.full = sst_shim_read64(drv->shim,
-					drv->ipc_reg.ipcx);
+					      drv->ipc_reg.ipcx);
 		header.p.header_high.part.done = 0;
 		sst_shim_write64(drv->shim, drv->ipc_reg.ipcx, header.full);
 
@@ -92,7 +92,7 @@ static irqreturn_t intel_sst_interrupt_mrfld(int irq, void *context)
 			size = header.p.header_low_payload;
 			if (sst_validate_mailbox_size(size)) {
 				memcpy_fromio(msg->mailbox_data,
-					drv->mailbox + drv->mailbox_recv_offset, size);
+					      drv->mailbox + drv->mailbox_recv_offset, size);
 			} else {
 				dev_err(drv->dev,
 					"Mailbox not copied, payload size is: %u\n", size);
@@ -114,7 +114,7 @@ static irqreturn_t intel_sst_interrupt_mrfld(int irq, void *context)
 
 static irqreturn_t intel_sst_irq_thread_mrfld(int irq, void *context)
 {
-	struct intel_sst_drv *drv = (struct intel_sst_drv *) context;
+	struct intel_sst_drv *drv = (struct intel_sst_drv *)context;
 	struct ipc_post *__msg, *msg;
 	unsigned long irq_flags;
 
@@ -146,8 +146,8 @@ static int sst_save_dsp_context_v2(struct intel_sst_drv *sst)
 	int ret = 0;
 
 	ret = sst_prepare_and_post_msg(sst, SST_TASK_ID_MEDIA, IPC_CMD,
-			IPC_PREP_D3, PIPE_RSVD, 0, NULL, NULL,
-			true, true, false, true);
+				       IPC_PREP_D3, PIPE_RSVD, 0, NULL, NULL,
+				       true, true, false, true);
 
 	if (ret < 0) {
 		dev_err(sst->dev, "not suspending FW!!, Err: %d\n", ret);
@@ -228,7 +228,7 @@ static void sst_init_locks(struct intel_sst_drv *ctx)
  * we are fine with using unsigned short as dev_id type.
  */
 int sst_alloc_drv_context(struct intel_sst_drv **ctx,
-		struct device *dev, unsigned short dev_id)
+			  struct device *dev, unsigned short dev_id)
 {
 	*ctx = devm_kzalloc(dev, sizeof(struct intel_sst_drv), GFP_KERNEL);
 	if (!(*ctx))
@@ -242,7 +242,7 @@ int sst_alloc_drv_context(struct intel_sst_drv **ctx,
 EXPORT_SYMBOL_GPL(sst_alloc_drv_context);
 
 static ssize_t firmware_version_show(struct device *dev,
-			    struct device_attribute *attr, char *buf)
+				     struct device_attribute *attr, char *buf)
 {
 	struct intel_sst_drv *ctx = dev_get_drvdata(dev);
 
@@ -302,7 +302,7 @@ int sst_context_init(struct intel_sst_drv *ctx)
 	ctx->ipc_reg.ipcd = SST_IPCD + ctx->pdata->ipc_info->ipc_offset;
 
 	dev_info(ctx->dev, "Got drv data max stream %d\n",
-				ctx->info.max_streams);
+		 ctx->info.max_streams);
 
 	for (i = 1; i <= ctx->info.max_streams; i++) {
 		struct stream_info *stream = &ctx->streams[i];
@@ -325,7 +325,7 @@ int sst_context_init(struct intel_sst_drv *ctx)
 	sst_shim_write64(ctx->shim, SST_IMRX, 0xFFFF0038);
 
 	ctx->qos = devm_kzalloc(ctx->dev,
-		sizeof(struct pm_qos_request), GFP_KERNEL);
+				sizeof(struct pm_qos_request), GFP_KERNEL);
 	if (!ctx->qos) {
 		ret = -ENOMEM;
 		goto do_free_mem;
-- 
2.46.0

