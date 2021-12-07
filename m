Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B646E46C3D5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 20:43:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 633082564;
	Tue,  7 Dec 2021 20:42:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 633082564
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638906192;
	bh=xWAhY4Yd2iXkas/xlM+ctpj0L7osa8XlPc+TfGNc3O4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fPptvCDN6KDOfCTj7Ewp6c7n0rpLqVDNqgnedBm9CW0QpE2v+csDYs7XdUtV2vBLJ
	 qYwze14KOMb59P4mw3bnj/ev5nwDMIqevwIgcFS75HGkAtpmyY+jU6vfOfLsTYe0F2
	 CLMf+vKWj+G8o4FUO6vOjzYZ5nqDrqMXZ2db8IpI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEBD8F80518;
	Tue,  7 Dec 2021 20:40:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94768F80508; Tue,  7 Dec 2021 20:40:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31A03F804E4
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 20:40:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31A03F804E4
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236407810"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="236407810"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:40:11 -0800
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="479641167"
Received: from nthiag2-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.74.17])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:40:10 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/7] ASoC: SOF: hda-stream: only enable DPIB if needed
Date: Tue,  7 Dec 2021 13:39:44 -0600
Message-Id: <20211207193947.71080-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207193947.71080-1-pierre-louis.bossart@linux.intel.com>
References: <20211207193947.71080-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

The existing code is inconsistent, we should only enable DPIB if the
'use_posbuf' field is true.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 5f9eb5bdcdba..e910f68706d9 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -626,9 +626,10 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPU,
 			  upper_32_bits(hstream->bdl.addr));
 
-	/* enable position buffer */
-	if (!(snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_ADSP_DPLBASE)
-				& SOF_HDA_ADSP_DPLBASE_ENABLE)) {
+	/* enable position buffer, if needed */
+	if (bus->use_posbuf && bus->posbuf.addr &&
+	    !(snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_ADSP_DPLBASE)
+	      & SOF_HDA_ADSP_DPLBASE_ENABLE)) {
 		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, SOF_HDA_ADSP_DPUBASE,
 				  upper_32_bits(bus->posbuf.addr));
 		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, SOF_HDA_ADSP_DPLBASE,
-- 
2.25.1

