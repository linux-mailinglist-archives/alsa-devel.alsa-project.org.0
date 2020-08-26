Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D8125377F
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 20:48:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5E5816C9;
	Wed, 26 Aug 2020 20:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5E5816C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598467710;
	bh=tmV6pxwwnIv/WbJdk+BoBdyX0BOhUC+1LYoSoBGmYb4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GdXjzphqyBhmGPoe2RcANFhtJfI0N2xbuh+izWz1RfmfcKKu3+WtiplgpZYRkxjA+
	 pCz6bAVajT+6zsn6OpfSQkhD91QUHNewDPGKLCGjKa+J5Y/gfKFz5BzL4z0zznfvUo
	 MhEiIhu4OGSQlMLqMnhTYvooL3v9/R3NUarPxrLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 523B9F801EC;
	Wed, 26 Aug 2020 20:46:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10C65F802C3; Wed, 26 Aug 2020 20:45:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4624BF8016F
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 20:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4624BF8016F
IronPort-SDR: JOxyGrC8RT9r4AFMRvmzoCJvwBW/1g7kKY57JbK+rRxUaEZNc0GC5GsBa5yKXlPZvufnHCTv1M
 SCrc6GhtmGiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="174418613"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="174418613"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:44 -0700
IronPort-SDR: TnrJrYP6hTbtr41UwNoBsHC56QBz6MtUDARFqxVSdE9iXoyEGCL+3CK6LfNwoTWo0deHb76C0s
 6/36EHcEqMew==
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="500347331"
Received: from sghoshal-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.145.101])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:44 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/8] ASoC: SOF: Intel: hda: Remove unused parameters in
 cl_dsp_init()
Date: Wed, 26 Aug 2020 11:45:26 -0700
Message-Id: <20200826184532.1612070-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
References: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

cl_dsp_init() doesn't use the fwdata and fwsize parameters.
Remove it, and update caller accordingly.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 9cb219b87b3e..914699f550b1 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -78,8 +78,7 @@ static int cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
  * status on core 1, so power up core 1 also momentarily, keep it in
  * reset/stall and then turn it off
  */
-static int cl_dsp_init(struct snd_sof_dev *sdev, const void *fwdata,
-		       u32 fwsize, int stream_tag, int iteration)
+static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, int iteration)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
@@ -340,8 +339,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 		dev_dbg(sdev->dev,
 			"Attempting iteration %d of Core En/ROM load...\n", i);
 
-		ret = cl_dsp_init(sdev, stripped_firmware.data,
-				  stripped_firmware.size, tag, i + 1);
+		ret = cl_dsp_init(sdev, tag, i + 1);
 
 		/* don't retry anymore if successful */
 		if (!ret)
-- 
2.25.1

