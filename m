Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C515441F2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B87D42022;
	Thu,  9 Jun 2022 05:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B87D42022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745470;
	bh=+VxCinZMyIrGJaJU7gX0mrYm/bQoyBZTpjph/VK5WM4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kw12nxxBEeXfZQF+IEnlF15AgHe7aZ5BW1R56tD8QzwlXy16X3CQeIIhiMt8ySwN0
	 0poYXwwsfil4rAY8FDO/TtZoaVqqh7EB213uI4obEnDr/FMYSMSQwyj7FSl49nP3re
	 ZWihrAkLh0pcLtS5n+IY8FrB2tOafmE1551isntE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5458FF80520;
	Thu,  9 Jun 2022 05:27:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E984FF805B0; Thu,  9 Jun 2022 05:27:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B580F8053B
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B580F8053B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Jyx7sIZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745240; x=1686281240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+VxCinZMyIrGJaJU7gX0mrYm/bQoyBZTpjph/VK5WM4=;
 b=Jyx7sIZLoLj1Z1gqyUG5E68Mqzm+fGypVXhT2p13iW2KzVr8BwaC2HHO
 QH55s/V5GE1RrjaGYeoyuqTE4Ks3hiI5zcsJdiTa9CbX52PNRMgZ8MZ5T
 NojNwSujR7dIzwnEAIVz46zoaQXcIoCAE0MABDei+Cey1lwZm+j1JVy+t
 E9YdzdVKCR6qO+I4wQivz+lWkXXnDN1gm57SC+kYgBJJvldP65/6DTXgU
 8A5hukFx052jiHivAdFl/hagr1edt3/YPf1aQT1krAvLQJVdfdZVSN28W
 2H6mN0FDRxm7xHgYNTZud/+C+rm1igxYboDPCShJUby29pXNNvPeClOYJ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219564"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219564"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260247"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:00 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/23] ASoC: SOF: ipc4-topology: Add the dai_config op
Date: Wed,  8 Jun 2022 20:26:34 -0700
Message-Id: <20220609032643.916882-15-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Define and set the dai_config op for IPC4.

Co-developed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 45 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-topology.h |  2 +-
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index f5067d630f2d..9615034f8c70 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1273,6 +1273,50 @@ static int sof_ipc4_route_free(struct snd_sof_dev *sdev, struct snd_sof_route *s
 	return ret;
 }
 
+static int sof_ipc4_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
+			       unsigned int flags, struct snd_sof_dai_config_data *data)
+{
+	struct snd_sof_widget *pipe_widget = swidget->pipe_widget;
+	struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+	struct snd_sof_dai *dai = swidget->private;
+	struct sof_ipc4_gtw_attributes *gtw_attr;
+	struct sof_ipc4_copier_data *copier_data;
+	struct sof_ipc4_copier *ipc4_copier;
+
+	if (!dai || !dai->private) {
+		dev_err(sdev->dev, "Invalid DAI or DAI private data for %s\n",
+			swidget->widget->name);
+		return -EINVAL;
+	}
+
+	ipc4_copier = (struct sof_ipc4_copier *)dai->private;
+	copier_data = &ipc4_copier->data;
+
+	if (!data)
+		return 0;
+
+	switch (ipc4_copier->dai_type) {
+	case SOF_DAI_INTEL_HDA:
+		gtw_attr = ipc4_copier->gtw_attr;
+		gtw_attr->lp_buffer_alloc = pipeline->lp_mode;
+		fallthrough;
+	case SOF_DAI_INTEL_ALH:
+		copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
+		copier_data->gtw_cfg.node_id |= SOF_IPC4_NODE_INDEX(data->dai_data);
+		break;
+	case SOF_DAI_INTEL_DMIC:
+	case SOF_DAI_INTEL_SSP:
+		/* nothing to do for SSP/DMIC */
+		break;
+	default:
+		dev_err(sdev->dev, "%s: unsupported dai type %d\n", __func__,
+			ipc4_copier->dai_type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static enum sof_tokens host_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
@@ -1357,4 +1401,5 @@ const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
 	.widget_free = sof_ipc4_widget_free,
 	.route_setup = sof_ipc4_route_setup,
 	.route_free = sof_ipc4_route_free,
+	.dai_config = sof_ipc4_dai_config,
 };
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index eebf46b24430..0cadf04efa6a 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -26,7 +26,7 @@
 #define SOF_IPC4_FW_MAX_PAGE_COUNT 20
 #define SOF_IPC4_FW_MAX_QUEUE_COUNT 8
 
-/* Node index and mask applicable for host copier */
+/* Node index and mask applicable for host copier and ALH/HDA type DAI copiers */
 #define SOF_IPC4_NODE_INDEX_MASK	0xFF
 #define SOF_IPC4_NODE_INDEX(x)	((x) & SOF_IPC4_NODE_INDEX_MASK)
 #define SOF_IPC4_NODE_TYPE(x)  ((x) << 8)
-- 
2.25.1

