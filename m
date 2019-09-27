Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 227E2C0C74
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 22:14:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB55F167A;
	Fri, 27 Sep 2019 22:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB55F167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569615269;
	bh=prA02nStOh/lWhlKVERCMJFRKP/0nQo/AKDS62ojVDU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UoupsGlhVa0y46P2Bs0r11Ob/2uol7II3liQGpXLOftyGMPWvRFqWe3vUb/TKdbQU
	 3XpzLr16kBB3f84lUHg1SEk4F/C7Ojadg92/NfTU7tSuKQWIO0NDSRVGhU8yYbiDp7
	 6vgIVV6e3z7pPinwbg63wLkDpn3v6/u88aJhjAe4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DCB4F806E5;
	Fri, 27 Sep 2019 22:06:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79058F80612; Fri, 27 Sep 2019 22:06:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4130F805F8
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 22:06:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4130F805F8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 13:05:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,556,1559545200"; d="scan'208";a="190444272"
Received: from wcui-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.146.136])
 by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2019 13:05:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 27 Sep 2019 15:05:34 -0500
Message-Id: <20190927200538.660-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927200538.660-1-pierre-louis.bossart@linux.intel.com>
References: <20190927200538.660-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Marcin Rajwa <marcin.rajwa@linux.intel.com>
Subject: [alsa-devel] [PATCH 09/13] ASoC: SOF: Intel: hda: fix reset of
	host_period_bytes
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

From: Marcin Rajwa <marcin.rajwa@linux.intel.com>

This patch prevents the reset of host period bytes
and uses no_stream_position to record requests
for stream position.

Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-pcm.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 9b730f183529..575f5f5877d8 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -89,6 +89,7 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 	struct hdac_ext_stream *stream = stream_to_hdac_ext_stream(hstream);
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct snd_dma_buffer *dmab;
+	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
 	int ret;
 	u32 size, rate, bits;
 
@@ -116,9 +117,17 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 	/* disable SPIB, to enable buffer wrap for stream */
 	hda_dsp_stream_spib_config(sdev, stream, HDA_DSP_SPIB_DISABLE, 0);
 
-	/* set host_period_bytes to 0 if no IPC position */
-	if (hda && hda->no_ipc_position)
-		ipc_params->host_period_bytes = 0;
+	/* update no_stream_position flag for ipc params */
+	if (hda && hda->no_ipc_position) {
+		/* For older ABIs set host_period_bytes to zero to inform
+		 * FW we don't want position updates. Newer versions use
+		 * no_stream_position for this purpose.
+		 */
+		if (v->abi_version < SOF_ABI_VER(3, 10, 0))
+			ipc_params->host_period_bytes = 0;
+		else
+			ipc_params->no_stream_position = 1;
+	}
 
 	ipc_params->stream_tag = hstream->stream_tag;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
