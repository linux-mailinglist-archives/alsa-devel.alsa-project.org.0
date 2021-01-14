Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AF32F62FA
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 15:23:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 892B516CB;
	Thu, 14 Jan 2021 15:22:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 892B516CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610634192;
	bh=AdVfV8NdSdwvqbSmnF1NyigvtwoXs9KCprQFAVzZHes=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j4/dyMKDtsj+0KiqH2j9odRCgof2isBtbkGsfspHfb5hNZC/OqQQsx39wbONvcwY+
	 e1mSVw5xQkPGbYHS/pE9GxI//dhewmMuTEElxnw2A8VrU/ZIL2z764Dg1q5wY9ECCC
	 3gICaCzGGotmgKR/4omO5yOClFN9iUq+74brumVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B540F804CB;
	Thu, 14 Jan 2021 15:21:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F065F804CB; Thu, 14 Jan 2021 15:21:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E67CF80134
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 15:21:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E67CF80134
IronPort-SDR: CXQ5pNToMrf82eNB7EB35znt6pvB5iH3ibrvpGQcJ6E0QjVr8jAcjt8O7wmhEPTsS5QJUDE4XO
 PeAEiluSDKXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="175792520"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="175792520"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 06:21:18 -0800
IronPort-SDR: VEF+Zr9q8wrSPNsLvsyUHKep822praH1CRgU0GaarWGLUGq7iVQ7IHiyK1oABKa15Rt4dgk18s
 pG0WHi98xHfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="400912794"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2021 06:21:16 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ASoC: topology: Ensure that needed parameters are set
Date: Thu, 14 Jan 2021 11:36:01 -0500
Message-Id: <20210114163602.911205-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114163602.911205-1-amadeuszx.slawinski@linux.intel.com>
References: <20210114163602.911205-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

As snd_soc_tplg_component_load is exported function, which means it is
part of API, there should be checks if it is called with proper
parameters.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 950c45008e24..0d182a190c98 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2659,8 +2659,14 @@ int snd_soc_tplg_component_load(struct snd_soc_component *comp,
 	struct soc_tplg tplg;
 	int ret;
 
-	/* component needs to exist to keep and reference data while parsing */
-	if (!comp)
+	/*
+	 * check if we have sane parameters:
+	 * comp - needs to exist to keep and reference data while parsing
+	 * comp->dev - used for resource management and prints
+	 * comp->card - used for setting card related parameters
+	 * fw - we need it, as it is the very thing we parse
+	 */
+	if (!comp || !comp->dev || !comp->card || !fw)
 		return -EINVAL;
 
 	/* setup parsing context */
-- 
2.25.1

