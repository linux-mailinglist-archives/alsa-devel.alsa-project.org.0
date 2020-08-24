Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F05B62509D8
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 22:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A843F167E;
	Mon, 24 Aug 2020 22:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A843F167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598300037;
	bh=iPOcQRQY41wQEAIAzbje38Q/xlFZFdYQoD1FyoIlGQ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KzSHQcsOJOG2qHZii4aZfuZFYVOBjc0SfyyJhDtmCBjnlJDqUXbHKjCXipTzYv8ZI
	 4SXGYIGwaCWiYqInTbxXpXvzqdv2rLx8hXFo92BU9iQa4ehUPLFzY2yPUXV7kY0/gs
	 FaSGzioAMZRWxfyySfCGzkKpg8rcJSi19Daa3iss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C31A3F802EC;
	Mon, 24 Aug 2020 22:09:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFCD5F8025E; Mon, 24 Aug 2020 22:09:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D58BEF800B8
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 22:09:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D58BEF800B8
IronPort-SDR: N4lnJXxoCV5ZsOcJy9DW/YBbpJ2/r9FeUUvTNXQnrUwaTtAav+in+4wo3SAxtkdzapLEjauNYv
 bQsKajDX8iAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="157033731"
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="157033731"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 13:09:25 -0700
IronPort-SDR: wVsYX13wzvEY4BSMQbwe+Xn7najOd3UGRbLM0CRP9J66QASG4iOf/A6dFmLXuZuedBrjqAFQQJ
 qGV9yIYpyTrA==
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="443351198"
Received: from dentoneb-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.223.13])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 13:09:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/8] ASoC: SOF: IPC: reduce verbosity of IPC pointer updates
Date: Mon, 24 Aug 2020 15:09:09 -0500
Message-Id: <20200824200912.46852-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824200912.46852-1-pierre-louis.bossart@linux.intel.com>
References: <20200824200912.46852-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

When using dynamic debug, the console is swamped with verbose position
pointer logs, which really don't add much information. Move then to
vdbg to keep traces usable and allow for easier end-user support.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc.c | 16 +++++++++++-----
 sound/soc/sof/pcm.c |  6 +++---
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 36e2d4d43da4..fd2b96ae4943 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -54,6 +54,7 @@ static void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
 	u8 *str2 = NULL;
 	u32 glb;
 	u32 type;
+	bool vdbg = false;
 
 	glb = cmd & SOF_GLB_TYPE_MASK;
 	type = cmd & SOF_CMD_TYPE_MASK;
@@ -146,6 +147,7 @@ static void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
 		case SOF_IPC_STREAM_TRIG_XRUN:
 			str2 = "TRIG_XRUN"; break;
 		case SOF_IPC_STREAM_POSITION:
+			vdbg = true;
 			str2 = "POSITION"; break;
 		case SOF_IPC_STREAM_VORBIS_PARAMS:
 			str2 = "VORBIS_PARAMS"; break;
@@ -183,10 +185,14 @@ static void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
 		str = "unknown GLB command"; break;
 	}
 
-	if (str2)
-		dev_dbg(dev, "%s: 0x%x: %s: %s\n", text, cmd, str, str2);
-	else
+	if (str2) {
+		if (vdbg)
+			dev_vdbg(dev, "%s: 0x%x: %s: %s\n", text, cmd, str, str2);
+		else
+			dev_dbg(dev, "%s: 0x%x: %s: %s\n", text, cmd, str, str2);
+	} else {
 		dev_dbg(dev, "%s: 0x%x: %s\n", text, cmd, str);
+	}
 }
 #else
 static inline void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
@@ -449,8 +455,8 @@ static void ipc_period_elapsed(struct snd_sof_dev *sdev, u32 msg_id)
 	stream = &spcm->stream[direction];
 	snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
 
-	dev_dbg(sdev->dev, "posn : host 0x%llx dai 0x%llx wall 0x%llx\n",
-		posn.host_posn, posn.dai_posn, posn.wallclock);
+	dev_vdbg(sdev->dev, "posn : host 0x%llx dai 0x%llx wall 0x%llx\n",
+		 posn.host_posn, posn.dai_posn, posn.wallclock);
 
 	memcpy(&stream->posn, &posn, sizeof(posn));
 
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index d730e437e4ba..30e667daffe4 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -446,9 +446,9 @@ static snd_pcm_uframes_t sof_pcm_pointer(struct snd_soc_component *component,
 	dai = bytes_to_frames(substream->runtime,
 			      spcm->stream[substream->stream].posn.dai_posn);
 
-	dev_dbg(component->dev,
-		"PCM: stream %d dir %d DMA position %lu DAI position %lu\n",
-		spcm->pcm.pcm_id, substream->stream, host, dai);
+	dev_vdbg(component->dev,
+		 "PCM: stream %d dir %d DMA position %lu DAI position %lu\n",
+		 spcm->pcm.pcm_id, substream->stream, host, dai);
 
 	return host;
 }
-- 
2.25.1

