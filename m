Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0D9243FA2
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 22:07:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AB4F1665;
	Thu, 13 Aug 2020 22:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AB4F1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597349278;
	bh=4Va8InEbuQOz/LUHA0t1yB2ias8hxAnASXfJNRZsdP4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XTYSqrp8/ajuNGpHnL0mqk4694pInI/7b+eWTaVsqAt4Iv8dWZw/7nj3SqTruCbh1
	 GL9CQpVI3Q1E4T7m1ZjhJeTxIao9nfXu+5nro2MUgub+9OBDD+s+NYx1sy3i1lKKvg
	 ur7OYgC5WevABa2RN5Uq/wZRDsKUzZzotGGmqdec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74D1DF8031A;
	Thu, 13 Aug 2020 22:02:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4F20F802FD; Thu, 13 Aug 2020 22:02:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52633F800D3
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 22:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52633F800D3
IronPort-SDR: I8UwjMnqb63lAb/gRPEZX+n3Si3WiaBEmkeBH30pjqjwcj4sxxPPOxgvsV3F+mfcgJoI0K2nTU
 ECOFtYIotRHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="134374662"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="134374662"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:07 -0700
IronPort-SDR: KQ63HNzOG936VCxOwZTUNASsoPrQaATgLAsgl5jbei1krEb0jiE6RWeO4SkG/8wlTGySJgyWyG
 Qm0OjD9dosmQ==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="495506317"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/21] ASoC: Intel: common: (cosmetic) align function
 parameters
Date: Thu, 13 Aug 2020 15:01:39 -0500
Message-Id: <20200813200147.61990-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
References: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

Fix cppcheck style warnings, align headers and code and remove useless
prototypes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/sst-dsp-priv.h |  2 +-
 sound/soc/intel/common/sst-dsp.h      | 15 +++++++--------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/common/sst-dsp-priv.h b/sound/soc/intel/common/sst-dsp-priv.h
index 3d8765ce3e0d..9a760123b46f 100644
--- a/sound/soc/intel/common/sst-dsp-priv.h
+++ b/sound/soc/intel/common/sst-dsp-priv.h
@@ -344,7 +344,7 @@ void sst_fw_unload(struct sst_fw *sst_fw);
 /* Create/Free firmware modules */
 struct sst_module *sst_module_new(struct sst_fw *sst_fw,
 	struct sst_module_template *template, void *private);
-void sst_module_free(struct sst_module *module);
+void sst_module_free(struct sst_module *sst_module);
 struct sst_module *sst_module_get_from_id(struct sst_dsp *dsp, u32 id);
 int sst_module_alloc_blocks(struct sst_module *module);
 int sst_module_free_blocks(struct sst_module *module);
diff --git a/sound/soc/intel/common/sst-dsp.h b/sound/soc/intel/common/sst-dsp.h
index 604a80c5859b..d55014587415 100644
--- a/sound/soc/intel/common/sst-dsp.h
+++ b/sound/soc/intel/common/sst-dsp.h
@@ -268,15 +268,14 @@ void sst_dsp_ipc_msg_tx(struct sst_dsp *dsp, u32 msg);
 u32 sst_dsp_ipc_msg_rx(struct sst_dsp *dsp);
 
 /* Mailbox management */
-int sst_dsp_mailbox_init(struct sst_dsp *dsp, u32 inbox_offset,
+int sst_dsp_mailbox_init(struct sst_dsp *sst, u32 inbox_offset,
 	size_t inbox_size, u32 outbox_offset, size_t outbox_size);
-void sst_dsp_inbox_write(struct sst_dsp *dsp, void *message, size_t bytes);
-void sst_dsp_inbox_read(struct sst_dsp *dsp, void *message, size_t bytes);
-void sst_dsp_outbox_write(struct sst_dsp *dsp, void *message, size_t bytes);
-void sst_dsp_outbox_read(struct sst_dsp *dsp, void *message, size_t bytes);
-void sst_dsp_mailbox_dump(struct sst_dsp *dsp, size_t bytes);
-int sst_dsp_register_poll(struct sst_dsp  *dsp, u32 offset, u32 mask,
-		 u32 expected_value, u32 timeout, char *operation);
+void sst_dsp_inbox_write(struct sst_dsp *sst, void *message, size_t bytes);
+void sst_dsp_inbox_read(struct sst_dsp *sst, void *message, size_t bytes);
+void sst_dsp_outbox_write(struct sst_dsp *sst, void *message, size_t bytes);
+void sst_dsp_outbox_read(struct sst_dsp *sst, void *message, size_t bytes);
+int sst_dsp_register_poll(struct sst_dsp  *ctx, u32 offset, u32 mask,
+		 u32 target, u32 time, char *operation);
 
 /* Debug */
 void sst_dsp_dump(struct sst_dsp *sst);
-- 
2.25.1

