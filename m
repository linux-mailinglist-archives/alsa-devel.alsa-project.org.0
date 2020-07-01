Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E39211273
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 20:18:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D4601690;
	Wed,  1 Jul 2020 20:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D4601690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593627511;
	bh=b5zM8kO3Ap373+CdXu8ssAWUEnsIZLGYm0BcgxdX1RY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XoT8s/wH5n39JU/QkLQ94K1HZ0Bnl3yPahEpKbs0e53XLezIqBL61WSnn5KcGDrkZ
	 F3zcvUTfGtk4XgdBuL+2f1oZLJZ2NFukNTIU2VAfpZH0s79ZtVcS32w2UTmfE/1Fx5
	 8cosQ+nceV/puBPydm/lY28Ka2WoRkLfnPWhEX10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04E3FF802DF;
	Wed,  1 Jul 2020 20:14:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9024DF802BD; Wed,  1 Jul 2020 20:14:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31B7AF80229
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 20:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31B7AF80229
IronPort-SDR: ZNHeVQWDSBSMgRkTK12UtqvO7WcfYbW3aj96yIRIrouSmOLlQGYITgl3SkF3dXzxm5btDE7mmf
 L7CH1ro+kOfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="145753273"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="145753273"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:13:56 -0700
IronPort-SDR: a9VON5upshWlAASH0NEfVO5bJAwT4QhtSD0lDpa+0BnWxJjx/MvBU5yd92SvP5XJbi8X4Ohc9J
 JsovNDnUGtEA==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="481686395"
Received: from srnatla-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.76.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:13:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/7] ASoC: codecs: wm9713: remove spurious kernel-doc comment
 start
Date: Wed,  1 Jul 2020 13:13:18 -0500
Message-Id: <20200701181320.80848-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
References: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
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

Fix W=1 warning

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/wm9713.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index a662a5547eb6..7072ffacbdfd 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -807,7 +807,7 @@ static void pll_factors(struct snd_soc_component *component,
 	pll_div->k = K;
 }
 
-/**
+/*
  * Please note that changing the PLL input frequency may require
  * resynchronisation with the AC97 controller.
  */
-- 
2.25.1

