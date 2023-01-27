Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D01467E92B
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 16:13:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 915C8EA0;
	Fri, 27 Jan 2023 16:13:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 915C8EA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674832432;
	bh=xrYcmvjWf+uFdMitGF3Y74ed18GwxPVNfZPcF6Y6eN4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Iobxoljs9IXDlItrxWrSGo9idBmtkj/RdtRbEgTwVXcapjz/G3PnidU1h1astky/w
	 TOMcIZpb/ZXAkU8hlPJjsAoJ2k9CpWz/kOnkWvX8u8knFosPBg3cOhtH/nv5llvXjg
	 0qDuG7GJUaxsMdYz8V7g+d5H2mibR2gIoyniSZQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A1F7F80587;
	Fri, 27 Jan 2023 16:10:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AE2BF8056F; Fri, 27 Jan 2023 16:10:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87CE7F80552
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 16:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87CE7F80552
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=myvq+l1j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674832228; x=1706368228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xrYcmvjWf+uFdMitGF3Y74ed18GwxPVNfZPcF6Y6eN4=;
 b=myvq+l1jYIJLQamlItHHqzz2n/W0/lTxf2i57fQbCgvStLjOuXEAmOUO
 lQ64leDhLXfbldN6p6fqklMD7lw39j5oKMsHs1BFeyXa95wi/wCqobPSv
 L6NabbHgy6xV3lD7O39aHMqe3L801DIZY51TAGkyVPORiP7TQzksYvaG2
 mFQzBBmllckmUR5Dd7LRS36wmJ3CebT6mt6PQ9wI27DIIQIDTpEBqDD9V
 blhq4x2br6C4v5EqMaO1QlROkqo6TtZzgChk1n6gu8+Bruu2IUOE8reEE
 yyaDHF4d/4iSjQeXyoxF/mDPrDXrQi/9b7N9CeMppApuT95i6RITn5T9d g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="324795844"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="324795844"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 07:10:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="908709029"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="908709029"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jan 2023 07:10:25 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 08/11] ASoC: topology: Return an error on complete() failure
Date: Sat, 28 Jan 2023 00:11:08 +0100
Message-Id: <20230127231111.937721-9-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
References: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Function soc_tplg_dapm_complete() detects an error and logs it, but
doesn't return failure to the caller, fix it by returning the error.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index c35c0c53a184..08dd55f94584 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1563,7 +1563,7 @@ static int soc_tplg_dapm_complete(struct soc_tplg *tplg)
 		dev_err(tplg->dev, "ASoC: failed to create new widgets %d\n",
 			ret);
 
-	return 0;
+	return ret;
 }
 
 static int set_stream_info(struct soc_tplg *tplg, struct snd_soc_pcm_stream *stream,
-- 
2.25.1

