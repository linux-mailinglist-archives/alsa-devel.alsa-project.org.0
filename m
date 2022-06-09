Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DEE5441F6
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:32:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 227162040;
	Thu,  9 Jun 2022 05:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 227162040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745534;
	bh=rQQXxbpY/SKhtTlDOzP7Pjrd7wffAb1zF0lgrLePOKs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KasOTOAuTiQptr8kLVikvLkcf2yoljJOncE8sq7LGEEsUasbKWE6uWmWwqf1PlYUn
	 hkh7DfzwcD9ILlyWrqcgtG0FB89jClmtWYicrxmEcOt9xTxbL6nW4vaKMpAb68TUy0
	 kQbpcCgC7KajmdpfNcoqhblMgymKZ53BdK/zeSyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 347F7F805B5;
	Thu,  9 Jun 2022 05:27:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 613E2F805B1; Thu,  9 Jun 2022 05:27:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EC56F8053C
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EC56F8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ke5Jm6J4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745240; x=1686281240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rQQXxbpY/SKhtTlDOzP7Pjrd7wffAb1zF0lgrLePOKs=;
 b=ke5Jm6J4kz7brVGNDaZu7pEr/RT58ZOx/vdDfFkwtyTfwHdsq7AJIIjL
 ddwwKXAr6z/kgW3DCCieBb2+ECNPeI9oYJ0d+suk2nXmJUouAGi2ptJDV
 069i/Zo8wnR1Z7pGvn7OiSlVxiQOk1HAc5xy479R/pjVvpwNACjHvOlEH
 He03LKjPKqAa7UKPTl+jaD4BpQhz6AdB2fLX/bJpjhN4ay5k3t02AgnBC
 6Ky8bQaHfqCJ8824jPguAE5iX3za9UEA+XPXf0txl12IWIkaIzADeNc5L
 Z/LiSNpHnGyeAHzPlBESz6jwPpAYJhpnrkYuZJV269PBF9xjZJ/yl9XLK g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219562"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219562"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260246"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:00 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/23] ASoC: SOF: ipc4-topology: Add route_setup/route_free ops
Date: Wed,  8 Jun 2022 20:26:33 -0700
Message-Id: <20220609032643.916882-14-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
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

Define and set the route_setup/route_free ops for IPC4.

Co-developed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 76 +++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 44f65b8b526a..f5067d630f2d 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1199,6 +1199,80 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 	return ret;
 }
 
+static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *sroute)
+{
+	struct snd_sof_widget *src_widget = sroute->src_widget;
+	struct snd_sof_widget *sink_widget = sroute->sink_widget;
+	struct sof_ipc4_fw_module *src_fw_module = src_widget->module_info;
+	struct sof_ipc4_fw_module *sink_fw_module = sink_widget->module_info;
+	struct sof_ipc4_msg msg = {{ 0 }};
+	u32 header, extension;
+	int src_queue = 0;
+	int dst_queue = 0;
+	int ret;
+
+	dev_dbg(sdev->dev, "%s: bind %s -> %s\n", __func__,
+		src_widget->widget->name, sink_widget->widget->name);
+
+	header = src_fw_module->man4_module_entry.id;
+	header |= SOF_IPC4_MOD_INSTANCE(src_widget->instance_id);
+	header |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_MOD_BIND);
+	header |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	header |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+
+	extension = sink_fw_module->man4_module_entry.id;
+	extension |= SOF_IPC4_MOD_EXT_DST_MOD_INSTANCE(sink_widget->instance_id);
+	extension |= SOF_IPC4_MOD_EXT_DST_MOD_QUEUE_ID(dst_queue);
+	extension |= SOF_IPC4_MOD_EXT_SRC_MOD_QUEUE_ID(src_queue);
+
+	msg.primary = header;
+	msg.extension = extension;
+
+	ret = sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
+	if (ret < 0)
+		dev_err(sdev->dev, "%s: failed to bind modules %s -> %s\n",
+			__func__, src_widget->widget->name, sink_widget->widget->name);
+
+	return ret;
+}
+
+static int sof_ipc4_route_free(struct snd_sof_dev *sdev, struct snd_sof_route *sroute)
+{
+	struct snd_sof_widget *src_widget = sroute->src_widget;
+	struct snd_sof_widget *sink_widget = sroute->sink_widget;
+	struct sof_ipc4_fw_module *src_fw_module = src_widget->module_info;
+	struct sof_ipc4_fw_module *sink_fw_module = sink_widget->module_info;
+	struct sof_ipc4_msg msg = {{ 0 }};
+	u32 header, extension;
+	int src_queue = 0;
+	int dst_queue = 0;
+	int ret;
+
+	dev_dbg(sdev->dev, "%s: unbind modules %s -> %s\n", __func__,
+		src_widget->widget->name, sink_widget->widget->name);
+
+	header = src_fw_module->man4_module_entry.id;
+	header |= SOF_IPC4_MOD_INSTANCE(src_widget->instance_id);
+	header |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_MOD_UNBIND);
+	header |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	header |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+
+	extension = sink_fw_module->man4_module_entry.id;
+	extension |= SOF_IPC4_MOD_EXT_DST_MOD_INSTANCE(sink_widget->instance_id);
+	extension |= SOF_IPC4_MOD_EXT_DST_MOD_QUEUE_ID(dst_queue);
+	extension |= SOF_IPC4_MOD_EXT_SRC_MOD_QUEUE_ID(src_queue);
+
+	msg.primary = header;
+	msg.extension = extension;
+
+	ret = sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
+	if (ret < 0)
+		dev_err(sdev->dev, "failed to unbind modules %s -> %s\n",
+			src_widget->widget->name, sink_widget->widget->name);
+
+	return ret;
+}
+
 static enum sof_tokens host_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
@@ -1281,4 +1355,6 @@ const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
 	.control = &tplg_ipc4_control_ops,
 	.widget_setup = sof_ipc4_widget_setup,
 	.widget_free = sof_ipc4_widget_free,
+	.route_setup = sof_ipc4_route_setup,
+	.route_free = sof_ipc4_route_free,
 };
-- 
2.25.1

