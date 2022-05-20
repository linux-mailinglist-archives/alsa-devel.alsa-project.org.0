Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1B552F4F8
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 23:21:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 727221726;
	Fri, 20 May 2022 23:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 727221726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653081663;
	bh=SDCxCQyAr+JHAOYb+FdHmql9m6DMqjDm7oPefgqcknY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nniv7OaqMqBx3PKim3VZrxhFf3Qp0YbOeUvbAEo8TqLCIPPlKdvK7I5b5ynbmMJZw
	 l8g6q2fpth8pNIk8MZvTdzkdyujCFM3IZBylqe0Vi0WGegwnAQQzc6HyzLIOxr4TF/
	 U1tTAhgTlxdrQQnXYaS5KEm+0+35lJo40UQmvKqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60AD4F80548;
	Fri, 20 May 2022 23:17:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47D70F80534; Fri, 20 May 2022 23:17:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FA4FF8051C
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 23:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FA4FF8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Mv9C2Ko7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653081462; x=1684617462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SDCxCQyAr+JHAOYb+FdHmql9m6DMqjDm7oPefgqcknY=;
 b=Mv9C2Ko7yr7wZjIIIL2001M6QZFUXciYK1ZgFop7nqpFRd2ikn08xJCe
 5cAGAwWVMgGsrEkk8plppJzxcmZcVDAX1su23ablJ3pRxjxNPocUskt3R
 wMsBO8GQFdxufbo1PrwM2XmybmHx293Lgc4O5mPaC+vG+aRauJiyIJCG0
 u5L6nhPqo8eDHUlaK+fufkrCJ3hiR8u6iQjdQx2TXSWxQojLajr11lTma
 jxZS/cA2E3ht539r7mFe2t6yWev1IvQq9Vue+Y8nmA5XF1F3wPCBWczH+
 4n3FHkrKKCEHVZvYBXaI6DZkgLJIru3K1lSzUBRYgi+hEBqlXFyIp1mQH A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="270324236"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="270324236"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="674796027"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.181.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/16] ASoC: Intel: atom: sst_ipc: remove useless
 initializations
Date: Fri, 20 May 2022 16:17:10 -0500
Message-Id: <20220520211719.607543-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
References: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

cppcheck throws invalid NULL dereference warnings but there's indeed
no need to initialize a loop variable or initialize to NULL before
allocating memory.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/atom/sst/sst_ipc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_ipc.c b/sound/soc/intel/atom/sst/sst_ipc.c
index 78ea67c7a1281..4e039c7173d8c 100644
--- a/sound/soc/intel/atom/sst/sst_ipc.c
+++ b/sound/soc/intel/atom/sst/sst_ipc.c
@@ -28,7 +28,7 @@
 struct sst_block *sst_create_block(struct intel_sst_drv *ctx,
 					u32 msg_id, u32 drv_id)
 {
-	struct sst_block *msg = NULL;
+	struct sst_block *msg;
 
 	dev_dbg(ctx->dev, "Enter\n");
 	msg = kzalloc(sizeof(*msg), GFP_KERNEL);
@@ -63,7 +63,7 @@ struct sst_block *sst_create_block(struct intel_sst_drv *ctx,
 int sst_wake_up_block(struct intel_sst_drv *ctx, int result,
 		u32 drv_id, u32 ipc, void *data, u32 size)
 {
-	struct sst_block *block = NULL;
+	struct sst_block *block;
 
 	dev_dbg(ctx->dev, "Enter\n");
 
@@ -91,7 +91,7 @@ int sst_wake_up_block(struct intel_sst_drv *ctx, int result,
 
 int sst_free_block(struct intel_sst_drv *ctx, struct sst_block *freed)
 {
-	struct sst_block *block = NULL, *__block;
+	struct sst_block *block, *__block;
 
 	dev_dbg(ctx->dev, "Enter\n");
 	spin_lock_bh(&ctx->block_lock);
-- 
2.30.2

