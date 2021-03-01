Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E00232858C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 17:56:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6217E16A0;
	Mon,  1 Mar 2021 17:56:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6217E16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614617811;
	bh=kmMTmN0aIQKYc4lZUz/OrxYV294lCnyqGKBrrDWhV1w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W5nik9DwCDXh3AuHCa52WDE1vk1xzgBofptWrDELEUdarvMswwedgKWHIMAFPawWt
	 FBi2OkiF5Km9Q523HS1oiigym04ijAnno7fHMPSOUeKaAFNnBgVdK2Uu0qGa0PiZ+n
	 BfOsicMaGOi8EuGvvnKEIe4r72Q7Z/S6kNzl8PbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 409D0F80257;
	Mon,  1 Mar 2021 17:54:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AC65F80431; Mon,  1 Mar 2021 17:54:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E4E0F8025E
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 17:54:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E4E0F8025E
IronPort-SDR: ppHrS4v7NLcShBPc+/2KOn4TD1fj5UmcPnIFlGrAnkmqBeohKGUGVxLTevE6WeS3aL9rzAXzLi
 u0oUrbs9dDiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="186580172"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="186580172"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 08:54:03 -0800
IronPort-SDR: kMilwrl/aGrHpTwORGlQfY+fN4GOJPKYplpMuo4zXLfO6TegvadISdSa8uWbFCaHBGQtmg7+vM
 30BUQ31kluBw==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="505330642"
Received: from mhuang8-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.25.220])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 08:54:02 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: soc-dai: fix kernel-doc
Date: Mon,  1 Mar 2021 10:53:48 -0600
Message-Id: <20210301165349.114952-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301165349.114952-1-pierre-louis.bossart@linux.intel.com>
References: <20210301165349.114952-1-pierre-louis.bossart@linux.intel.com>
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

v5.12-rc1 flags new warnings with make W=1, fix missing or broken
function descriptors.

sound/soc/soc-dai.c:167: warning: expecting prototype for
snd_soc_xlate_tdm_slot(). Prototype was for
snd_soc_xlate_tdm_slot_mask() instead

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index cd3bb9a7983f..080fbe053fc5 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -154,7 +154,7 @@ int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_fmt);
 
 /**
- * snd_soc_xlate_tdm_slot - generate tx/rx slot mask.
+ * snd_soc_xlate_tdm_slot_mask - generate tx/rx slot mask.
  * @slots: Number of slots in use.
  * @tx_mask: bitmask representing active TX slots.
  * @rx_mask: bitmask representing active RX slots.
-- 
2.25.1

