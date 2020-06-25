Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8B320A5A6
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 21:20:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A98D41ACB;
	Thu, 25 Jun 2020 21:19:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A98D41ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593112833;
	bh=7jrsUBYv/b/0kvZU/mwQejOBH0DLLga+A6nS6+NYI4U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hQp7X9v8j1FXAU1GYBmHjlorwWvZjODAc2WvkEC/gByylke64xhnk0bgf5BgGksy0
	 bW6IYr08+BeJCGuRHwt4mBgmv+xUcuilsFCYIiDwQxraFrXVMsD6PdNwLiYBSF0kjR
	 v604wAtK051gTievPIuXMYZNQzaFbolLON6+0c8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C68FBF80315;
	Thu, 25 Jun 2020 21:14:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 385A5F802E2; Thu, 25 Jun 2020 21:13:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAC62F802D2
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 21:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAC62F802D2
IronPort-SDR: gK0a77h9dJf8XJBvG6LRuKR0kb02WbpuX+CMUFpzAcZ7N29vPeTFJ5aZwSym6noUeKXAvOj0MP
 RW2GmmSjQXng==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="144120843"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="144120843"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:42 -0700
IronPort-SDR: XvjuKjaiJH/wmt19KmWSEAdxPBriWR1Q5Qpq8NY0IT5E6dyUtZK5xHmOp+k1OlltgHgVv8Y/Sc
 I7muxo2L1XXg==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="354559544"
Received: from zeqimao-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.109.39])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/17] ASoC: Intel: Boards: tgl_max98373: Update TDM
 configuration in hw_params
Date: Thu, 25 Jun 2020 14:13:04 -0500
Message-Id: <20200625191308.3322-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
References: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Dharageswari R <dharageswari.r@intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

From: Dharageswari R <dharageswari.r@intel.com>

This patch updates tx_mask, so that (0-3)slots are reserved for
Maxim amps to feedback data.

V0->slot0,
I0->slot1,
V1->slot2,
I1->slot3.

also update slot_width in tdm configuration to 24 as the BE
configuration is 24 in topology.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Dharageswari R <dharageswari.r@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index f8871af2f0d3..123e6e5313fb 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -49,11 +49,11 @@ static int max98373_hw_params(struct snd_pcm_substream *substream,
 	for_each_rtd_codec_dais(rtd, j, codec_dai) {
 		if (!strcmp(codec_dai->component->name, MAX_98373_DEV0_NAME)) {
 			/* DEV0 tdm slot configuration */
-			snd_soc_dai_set_tdm_slot(codec_dai, 0x30, 3, 8, 16);
+			snd_soc_dai_set_tdm_slot(codec_dai, 0x03, 3, 8, 24);
 		}
 		if (!strcmp(codec_dai->component->name, MAX_98373_DEV1_NAME)) {
 			/* DEV1 tdm slot configuration */
-			snd_soc_dai_set_tdm_slot(codec_dai, 0xC0, 3, 8, 16);
+			snd_soc_dai_set_tdm_slot(codec_dai, 0x0C, 3, 8, 24);
 		}
 	}
 	return 0;
-- 
2.20.1

