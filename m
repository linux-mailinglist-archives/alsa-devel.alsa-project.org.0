Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CD0123B5A
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 01:09:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCD421675;
	Wed, 18 Dec 2019 01:08:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCD421675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576627748;
	bh=oVwD9NoJdoeSb+VCMe/0RPrnebnOCxUbApeYevKeuaM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PyO5yCdcnaK1/+YVnPHnoiZuxFf0CSY5IlpWQMBYt5iMp/9PubY31cRYuPH/9M3nq
	 rMjig4kzPhmwxAZ+3Csn7NYmpSq5TVzUNM60EO3xADbqsUj5pTJfmDCBXk29m+T6WD
	 Gsz4fq8lblS3zzFx6V7SvtLI29w//46UecQ6VPXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72A07F80277;
	Wed, 18 Dec 2019 01:05:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B038F8025F; Wed, 18 Dec 2019 01:05:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28B5FF80234
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 01:05:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28B5FF80234
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 16:05:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="266723543"
Received: from dshoemak-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.3.243])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Dec 2019 16:05:30 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 18:05:17 -0600
Message-Id: <20191218000518.5830-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191218000518.5830-1-pierre-louis.bossart@linux.intel.com>
References: <20191218000518.5830-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org
Subject: [alsa-devel] [PATCH v2 2/3] ASoC: SOF: Intel: hda: hda-dai: fix
	oops on hda_link .hw_free
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

When the PCM_PARAM IPC fails while configuring the FE, the kernel
oopses in the HDaudio link DMA .hw_free operation. The root cause is a
NULL dma_data since the BE .hw_params was never called by the SOC
core.

This error can also happen if the HDaudio link DMA configuration IPC
fails in the BE .hw_params.

This patches makes sure the dma_data is properly saved in .hw_params,
and tested before being use in hw_free.

GitHub issue: https://github.com/thesofproject/linux/issues/1417

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 2d9ac0035bd2..7d2903a67503 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -217,6 +217,8 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 		link_dev = hda_link_stream_assign(bus, substream);
 		if (!link_dev)
 			return -EBUSY;
+
+		snd_soc_dai_set_dma_data(dai, substream, (void *)link_dev);
 	}
 
 	stream_tag = hdac_stream(link_dev)->stream_tag;
@@ -229,8 +231,6 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
-	snd_soc_dai_set_dma_data(dai, substream, (void *)link_dev);
-
 	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
 	if (!link)
 		return -EINVAL;
@@ -362,6 +362,13 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 	bus = hstream->bus;
 	rtd = snd_pcm_substream_chip(substream);
 	link_dev = snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!link_dev) {
+		dev_dbg(dai->dev,
+			"%s: link_dev is not assigned\n", __func__);
+		return -EINVAL;
+	}
+
 	hda_stream = hstream_to_sof_hda_stream(link_dev);
 
 	/* free the link DMA channel in the FW */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
