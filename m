Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B403746C3DC
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 20:44:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DBD7254F;
	Tue,  7 Dec 2021 20:43:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DBD7254F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638906256;
	bh=WdrMoPGgEOnQI+i2+zuisP5sKGAUVzQeQoA0TfpI4mY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C6ovSftVoDHhouir7+o2VPI3PNclW8T232qxMmIO87kRgtvyMCVQ4k8lbeUiPz5Gz
	 8+MFcdNi64kJ+x/3EQ3rz3TK8EjNnjLTvKb7QdblBZ5uwkGH7KJ1cQIL80XOGq85Fp
	 LkCT4qTB//l1PJMEv0DMTTDO8mkM0dFFn0MVrxHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AE0AF80534;
	Tue,  7 Dec 2021 20:40:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B06EF80510; Tue,  7 Dec 2021 20:40:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 498C9F8028D
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 20:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 498C9F8028D
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236407816"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="236407816"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:40:12 -0800
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="479641188"
Received: from nthiag2-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.74.17])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:40:11 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/7] ASoC: SOF: Intel: hda-dai: remove unused fields
Date: Tue,  7 Dec 2021 13:39:46 -0600
Message-Id: <20211207193947.71080-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207193947.71080-1-pierre-louis.bossart@linux.intel.com>
References: <20211207193947.71080-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

The existing code does not use the 'host_dma_id', 'link_dma_id',
'host_bps' fields remove them.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 8c1d7ddb00e2..35ffb71116c6 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -21,8 +21,6 @@
 #endif
 
 struct hda_pipe_params {
-	u8 host_dma_id;
-	u8 link_dma_id;
 	u32 ch;
 	u32 s_freq;
 	u32 s_fmt;
@@ -30,7 +28,6 @@ struct hda_pipe_params {
 	snd_pcm_format_t format;
 	int link_index;
 	int stream;
-	unsigned int host_bps;
 	unsigned int link_bps;
 };
 
@@ -256,7 +253,6 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	p_params.ch = params_channels(params);
 	p_params.s_freq = params_rate(params);
 	p_params.stream = substream->stream;
-	p_params.link_dma_id = stream_tag - 1;
 	p_params.link_index = link->index;
 	p_params.format = params_format(params);
 
-- 
2.25.1

