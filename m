Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A247137A73
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jan 2020 01:05:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAF4016B9;
	Sat, 11 Jan 2020 01:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAF4016B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578701117;
	bh=L1NWtnvAP8TpXFrbJXQjWctO7z4C+BWuHkVYFZvv8Z8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DSMEMHXXRisHz7Axhn0BaaMyTMHYakso8n6aToCoqBCR21PutNR7SXpGS24GD3FRG
	 AZUwsFIThmPdUFd2W/pfqcADjW4fbkfD+L3T1/O35JDxZb3ktwWH4AxqVPll82Wl5C
	 F6SExxMYsizw5uSY3N/bStU8FiIml5fydwU98Y8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37037F802C4;
	Sat, 11 Jan 2020 00:58:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F26CF8024A; Sat, 11 Jan 2020 00:58:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF678F80116
 for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2020 00:58:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF678F80116
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 15:58:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,418,1571727600"; d="scan'208";a="224345304"
Received: from jrderube-mobl5.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.155.251])
 by orsmga003.jf.intel.com with ESMTP; 10 Jan 2020 15:58:10 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 10 Jan 2020 17:57:49 -0600
Message-Id: <20200110235751.3404-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110235751.3404-1-pierre-louis.bossart@linux.intel.com>
References: <20200110235751.3404-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 6/8] ASoC: SOF: fix PCM playback through ALSA
	OSS emulation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Any app using ALSA OSS emulation on top of SOF will fail
to error from OSS SNDCTL_DSP_SETFMT ioctl. Reported initially
as an issue with xournalpp (application using PortAudio with
an OSS backend), but applies more generally to other apps
using OSS as well.

Problem is caused by SOF PCM not supporting repeated calls
to hw_params(), without matching calls to pcm_free(). This
is however exactly what the ALSA OSS PCM code is doing when
it is handling the OSS ioctls.

The problem will lead to leaking of DSP resources and eventual
failure of DSP PCM_PARAMS IPC.

BugLink: https://github.com/thesofproject/linux/issues/1510
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c | 53 ++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 9bb6388742e1..314f3095c12f 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -92,7 +92,27 @@ void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream)
 }
 EXPORT_SYMBOL(snd_sof_pcm_period_elapsed);
 
-/* this may get called several times by oss emulation */
+static int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream,
+				struct snd_sof_dev *sdev,
+				struct snd_sof_pcm *spcm)
+{
+	struct sof_ipc_stream stream;
+	struct sof_ipc_reply reply;
+	int ret;
+
+	stream.hdr.size = sizeof(stream);
+	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_FREE;
+	stream.comp_id = spcm->stream[substream->stream].comp_id;
+
+	/* send IPC to the DSP */
+	ret = sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
+				 sizeof(stream), &reply, sizeof(reply));
+	if (!ret)
+		spcm->prepared[substream->stream] = false;
+
+	return ret;
+}
+
 static int sof_pcm_hw_params(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
@@ -113,6 +133,16 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	if (!spcm)
 		return -EINVAL;
 
+	/*
+	 * Handle repeated calls to hw_params() without free_pcm() in
+	 * between. At least ALSA OSS emulation depends on this.
+	 */
+	if (spcm->prepared[substream->stream]) {
+		ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
+		if (ret < 0)
+			return ret;
+	}
+
 	dev_dbg(component->dev, "pcm: hw params stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
 
@@ -201,27 +231,6 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	return ret;
 }
 
-static int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream,
-				struct snd_sof_dev *sdev,
-				struct snd_sof_pcm *spcm)
-{
-	struct sof_ipc_stream stream;
-	struct sof_ipc_reply reply;
-	int ret;
-
-	stream.hdr.size = sizeof(stream);
-	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_FREE;
-	stream.comp_id = spcm->stream[substream->stream].comp_id;
-
-	/* send IPC to the DSP */
-	ret = sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
-				 sizeof(stream), &reply, sizeof(reply));
-	if (!ret)
-		spcm->prepared[substream->stream] = false;
-
-	return ret;
-}
-
 static int sof_pcm_hw_free(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
