Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D304ECDCD
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 22:22:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14E221ABE;
	Wed, 30 Mar 2022 22:21:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14E221ABE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648671732;
	bh=219w+WAhFOLOTuSWfHn8ygxlqsJUkzHLHdtOW7b9fFY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MPuanJmwXjhPE2aQ/q2o4/2uN2tAJLnnYZY1YmE9lUNF8SuahSqUw7wTwAA+r+tqS
	 xjAuSY1+djwpHGCbrxg6bjcti33ZcVzi1Yc2mp+J9XRwT5ySlAXyCcFrldys+KR5XL
	 DR5lsvQz0O5KtUV7TZ+fqXfCz29jx7Z04/e8tFrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 166B5F80525;
	Wed, 30 Mar 2022 22:19:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36E5CF80254; Wed, 30 Mar 2022 22:19:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97B37F8025A
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 22:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97B37F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="clJh/wdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648671583; x=1680207583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=219w+WAhFOLOTuSWfHn8ygxlqsJUkzHLHdtOW7b9fFY=;
 b=clJh/wdMRyXQjfmQJF9SbP6ANPLMBOk1D94EKByMkqmmJvtOb65F5+he
 bn8WE25R1nJ2co54BheGPc+ZHUug6QeJVb9Y57cUOuXTdQgOquVw8w6F0
 AtDGj0GwGbAQqW/B6P0iuABRWxPm0D1Z7prFs22RfeK/pJwIv55350Kc/
 VoCK/2AYlpX20ufQRhkHbEyT4jMhDBBcFzgGOf8WqGRWLqUtfozMxiLus
 E0emZj/Y0Z0x0SGjdRrl1oCQCnq4jRXwYLXs6pzmLgsLUvGImy8sldP8M
 i2P3Sl+azK4b//JEM+nD77QZapIjOyAqpxozBt4mpnkS5umdWl98W3SOT g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322819826"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="322819826"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="522045022"
Received: from ggunnam-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.195])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:36 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/11] ASoC: SOF: ipc: Add max_payload_size field in struct
 snd_sof_ipc
Date: Wed, 30 Mar 2022 13:19:18 -0700
Message-Id: <20220330201926.1330402-4-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
References: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The max_payload_size is an IPC level constraint. Add a new field,
max_payload_size to struct snd_sof_ipc and set it during IPC init.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c      | 2 ++
 sound/soc/sof/sof-priv.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 5f5753608c79..af2efc1c8436 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -1005,6 +1005,8 @@ int sof_ipc_init_msg_memory(struct snd_sof_dev *sdev)
 	if (!msg->reply_data)
 		return -ENOMEM;
 
+	sdev->ipc->max_payload_size = SOF_IPC_MSG_MAX_SIZE;
+
 	return 0;
 }
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 93de5547b952..f75c6f76297e 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -394,6 +394,9 @@ struct snd_sof_ipc {
 	/* disables further sending of ipc's */
 	bool disable_ipc_tx;
 
+	/* Maximum allowed size of a single IPC message/reply */
+	size_t max_payload_size;
+
 	struct snd_sof_ipc_msg msg;
 
 	/* IPC ops based on version */
-- 
2.25.1

