Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A26687EB9
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 14:32:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC45BE8F;
	Thu,  2 Feb 2023 14:31:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC45BE8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675344745;
	bh=qFV2i75zO5MVG4AiexOVN5pRHMk14Pc1mQpx6RGneuA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YoltHBltEJtIZyO8G3da37zUz75pthTHvjzCS/kTE7YglRQ74jg+DLrQJeoYYNWEq
	 xE2KTHZPHR1PnuSouIGE2UPzxt60SPtGYMBBzlyp1uPb1cVDFfU5CiTEGUyJYys6t/
	 AVo35XZB8I5Xm15hln4tTYDEwUW9GnW1ogxXcz1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02505F80571;
	Thu,  2 Feb 2023 14:30:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C564BF80578; Thu,  2 Feb 2023 14:30:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2217CF80568
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 14:30:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2217CF80568
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nOFf/zXC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675344612; x=1706880612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qFV2i75zO5MVG4AiexOVN5pRHMk14Pc1mQpx6RGneuA=;
 b=nOFf/zXC5+23La4P60IbLroMDx9ongu54x5HYco9CEJuFZtMOJ3fdS/l
 GgtzuSGd37Fy4sEZGH+HQweLMmM3+QDNRn82rxLNJtKrQY1IqfDVDmLDI
 x04C6AEfbMNE+HGBZ90wMq9P/deEwQfKpSjcuA/va/bj1z6bT0SBiPzmT
 /UdyBN9NStzWNXGKcFu+rCb/l8uFjngntgVJN1fa9QYHbU2FFUPYnZsgU
 52UetA5zAzxxO8eIhHJ/3tsQ1TWa+GGbnu5SgfaizJnAvKA0OuL8Jkbce
 m36VfeTTGPh8QlxhPjwEp7paQKcPhAu3/s9HKpZCKLx4CdBKLZaZS1NnM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308783325"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="308783325"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 05:30:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="658727471"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="658727471"
Received: from jpdamery-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.1.104])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 05:30:05 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz
Subject: [PATCH v3 7/9] ASoC: SOF: add get_stream_position ops for pcm delay
Date: Thu,  2 Feb 2023 15:29:52 +0200
Message-Id: <20230202132954.26773-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202132954.26773-1-peter.ujfalusi@linux.intel.com>
References: <20230202132954.26773-1-peter.ujfalusi@linux.intel.com>
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

