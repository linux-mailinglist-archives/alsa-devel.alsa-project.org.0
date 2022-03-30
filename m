Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9225D4ECDCE
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 22:22:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33A361A44;
	Wed, 30 Mar 2022 22:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33A361A44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648671745;
	bh=JmxjxkctsBbCt8FQmgaxOp19DTK3oUUVnv7oCGuBITA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tkjtuoYnajlSMD6oxa3PR++4zG2eaX6g6DvsR8ueHKwkGev+e36AsvMlmUzXDQhEZ
	 VHo9M0lAlxorB4lFGpl66e5DFZq1D5hdHVJ3uyvjqF5jI07eqckelB4XVPVJJyZGUd
	 aSHYh+N+LClk19bNX3RLV+0bcua2l8pBlnaxOtvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB4BBF8052D;
	Wed, 30 Mar 2022 22:19:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45886F80155; Wed, 30 Mar 2022 22:19:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB781F804B4
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 22:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB781F804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PiwsU77I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648671583; x=1680207583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JmxjxkctsBbCt8FQmgaxOp19DTK3oUUVnv7oCGuBITA=;
 b=PiwsU77Irk5qsLo6iQ4xf1X5eXhj9nln8vpuJkQtJbr25yG69oL3Z+oh
 cNTBwczbCCgM0IqVFI5kG9OfYgFqzg6oNLslU9xiXiSTQoNNP/UTfHG3I
 lhJxtWXmMg688zuTBk6YC5YIVS8bhIBFNXGpi/YqaZLPSv1nVAj1xm9BD
 6z2NWILhWEuu6Q1QZabyEMyK+V+xzV1BlFmRUkGM7TdVREJeeWqjuS9wD
 StIrpfrLBQRz/9m3yx0RBsC8CNq9i6gdveMnh6fWc6A0yrYMZjivMXrnH
 0c7HV5PMx2wzov34m2pr7d4+lY3yZPgoLlxXZq2HWKZXZ7jmfYEphCBDn A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322819829"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="322819829"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="522045031"
Received: from ggunnam-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.195])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:37 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/11] ASoC: SOF: Drop support for mapped control data
Date: Wed, 30 Mar 2022 13:19:20 -0700
Message-Id: <20220330201926.1330402-6-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
References: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@intel.com>, broonie@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Access through mmapped memory is not supported and it is explicitly
disabled with scontrol->readback_offset = 0; when a control is created.

Remove the dead code and the confusion around this feature.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c       | 22 ----------------------
 sound/soc/sof/sof-audio.c |  3 ---
 sound/soc/sof/sof-audio.h |  1 -
 3 files changed, 26 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 166d4906698b..c722ca0b00a6 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -823,7 +823,6 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol, bool set)
 	enum sof_ipc_ctrl_type ctrl_type;
 	struct snd_sof_widget *swidget;
 	bool widget_found = false;
-	size_t send_bytes;
 	u32 ipc_cmd;
 	int err;
 
@@ -847,27 +846,6 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol, bool set)
 	if (!swidget->use_count)
 		return 0;
 
-	/* read or write firmware volume */
-	if (scontrol->readback_offset != 0) {
-		/* write/read value header via mmaped region */
-		send_bytes = sizeof(struct sof_ipc_ctrl_value_chan) *
-		cdata->num_elems;
-		if (set)
-			err = snd_sof_dsp_block_write(sdev, SOF_FW_BLK_TYPE_IRAM,
-						      scontrol->readback_offset,
-						      cdata->chanv, send_bytes);
-
-		else
-			err = snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_IRAM,
-						     scontrol->readback_offset,
-						     cdata->chanv, send_bytes);
-
-		if (err)
-			dev_err_once(sdev->dev, "error: %s TYPE_IRAM failed\n",
-				     set ? "write to" :  "read from");
-		return err;
-	}
-
 	/*
 	 * Select the IPC cmd and the ctrl_type based on the ctrl_cmd and the
 	 * direction
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index b2f009a0c5b7..49fdfe06a9a3 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -16,9 +16,6 @@ static int sof_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_control *
 {
 	int ret;
 
-	/* reset readback offset for scontrol */
-	scontrol->readback_offset = 0;
-
 	ret = snd_sof_ipc_set_get_comp_data(scontrol, true);
 	if (ret < 0)
 		dev_err(sdev->dev, "error: failed kcontrol value set for widget: %d\n",
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 7f15b3bc8196..4a8cd7f2a0eb 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -247,7 +247,6 @@ struct snd_sof_control {
 	int max_volume_step; /* max volume step for volume_table */
 	int num_channels;
 	unsigned int access;
-	u32 readback_offset; /* offset to mmapped data if used */
 	int info_type;
 	int index; /* pipeline ID */
 	void *priv; /* private data copied from topology */
-- 
2.25.1

