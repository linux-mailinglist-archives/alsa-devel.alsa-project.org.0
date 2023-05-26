Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F386712E4E
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 22:44:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFEEC3E7;
	Fri, 26 May 2023 22:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFEEC3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685133849;
	bh=ZFbr7rgyIv06z42HHlBXVYCpuVWMAKW5RiuYXygDhX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oGBh2t3A6DfHDVxDs2d6GPL533j3dTh7nopE6Yai3Swa2KPdCaP+o1XIycEthieG1
	 7wv/sUDvZ8n1AYwPFlNVtt+FmHHA9x+ye7g7nS8aFOp8aWdcuJCHFy1dMecD9R98Lr
	 7j3ld8XbJvKTLauxr+/v3t1NGBHm0+ket0WY12eY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8A65F80548; Fri, 26 May 2023 22:42:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3EEBF80548;
	Fri, 26 May 2023 22:42:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79E21F8026A; Fri, 26 May 2023 22:42:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38371F80086
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 22:42:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38371F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gxI0You8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685133734; x=1716669734;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZFbr7rgyIv06z42HHlBXVYCpuVWMAKW5RiuYXygDhX0=;
  b=gxI0You8p5oqdqTqaCu4Qq/alqwaxQ8JHNYRgJC2tl6U1JzIg2EKIziY
   252sW4iM7Uj5o2jJpm5ny+37C94CRvfqFWCwgvMMblzz4xc/zj5zrytrI
   WzhfYAfWiXX4nXRL5D/OPhdm34FviMBLAE+QUtnHv/mYIqwbgxYUvOiUZ
   spMUYWVGVZSqHG+RvGU1F/QMYAlOD0CQfR7rBlwW8Y3WUKHmFEgbPgs9e
   W+AZfPGIVP+SJqwlR6AF4IinA5VMQ/jMWthkQuy2lhIUfdzT+lu7fz7Dk
   md2+lTi4ddg4hq8R/k/sjwO7SVygouerSRdQEx/ha+nOrspk0ZS6FZuem
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="333926231"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400";
   d="scan'208";a="333926231"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 13:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="699527110"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400";
   d="scan'208";a="699527110"
Received: from bedriarm-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.48.113])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 13:41:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 1/3] ASoC: topology: Allow partial matching when finding DAI
 link
Date: Fri, 26 May 2023 15:41:47 -0500
Message-Id: <20230526204149.456068-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230526204149.456068-1-pierre-louis.bossart@linux.intel.com>
References: <20230526204149.456068-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XTTDE5DY33CO2BUEKHDQQAMUC5QDS4CX
X-Message-ID-Hash: XTTDE5DY33CO2BUEKHDQQAMUC5QDS4CX
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XTTDE5DY33CO2BUEKHDQQAMUC5QDS4CX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

This allows for setting shorter link names in topology. For example,
for the HDA Analog DAI link, just "Analog" would suffice instead of
"Analog Playback and Capture"

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/soc-topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 20fd46a41cbb..8add361e87c6 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2030,11 +2030,11 @@ static struct snd_soc_dai_link *snd_soc_find_dai_link(struct snd_soc_card *card,
 		if (link->id != id)
 			continue;
 
-		if (name && (!link->name || strcmp(name, link->name)))
+		if (name && (!link->name || !strstr(link->name, name)))
 			continue;
 
-		if (stream_name && (!link->stream_name
-				    || strcmp(stream_name, link->stream_name)))
+		if (stream_name && (!link->stream_name ||
+				    !strstr(link->stream_name, stream_name)))
 			continue;
 
 		return link;
-- 
2.37.2

