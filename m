Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BAF559A64
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 15:35:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06ECF187A;
	Fri, 24 Jun 2022 15:34:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06ECF187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656077708;
	bh=/RoTz20LqF1jxKFuAmOWYqeSfnhD7dr4rsbSY+7SKM4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NILHrIQuCLbbEx92k5jsqLD6eEGsc6nf3erMvfG8azrov+LuT+ewRqz4v3ufhASRW
	 lObiGLuOAC0hIb2N2bTA8odbMX53yvH5fNNQ1AYGJDxC4ghMBmk9U6w7VUUdjVo92c
	 +itNX5fFnfeOtyDJ6vY0JNPyVHBCmNrjds6AcVlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81E29F80538;
	Fri, 24 Jun 2022 15:33:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02E3FF80165; Fri, 24 Jun 2022 15:33:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EC73F80139
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 15:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EC73F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="De5ej4n6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656077597; x=1687613597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/RoTz20LqF1jxKFuAmOWYqeSfnhD7dr4rsbSY+7SKM4=;
 b=De5ej4n6LTekQ5LX1MwlLlrRoJP6y+KqMbHUmtYU/69ntYxBnystMQ7x
 el4zOVcnpEjrmu9NkBlTmjfsVBDmxHpczcwBYI4P7Bo6r0jFse3ic/oFS
 sslgwZrVJHTx9T/jTeqkDkZrYxda7/BoLlyuLsh8qnMyPME7j7V4zkCKo
 cw3NAxjxPpyWp9pRpCIcaEegb3wiP29cLVYDOOaMpmEGBjSpzlXfYfOC3
 c2jGNeg6RPkjhVAihlY6BbYeUbVvAw0PKeOH6Sxvx1h1n9chE0qj30xjG
 SwdhtAJDvRD+oqkO2EJcrIN3A11RqR1eEpYpq4Y67kY4WCBVseEMAIVsY Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="344996183"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="344996183"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 06:33:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="835123896"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 24 Jun 2022 06:33:08 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/4] ASoC: Intel: bdw_rt286: Mark BE DAI as nonatomic
Date: Fri, 24 Jun 2022 15:43:15 +0200
Message-Id: <20220624134317.3656128-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624134317.3656128-1-cezary.rojewski@intel.com>
References: <20220624134317.3656128-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Address the warning: "Codec: dpcm_be_connect: FE is nonatomic but BE is
not, forcing BE as nonatomic" by marking BE DAI as nonatomic. Aligns
with what is already done for FE DAIs.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/bdw_rt286.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 47eaddb00936..6b76df0e7c9b 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -162,6 +162,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		/* SSP0 - Codec */
 		.name = "Codec",
 		.id = 0,
+		.nonatomic = 1,
 		.no_pcm = 1,
 		.init = codec_link_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC,
-- 
2.25.1

