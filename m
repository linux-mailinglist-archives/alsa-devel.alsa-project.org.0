Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA06206BD5
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 07:37:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 361B617FE;
	Wed, 24 Jun 2020 07:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 361B617FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592977065;
	bh=C3jnknJ1yuaV6xhGfTQ3QQX+NK0wLk1Dvya86qEqb6M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JPOYWubbGQgyhzJxb4AkGDwCt2lKtqgIXzGRc3bjLSAcRY4/gT/1nE+0SQj8QGOO/
	 cJXob+EglN+IKL8a3xPsNTScPQqh+fRL7vRefSKl4SuW3CBuSlGSoX3RInT4MFYJAM
	 FRcfKBdBkBhykh7HM2cP7jF7clyTz7kn9CNGAc3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80561F8012F;
	Wed, 24 Jun 2020 07:35:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DD65F8015B; Wed, 24 Jun 2020 07:35:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BC8CF800B2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 07:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BC8CF800B2
IronPort-SDR: L65LDR2AE3X0tXnhqzEfzmrzkrSiReGuFPHmLFbgbhFDFb3vk5bco6p89W/E0yR0UsikMVTZ/X
 FqGHZXYh+xAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="144376406"
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="144376406"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 22:35:39 -0700
IronPort-SDR: 0r6h65uA5vTdlEYGtRj/Wwfb9qGWrsj4OpAaQ7ZjESJmH/F8ttWaWBDBbufh5AEfZotI3YGW2W
 OklUTwy5Kr7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="301504889"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga004.fm.intel.com with ESMTP; 23 Jun 2020 22:35:37 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH] ASoC: SOF: Intel: hda: import SOUNDWIRE_INIT namespace
Date: Wed, 24 Jun 2020 01:41:30 +0800
Message-Id: <20200623174130.22003-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Make sure the SoundWire driver can be loaded

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 63ca920c8e6e..c0b75d682750 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1207,3 +1207,4 @@ MODULE_LICENSE("Dual BSD/GPL");
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC);
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
+MODULE_IMPORT_NS(SOUNDWIRE_INTEL_INIT);
-- 
2.17.1

