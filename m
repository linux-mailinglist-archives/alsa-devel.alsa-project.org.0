Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4E34CDEEC
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 21:59:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D2441F1B;
	Fri,  4 Mar 2022 21:58:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D2441F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646427571;
	bh=CRC2ct/DfIi+0TNCQ4GKAKVmOEb0xUCX2cI/seYG3BA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UMchwY0WaYIvkGjgWI/pWKRPMplLAdhrvBGOcHmEofzwRQFBqo80jbf7u2nQJ4teF
	 SEOL5GbWI2yT/AeLiM2afl3H1aBUCg82eilZ8iWu63fU9tir/rSruJSSbpK4yprpzb
	 3zlOJORyplMyGxtJQ5k0CBnB94g3+KUHtqvRxvXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36D65F800F2;
	Fri,  4 Mar 2022 21:57:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC286F80311; Fri,  4 Mar 2022 21:57:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFABAF801EC
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 21:57:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFABAF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Z2tFdEHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646427468; x=1677963468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CRC2ct/DfIi+0TNCQ4GKAKVmOEb0xUCX2cI/seYG3BA=;
 b=Z2tFdEHUsRnLxtUG8BKRkHZg6JSDzbqsoBiQQINJX36IOpIHHCtes0wb
 QnG+2acMv7mifg7JofcQoM0FSGtVJkYKcC2CIxocISJVMBBUroE7dzPhW
 tILaeRkOPi8MeIgdyDD1Xny2bN+8xtL0K2EalvnwQmgOlf7qw1tiQozQq
 OuC6h9bxK7bEXkMfQ/PegWf6PI4fPtKN7MwVdfTqG/L8Afa4gGpUMz0go
 fxw9fl98QFjukgzy5c07p/zUpSJ2c+INW6Qx8InF54O6W8OoKIiEYsWQo
 1ZDfTWoPC2vjiD5AOvpWCEMnu6oV4M5Qum0eZ5iLiGaGu+tIH6bzce46X Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="340492547"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="340492547"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:42 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="631271282"
Received: from grmundad-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.115.48])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:41 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/10] ASoC: SOF: amd: acp-pcm: Take buffer information
 directly from runtime
Date: Fri,  4 Mar 2022 14:57:25 -0600
Message-Id: <20220304205733.62233-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
References: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
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

Instead of using the values from ipc_params, take them directly from
substream->runtime.

This is in preparation of making the platform hw_params callback to be
IPC agnostic.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp-pcm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/amd/acp-pcm.c b/sound/soc/sof/amd/acp-pcm.c
index 5b23830cb1f3..b49cc55980ae 100644
--- a/sound/soc/sof/amd/acp-pcm.c
+++ b/sound/soc/sof/amd/acp-pcm.c
@@ -19,13 +19,14 @@
 int acp_pcm_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
 		      struct snd_pcm_hw_params *params, struct sof_ipc_stream_params *ipc_params)
 {
-	struct acp_dsp_stream *stream = substream->runtime->private_data;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct acp_dsp_stream *stream = runtime->private_data;
 	unsigned int buf_offset, index;
 	u32 size;
 	int ret;
 
-	size = ipc_params->buffer.size;
-	stream->num_pages = ipc_params->buffer.pages;
+	size = runtime->dma_bytes;
+	stream->num_pages = PFN_UP(runtime->dma_bytes);
 	stream->dmab = substream->runtime->dma_buffer_p;
 
 	ret = acp_dsp_stream_config(sdev, stream);
-- 
2.30.2

