Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3613C8B3BC7
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:40:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8563922A5;
	Fri, 26 Apr 2024 17:40:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8563922A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714146019;
	bh=flcFCyFG2/t8hSowAIB01UznDgaflhSitPfuUrp0c60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nKNFDRhglYHkXJ7CRbufQrwbxvjFDm3sGuEJPB9sHbz1M2mm98VSDv2X9usXYLVta
	 qj+K3j6DuvIdzK0s6JaC599lZcXB9B22xQzNMT9B9I8FyetOFttgL0Rwed/IUG+V0A
	 T+GszfyoO8aubOHU5NlkglziI9VNbJo3y3nw1Q5g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5E7DF805B6; Fri, 26 Apr 2024 17:39:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8987DF805D2;
	Fri, 26 Apr 2024 17:39:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69FF2F8003C; Fri, 26 Apr 2024 17:39:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBAF0F8003C
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBAF0F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T3yLmCm0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145957; x=1745681957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=flcFCyFG2/t8hSowAIB01UznDgaflhSitPfuUrp0c60=;
  b=T3yLmCm0SE1oEB/11RAuIAOhWzBaj2Cl0OR0AfBvnlGHjI73JF8vzCxF
   1Ac3sTocamDsxlzJVmqyXvGGGfg/YMNnK2LY9I/ea6/VkRZlPvf1yzN30
   KACVKeJz8kswxE2sEYENyMApRyD2XKf0PWj4wvqDE0ATSINw+xuOkOA6s
   ig8A8Tx0DoRYW2zYzLV9j/+I51ZmKyYWm9uz0vN+t8nHSV8E75HEhJTOj
   KJ/Dp0wEK/nB/u89BfWlE9R9OoCSyvvMRZUWQQHhmpy0UwrWJ8iOLF0/3
   ivYHxpNEMa2P+wDFzOTJgn6634F4oatuBuSXFB+lioYOy9K/2ZKbkqn4M
   w==;
X-CSE-ConnectionGUID: Pq0DKgZER9SE/mldTNF3fg==
X-CSE-MsgGUID: ZstzReK+Rg+rYwEM+gxY7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9718439"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000";
   d="scan'208";a="9718439"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:39:11 -0700
X-CSE-ConnectionGUID: WL7/LIeJRTSSuULWaJyWbA==
X-CSE-MsgGUID: cILyGG/0QEKLlCU1ZdfHEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000";
   d="scan'208";a="56623540"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:39:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Yong Zhi <yong.zhi@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/5] ASoC: SOF: topology: remove incorrect widget id in error
 message
Date: Fri, 26 Apr 2024 10:38:59 -0500
Message-Id: <20240426153902.39560-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
References: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BE2JTTKN2Z5VXQENVSSIF7TTWYKOM7C6
X-Message-ID-Hash: BE2JTTKN2Z5VXQENVSSIF7TTWYKOM7C6
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BE2JTTKN2Z5VXQENVSSIF7TTWYKOM7C6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Yong Zhi <yong.zhi@intel.com>

In sof_widget_ready() function, the shift field of
struct snd_soc_tplg_dapm_widget is incorrectly used to print
widget id in dev_err(scomp->dev, "error: failed to add widget id %d ..",
this patch removes the useless tw->shift from the error output.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index bcdb499c96a0..ec931a26b54f 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1531,10 +1531,9 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	/* check token parsing reply */
 	if (ret < 0) {
 		dev_err(scomp->dev,
-			"error: failed to add widget id %d type %d name : %s stream %s\n",
-			tw->shift, swidget->id, tw->name,
-			strnlen(tw->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) > 0
-				? tw->sname : "none");
+			"failed to add widget type %d name : %s stream %s\n",
+			swidget->id, tw->name, strnlen(tw->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) > 0
+							? tw->sname : "none");
 		goto widget_free;
 	}
 
-- 
2.40.1

