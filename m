Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB016101DF
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:40:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D9842DA1;
	Thu, 27 Oct 2022 21:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D9842DA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899644;
	bh=RDOSYGtxP4ldqOOaUKxB6GXEBoUjy++oyOKHOCBcjrQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kvBOkXsJhKd7gvrwm4EQ7ru910qM+IGSevIPLdU0ED5qNri3S1U8/u0/iZkreKA/d
	 qm+H4lsC7lXEWXK9pnkw9qiDvV2glgEASdNt3mnTo9AZkSAsEIAAY7GXZxLDfd0YcN
	 WJfo5DPH4NLyKnUL64uIbgPK8/IU9juGMEQSX6ck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 393C0F805C2;
	Thu, 27 Oct 2022 21:36:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E4E4F80558; Thu, 27 Oct 2022 21:36:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0502FF8055C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0502FF8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="g11WEdMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899378; x=1698435378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RDOSYGtxP4ldqOOaUKxB6GXEBoUjy++oyOKHOCBcjrQ=;
 b=g11WEdMU7u/KxlF7I5P6/efqA2N65238nmhXdSDM6I0txGaKYv5ELukK
 Lj56qUcMi/9jq8lDvKcnH3bdHGeskqsZ+AyYAJNXXdZGtkEbhVl5enO7y
 rAmVfM5DMDFn/vY77cM2RtGNqN5eAbVvHxdajH7UQrD9EQGiCC/XJf6L7
 5RbY5yEuIMu56p/EDOwHsIiW7I117gR9u863PWXCjk9hFS9QHaLVZ3AFI
 WsZeUghr6daE81H3LXZx7yDGTF2MYRcGKwrbtQiRSKKXiicm2IJO/E6qN
 34lnHQ3d9NTsjapJCyWFgCDaJNDUhjfl9+4BHYkAbBxFxzyv/Y4C9I8nm g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957836"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957836"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632527027"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632527027"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/21] ASoC: SOF: Intel: hda-stream: always allocate CORB/RIRB
 buffer
Date: Thu, 27 Oct 2022 15:35:30 -0400
Message-Id: <20221027193540.259520-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
References: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

There is no real reason to filter out this allocation at build
time. Let's allocate it always, so that we can have a more dynamic way
of disabling HDaudio codec support without having to recompile.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index c858f30c08f9..59a3c0c9c21f 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -854,15 +854,16 @@ int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 		return -ENOMEM;
 	}
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	/* mem alloc for the CORB/RIRB ringbuffers */
+	/*
+	 * mem alloc for the CORB/RIRB ringbuffers - this will be used only for
+	 * HDAudio codecs
+	 */
 	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
 				  PAGE_SIZE, &bus->rb);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: RB alloc failed\n");
 		return -ENOMEM;
 	}
-#endif
 
 	/* create capture streams */
 	for (i = 0; i < num_capture; i++) {
@@ -995,11 +996,9 @@ void hda_dsp_stream_free(struct snd_sof_dev *sdev)
 	if (bus->posbuf.area)
 		snd_dma_free_pages(&bus->posbuf);
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	/* free position buffer */
+	/* free CORB/RIRB buffer - only used for HDaudio codecs */
 	if (bus->rb.area)
 		snd_dma_free_pages(&bus->rb);
-#endif
 
 	list_for_each_entry_safe(s, _s, &bus->stream_list, list) {
 		/* TODO: decouple */
-- 
2.34.1

