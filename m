Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4310D243FA1
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 22:07:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E181A166D;
	Thu, 13 Aug 2020 22:06:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E181A166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597349241;
	bh=q331DbJDAac6bzYw8hlBxPgh7kxAkC4FKqPGC/zX8O4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jhUnc5OhI+ZM2O4IYherexrAKcj3DCNSaBIuc7nhozOS8vS532TOtW6yiSS4Y1PDy
	 9CDcoGY/MGWDPWcIAGY3nq5lqdR8Wh0VtrorJ0tHeftNNE2cgWqgeyxj1D/3ivcNyz
	 /1mPhFVO2oFVJd954w81M6ZBoTot4Vk+lZ2zXHJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 388A0F80308;
	Thu, 13 Aug 2020 22:02:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 511D3F802E7; Thu, 13 Aug 2020 22:02:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 849E9F8014C
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 22:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 849E9F8014C
IronPort-SDR: PtDSW/Bp2gkAahlKAWPitZJW87XWbHvpilV3gHcKAb6LcnVPTW5rUUzzBS1u4uiAH+IsXuz5ur
 i2VCjzqTyrgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="141940380"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="141940380"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:05 -0700
IronPort-SDR: dHynQttSydVY0pkx5N1oBUrQJJc6IRJvIS6QTWkK58Zb7SyNIoxVZYpldE7CAdIurfVJgIQ03B
 ngLeFluhob8w==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="495506285"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/21] ASoC: Intel: Atom: platform-pcm: fix redundant return
Date: Thu, 13 Aug 2020 15:01:33 -0500
Message-Id: <20200813200147.61990-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
References: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

 return ret_val;
        ^
sound/soc/intel/atom/sst-mfld-platform-pcm.c:384:6: note: If condition 'ret_val' is true, the function will return/exit
 if (ret_val)
     ^
sound/soc/intel/atom/sst-mfld-platform-pcm.c:387:9: note: Returning identical expression 'ret_val'
 return ret_val;
        ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 58628c7e7a0a..5de2e0b35a1d 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -384,7 +384,7 @@ static int sst_media_prepare(struct snd_pcm_substream *substream,
 	if (ret_val)
 		return ret_val;
 	substream->runtime->hw.info = SNDRV_PCM_INFO_BLOCK_TRANSFER;
-	return ret_val;
+	return 0;
 }
 
 static int sst_enable_ssp(struct snd_pcm_substream *substream,
-- 
2.25.1

