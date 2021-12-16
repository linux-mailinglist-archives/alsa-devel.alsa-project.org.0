Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2B9477133
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 12:57:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA4981E7D;
	Thu, 16 Dec 2021 12:57:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA4981E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639655876;
	bh=L3dXPB6xC9umFovRHn3/BXBj2TeY/SOLQYJKF+fyMpM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YowqyoHFN09XoKlaIzrFX/YSn63Yb0iGlaw5AQJZOpYzGwQ9PrtH+vnEvCAbm5IbO
	 RzUwUs950zynNc4yEqTPIqnthgtjXKWvnaHKRkcPEf01ydZ1YYHYZwNhTELE5VEAfM
	 ZjwX8bVX/3cPK7JPOpCZ94aJouqFKPP4VDbRkSi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B322F8047B;
	Thu, 16 Dec 2021 12:56:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1291F8047B; Thu, 16 Dec 2021 12:56:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B41CAF8014C
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 12:56:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B41CAF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZBxXAunN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639655768; x=1671191768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L3dXPB6xC9umFovRHn3/BXBj2TeY/SOLQYJKF+fyMpM=;
 b=ZBxXAunNUIZDlYs3vKVt9eMxCmECDtMyYOkswO+bOS3/4iF1WeFVto8M
 EOVU6MJuDiS+rBWu2ejYmYG7Ox6Kc3MbxvMazGun6p7dEXJYAGZ/QoHZT
 SJZg6mmqbZwRz79o0VHOiqcPoyyigMCfLXClCfjCvVpqtl8Lg5Qp31E1i
 2t6PePVKILK2V6SUKx437puDGLbHshMXrrT9Gc6RE/TvMkxtUmwq3CmPN
 0y8J73emm9hfMtGFvhe73T3nMZWiZ9h2IBNLNtRrYOTvjwnCmAgWich1A
 S9IMBe3w1JO9y9yfzEs7bD+GFuqX9Ww0X5FMqIJdeS5GikOdCN1NBtHp3 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239692039"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="239692039"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 03:56:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="506248427"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 03:56:00 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ASoC: Intel: catpt: Reduce size of catpt_component_open()
Date: Thu, 16 Dec 2021 12:57:40 +0100
Message-Id: <20211216115743.2130622-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216115743.2130622-1-cezary.rojewski@intel.com>
References: <20211216115743.2130622-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com
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

With some improved if-logy, function's size can be reduced slightly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index ebb27daeb1c7..16146c693c08 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -595,9 +595,8 @@ static int catpt_component_open(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtm = substream->private_data;
 
-	if (rtm->dai_link->no_pcm)
-		return 0;
-	snd_soc_set_runtime_hwparams(substream, &catpt_pcm_hardware);
+	if (!rtm->dai_link->no_pcm)
+		snd_soc_set_runtime_hwparams(substream, &catpt_pcm_hardware);
 	return 0;
 }
 
-- 
2.25.1

