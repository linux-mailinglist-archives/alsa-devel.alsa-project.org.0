Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9BC25D9B3
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 15:34:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7513B1B09;
	Fri,  4 Sep 2020 15:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7513B1B09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599226487;
	bh=jXNIl3LKtWyOWveQDYX4RESUDChR0OvcnYxjJFU9LDQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rcQAixyKo0ws7pE81NBQxk9riQ+nccq31VHHLeoimAjvBxUPlSb94GlqaS6DITf38
	 rFMSNEPEltaRKmkRDhhSstFhHOplRHP4pp4lQJjWzkSCSxr6CkNPDpyS4QfoZzIo0h
	 xUZWXF7yk6LMbZ7mL132TLn0REI4RFbutcpNl1oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78DF2F80315;
	Fri,  4 Sep 2020 15:30:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A86FEF80268; Fri,  4 Sep 2020 15:29:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93F5BF80268
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 15:29:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93F5BF80268
IronPort-SDR: N6f68B1KdnLcCurym6uQ99H9GxFm2Inx+/IjrHYKU4E1PTVVpa1qs/7mmrXcoVfwJk/9SOfNt1
 a7QI2hfShrDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137259562"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="137259562"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:29:41 -0700
IronPort-SDR: AaNj99QacY+Qp/Rq+xyIQpIUzCJgnFOXuJE3ShJi5E+bNJ43LGio50TIrMQLcqC/i731DAn+dp
 JXYh2Uhhqc3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284416716"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2020 06:29:39 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 06/16] ASoC: SOF: topology: add helper for setting up IPC
 component
Date: Fri,  4 Sep 2020 16:27:34 +0300
Message-Id: <20200904132744.1699575-7-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
References: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Keyon Jie <yang.jie@linux.intel.com>

Add helper to allocate buffer for IPC component, configure the basic
settings, and set up the extended data for the subsequent IPC sending.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/topology.c | 45 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 7d1013e315fc..836da1a6f7cc 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1453,6 +1453,51 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 	return 0;
 }
 
+/**
+ * sof_comp_alloc - allocate and initialize buffer for a new component
+ * @swidget: pointer to struct snd_sof_widget containing extended data
+ * @ipc_size: IPC payload size that will be updated depending on valid
+ *  extended data.
+ * @index: ID of the pipeline the component belongs to
+ * @core: index of the DSP core that the component should run on
+ *
+ * Return: The pointer to the new allocated component, NULL if failed.
+ */
+static struct sof_ipc_comp *sof_comp_alloc(struct snd_sof_widget *swidget,
+					   size_t *ipc_size, int index,
+					   int core)
+{
+	u8 nil_uuid[SOF_UUID_SIZE] = {0};
+	struct sof_ipc_comp *comp;
+	size_t total_size = *ipc_size;
+
+	/* only non-zero UUID is valid */
+	if (memcmp(&swidget->comp_ext, nil_uuid, SOF_UUID_SIZE))
+		total_size += sizeof(swidget->comp_ext);
+
+	comp = kzalloc(total_size, GFP_KERNEL);
+	if (!comp)
+		return NULL;
+
+	/* configure comp new IPC message */
+	comp->hdr.size = total_size;
+	comp->hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_NEW;
+	comp->id = swidget->comp_id;
+	comp->pipeline_id = index;
+	comp->core = core;
+
+	/* handle the extended data if needed */
+	if (total_size > *ipc_size) {
+		/* append extended data to the end of the component */
+		memcpy((u8 *)comp + *ipc_size, &swidget->comp_ext, sizeof(swidget->comp_ext));
+		comp->ext_data_length = sizeof(swidget->comp_ext);
+	}
+
+	/* update ipc_size and return */
+	*ipc_size = total_size;
+	return comp;
+}
+
 static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 			       struct snd_sof_widget *swidget, int core,
 			       struct snd_soc_tplg_dapm_widget *tw,
-- 
2.27.0

