Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B90326D9C9E
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 17:46:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 176DFDF9;
	Thu,  6 Apr 2023 17:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 176DFDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680795997;
	bh=+ysS7T7cxRO9HlMvDXWw2b6g8HzEPsfpnLPFd7YHjnM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ShRuDRdSnq32/GvriNioqeJNWCOkn5xmTEYBNzeCyJul/4k0IY8nNTNsWNmbAcfvD
	 DRtUYgHjoRP3UKFa5IqN/ImI0AZp0MBZLlTe5gg7bkjnVthrOBpGaiZeJ44Jx5YIow
	 ZKUyQHEutE3CKFWoY/jEWYP9v0qAfQIZ9NhMSdaA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ACEAF80171;
	Thu,  6 Apr 2023 17:45:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F177F80246; Thu,  6 Apr 2023 17:45:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0942BF8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 17:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0942BF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VlIbEQmh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680795929; x=1712331929;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+ysS7T7cxRO9HlMvDXWw2b6g8HzEPsfpnLPFd7YHjnM=;
  b=VlIbEQmh6UrFH2lKJAnxvgdKZQ8VUIQZowhpII2ZzwYb5jl9W0IyavLi
   dgcOhSAWo/QndigmsnGfS3QojsQ/ifWRkThpmSnruKMoB8AGjNwElIp+/
   vFw2/kksuUGV5RNK3S8eEXRft8T8P2Ud9IC94Y7e8amZeJXj0qkDagmuy
   6SkGgsz9nXP4VbgA1kv/9iub/7HZXIVcm4tP8tCckNn8WNYRDfL3GxXvC
   30LjWxYZI1SBOukE57ywpPEoH96VBSrB956oP1bpgj1npJOVgicThbFGL
   rdmf7uXkHpuPfxLm6J7j/L6Yy3J5Wn//omk9rUn//InTmXisNJKDfOAdu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344527941"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="344527941"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:45:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="1016910423"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="1016910423"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.83.247])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:45:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Intel: MTL: conditionally wake WPIO1PG domain
Date: Thu,  6 Apr 2023 10:44:54 -0500
Message-Id: <20230406154454.18163-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GSELP5BJF5STNGERWZKYQRFLPYTYHV6B
X-Message-ID-Hash: GSELP5BJF5STNGERWZKYQRFLPYTYHV6B
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, broonie@kernel.org, Yong Zhi <yong.zhi@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GSELP5BJF5STNGERWZKYQRFLPYTYHV6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Yong Zhi <yong.zhi@intel.com>

Wake IO1 from power gating if there is SoundWire enabled link discovered
by ACPI scan.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 58959c24cb71..882ce5536ab6 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -217,6 +217,7 @@ static int mtl_enable_interrupts(struct snd_sof_dev *sdev, bool enable)
 /* pre fw run operations */
 static int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 {
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	u32 dsphfpwrsts;
 	u32 dsphfdsscs;
 	u32 cpa;
@@ -255,9 +256,11 @@ static int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		dev_err(sdev->dev, "failed to power up gated DSP domain\n");
 
-	/* make sure SoundWire is not power-gated */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_HFPWRCTL,
-				MTL_HfPWRCTL_WPIOXPG(1), MTL_HfPWRCTL_WPIOXPG(1));
+	/* if SoundWire is used, make sure it is not power-gated */
+	if (hdev->info.handle && hdev->info.link_mask > 0)
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_HFPWRCTL,
+					MTL_HfPWRCTL_WPIOXPG(1), MTL_HfPWRCTL_WPIOXPG(1));
+
 	return ret;
 }
 
-- 
2.37.2

