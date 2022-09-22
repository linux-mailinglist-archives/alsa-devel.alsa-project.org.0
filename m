Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A695E6EA4
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 23:40:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7455E86E;
	Thu, 22 Sep 2022 23:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7455E86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663882852;
	bh=qkpXb0yvRVOwPQ9b8Ep67gFKLGETZHSPjpNQvjAeac8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J9dkISYHWQZKWLLa3q7I8IepY2efozFok6vrYtzBfKiJBEUGipJjPNQwqUH82bvJR
	 6Y0RWww1l7vhvw5Blh+QofgoS+kVNmwefDGkyq/fw/xXKQ6UMhntXi0k7Up8isGrtu
	 ks3ucvSwg7EkBk6liIESGt4cMGjQdA0OW1GUuhSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55CE5F805A1;
	Thu, 22 Sep 2022 23:37:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59DD5F805A0; Thu, 22 Sep 2022 23:37:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0966FF80588
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 23:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0966FF80588
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jNIO5otT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663882644; x=1695418644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qkpXb0yvRVOwPQ9b8Ep67gFKLGETZHSPjpNQvjAeac8=;
 b=jNIO5otTdqzgXhBSeNyImGpg4q4+EDnUT2vXf0Vidlcq3XoLEGRq/1V3
 WMPE7V1desiuYABfvEpAKctnmpSV3KvfXB7O+l9SGhgstJZcHpwH3r0ud
 P+4ECGnYS+Z/NxrRBtZ88Wu5BukXpvKK9OBvUui5hSrJPd03gtJMJ75sw
 HzZCcTOpEW2i7Lh6IRyNEsIGvdql0w2tKNX4iDYfoiujocwXqWAHxYkHL
 wJSdb0tsDK5lk+ieWBXCtLN71xawM1ajAA/AUYEmibAaYiJBUmHeyLLd1
 TNmv0i4g/XohsaKprWmgynd9Tj7ORyOVXjEugD4SJd9rZ2aMTDQ47EDYm A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="298036141"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="298036141"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:53 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="745550871"
Received: from jpwarner-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.13.62])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:52 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/10] ASoC: SOF: Intel: MTL: remove the unnecessary
 snd_sof_dsp_read()
Date: Thu, 22 Sep 2022 14:36:44 -0700
Message-Id: <20220922213644.666315-11-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
References: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

The return val of snd_sof_dsp_read() right before polling the same
register is not used, so remove the redundant call.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index eb4e00af74a3..27ec171cb586 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -144,7 +144,6 @@ static int mtl_enable_interrupts(struct snd_sof_dev *sdev)
 
 	/* check if operation was successful */
 	host_ipc = MTL_IRQ_INTEN_L_HOST_IPC_MASK | MTL_IRQ_INTEN_L_SOUNDWIRE_MASK;
-	irqinten = snd_sof_dsp_read(sdev, HDA_DSP_BAR, hfintipptr);
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, hfintipptr, irqinten,
 					    (irqinten & host_ipc) == host_ipc,
 					    HDA_DSP_REG_POLL_INTERVAL_US, HDA_DSP_RESET_TIMEOUT_US);
@@ -159,7 +158,6 @@ static int mtl_enable_interrupts(struct snd_sof_dev *sdev)
 
 	/* check if operation was successful */
 	host_ipc = MTL_DSP_REG_HfHIPCIE_IE_MASK;
-	hipcie = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfHIPCIE);
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfHIPCIE, hipcie,
 					    (hipcie & host_ipc) == host_ipc,
 					    HDA_DSP_REG_POLL_INTERVAL_US, HDA_DSP_RESET_TIMEOUT_US);
@@ -171,7 +169,6 @@ static int mtl_enable_interrupts(struct snd_sof_dev *sdev)
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfSNDWIE,
 				MTL_DSP_REG_HfSNDWIE_IE_MASK, MTL_DSP_REG_HfSNDWIE_IE_MASK);
 	host_ipc = MTL_DSP_REG_HfSNDWIE_IE_MASK;
-	hipcie = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfSNDWIE);
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfSNDWIE, hipcie,
 					    (hipcie & host_ipc) == host_ipc,
 					    HDA_DSP_REG_POLL_INTERVAL_US, HDA_DSP_RESET_TIMEOUT_US);
@@ -199,7 +196,6 @@ static int mtl_disable_interrupts(struct snd_sof_dev *sdev)
 
 	/* check if operation was successful */
 	host_ipc = MTL_IRQ_INTEN_L_HOST_IPC_MASK | MTL_IRQ_INTEN_L_SOUNDWIRE_MASK;
-	irqinten = snd_sof_dsp_read(sdev, HDA_DSP_BAR, hfintipptr);
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, hfintipptr, irqinten,
 					    (irqinten & host_ipc) == 0,
 					    HDA_DSP_REG_POLL_INTERVAL_US, HDA_DSP_RESET_TIMEOUT_US);
@@ -213,7 +209,6 @@ static int mtl_disable_interrupts(struct snd_sof_dev *sdev)
 
 	/* check if operation was successful */
 	host_ipc = MTL_DSP_REG_HfHIPCIE_IE_MASK;
-	hipcie = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfHIPCIE);
 	ret1 = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfHIPCIE, hipcie,
 					     (hipcie & host_ipc) == 0,
 					     HDA_DSP_REG_POLL_INTERVAL_US,
@@ -228,7 +223,6 @@ static int mtl_disable_interrupts(struct snd_sof_dev *sdev)
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfSNDWIE,
 				MTL_DSP_REG_HfSNDWIE_IE_MASK, 0);
 	host_ipc = MTL_DSP_REG_HfSNDWIE_IE_MASK;
-	hipcie = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfSNDWIE);
 	ret1 = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfSNDWIE, hipcie,
 					     (hipcie & host_ipc) == 0,
 					     HDA_DSP_REG_POLL_INTERVAL_US,
@@ -260,7 +254,6 @@ static int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 
 	/* poll with timeout to check if operation successful */
 	cpa = MTL_HFDSSCS_CPA_MASK;
-	dsphfdsscs = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_HFDSSCS);
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_HFDSSCS, dsphfdsscs,
 					    (dsphfdsscs & cpa) == cpa, HDA_DSP_REG_POLL_INTERVAL_US,
 					    HDA_DSP_RESET_TIMEOUT_US);
@@ -277,7 +270,6 @@ static int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 
 	/* poll with timeout to check if operation successful */
 	pgs = MTL_HFPWRSTS_DSPHPXPGS_MASK;
-	dsphfpwrsts = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_HFPWRSTS);
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_HFPWRSTS, dsphfpwrsts,
 					    (dsphfpwrsts & pgs) == pgs,
 					    HDA_DSP_REG_POLL_INTERVAL_US,
-- 
2.25.1

