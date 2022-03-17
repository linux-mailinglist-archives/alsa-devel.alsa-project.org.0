Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFE74DCCED
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:53:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C850518A8;
	Thu, 17 Mar 2022 18:52:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C850518A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539606;
	bh=Tptf8VyQob+r1azRJ8hK+4qcr+k5LUpR31+UaaqCeag=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s9MJ23eWKC4TlYJizRWlIKtnnwlIFc+0/ijU8YJAe6elq/0pNqBsYPDsUzprwryuc
	 Rt1k3tNqYh8KQXdw42o8kW3mKiuwr7ouJNATrOx+BbvRDN47pOObN28QyXUmdMRJEJ
	 gQZwufN2BjS/fFWL4rcG3InxByKmqXwOnq8YsEF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AC05F80517;
	Thu, 17 Mar 2022 18:51:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DBE3F80132; Thu, 17 Mar 2022 18:51:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C71FF80159
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C71FF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jm5vjAL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539506; x=1679075506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tptf8VyQob+r1azRJ8hK+4qcr+k5LUpR31+UaaqCeag=;
 b=jm5vjAL4zLDoDRDqCmBYScn26QbqvfyuBZw6z/QGh8V2XC8ONI6zSSFW
 yeFqtNPFG24r7rmydQl3W6S8KQ5bf/TiCEws7rm7sSuHs5D6vKMX9m5De
 AhNUs9hIOi52y5ueX6gZdXfw2sfsgPaPfrXJy3X+zietaz/i28VywSb2L
 2AUHuNfWfXOOMwHY43qipxl+pP+GOdx2/j2Rt5yeWI3XiDrstccy786p7
 PGAIHHfaLMfelFOE4hi8EhuLgoydcsVps6WfNJq6/1kkydYb9YAQiv7ug
 1nX2OZAtv7cKutK6jBW58dQjm+/dnfj6GGKyuMxMO034wIgAjhLYe+wam g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492903"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492903"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431116"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:21 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/19] ASoC: SOF: Introduce IPC ops for kcontrol IO
Date: Thu, 17 Mar 2022 10:50:29 -0700
Message-Id: <20220317175044.1752400-5-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
References: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Introduce IPC-specific ops for kcontrol IO in struct ipc_tplg_ops.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 19386184d8f3..d241dd84e708 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -45,6 +45,28 @@ struct snd_sof_dai_config_data {
 	int dai_data; /* contains DAI-specific information */
 };
 
+/**
+ * struct ipc_tplg_control_ops - IPC-specific ops for topology kcontrol IO
+ */
+struct ipc_tplg_control_ops {
+	bool (*volume_put)(struct snd_sof_control *scontrol, struct snd_ctl_elem_value *ucontrol);
+	int (*volume_get)(struct snd_sof_control *scontrol, struct snd_ctl_elem_value *ucontrol);
+	bool (*switch_put)(struct snd_sof_control *scontrol, struct snd_ctl_elem_value *ucontrol);
+	int (*switch_get)(struct snd_sof_control *scontrol, struct snd_ctl_elem_value *ucontrol);
+	bool (*enum_put)(struct snd_sof_control *scontrol, struct snd_ctl_elem_value *ucontrol);
+	int (*enum_get)(struct snd_sof_control *scontrol, struct snd_ctl_elem_value *ucontrol);
+	int (*bytes_put)(struct snd_sof_control *scontrol, struct snd_ctl_elem_value *ucontrol);
+	int (*bytes_get)(struct snd_sof_control *scontrol, struct snd_ctl_elem_value *ucontrol);
+	int (*bytes_ext_get)(struct snd_sof_control *scontrol,
+			     const unsigned int __user *binary_data, unsigned int size);
+	int (*bytes_ext_volatile_get)(struct snd_sof_control *scontrol,
+				      const unsigned int __user *binary_data, unsigned int size);
+	int (*bytes_ext_put)(struct snd_sof_control *scontrol,
+			     const unsigned int __user *binary_data, unsigned int size);
+	/* update control data based on notification from the DSP */
+	void (*update)(struct snd_sof_dev *sdev, void *ipc_control_message);
+};
+
 /**
  * struct sof_ipc_tplg_widget_ops - IPC-specific ops for topology widgets
  * @ipc_setup: Function pointer for setting up widget IPC params
@@ -67,6 +89,7 @@ struct sof_ipc_tplg_widget_ops {
  * @widget: Array of pointers to IPC-specific ops for widgets. This should always be of size
  *	    SND_SOF_DAPM_TYPE_COUNT i.e one per widget type. Unsupported widget types will be
  *	    initialized to 0.
+ * @control: Pointer to the IPC-specific ops for topology kcontrol IO
  * @route_setup: Function pointer for setting up pipeline connections
  * @token_list: List of all tokens supported by the IPC version. The size of the token_list
  *		array should be SOF_TOKEN_COUNT. The unused elements in the array will be
@@ -80,6 +103,7 @@ struct sof_ipc_tplg_widget_ops {
  */
 struct sof_ipc_tplg_ops {
 	const struct sof_ipc_tplg_widget_ops *widget;
+	const struct ipc_tplg_control_ops *control;
 	int (*route_setup)(struct snd_sof_dev *sdev, struct snd_sof_route *sroute);
 	const struct sof_token_info *token_list;
 	int (*control_setup)(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol);
-- 
2.25.1

