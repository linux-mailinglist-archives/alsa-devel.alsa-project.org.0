Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4104E55124F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 10:15:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D390F18C4;
	Mon, 20 Jun 2022 10:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D390F18C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655712949;
	bh=caF6uMwN6uVQ02UDhQ8rgZeuZsctMB4Rc9h8B0yK7gw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dpF84iedwSkkUNRdZYEVKx/cBAsLJN7wx5QqDah9aSlRCEmZMMKRUQYKsZrXiTZax
	 lUaZKntt10Br67PkKMJg36pJpbo5rvfic3sUDEqKdG0j6YrsehmVUtZUrN3rd/AOJZ
	 Qt8SaqCuKNotOc0AE7Njq7Lk7QRM84YpnPysFwv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 253FEF80579;
	Mon, 20 Jun 2022 10:12:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA0C5F80553; Mon, 20 Jun 2022 10:12:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 403B0F80534
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 10:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 403B0F80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PJX4H+pf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655712753; x=1687248753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=caF6uMwN6uVQ02UDhQ8rgZeuZsctMB4Rc9h8B0yK7gw=;
 b=PJX4H+pf2QH2PQntziWultKDZ/Vf0Z8iPdx+MSkDFwAgnagzgNHEnUfu
 iriV8xVHmhE+5Ru/3ajcC7wdDpmTECIpjetNu8F2bWSSllpGTfUwl/mX/
 YF0ZUO5AzVLgbwH3+u1k21lQfKm8VwA1fnttbppWmUubcLgoobFEk4pYN
 G7EFH8Zks+2QN5n+2iZAhI6sRH2hcgVhRkiT326zkgVWb04lESHlyl28E
 7yxR5XLjUWa4BOtaQoVaOjcLxQdleTl9V1PGT4dH1BE/apiZLC6RdPFv7
 KNzHq9wDuvC/9fPkk7Lx/r0RiPdSTUTSfqoW2ajd6ict564Z+rvZuE7qV w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="305270897"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="305270897"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 01:12:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="591067391"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2022 01:12:29 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 07/17] ASoC: Intel: hsw_rt5640: Improve hw_params()
 debug-ability
Date: Mon, 20 Jun 2022 10:22:16 +0200
Message-Id: <20220620082226.2489357-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620082226.2489357-1-cezary.rojewski@intel.com>
References: <20220620082226.2489357-1-cezary.rojewski@intel.com>
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
index 273c8e274d25..ad747363d112 100644
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

