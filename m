Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 735EC4D404C
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 05:29:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E7B21760;
	Thu, 10 Mar 2022 05:29:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E7B21760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646886594;
	bh=1iRPoXf5x2Di7zV/Jh4ft5+ROpXXG4SQf/grKiwLFEA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MZvYCdylFesThJz79xI/pL8qaX/sVfF2Zd8wzhMhNQG1RgyRIc9cXJ7QGd0jS2PaS
	 0IFZoOlYr1xqRj4k+aCMVw3vQVpEGE9UTcN9eO2SI7kmWdej5vTVr23gKzhNE0hbSy
	 DIYTlDUMkFsEy5TiZ7fdUeL7E2mRUeQuMNKW37YA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44CC1F8051E;
	Thu, 10 Mar 2022 05:27:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26FFAF8051C; Thu, 10 Mar 2022 05:27:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9537EF80515
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 05:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9537EF80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fp5F6Nhl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646886468; x=1678422468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1iRPoXf5x2Di7zV/Jh4ft5+ROpXXG4SQf/grKiwLFEA=;
 b=fp5F6Nhlz//ObhSCBjyYagtfyiZ06fI0JdQUc7EJz4NTkQeIUZ1JMD1F
 wcjCOf1PWL5M9bmZFVoT41PnsxHpWmM5nhBSyYlOq6F2Q+06tdKA65tx7
 nvTlF3DbQ+D5JSDe4mojCtHXi+R/F9B3MXPjUBVW+0Q0kfFo0N737jmWH
 I4dH9zOZw7mzuU2iGPYkYKqgHJKbvw+1QqMCw7/FILajU7+4uwYzX5per
 qX3KUf53rcvPfAo4Yv1ISN1yWnxgVTgRb8u2AmXFs+3K7y13X4KVWj4Gg
 Tu555Zbu+6AbqXGTJogQPxdQ2jJVJiHsI+kRe3/VEK8SePpwXqDe6SzLx g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318380887"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="318380887"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:32 -0800
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="547884676"
Received: from ttahmed-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.50.225])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:31 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/10] ASoC: SOF: Introduce optional callback to configure
 stream data offset
Date: Wed,  9 Mar 2022 20:27:14 -0800
Message-Id: <20220310042720.976809-5-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
References: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Each running audio stream's data have distinct start offset within the
stream mailbox area from/to where the host can read/write.

Instead of using the struct sof_ipc_pcm_params_reply to configure this
offset, add an optional callback which is IPC agnostic.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ops.h      | 13 +++++++++++++
 sound/soc/sof/pcm.c      |  8 ++++++++
 sound/soc/sof/sof-priv.h |  5 +++++
 3 files changed, 26 insertions(+)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 98fa91f5927d..f21d4a7ac261 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -476,6 +476,19 @@ snd_sof_ipc_pcm_params(struct snd_sof_dev *sdev,
 	return sof_ops(sdev)->ipc_pcm_params(sdev, substream, reply);
 }
 
+/* host side configuration of the stream's data offset in stream mailbox area */
+static inline int
+snd_sof_set_stream_data_offset(struct snd_sof_dev *sdev,
+			       struct snd_pcm_substream *substream,
+			       size_t posn_offset)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->set_stream_data_offset)
+		return sof_ops(sdev)->set_stream_data_offset(sdev, substream,
+							     posn_offset);
+
+	return 0;
+}
+
 /* host stream pointer */
 static inline snd_pcm_uframes_t
 snd_sof_pcm_platform_pointer(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 93989a77873a..af8c367cd55c 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -276,6 +276,14 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 		return ret;
 	}
 
+	ret = snd_sof_set_stream_data_offset(sdev, substream,
+					     ipc_params_reply.posn_offset);
+	if (ret < 0) {
+		dev_err(component->dev, "%s: invalid stream data offset for PCM %d\n",
+			__func__, spcm->pcm.pcm_id);
+		return ret;
+	}
+
 	spcm->prepared[substream->stream] = true;
 
 	/* save pcm hw_params */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 3c50defcfb25..3a2804c82bae 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -226,6 +226,11 @@ struct snd_sof_dsp_ops {
 			      struct snd_pcm_substream *substream,
 			      const struct sof_ipc_pcm_params_reply *reply); /* mandatory */
 
+	/* host side configuration of the stream's data offset in stream mailbox area */
+	int (*set_stream_data_offset)(struct snd_sof_dev *sdev,
+				      struct snd_pcm_substream *substream,
+				      size_t posn_offset); /* optional */
+
 	/* pre/post firmware run */
 	int (*pre_fw_run)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*post_fw_run)(struct snd_sof_dev *sof_dev); /* optional */
-- 
2.25.1

