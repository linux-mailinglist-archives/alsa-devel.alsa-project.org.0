Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C8A54829E
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 11:08:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F6AE185A;
	Mon, 13 Jun 2022 11:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F6AE185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655111322;
	bh=2NbET2uuELT2qxeUA6UaI5G3IivOjV6ok7fat1d8OXM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vaWbyyxFZbhh3CnzFX4G5B5iPrKkwODW0MAyGzkdLvn/mKIrvz+I3aaVmnlkV0ebu
	 vWLnEkfrgQ+46qSLxuEcVnnCYTVV7i02ehnp6/sHe5aBoDZmgWuiNWPAwAbY1XxFpm
	 uEAnJ1uM6wOwogZe7tnnPQOA0y0nr0ZhNHs3eyMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F952F80557;
	Mon, 13 Jun 2022 11:05:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C16B4F8053C; Mon, 13 Jun 2022 11:05:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DE84F804BB
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 11:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DE84F804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AUO30pk4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655111144; x=1686647144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2NbET2uuELT2qxeUA6UaI5G3IivOjV6ok7fat1d8OXM=;
 b=AUO30pk4x39flPz+o77yOmrSxTrjV8qaZMZn9sbspqd29znT8gY5BtsQ
 bEZAAB5xl+/NVWDuIvsTdIrhkvA3l1nk9GtpsXqUmIo1cQhv9WR0HRzPf
 MZCEGBpQZ4zApf2sif0qgnzD4QoaIbtleMTfRg67fFNpbiMJN9p193fwC
 JBgTx745Somc3EYHbmBOIdFthm7TKJtw0xecIbhahvsWEO3R0hcNnEJl3
 So7FDTjecAyOFxZsIl919nE6uTDoemz8AQveL4H3EidoeriuwaOEg7oS0
 nQRT1IiYGns3GqsuKSp+YtakawoJcgmErxVG74U25R8Tmf9WdzOY5NK14 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="275753845"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="275753845"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 02:05:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="639625873"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jun 2022 02:05:40 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 07/17] ASoC: Intel: hsw_rt5640: Improve hw_params()
 debug-ability
Date: Mon, 13 Jun 2022 11:15:36 +0200
Message-Id: <20220613091546.1565167-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613091546.1565167-1-cezary.rojewski@intel.com>
References: <20220613091546.1565167-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Print status if setting sysclk fails.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/hsw_rt5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index 94f96de0b62a..5e2224f7e986 100644
--- a/sound/soc/intel/boards/hsw_rt5640.c
+++ b/sound/soc/intel/boards/hsw_rt5640.c
@@ -53,7 +53,7 @@ static int codec_link_hw_params(struct snd_pcm_substream *substream,
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_MCLK, 12288000, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
-		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
+		dev_err(rtd->dev, "set codec sysclk failed: %d\n", ret);
 		return ret;
 	}
 
-- 
2.25.1

