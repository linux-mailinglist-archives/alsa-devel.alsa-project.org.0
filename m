Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF545D841
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 11:27:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C52F18A1;
	Thu, 25 Nov 2021 11:27:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C52F18A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637836075;
	bh=HLNNMQdyJDnO0oxxuruTNpsLWPdXxQDgA3yHQ44iOKU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eh7FoOZJRzFB0yDLc22qv02rDc7THiPttC6BxD3xsAY8irhwsknU6J7WDUACtezm3
	 RyL1iWi9A3DGTrGNDhW2backSwBcil+VCd9d8DPTFQZ7wlBoQQYT7UWckGqZexAmVj
	 kW8EaGhsF2U0c9gbh26gDqFUfprKvYoOBzaYh2iA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3226AF804BC;
	Thu, 25 Nov 2021 11:24:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4C32F804B1; Thu, 25 Nov 2021 11:24:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F6D9F804FF
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 11:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F6D9F804FF
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="215515289"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="215515289"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 02:23:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="741672091"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 25 Nov 2021 02:23:39 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 07/10] ASoC: SOF: pcm: move the check for prepared flag
Date: Thu, 25 Nov 2021 12:15:17 +0200
Message-Id: <20211125101520.291581-8-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211125101520.291581-1-kai.vehmanen@linux.intel.com>
References: <20211125101520.291581-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Move the check for the prepared flag inside snd_pcm_dsp_pcm_free() to
avoid having to check it before every invocation of the function.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/pcm.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 3aa708b1ac26..c61cd3cc4f02 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -107,6 +107,9 @@ int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream, struct snd_sof_dev
 	struct sof_ipc_reply reply;
 	int ret;
 
+	if (!spcm->prepared[substream->stream])
+		return 0;
+
 	stream.hdr.size = sizeof(stream);
 	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_FREE;
 	stream.comp_id = spcm->stream[substream->stream].comp_id;
@@ -178,11 +181,9 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	 * Handle repeated calls to hw_params() without free_pcm() in
 	 * between. At least ALSA OSS emulation depends on this.
 	 */
-	if (spcm->prepared[substream->stream]) {
-		ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
-		if (ret < 0)
-			return ret;
-	}
+	ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
+	if (ret < 0)
+		return ret;
 
 	dev_dbg(component->dev, "pcm: hw params stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
@@ -298,11 +299,9 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 	dev_dbg(component->dev, "pcm: free stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
 
-	if (spcm->prepared[substream->stream]) {
-		ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
-		if (ret < 0)
-			err = ret;
-	}
+	ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
+	if (ret < 0)
+		err = ret;
 
 	ret = sof_widget_list_free(sdev, spcm, substream->stream);
 	if (ret < 0)
-- 
2.33.0

