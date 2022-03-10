Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4172C4D404E
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 05:30:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD035171C;
	Thu, 10 Mar 2022 05:29:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD035171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646886630;
	bh=7QBiyqzjIivBGSxyLTX8Sy7Um8n0/kj3Eb9Rbn/aaA0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GtkN1qAjqUQGAx96UKTMBXkmMuOhry8HG3MnuWTTEJqWb2WFHfb2vidQYjdFHGcML
	 M6IK3GKETxB2hfJLFYkzhWoSu0A3v0rdVsOMoI9ilvluUSaeHAYBhdMNVoIWdvsIDX
	 271nR+LL4NR4iSO0VKHf/PMREuf2gUg7eBQIEIU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADFAAF8052D;
	Thu, 10 Mar 2022 05:28:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7C3CF8051D; Thu, 10 Mar 2022 05:27:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75D29F80425
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 05:27:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75D29F80425
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nkhNXFTa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646886468; x=1678422468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7QBiyqzjIivBGSxyLTX8Sy7Um8n0/kj3Eb9Rbn/aaA0=;
 b=nkhNXFTalj2xvZkcRbJuEeVWxU8kWU9hOMwpqvgG/pJQmEfg7lNj6VdJ
 aCyDx6IXZ2dw/DHjbmgV5PwOtHH4q1RmCD/zRtO04Rgm8419k5Pmmltvm
 2qtPj5LOyoK5sCH+qXaRHfHxcp9qHIKtKueLtdOV9ZrQsDvK0XQEZY5my
 mezeIHTGMVhOV0zDs0c9rFbFALo2Dg+uTGIduoQH5mDQMBMFmwxbnNeoP
 f4Esii1slSxFxci+0MdQtTAQKcw97CllOaybGP125ptogySrY/xQliiNe
 +LNkyO0Gk4vfajuINjKSIFJrN4Tf78F+lZ1RDXkKw5Zk52q78Id3TQ2Zr Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318380891"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="318380891"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:32 -0800
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="547884685"
Received: from ttahmed-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.50.225])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:32 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/10] ASoC: SOF: stream-ipc: Add sof_set_stream_data_offset()
Date: Wed,  9 Mar 2022 20:27:16 -0800
Message-Id: <20220310042720.976809-7-ranjani.sridharan@linux.intel.com>
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

Add implementation for the generic set_stream_data_offset() callback in
core to be used by platforms.

Convert the sof_ipc_pcm_params() to a wrapper for the new function.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-priv.h   |  3 +++
 sound/soc/sof/stream-ipc.c | 15 +++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 2791d25f7ac3..49e4d87bd467 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -626,6 +626,9 @@ int sof_ipc_msg_data(struct snd_sof_dev *sdev,
 int sof_ipc_pcm_params(struct snd_sof_dev *sdev,
 		       struct snd_pcm_substream *substream,
 		       const struct sof_ipc_pcm_params_reply *reply);
+int sof_set_stream_data_offset(struct snd_sof_dev *sdev,
+			       struct snd_pcm_substream *substream,
+			       size_t posn_offset);
 
 int sof_stream_pcm_open(struct snd_sof_dev *sdev,
 			struct snd_pcm_substream *substream);
diff --git a/sound/soc/sof/stream-ipc.c b/sound/soc/sof/stream-ipc.c
index 15a55851faeb..b7b96b9f5279 100644
--- a/sound/soc/sof/stream-ipc.c
+++ b/sound/soc/sof/stream-ipc.c
@@ -45,12 +45,11 @@ int sof_ipc_msg_data(struct snd_sof_dev *sdev,
 }
 EXPORT_SYMBOL(sof_ipc_msg_data);
 
-int sof_ipc_pcm_params(struct snd_sof_dev *sdev,
-		       struct snd_pcm_substream *substream,
-		       const struct sof_ipc_pcm_params_reply *reply)
+int sof_set_stream_data_offset(struct snd_sof_dev *sdev,
+			       struct snd_pcm_substream *substream,
+			       size_t posn_offset)
 {
 	struct sof_stream *stream = substream->runtime->private_data;
-	size_t posn_offset = reply->posn_offset;
 
 	/* check if offset is overflow or it is not aligned */
 	if (posn_offset > sdev->stream_box.size ||
@@ -64,6 +63,14 @@ int sof_ipc_pcm_params(struct snd_sof_dev *sdev,
 
 	return 0;
 }
+EXPORT_SYMBOL(sof_set_stream_data_offset);
+
+int sof_ipc_pcm_params(struct snd_sof_dev *sdev,
+		       struct snd_pcm_substream *substream,
+		       const struct sof_ipc_pcm_params_reply *reply)
+{
+	return sof_set_stream_data_offset(sdev, substream, reply->posn_offset);
+}
 EXPORT_SYMBOL(sof_ipc_pcm_params);
 
 int sof_stream_pcm_open(struct snd_sof_dev *sdev,
-- 
2.25.1

