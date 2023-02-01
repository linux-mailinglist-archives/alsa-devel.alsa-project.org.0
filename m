Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D64166865FE
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 13:34:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 903B7AE8;
	Wed,  1 Feb 2023 13:33:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 903B7AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675254870;
	bh=hqGPiTb3SAUmJcU9PUxVFwsufiYM6BS1FXIonficbCo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=T0b+7TOsYDg+6Chn1tP4b9xlN58I06IRLzAMhuFrASPxkwS7vFObO9YHHATwVrO6R
	 6NViJfVAMIhN/3brqoWFJ3KgWjphX4eSMpb5vF/x0JrTjbYTjwPzslv0mjuRjNBRMc
	 1zJEBIdOjWzfdiemud4QdPEorEa97yNV0nB3J0fg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFEC0F80528;
	Wed,  1 Feb 2023 13:32:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96FDAF80549; Wed,  1 Feb 2023 13:32:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE12CF8047D
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 13:32:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE12CF8047D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CAxNzrQ1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675254758; x=1706790758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hqGPiTb3SAUmJcU9PUxVFwsufiYM6BS1FXIonficbCo=;
 b=CAxNzrQ1gO6n8nYiRuDBl/Ec6K9RoYLB+kTjSphNrVHG6FFUlv/JcfRa
 99BDH7FD86vSz7X3noy/ZiH6X6GTtqrj5lj9vk+3GV33hSju+/kukAZFZ
 AFOZFnqmbhwDea5kfVQOlKML8LnLKgd9nTntjrChPB6LsdNDzPxV5D2yE
 m469udaa0P2MpKbaz3EkmeGsE1pU/TA6Uj5a3hg7BGCCj4MOBxYREJLAw
 yPZJpaqQHLBI6mZlVHqcZ+l/cizE+0wH9+WoDSHSAW8XpkKB0NFMEXTts
 xA0AhTGkN3Be0TZEFXwKwcIR2ovYqW7+Z6Eo3eHK9cNBWwTO9OBIIYdrU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="328143540"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="328143540"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 04:32:34 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="788865688"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="788865688"
Received: from jehdildi-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.31.67])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 04:32:29 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 3/9] ASoC: SOF: add time info structure for ipc4 path
Date: Wed,  1 Feb 2023 14:32:25 +0200
Message-Id: <20230201123231.26361-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201123231.26361-1-peter.ujfalusi@linux.intel.com>
References: <20230201123231.26361-1-peter.ujfalusi@linux.intel.com>
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

