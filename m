Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BF3602B6A
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:13:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3725E751A;
	Tue, 18 Oct 2022 14:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3725E751A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095219;
	bh=u55hqlXJW8uYvmujppg6OWT/zzFqXGkS4BV7liCUg8w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MMuMeUmdVtFUIQj/oHKlwn127VGncwwRZJLs+VAz4u0m4ubKCGlHJqQIy4FJv1ZGE
	 MGMO+PgR0jUorBWyyKp0m4q7i3pK7nlPR4ZRztwO6zJvvtNZ8svjMqLglBM0dMXLvP
	 9clvA7GnnA4+R4+Ah+Fzkv8xmwi3RKWfLYAAPpl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DA02F805C0;
	Tue, 18 Oct 2022 14:09:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91B28F8057E; Tue, 18 Oct 2022 14:09:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 274D9F8056F
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 274D9F8056F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="b4vluRUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094966; x=1697630966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u55hqlXJW8uYvmujppg6OWT/zzFqXGkS4BV7liCUg8w=;
 b=b4vluRUGT3JcGkZcLm5FQ0PYLBzVv8pH6Ju8yMH7Jaxs18cqto5V+B6o
 Z5unczgeLlJLQLoexB/ewkn5CBVGibNtX9AV8w4uXMOJf466cElOlb3o/
 02+pLl/nTLgpsQk3qsx4oEBiFAdeKzowLLtucFy4kWNOmGlMzc2KGIdAw
 Eu92Dlf+AmkeYfgM8Nb1FGKYLPLHa8OnKNHLXzP3UcByT79vMxNWUgDKU
 LeMgz1pT/Gbbt0gv7up7uEOTBbPOKcVokm4waw/Kr5AE8fpgx0tyTectD
 yODV5lC60V5Ef72KBef6klkyidDPMCzEDgOGfVjHco7JdBc0lW2dm5TOU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293452946"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="293452946"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:19 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579757916"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579757916"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:11 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 07/19] ASoC: SOF: ipc: ops: Add support for optional init and
 exit callbacks
Date: Tue, 18 Oct 2022 15:09:04 +0300
Message-Id: <20221018120916.19820-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

Add support for IPC specific initialization (init) and cleanup (exit)
callback.

These callbacks can be used by IPC implementation to do basic
initialization and cleanup.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc.c      | 6 ++++++
 sound/soc/sof/sof-priv.h | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 6ed3f9b6a0c4..30781e808a02 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -200,6 +200,9 @@ struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
 		return NULL;
 	}
 
+	if (ops->init && ops->init(sdev))
+		return NULL;
+
 	ipc->ops = ops;
 
 	return ipc;
@@ -217,5 +220,8 @@ void snd_sof_ipc_free(struct snd_sof_dev *sdev)
 	mutex_lock(&ipc->tx_mutex);
 	ipc->disable_ipc_tx = true;
 	mutex_unlock(&ipc->tx_mutex);
+
+	if (ipc->ops->exit)
+		ipc->ops->exit(sdev);
 }
 EXPORT_SYMBOL(snd_sof_ipc_free);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 3d70b57e4864..ea6013ab1d4a 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -443,6 +443,9 @@ struct sof_ipc_pcm_ops;
  * @fw_loader:	Pointer to Firmware Loader ops
  * @fw_tracing:	Pointer to Firmware tracing ops
  *
+ * @init:	Optional pointer for IPC related initialization
+ * @exit:	Optional pointer for IPC related cleanup
+ *
  * @tx_msg:	Function pointer for sending a 'short' IPC message
  * @set_get_data: Function pointer for set/get data ('large' IPC message). This
  *		function may split up the 'large' message and use the @tx_msg
@@ -464,6 +467,9 @@ struct sof_ipc_ops {
 	const struct sof_ipc_fw_loader_ops *fw_loader;
 	const struct sof_ipc_fw_tracing_ops *fw_tracing;
 
+	int (*init)(struct snd_sof_dev *sdev);
+	void (*exit)(struct snd_sof_dev *sdev);
+
 	int (*tx_msg)(struct snd_sof_dev *sdev, void *msg_data, size_t msg_bytes,
 		      void *reply_data, size_t reply_bytes, bool no_pm);
 	int (*set_get_data)(struct snd_sof_dev *sdev, void *data, size_t data_bytes,
-- 
2.38.0

