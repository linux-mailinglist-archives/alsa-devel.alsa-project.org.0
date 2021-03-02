Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6A732AC03
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:04:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D0271906;
	Tue,  2 Mar 2021 22:03:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D0271906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614719067;
	bh=HZKkvIDQ9gLG6VHUqIifCjw4cvfuoWS+i2gBEjIG+sc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FkuvjqKFhYso54d2XK68A4fD7pB3+bLNC+hqifUmSAXmSbCy70e3LBKzPiR3FXORF
	 5pjZ5UBxcLGv250BYk3SBbyczOJH404u9uH1XtZX8CtMZk0dBDbtn2eFhq5rltP85G
	 T2bY/PeJ/LJNaKit9AaJFt1ud9zV0V9NBtslzXnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6508AF804AA;
	Tue,  2 Mar 2021 22:00:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22B75F802E7; Tue,  2 Mar 2021 22:00:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0FF6F8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:00:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0FF6F8012D
IronPort-SDR: AqWIvl6M2XXQ3Qc05lZ8q178a/m2hmGCuIfjA05BZHanFGzI3lOjd22ssYDzgF4SX2oX96ZLf1
 XiEGkB/6FeIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174623733"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174623733"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:29 -0800
IronPort-SDR: rM6pkeOOrak/popEUhp577aD87PCsqhtvnGfDO/rzN/RMPtAiyJeDCfOwWTbiY48/LJvN7/jKZ
 Xg99imoui6lg==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="373727798"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:28 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/9] ASoC: sigmadsp-regmap: fix kernel-doc warning
Date: Tue,  2 Mar 2021 14:59:21 -0600
Message-Id: <20210302205926.49063-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302205926.49063-1-pierre-louis.bossart@linux.intel.com>
References: <20210302205926.49063-1-pierre-louis.bossart@linux.intel.com>
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

make W=1 warning:

sound/soc/codecs/sigmadsp-regmap.c:42: warning: expecting prototype
for devm_sigmadsp_init_i2c(). Prototype was for
devm_sigmadsp_init_regmap() instead

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/sigmadsp-regmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/sigmadsp-regmap.c b/sound/soc/codecs/sigmadsp-regmap.c
index bf1c4086da9f..ba9a6795e470 100644
--- a/sound/soc/codecs/sigmadsp-regmap.c
+++ b/sound/soc/codecs/sigmadsp-regmap.c
@@ -26,7 +26,7 @@ static int sigmadsp_read_regmap(void *control_data,
 }
 
 /**
- * devm_sigmadsp_init_i2c() - Initialize SigmaDSP instance
+ * devm_sigmadsp_init_regmap() - Initialize SigmaDSP instance
  * @dev: The parent device
  * @regmap: Regmap instance to use
  * @ops: The sigmadsp_ops to use for this instance
-- 
2.25.1

