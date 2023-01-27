Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3902267E47D
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:04:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AF22EBC;
	Fri, 27 Jan 2023 13:03:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AF22EBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674821039;
	bh=oMeC3yQQdvlNQlgHeuJq/tVyXvOBb7zZyx9xiHIQCw4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rOo1yoKHgyeD5M8z5I3b1uPDSGpreghXpfwDWvgGHzAIN6wcObSAtX45VaOw9Ewfj
	 QkaT1aaYz6C4H6KYORYBtODVcNw4kg8BPLoDe+e3x2O4D6FxsZWi/oBfnshn5WtgT4
	 7Hi1I7ltt9dbFcnwilamucyrskvpDujv/sbOiwzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93EC1F80587;
	Fri, 27 Jan 2023 13:01:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDC6EF8055B; Fri, 27 Jan 2023 13:00:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5A73F80544
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5A73F80544
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ADz0xo11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820848; x=1706356848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oMeC3yQQdvlNQlgHeuJq/tVyXvOBb7zZyx9xiHIQCw4=;
 b=ADz0xo11M54brME+uE21B38stO6Y4SDJMRDekxKLMQmRvZBsdTV/sAHA
 m1cNAUY85LS+/zSw4NgqNPfkZAP0IIs4wD5FPLvyDp2yw57TYAVa/NOrr
 xy1dvFF1coC1qCa/kR7p/I7TVEvav3BAiFWDb3WvpC8YM82fJLJxGKYK2
 Cfr3rVQuKdGv4lt3bE9JmwHwyJh6WrwGy5NYgzYoo4E1K7zDO5KOgLR5g
 YjL0cFIVUnrAhFkOpsr/XDLG3CyBI6lHyiEBJ3qKv80Ln6jgS19WAO0CG
 eUqZ6sws1SodlCDvvSowgJQSmFSbNqJPQ/E0Yi5hZIJ/g0n+o6E70aSAK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091864"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091864"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782183"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782183"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:43 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 08/18] ASoC: SOF: ipc4-pcm: Define pcm_setup/free ops
Date: Fri, 27 Jan 2023 14:00:21 +0200
Message-Id: <20230127120031.10709-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
References: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Define the pcm_setup/pcm_free ops for IPC4. Define a new struct
snd_sof_pcm_stream_trigger_info and add a new field trigger_info of this
type to struct snd_sof_pcm_stream. This will be used to save the list of
pipelines that need to be triggered.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c  | 36 ++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.h | 11 +++++++++++
 2 files changed, 47 insertions(+)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 23de58d7d06b..05515e8e6f57 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -215,8 +215,44 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static void sof_ipc4_pcm_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm)
+{
+	struct snd_sof_pcm_stream_pipeline_list *pipeline_list;
+	int stream;
+
+	for_each_pcm_streams(stream) {
+		pipeline_list = &spcm->stream[stream].pipeline_list;
+		kfree(pipeline_list->pipe_widgets);
+		pipeline_list->pipe_widgets = NULL;
+	}
+}
+
+static int sof_ipc4_pcm_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm)
+{
+	struct snd_sof_pcm_stream_pipeline_list *pipeline_list;
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	int stream;
+
+	for_each_pcm_streams(stream) {
+		pipeline_list = &spcm->stream[stream].pipeline_list;
+
+		/* allocate memory for max number of pipeline IDs */
+		pipeline_list->pipe_widgets = kcalloc(ipc4_data->max_num_pipelines,
+						      sizeof(struct snd_sof_widget *),
+						      GFP_KERNEL);
+		if (!pipeline_list->pipe_widgets) {
+			sof_ipc4_pcm_free(sdev, spcm);
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
 const struct sof_ipc_pcm_ops ipc4_pcm_ops = {
 	.trigger = sof_ipc4_pcm_trigger,
 	.hw_free = sof_ipc4_pcm_hw_free,
 	.dai_link_fixup = sof_ipc4_pcm_dai_link_fixup,
+	.pcm_setup = sof_ipc4_pcm_setup,
+	.pcm_free = sof_ipc4_pcm_free,
 };
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index bcde2ebaf022..bb5c61dd9b1e 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -285,6 +285,16 @@ struct sof_token_info {
 	int count;
 };
 
+/**
+ * struct snd_sof_pcm_stream_pipeline_list - List of pipelines associated with a PCM stream
+ * @count: number of pipeline widgets in the @pipe_widgets array
+ * @pipe_widgets: array of pipeline widgets
+ */
+struct snd_sof_pcm_stream_pipeline_list {
+	u32 count;
+	struct snd_sof_widget **pipe_widgets;
+};
+
 /* PCM stream, mapped to FW component  */
 struct snd_sof_pcm_stream {
 	u32 comp_id;
@@ -300,6 +310,7 @@ struct snd_sof_pcm_stream {
 	 * active or not while suspending the stream
 	 */
 	bool suspend_ignored;
+	struct snd_sof_pcm_stream_pipeline_list pipeline_list;
 };
 
 /* ALSA SOF PCM device */
-- 
2.39.1

