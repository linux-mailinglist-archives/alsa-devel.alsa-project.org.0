Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C4131F22A
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 23:21:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B035B1666;
	Thu, 18 Feb 2021 23:20:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B035B1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613686888;
	bh=cCDPexjSxgV8jedos0RjEzWGa560mKm+TwPhHaAMUKA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dMRGpgnIOkNWqzC2amOws+XI8EbHKoHgTVNkNgn2gG0yiLSDHvn3pe5bCbmgHKDsq
	 LPJF1pXXFqf5/RkfMu4cwESkFeix2Fb8F95J++0PPOIE6+zsMLmtsujHmOMo017CjZ
	 YKFrl8KKkaA1IvgwCYh7SjqWwDGbhjushCE+9sgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5C0CF8020C;
	Thu, 18 Feb 2021 23:19:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4509F802A9; Thu, 18 Feb 2021 23:19:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6920F800D0
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 23:19:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6920F800D0
IronPort-SDR: 2ovfFZYuwzNN+yMxckNJhzi0kCdTW2L9picXSKY/CSFxysPwOPLI+If4RDS3dLoul03Wb2CpNy
 yEPNA6TUl75A==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="170801477"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="170801477"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:19:35 -0800
IronPort-SDR: Z9741Z7+GihoCOXgl4qAS7MzYaqxliAGSBvrk6BUde8G1/DXttdrYjWf4Lgg3HKg9Ud624DpEY
 VeRK8t2eMB4Q==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="581441981"
Received: from tphilli1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.38])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:19:34 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/6] ASoC: soc-ops: remove useless assignment
Date: Thu, 18 Feb 2021 16:19:16 -0600
Message-Id: <20210218221921.88991-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218221921.88991-1-pierre-louis.bossart@linux.intel.com>
References: <20210218221921.88991-1-pierre-louis.bossart@linux.intel.com>
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

cppcheck warning:

sound/soc/soc-ops.c:410:35: style: Variable 'val2' is assigned a value
that is never used. [unreadVariable]
 unsigned int val, val_mask, val2 = 0;
                                  ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 10f48827bb0e..58527247df83 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -407,7 +407,7 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	int min = mc->min;
 	unsigned int mask = (1U << (fls(min + max) - 1)) - 1;
 	int err = 0;
-	unsigned int val, val_mask, val2 = 0;
+	unsigned int val, val_mask, val2;
 
 	val_mask = mask << shift;
 	val = (ucontrol->value.integer.value[0] + min) & mask;
-- 
2.25.1

