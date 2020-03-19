Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0788F18C21C
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 22:14:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9626617BD;
	Thu, 19 Mar 2020 22:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9626617BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584652452;
	bh=Va1qGIhaxyUN0bq3JSJKjS7dp1aFxm7NLQChHcP+1AI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Uy/hlXdvet8ghaoAsTb1mDSoGsh5srCDbmQU6eJBj1Kmtz0w/HL2Ey3COw2Yex5da
	 y/CjOtrPLQLs9obT5EJXprdkyLK0czjEvoA9y3bRbnj065jHgzdJwrQmcvDn+t1QAI
	 tpuThVnZIP6K5w0hSNs2ICB04YzxzgRAQL1tbODM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B483CF80232;
	Thu, 19 Mar 2020 22:12:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EFFEF8022B; Thu, 19 Mar 2020 22:12:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53BE2F8012F
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 22:12:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53BE2F8012F
IronPort-SDR: 67KWqBW/rk+uIw9pQeHJFEaiZrmbPowkvC812KSGvygvSzQ1AAYxpYtu0ypTNGOPrLGMFLTFv9
 t8fcHQOSACvw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 14:12:21 -0700
IronPort-SDR: nXpm8WDReEMraGgInDRbIWORfmGeijuPzcKIzmrdmFlXyY3c8kakMAxZBg9cX3Pq5eg2ugfHJj
 3rKGbBd58pQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,573,1574150400"; d="scan'208";a="263859642"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga002.jf.intel.com with ESMTP; 19 Mar 2020 14:12:20 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: broadwell: Revert SSP0 link to use dummy
 components
Date: Thu, 19 Mar 2020 22:12:04 +0100
Message-Id: <20200319211204.21580-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 linux@dominikbrodowski.net, tiwai@suse.com, broonie@kernel.org
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

Commit:
"ASoC: Intel: broadwell: change cpu_dai and platform components for SOF

while enabling bdw on SOF, changed behavior for non-SOF solutions. In
essence replacing platform 'dummy' with actual 'platform' causes
redundant stream initialization to occur during audio start. hw_params
for haswell-pcm destroys initial stream right after its creation - only
to recreate it again from proceed from there.

While harmless so far, this flow ain't right and should be corrected.
The actual need for dummy components for SSP0 link is questionable but
that issue is subject for another series.

Link to first message in conversation:
https://lkml.org/lkml/2020/3/18/54

Reported-by: Dominik Brodowski <linux@dominikbrodowski.net>
Fixes: 64df6afa0dab ("ASoC: Intel: broadwell: change cpu_dai and platform components for SOF")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/broadwell.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index 0776ea2d4f36..9b639475e99f 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -167,9 +167,6 @@ SND_SOC_DAILINK_DEF(codec,
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 SND_SOC_DAILINK_DEF(ssp0_port,
 	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
-#else
-SND_SOC_DAILINK_DEF(ssp0_port,
-	    DAILINK_COMP_ARRAY(COMP_DUMMY()));
 #endif
 
 /* broadwell digital audio interface glue - connects codec <--> CPU */
@@ -225,7 +222,11 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
 		.ops = &broadwell_rt286_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
+		SND_SOC_DAILINK_REG(dummy, codec, dummy),
+#else
 		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
+#endif
 	},
 };
 
-- 
2.17.1

