Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D2D91499E
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 14:16:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0459E0F;
	Mon, 24 Jun 2024 14:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0459E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719231399;
	bh=HkULgTbcgMho59o74DrgE8BND93M/VizDHfsiew3Aj8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o3BbyGexzI/aZzlq6lzcvEXJh5nU7i4R1rpDeLo0TtCAS9kC6CfoMoiZmO2Wzbx3M
	 UZ7LKaTv/QxN3kmw5BWw8geX0d1DvqkMKAWEbrL/qNSdQZIwjXMG8uVam7tpOObNfq
	 Ksti1bpC7HF4YscnZbF1GcKfT5skKakXQclRNH3E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BB01F805BE; Mon, 24 Jun 2024 14:15:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF497F805FF;
	Mon, 24 Jun 2024 14:15:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43281F805E8; Mon, 24 Jun 2024 14:15:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 682E4F805BB
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 14:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 682E4F805BB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CfL2GRjH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231343; x=1750767343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HkULgTbcgMho59o74DrgE8BND93M/VizDHfsiew3Aj8=;
  b=CfL2GRjHh7mw8YtUUQSLlYIN/ZuQ2Je5pGp/MCqnu/0YSaHy0YB4RM6i
   mJXCI8gDfAzAAYWDIasc8blKYhthvCq9d/i6v0kOWpFEBUXr/10X2wMTY
   6+a8SlRCkfqejRy9XJeHBwHxlzutzw4Mx1rpw/p60tzYNrS/XDJKbx/SY
   6ePtyFS99l8b2tT9qWU34JLcPPaa9rbtdwbCngdsW2ar0WRHMq/kB5KfE
   KbBMRE7Z4TUZAzwpJDQ3G+J+Z56zV0JSyvFAKmcqeh714O4aAxtACVMYa
   v+ZN2Z4DIdYmsnxkVx+pN4OvRbG/+Gy/EsXoZ4GAxEMcC7m5nkGfGPO8h
   A==;
X-CSE-ConnectionGUID: G76ev0AiSx6M1rXiyWDW2g==
X-CSE-MsgGUID: X3ZqVhvlQ/6ALA64S+fJaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15888064"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="15888064"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:15:40 -0700
X-CSE-ConnectionGUID: qtk3zWR4Q/SENaGgboWxWg==
X-CSE-MsgGUID: UzHG0/eoQ86cBBKb7uPDKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="43358828"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:15:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] ASoC: SOF: ipc4-topology: Use correct queue_id for
 requesting input pin format
Date: Mon, 24 Jun 2024 14:15:18 +0200
Message-ID: <20240624121519.91703-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TWCEIUUMNFUBVCFESV6ABOQST6UVUNFY
X-Message-ID-Hash: TWCEIUUMNFUBVCFESV6ABOQST6UVUNFY
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWCEIUUMNFUBVCFESV6ABOQST6UVUNFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

It is incorrect to request the input pin format of the destination widget
using the output pin index of the source module as the indexes are not
necessarily matching.
moduleA.out_pin1 can be connected to moduleB.in_pin0 for example.

Use the dst_queue_id to request the input format of the destination module.

This bug remained unnoticed likely because in nocodec topologies we don't
have process modules after a module copier, thus the pin/queue index is
ignored.
For the process module case, the code was likely have been tested in a
controlled way where all the pin/queue/format properties were present to
work.

Update the debug prints to have better information.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 sound/soc/sof/ipc4-topology.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index ce2910f70e65..90f6856ee80c 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2869,7 +2869,7 @@ static void sof_ipc4_put_queue_id(struct snd_sof_widget *swidget, int queue_id,
 static int sof_ipc4_set_copier_sink_format(struct snd_sof_dev *sdev,
 					   struct snd_sof_widget *src_widget,
 					   struct snd_sof_widget *sink_widget,
-					   int sink_id)
+					   struct snd_sof_route *sroute)
 {
 	struct sof_ipc4_copier_config_set_sink_format format;
 	const struct sof_ipc_ops *iops = sdev->ipc->ops;
@@ -2878,9 +2878,6 @@ static int sof_ipc4_set_copier_sink_format(struct snd_sof_dev *sdev,
 	struct sof_ipc4_fw_module *fw_module;
 	struct sof_ipc4_msg msg = {{ 0 }};
 
-	dev_dbg(sdev->dev, "%s set copier sink %d format\n",
-		src_widget->widget->name, sink_id);
-
 	if (WIDGET_IS_DAI(src_widget->id)) {
 		struct snd_sof_dai *dai = src_widget->private;
 
@@ -2891,13 +2888,15 @@ static int sof_ipc4_set_copier_sink_format(struct snd_sof_dev *sdev,
 
 	fw_module = src_widget->module_info;
 
-	format.sink_id = sink_id;
+	format.sink_id = sroute->src_queue_id;
 	memcpy(&format.source_fmt, &src_config->audio_fmt, sizeof(format.source_fmt));
 
-	pin_fmt = sof_ipc4_get_input_pin_audio_fmt(sink_widget, sink_id);
+	pin_fmt = sof_ipc4_get_input_pin_audio_fmt(sink_widget, sroute->dst_queue_id);
 	if (!pin_fmt) {
-		dev_err(sdev->dev, "Unable to get pin %d format for %s",
-			sink_id, sink_widget->widget->name);
+		dev_err(sdev->dev,
+			"Failed to get input audio format of %s:%d for output of %s:%d\n",
+			sink_widget->widget->name, sroute->dst_queue_id,
+			src_widget->widget->name, sroute->src_queue_id);
 		return -EINVAL;
 	}
 
@@ -2955,7 +2954,8 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 	sroute->src_queue_id = sof_ipc4_get_queue_id(src_widget, sink_widget,
 						     SOF_PIN_TYPE_OUTPUT);
 	if (sroute->src_queue_id < 0) {
-		dev_err(sdev->dev, "failed to get queue ID for source widget: %s\n",
+		dev_err(sdev->dev,
+			"failed to get src_queue_id ID from source widget %s\n",
 			src_widget->widget->name);
 		return sroute->src_queue_id;
 	}
@@ -2963,7 +2963,8 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 	sroute->dst_queue_id = sof_ipc4_get_queue_id(src_widget, sink_widget,
 						     SOF_PIN_TYPE_INPUT);
 	if (sroute->dst_queue_id < 0) {
-		dev_err(sdev->dev, "failed to get queue ID for sink widget: %s\n",
+		dev_err(sdev->dev,
+			"failed to get dst_queue_id ID from sink widget %s\n",
 			sink_widget->widget->name);
 		sof_ipc4_put_queue_id(src_widget, sroute->src_queue_id,
 				      SOF_PIN_TYPE_OUTPUT);
@@ -2972,10 +2973,11 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 
 	/* Pin 0 format is already set during copier module init */
 	if (sroute->src_queue_id > 0 && WIDGET_IS_COPIER(src_widget->id)) {
-		ret = sof_ipc4_set_copier_sink_format(sdev, src_widget, sink_widget,
-						      sroute->src_queue_id);
+		ret = sof_ipc4_set_copier_sink_format(sdev, src_widget,
+						      sink_widget, sroute);
 		if (ret < 0) {
-			dev_err(sdev->dev, "failed to set sink format for %s source queue ID %d\n",
+			dev_err(sdev->dev,
+				"failed to set sink format for source %s:%d\n",
 				src_widget->widget->name, sroute->src_queue_id);
 			goto out;
 		}
-- 
2.43.0

