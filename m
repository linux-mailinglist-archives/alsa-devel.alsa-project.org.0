Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8383A331BD3
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 01:43:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00E0B18B5;
	Tue,  9 Mar 2021 01:42:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00E0B18B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615250604;
	bh=zr59zx0JcyiLgxmiUd4PGM0gDDNu4Vs93LICkYeGot4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ynwajx1aByIu21jCYiS8wLoSExy8TvwT88tfdieGVsgYxzwcUZwgvS5D2XrxoxIbF
	 LvwwmSUFXyejWZLPCBCE2YC+LYrNsEnVYcPyvQBxFP5iFE/Iky4cQpCTfN5HtBoTQl
	 SSbahldxeAhJB5FYXPpd3mBss/uKd0KDzhBOHrRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83A91F8016C;
	Tue,  9 Mar 2021 01:41:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85A0EF801D8; Tue,  9 Mar 2021 01:41:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BD9EF800D0
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 01:41:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BD9EF800D0
IronPort-SDR: 0U4qgz3MknzLVyv4VWzQutlNI/0Ne6f9MTquoPfMnAFyZkCe+1E0bNSOyYKkyEC92CMhPDbe/d
 +g/gxkdDhg3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="188180825"
X-IronPort-AV: E=Sophos;i="5.81,233,1610438400"; d="scan'208";a="188180825"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 16:41:42 -0800
IronPort-SDR: 3nsQDS4DAtwTjVHGCW7qGle5DzwUDp9y1p6l2t1NpS+N3i/GsGNXUVYbHfNPKHQYx2YNemif/8
 CAzhu2+qc14A==
X-IronPort-AV: E=Sophos;i="5.81,233,1610438400"; d="scan'208";a="447315122"
Received: from syanjarl-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.4.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 16:41:41 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: intel: fix wrong poll bits in dsp power down
Date: Mon,  8 Mar 2021 18:41:27 -0600
Message-Id: <20210309004127.4940-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Rander Wang <rander.wang@intel.com>
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

From: Pan Xiuli <xiuli.pan@linux.intel.com>

The ADSPCS_SPA is Set Power Active bit. To check if DSP is powered
down, we need to check ADSPCS_CPA, the Current Power Active bit.

Fixes: 747503b1813a3 ("ASoC: SOF: Intel: Add Intel specific HDA DSP HW operations")
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 9900a058ba6e..6e24e1cb13f9 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -207,7 +207,7 @@ int hda_dsp_core_power_down(struct snd_sof_dev *sdev, unsigned int core_mask)
 
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
 				HDA_DSP_REG_ADSPCS, adspcs,
-				!(adspcs & HDA_DSP_ADSPCS_SPA_MASK(core_mask)),
+				!(adspcs & HDA_DSP_ADSPCS_CPA_MASK(core_mask)),
 				HDA_DSP_REG_POLL_INTERVAL_US,
 				HDA_DSP_PD_TIMEOUT * USEC_PER_MSEC);
 	if (ret < 0)
-- 
2.25.1

