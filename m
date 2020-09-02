Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E876725B5E6
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 23:32:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89A6417D5;
	Wed,  2 Sep 2020 23:32:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89A6417D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599082371;
	bh=CJataQneuBbNELeYX1UOBctA4XXhTsruSPa8YnWLDS4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Um2tnn0oEJsphCXiZ5FxiTNee/iJuFlIp6O7hDWW9zwrzoRDiZQbezYgBZ2bDnkxN
	 DrPOEtcScaSryn06+Uf1iNjsA50z2uXIUmk8zR/m0iDA2b9BF92eti/4yApCXtM2wo
	 VMtyPeMxEOJMocbZ0V2jdNrtAUJOIFn5D2OuNFoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F815F8034B;
	Wed,  2 Sep 2020 23:22:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E57D5F802E8; Wed,  2 Sep 2020 23:22:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEE7AF802DD
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 23:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEE7AF802DD
IronPort-SDR: S6YA12XB/F5GYl8uWcHxlNsyE28ljhlnXsOw4PXOaX6mr/UTXt43AmkEZlL3Jpm3mcBInCNHg6
 RBUFukKQVzPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="157482892"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="157482892"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:11 -0700
IronPort-SDR: hdbw1Ox8Pe2E51dV6RREtHThge2PglqzkzsUo2bhK+V2py/Pc9hbGitBF+OYR1G108yY0ckmma
 NnMpq92/8u+A==
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="477798295"
Received: from rnagarat-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.56.27])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 16/18] ALSA: vx: vx_core: clarify operator precedence
Date: Wed,  2 Sep 2020 16:21:31 -0500
Message-Id: <20200902212133.30964-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
References: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
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

Fix cppcheck warning

sound/drivers/vx/vx_core.c:600:49: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
      chip->chip_status & VX_STAT_XILINX_LOADED ? "Loaded" : "No");
                                                ^
sound/drivers/vx/vx_core.c:602:47: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
      chip->chip_status & VX_STAT_DEVICE_INIT ? "Yes" : "No");
                                              ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/drivers/vx/vx_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/drivers/vx/vx_core.c b/sound/drivers/vx/vx_core.c
index 26d591fe6a6b..d5c65cab195b 100644
--- a/sound/drivers/vx/vx_core.c
+++ b/sound/drivers/vx/vx_core.c
@@ -597,9 +597,9 @@ static void vx_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *b
 	
 	snd_iprintf(buffer, "%s\n", chip->card->longname);
 	snd_iprintf(buffer, "Xilinx Firmware: %s\n",
-		    chip->chip_status & VX_STAT_XILINX_LOADED ? "Loaded" : "No");
+		    (chip->chip_status & VX_STAT_XILINX_LOADED) ? "Loaded" : "No");
 	snd_iprintf(buffer, "Device Initialized: %s\n",
-		    chip->chip_status & VX_STAT_DEVICE_INIT ? "Yes" : "No");
+		    (chip->chip_status & VX_STAT_DEVICE_INIT) ? "Yes" : "No");
 	snd_iprintf(buffer, "DSP audio info:");
 	if (chip->audio_info & VX_AUDIO_INFO_REAL_TIME)
 		snd_iprintf(buffer, " realtime");
-- 
2.25.1

