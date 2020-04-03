Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 199FF19D36C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 11:22:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD0B016AA;
	Fri,  3 Apr 2020 11:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD0B016AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585905765;
	bh=eAfJnO6hxfpZTw7qG33hFE8tcGN/Qw8zM30RBCLEfM0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d+T19nbG0zvKtKzW3J28LQIEufiISt49O5vuSPn8Nci/JeOVjtKxTSZ7P02KvTRtl
	 gnoGFB/AGrxXLAS+gT+xCZxOWBmneb4OF5UAaDbEPKoC2k4In0LDxt4S1fMGH7GV8t
	 wtr9etBgcEHiPcbZBxqq+354Rb1GQJxjmM6vDeZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50AA6F8036A;
	Fri,  3 Apr 2020 11:15:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62BB7F8014C; Fri,  3 Apr 2020 11:14:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBFC8F80299;
 Fri,  3 Apr 2020 11:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBFC8F80299
IronPort-SDR: JmKGaarf661Al7fomJ7MBWRfNKvGlU57eh1M6x9zIKMPdlLpuE6J81WL1Oow5cu6ND2+aSCIV2
 hLoJirDgXZ2w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 02:14:32 -0700
IronPort-SDR: HAc9HnB0CU+v1py1GCSR/OvJrxeh2kXjtkwsBTeyUYRHAcNi2ev0sKwyD6li6JKKreP/kiSIWW
 W8Cn0LXdnStg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="451235024"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.36.113])
 by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2020 02:14:30 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 12/12] [RESEND] ASoC: SOF: VirtIO: enable simultaneous
 playback and capture
Date: Fri,  3 Apr 2020 11:14:06 +0200
Message-Id: <20200403091406.22381-13-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
References: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

Dynamically allocate separate playback and capture buffers to enable
simultaneous playback and capture.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/virtio-fe.c | 53 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/virtio-fe.c b/sound/soc/sof/virtio-fe.c
index aa6da81..807562d 100644
--- a/sound/soc/sof/virtio-fe.c
+++ b/sound/soc/sof/virtio-fe.c
@@ -79,17 +79,13 @@ struct sof_vfe {
 	struct completion completion;
 	spinlock_t vq_lock;
 
-	/* A shared capture / playback virtual queue data buffer */
-	union {
-		struct dsp_sof_data_req data_req;
-		struct dsp_sof_data_resp data_resp;
-	};
+	/* Pointers for virtual queue data buffers */
+	struct dsp_sof_data_req *playback_buf;
+	struct dsp_sof_data_resp *capture_buf;
 
 	/* Headers, used as a playback response or capture request */
-	union {
-		u8 hdr_req[HDR_SIZE_REQ];
-		u8 hdr_resp[HDR_SIZE_RESP];
-	};
+	u8 hdr_req[HDR_SIZE_REQ];
+	u8 hdr_resp[HDR_SIZE_RESP];
 };
 
 /* Firmware ready IPC. */
@@ -422,7 +418,7 @@ static int sof_vfe_pcm_read_part(struct snd_sof_dev *sdev,
 				 void __user *buf, unsigned long chunk_size)
 {
 	struct sof_vfe *vfe = sdev->pdata->vfe;
-	struct dsp_sof_data_resp *data = &vfe->data_resp;
+	struct dsp_sof_data_resp *data = vfe->capture_buf;
 	struct scatterlist sg_out, sg_in, *sgs[] = {&sg_out, &sg_in};
 	struct dsp_sof_data_req *req = (struct dsp_sof_data_req *)vfe->hdr_req;
 	unsigned int len;
@@ -480,7 +476,7 @@ static int sof_vfe_pcm_write_part(struct snd_sof_dev *sdev,
 				  void __user *buf, unsigned long chunk_size)
 {
 	struct sof_vfe *vfe = sdev->pdata->vfe;
-	struct dsp_sof_data_req *data = &vfe->data_req;
+	struct dsp_sof_data_req *data = vfe->playback_buf;
 	struct scatterlist sg_out, sg_in, *sgs[] = {&sg_out, &sg_in};
 	struct dsp_sof_data_resp *resp = (struct dsp_sof_data_resp *)vfe->hdr_resp;
 	unsigned int len;
@@ -596,9 +592,43 @@ static int sof_vfe_pcm_open(struct snd_sof_dev *sdev,
 static int sof_vfe_pcm_close(struct snd_sof_dev *sdev,
 			     struct snd_pcm_substream *substream)
 {
+	struct sof_vfe *vfe = sdev->pdata->vfe;
+
 	pm_runtime_mark_last_busy(sdev->dev);
 	pm_runtime_put_autosuspend(sdev->dev);
 
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		kfree(vfe->playback_buf);
+		vfe->playback_buf = NULL;
+	} else {
+		kfree(vfe->capture_buf);
+		vfe->capture_buf = NULL;
+	}
+
+	return 0;
+}
+
+static int sof_vfe_pcm_hw_params(struct snd_sof_dev *sdev,
+				 struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct sof_ipc_stream_params *ipc_params)
+{
+	struct sof_vfe *vfe = sdev->pdata->vfe;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	    !vfe->playback_buf) {
+		vfe->playback_buf = kmalloc(sizeof(*vfe->playback_buf),
+					    GFP_KERNEL);
+		if (!vfe->playback_buf)
+			return -ENOMEM;
+	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
+		   !vfe->capture_buf) {
+		vfe->capture_buf = kmalloc(sizeof(*vfe->capture_buf),
+					   GFP_KERNEL);
+		if (!vfe->capture_buf)
+			return -ENOMEM;
+	}
+
 	return 0;
 }
 
@@ -629,6 +659,7 @@ struct snd_sof_dsp_ops snd_sof_vfe_ops = {
 
 	.pcm_open	= sof_vfe_pcm_open,
 	.pcm_close	= sof_vfe_pcm_close,
+	.pcm_hw_params	= sof_vfe_pcm_hw_params,
 
 	.run		= sof_vfe_run,
 	.block_read	= sof_vfe_block_read,
-- 
1.9.3

