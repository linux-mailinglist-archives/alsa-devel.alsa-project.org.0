Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 867A04DCCFF
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:55:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51048193A;
	Thu, 17 Mar 2022 18:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51048193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539743;
	bh=oh448Xd11lB3oMc5RnUnNqrLe+WesJgQE7IDz0X9HDk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LN7rBzVV8ahZVyTbIS/YMWU68rcfHimqzRblHryLMgybh316cE3y5r1eGa52RA0Wu
	 JhbmDowMsdMcgW5fwK+WPv2MyDI8js7/iB4Upj7PNGz+7lRJOf+D5QrqzyAI7Z9px2
	 J7V57h35dz9I17nJOjzrH3Ayj+q5AiIszK0rVSR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22685F80542;
	Thu, 17 Mar 2022 18:52:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E6FEF80537; Thu, 17 Mar 2022 18:52:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95E88F8051F
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95E88F8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="e2OKFquU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539514; x=1679075514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oh448Xd11lB3oMc5RnUnNqrLe+WesJgQE7IDz0X9HDk=;
 b=e2OKFquUAaWTgy/OwGLiHgHfb4biYHEdxeJ4Icw2M4mg2JhyHopU2tv3
 sAmjIbW5UOusGuLxx9gSTRILQuFtmVV/Slj3thKfGDMAn6SM7LqGBRM8a
 PlYscSKksdRp9iR0we2t9QZ7q3IwDd9pxfDcRvDOBKwKC66CvnpcXDa7N
 oerR5UxZsdW60T/qCfDBMOUtlRHJEsjepmMp6AONqBE6aCbJ5/xgEfXAB
 QW8BmDKaeeZOSq1a0WHDYQTY8avrTIW76fZq1ZYpPVg9MoyR5UzRADEvO
 KJFyXX5Vy7FbwLp1uaV+YZl7t5rx9UP0CfLNb7yBtxihYSnhmhrWBqUEM w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492921"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492921"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431142"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:23 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/19] ASoC: SOF: Introduce IPC-specific PCM ops
Date: Thu, 17 Mar 2022 10:50:36 -0700
Message-Id: <20220317175044.1752400-12-ranjani.sridharan@linux.intel.com>
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

Introduce the IPC-specific PCM ops that will be used to abstract the
PCM related IPC's.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.h | 17 +++++++++++++++++
 sound/soc/sof/sof-priv.h  |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index bcd38c882078..4d25e781e5ae 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -45,6 +45,23 @@ struct snd_sof_dai_config_data {
 	int dai_data; /* contains DAI-specific information */
 };
 
+/**
+ * struct sof_ipc_pcm_ops - IPC-specific PCM ops
+ * @hw_params: Function pointer for hw_params
+ * @hw_free: Function pointer for hw_free
+ * @trigger: Function pointer for trigger
+ * @dai_link_fixup: Function pointer for DAI link fixup
+ */
+struct sof_ipc_pcm_ops {
+	int (*hw_params)(struct snd_soc_component *component, struct snd_pcm_substream *substream,
+			 struct snd_pcm_hw_params *params,
+			 struct snd_sof_platform_stream_params *platform_params);
+	int (*hw_free)(struct snd_soc_component *component, struct snd_pcm_substream *substream);
+	int (*trigger)(struct snd_soc_component *component,  struct snd_pcm_substream *substream,
+		       int cmd);
+	int (*dai_link_fixup)(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
+};
+
 /**
  * struct sof_ipc_tplg_control_ops - IPC-specific ops for topology kcontrol IO
  */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 3e883044dd0f..0d9b640ae24c 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -371,15 +371,18 @@ struct sof_ipc_pm_ops {
 };
 
 struct sof_ipc_tplg_ops;
+struct sof_ipc_pcm_ops;
 
 /**
  * struct sof_ipc_ops - IPC-specific ops
  * @tplg:	Pointer to IPC-specific topology ops
  * @pm:		Pointer to PM ops
+ * @pcm:	Pointer to PCM ops
  */
 struct sof_ipc_ops {
 	const struct sof_ipc_tplg_ops *tplg;
 	const struct sof_ipc_pm_ops *pm;
+	const struct sof_ipc_pcm_ops *pcm;
 };
 
 /* SOF generic IPC data */
-- 
2.25.1

