Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB6B687BE3
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 12:14:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99BFBA4D;
	Thu,  2 Feb 2023 12:13:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99BFBA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675336443;
	bh=qFV2i75zO5MVG4AiexOVN5pRHMk14Pc1mQpx6RGneuA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nFeVW109mKzTqlaQ1kNooWwfWNDHlIUTVGWVCQvRuMD6hu65JwGnFiVzfa/FuE6+u
	 aECumjaTew6FwmlYvSXEJTrmKLIuB8gsN/8GJzbHcbQ72xmpqYQ0WGLUK0pBdXRNVJ
	 hsoq/YOz9jHcBy8uMXrXnYGUX3fmCt6LVkYuFAWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0CBFF8056F;
	Thu,  2 Feb 2023 12:11:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 132EBF8055C; Thu,  2 Feb 2023 12:11:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0363F80552
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 12:11:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0363F80552
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=N8SRpIl0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675336303; x=1706872303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qFV2i75zO5MVG4AiexOVN5pRHMk14Pc1mQpx6RGneuA=;
 b=N8SRpIl0bE+phg+aw14vKu6Yjadl9rZGjK8GC3aFIwcm/Bo/JEFodUZd
 lKft/pKTeo6xuvgiTukck5vO5p+ZBcDfTi1ivPU+sLLnsc0e2/WqjS5zJ
 RmOFhGOxaGP8dUMEHWUeMTMGQXL+vY3I9khi+2ma8M83cF7KXO4VF2w1r
 +blSYQSXfdojX7psTdihp0WheyY75kJKYM4/xCXDJhN57zq5Mh+KA1t2j
 NVlGgdTAIdiqyINqLDpQ12erd9LyCAehW77xG/1bxSxG+kLqQCnXDqPKZ
 tj0Lp6XqWlccXm8RaDGYWrWeWvN05GFJUerCtytSXU3ZdlOkLR1P+9zZy w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="414625222"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="414625222"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 03:11:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695747701"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="695747701"
Received: from jpdamery-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.1.104])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 03:11:36 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz
Subject: [PATCH v2 7/9] ASoC: SOF: add get_stream_position ops for pcm delay
Date: Thu,  2 Feb 2023 13:11:21 +0200
Message-Id: <20230202111123.25231-8-peter.ujfalusi@linux.intel.com>
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

PCM delay depends on stream position based on hardware
counter to calculate stream delay so add this ops to get
stream position according to hardware counter.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ops.h      | 10 ++++++++++
 sound/soc/sof/sof-priv.h |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index febe318b9427..03752c8405ca 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -511,6 +511,16 @@ static inline int snd_sof_pcm_platform_ack(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+static inline u64 snd_sof_pcm_get_stream_position(struct snd_sof_dev *sdev,
+						  struct snd_soc_component *component,
+						  struct snd_pcm_substream *substream)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->get_stream_position)
+		return sof_ops(sdev)->get_stream_position(sdev, component, substream);
+
+	return 0;
+}
+
 /* machine driver */
 static inline int
 snd_sof_machine_register(struct snd_sof_dev *sdev, void *pdata)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index fd1c3b17a396..14f7adb2dc12 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -248,6 +248,15 @@ struct snd_sof_dsp_ops {
 	/* pcm ack */
 	int (*pcm_ack)(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream); /* optional */
 
+	/*
+	 * optional callback to retrieve the link DMA position for the substream
+	 * when the position is not reported in the shared SRAM windows but
+	 * instead from a host-accessible hardware counter.
+	 */
+	u64 (*get_stream_position)(struct snd_sof_dev *sdev,
+				   struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream); /* optional */
+
 	/* host read DSP stream data */
 	int (*ipc_msg_data)(struct snd_sof_dev *sdev,
 			    struct snd_sof_pcm_stream *sps,
-- 
2.39.1

