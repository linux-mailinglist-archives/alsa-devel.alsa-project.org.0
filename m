Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0C3687BDB
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 12:13:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7490DF3;
	Thu,  2 Feb 2023 12:12:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7490DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675336403;
	bh=hqGPiTb3SAUmJcU9PUxVFwsufiYM6BS1FXIonficbCo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IHPlunGpppeFMex2M2EBSEODOikh4ew3zLc3zS2589mxF801DZ0KOzHRLOLqafryf
	 u5KZANPSHgj0P9H/BPzoKDY/GhDTtJazfLa7ldQ40r937J0p9y1S6HbM/wDnoAdpKJ
	 pN70gGPDGZCKrR/MrtdMqCeAJocrguxqifh0SL9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78758F80558;
	Thu,  2 Feb 2023 12:11:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EA1AF80557; Thu,  2 Feb 2023 12:11:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 921E3F804C2
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 12:11:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 921E3F804C2
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dOnq6zmQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675336289; x=1706872289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hqGPiTb3SAUmJcU9PUxVFwsufiYM6BS1FXIonficbCo=;
 b=dOnq6zmQVCh68V3dJnfMWtR+GJDgqL296DbBCPtpIOO8C/E3hXHGGePe
 SsqRzv0pbhuwfHwDvPlR+Rsjssim5VIVVBHk8vvvAbaV0LRuOpQE0Zt6N
 y89DozZWthkoKoqpTjxrEw1/n4Mmmd25ugRQWSbR30iu3ioAiBL3gj4gL
 0TIXU4Z7QSb9jiSZNAI+CIww+jGGgP69SMlBu+HrrPele3TOv7efTILE1
 J9InFauLJ2+gOYXH0bly7wdMlH7av/Dp6+6z/GPxM7tUcG2uSGNQnRAvs
 Nj/+Bx4LS81Ak84tuvx9HvGYkbOhAG8pZJIxZBiOr/upwRAPU24XZlJD/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="414625166"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="414625166"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 03:11:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695747682"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="695747682"
Received: from jpdamery-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.1.104])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 03:11:23 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz
Subject: [PATCH v2 3/9] ASoC: SOF: add time info structure for ipc4 path
Date: Thu,  2 Feb 2023 13:11:17 +0200
Message-Id: <20230202111123.25231-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202111123.25231-1-peter.ujfalusi@linux.intel.com>
References: <20230202111123.25231-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Start_stream_offset is used to strip invalid sample count in dai
for some cases like dai is started before host. llp_offset is used
to get current dai position from memory windows.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-priv.h | 14 ++++++++++++++
 sound/soc/sof/sof-audio.h |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 8f8259a7e21c..f461b8c70df3 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -87,6 +87,20 @@ struct sof_ipc4_fw_data {
 	struct mutex pipeline_state_mutex; /* protect pipeline triggers, ref counts and states */
 };
 
+/**
+ * struct sof_ipc4_timestamp_info - IPC4 timestamp info
+ * @host_copier: the host copier of the pcm stream
+ * @dai_copier: the dai copier of the pcm stream
+ * @stream_start_offset: reported by fw in memory window
+ * @llp_offset: llp offset in memory window
+ */
+struct sof_ipc4_timestamp_info {
+	struct sof_ipc4_copier *host_copier;
+	struct sof_ipc4_copier *dai_copier;
+	u64 stream_start_offset;
+	u32 llp_offset;
+};
+
 extern const struct sof_ipc_fw_loader_ops ipc4_loader_ops;
 extern const struct sof_ipc_tplg_ops ipc4_tplg_ops;
 extern const struct sof_ipc_tplg_control_ops tplg_ipc4_control_ops;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index b0593b46d477..334b715b17c8 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -311,6 +311,9 @@ struct snd_sof_pcm_stream {
 	 */
 	bool suspend_ignored;
 	struct snd_sof_pcm_stream_pipeline_list pipeline_list;
+
+	/* used by IPC implementation and core does not touch it */
+	void *private;
 };
 
 /* ALSA SOF PCM device */
-- 
2.39.1

