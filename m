Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A520F520357
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 19:11:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3024618A2;
	Mon,  9 May 2022 19:10:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3024618A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652116302;
	bh=QgakIGbWNo3zLFi+HTo83Ju8g3nsMS29DGatcZR6tRc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HxkSOa5P6wMe8aCesDEV+rPOmeHjgEyIwahIzXkM2gDlJ+NZt0UBOm/7B7Ddvkjeo
	 R8Mof6RcxD67FyNwm3C1OkC3qxF0NQsASqgqlYKmHbdLzfuzXoHG8t96XgtFvPUzxU
	 yC7ujIIBNNC8obr8fZbPKvD2c+Z5wsg9q4vayayI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 561C0F80517;
	Mon,  9 May 2022 19:10:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB7B8F80516; Mon,  9 May 2022 19:10:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 060BDF804FF
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 19:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 060BDF804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SkoFR2Se"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652116197; x=1683652197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QgakIGbWNo3zLFi+HTo83Ju8g3nsMS29DGatcZR6tRc=;
 b=SkoFR2SewEMnjkqV6wHtlFc1uT4R09NhUKwxuVtojYrc1t9+E87chnP+
 JWaRS1Z5YADfSb8+m+y5CMy56/KxDqeuZ4gIhuLZbrm96i6kAKCeo8dRr
 JIzu1Lsg73QZqLCpdsf+D/G0ZIT17gSthNTFmM9fecN5/RxLsLwEmIzWF
 xrQTjxw/+yIBMFrtepoYzFTKd7oOCa+t3vxwmeJvcwKs9+x6oNJl6i7sH
 bzhzClTf1sAkVGgYRGFgec5ce1mklIUgtFdpU6Y0zJjypPLV0FgDPMbLf
 S3hBrxzI9GLmFBGV8k+OsmJzD0hcOlmoSH0r1SlmX+pAgynlupsxNCwbe Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="266701904"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="266701904"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 10:09:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="592909326"
Received: from mkarkhan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.61.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 10:09:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: Intel: sof_ssp_amp: enable capture stream from
 cs35l41
Date: Mon,  9 May 2022 12:09:22 -0500
Message-Id: <20220509170922.54868-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220509170922.54868-1-pierre-louis.bossart@linux.intel.com>
References: <20220509170922.54868-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
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

From: Brent Lu <brent.lu@intel.com>

Enable capture stream of the cs35l41 dai link to support feedback
stream from amplifier.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 675ade8187b65..4a762e002ac75 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -258,6 +258,9 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		sof_rt1308_dai_link(&links[id]);
 	} else if (sof_ssp_amp_quirk & SOF_CS35L41_SPEAKER_AMP_PRESENT) {
 		cs35l41_set_dai_link(&links[id]);
+
+		/* feedback from amplifier */
+		links[id].dpcm_capture = 1;
 	}
 	links[id].platforms = platform_component;
 	links[id].num_platforms = ARRAY_SIZE(platform_component);
-- 
2.30.2

