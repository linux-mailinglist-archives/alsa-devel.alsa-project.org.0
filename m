Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D3040D785
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 12:34:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54E36189B;
	Thu, 16 Sep 2021 12:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54E36189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631788499;
	bh=JdqtW+q8dahBye+Kysc4IRVpos4S24TEdLgWGicJABQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uTacMDmKlMieKwRWXXRL1mAX4tgAIWxFEa0x1Nyk+ZOz44R0YMtgZrvi4o673Qjuo
	 6vYYedsbwqE369wstLgLzw1jbYAvlNBf3DTvuUSaxTpjdDoDJH+jczsTpfYwzWAAAv
	 NYP1ITx9Cn2bmnV0TrPcPUJoywhJP7qn+4wLSCfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B737EF804FC;
	Thu, 16 Sep 2021 12:32:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E8F8F804EC; Thu, 16 Sep 2021 12:32:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5467F800D3
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 12:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5467F800D3
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="202031852"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="202031852"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:32:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="545473524"
Received: from gkapusti-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.35.152])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:32:17 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 2/6] ASoC: SOF: pcm: Remove non existent
 CONFIG_SND_SOC_SOF_COMPRESS reference
Date: Thu, 16 Sep 2021 13:32:07 +0300
Message-Id: <20210916103211.1573-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916103211.1573-1-peter.ujfalusi@linux.intel.com>
References: <20210916103211.1573-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

The SND_SOC_SOF_COMPRESS is not valid Kconfig option, remove it.

At the same time remove the also the declaration of the non existent
sof_compressed_ops.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/pcm.c      | 4 ----
 sound/soc/sof/sof-priv.h | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 9893b182da43..2cfc0e24fec1 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -829,11 +829,7 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 	pd->trigger = sof_pcm_trigger;
 	pd->pointer = sof_pcm_pointer;
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
-	pd->compress_ops = &sof_compressed_ops;
-#endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
-	/* override cops when probe support is enabled */
 	pd->compress_ops = &sof_probe_compressed_ops;
 #endif
 	pd->pcm_construct = sof_pcm_new;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index fd8423172d8f..3172722fd5b8 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -540,11 +540,6 @@ int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev);
 void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev);
 int snd_sof_dbg_memory_info_init(struct snd_sof_dev *sdev);
 
-/*
- * Platform specific ops.
- */
-extern struct snd_compress_ops sof_compressed_ops;
-
 /*
  * DSP Architectures.
  */
-- 
2.33.0

