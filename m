Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5EF54ECEE
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 23:57:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA20D1AFF;
	Thu, 16 Jun 2022 23:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA20D1AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655416649;
	bh=C4sNX1ZH9/zdPXJBUCxcBJSiHT05yZaWXfbBJR5Wl+o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tGDuhyuUlAdN+DocRD+1K+Kp7Xe+iV3jje/AlGp3VdvtvEd4UDG4sj9JU0vBLqJWF
	 wjnMT7GTZihEln1D1K76mTjseuVYp3m7Q6NHjY1niYf1LEcQgUhe8bGbKHqb1jFxlu
	 WtXK8+QyuFg7FloJUbKzcmy+fPVt0dGTNl68OoCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AEC2F80542;
	Thu, 16 Jun 2022 23:54:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4827DF8053A; Thu, 16 Jun 2022 23:54:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F950F8052E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 23:54:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F950F8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="d4cki+YA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655416486; x=1686952486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C4sNX1ZH9/zdPXJBUCxcBJSiHT05yZaWXfbBJR5Wl+o=;
 b=d4cki+YA286BzTTEnQvvF+Hb+0sucukZQV7pnIHWR7P8DkxbW/6DpU+o
 iQMqwK1yndwPyXNGTBgcUFoNAeTHZ/uvmvxq2JqCLtfAGQLpxVDZFQMG4
 T/zy/vj5BJ/DyKv5YGHGmZqDPJ/5CskXdbHn5KY7yIhgCj0Ybd9SqZfSS
 e57cUl73hDy3pfi+fGW3eL1HQ9muQV+BycdgGhMNqAi1lCpaJH1WSsNnF
 reKVbAs8JDrU+AgnQ+5V+NjMab5wCU57zzuvToaWzqlbU51N71GOEBrog
 cav/MsGPazrPjxAVc1qhuICLzUDpfkOxae//e8nJ14ywi34wY9LpQLaNp A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268047830"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268047830"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:21 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="675212685"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/13] ASoC: SOF: ipc4-topology remove use of __func__ in
 dev_dbg
Date: Thu, 16 Jun 2022 16:53:47 -0500
Message-Id: <20220616215351.135643-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
References: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

The module and function information can be added with
'modprobe foo dyndbg=+pmf'

Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 3c949298e007f..34f805431f2eb 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -804,8 +804,8 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 		valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
 		if (params_rate(params) == rate && params_channels(params) == channels &&
 		    sample_valid_bits == valid_bits) {
-			dev_dbg(sdev->dev, "%s: matching audio format index for %uHz, %ubit, %u channels: %d\n",
-				__func__, rate, valid_bits, channels, i);
+			dev_dbg(sdev->dev, "matching audio format index for %uHz, %ubit, %u channels: %d\n",
+				rate, valid_bits, channels, i);
 
 			/* copy ibs/obs and input format */
 			memcpy(base_config, &available_fmt->base_config[i],
@@ -919,8 +919,8 @@ static int snd_sof_get_hw_config_params(struct snd_sof_dev *sdev, struct snd_sof
 	*channel_count = le32_to_cpu(hw_config->tdm_slots);
 	*sample_rate = le32_to_cpu(hw_config->fsync_rate);
 
-	dev_dbg(sdev->dev, "%s: sample rate: %d sample width: %d channels: %d\n",
-		__func__, *sample_rate, *bit_depth, *channel_count);
+	dev_dbg(sdev->dev, "sample rate: %d sample width: %d channels: %d\n",
+		*sample_rate, *bit_depth, *channel_count);
 
 	return 0;
 }
@@ -954,8 +954,8 @@ static int snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_s
 		return 0;
 	}
 
-	dev_dbg(sdev->dev, "%s: dai index %d nhlt type %d direction %d\n",
-		__func__, dai_index, nhlt_type, dir);
+	dev_dbg(sdev->dev, "dai index %d nhlt type %d direction %d\n",
+		dai_index, nhlt_type, dir);
 
 	/* find NHLT blob with matching params */
 	cfg = intel_nhlt_get_endpoint_blob(sdev->dev, ipc4_data->nhlt, dai_index, nhlt_type,
@@ -1005,7 +1005,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	u32 **data;
 	int ipc_size, ret;
 
-	dev_dbg(sdev->dev, "%s: copier %s, type %d", __func__, swidget->widget->name, swidget->id);
+	dev_dbg(sdev->dev, "copier %s, type %d", swidget->widget->name, swidget->id);
 
 	switch (swidget->id) {
 	case snd_soc_dapm_aif_in:
@@ -1446,7 +1446,7 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 	int dst_queue = 0;
 	int ret;
 
-	dev_dbg(sdev->dev, "%s: bind %s -> %s\n", __func__,
+	dev_dbg(sdev->dev, "bind %s -> %s\n",
 		src_widget->widget->name, sink_widget->widget->name);
 
 	header = src_fw_module->man4_module_entry.id;
@@ -1483,7 +1483,7 @@ static int sof_ipc4_route_free(struct snd_sof_dev *sdev, struct snd_sof_route *s
 	int dst_queue = 0;
 	int ret;
 
-	dev_dbg(sdev->dev, "%s: unbind modules %s -> %s\n", __func__,
+	dev_dbg(sdev->dev, "unbind modules %s -> %s\n",
 		src_widget->widget->name, sink_widget->widget->name);
 
 	header = src_fw_module->man4_module_entry.id;
-- 
2.34.1

