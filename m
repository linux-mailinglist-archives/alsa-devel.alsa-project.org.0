Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED43A253784
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 20:49:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9985C17A4;
	Wed, 26 Aug 2020 20:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9985C17A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598467752;
	bh=itPX26kg1lGyIyFASQJxPAn2374gGupyGzEh/19NPL8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BXa9vGssVACUF29Z2nEFhZ8md14x55WsVEcbtIHlTI40EKvtiW+qm61oSVJxihjqi
	 WMqAa/PXtxPoD77hIL771d5X77lggZdUNa7p/R3c9i594UiyGyfE3a58Q3PWwn6Csn
	 +ZQJCrU3XpFrcGuZo7+sYGDWhMmQjiFugkSdX+8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73DEDF802A0;
	Wed, 26 Aug 2020 20:46:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84266F802C4; Wed, 26 Aug 2020 20:45:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32376F801D9
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 20:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32376F801D9
IronPort-SDR: 4+TYJtX9nDmTUPR5uchKfWt16vWOON4dRDxeovMo3UK9VsiIpJC6B2+1xWQo0yG36fg2dzo2Gb
 P9FnmGyEKOGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="174418620"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="174418620"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:46 -0700
IronPort-SDR: 6CVIwjQUe6bfDzVcn4GGMF4HT1E5rzCcWJbRHI/JRTGf7Z6uAl+Mq7GbW1jB2NtR1AMfh1ITwf
 /vxuehaXVQDg==
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="500347338"
Received: from sghoshal-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.145.101])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:46 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/8] ASoC: SOF: Intel: hda: define macro for code loader
 stream format
Date: Wed, 26 Aug 2020 11:45:29 -0700
Message-Id: <20200826184532.1612070-6-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
References: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

This will be used for the ICCMAX stream as well.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 804f5f64aa33..9b4844aa3023 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -22,6 +22,7 @@
 #include "hda.h"
 
 #define HDA_FW_BOOT_ATTEMPTS	3
+#define HDA_CL_STREAM_FORMAT 0x40
 
 static int cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
 			     unsigned int size, struct snd_dma_buffer *dmab,
@@ -309,7 +310,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	init_waitqueue_head(&sdev->boot_wait);
 
 	/* prepare DMA for code loader stream */
-	tag = cl_stream_prepare(sdev, 0x40, stripped_firmware.size,
+	tag = cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
 				&sdev->dmab, SNDRV_PCM_STREAM_PLAYBACK);
 
 	if (tag < 0) {
-- 
2.25.1

