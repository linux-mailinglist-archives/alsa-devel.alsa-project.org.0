Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3620322186
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 22:36:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B02F1675;
	Mon, 22 Feb 2021 22:36:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B02F1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614029818;
	bh=m4ExSWemA7Eyvb4oeQE/PDwF64YNMOO8CfpPCRsSpF8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VVr8iYJi6Q9fOqJ52cCM97EY0sc57nnE1GeDQ+Rm85d4WDiJi9j0FmtKgnGgdiviG
	 cktIpCdSggKKOV9OGfacmBsPhgtwOl1Dh7lldgwOPLHCsXksTeWk3JEOTcL8fyrhWs
	 58wuZ45EDsn1fg7GZY9N/44dut0kmG+s0zSElItE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3C4BF80430;
	Mon, 22 Feb 2021 22:33:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD21AF80279; Mon, 22 Feb 2021 22:33:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DBABF8022B
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 22:33:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DBABF8022B
IronPort-SDR: mds5bTAMkCJf3iFimcRUKq3uUM9AcHh0WqGV/Z9XNol+w4/SAjcJzMkvN8w3WbMxYa1Ps/2UxC
 81VCvdUyfudw==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="171740003"
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="171740003"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 13:33:22 -0800
IronPort-SDR: hI35zrZdqCfOECuMRWzzqZ/h2UjuU0FtjmBj3SEYtzZqAQZtuu5kLmTLQDNWS3IlBKfu4hZSY2
 Z5dMCwklMFSg==
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="423270721"
Received: from sspurohi-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.54.136])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 13:33:18 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 4/6] ASoC: samsung: smdk_wm8994: add missing return
Date: Mon, 22 Feb 2021 15:33:04 -0600
Message-Id: <20210222213306.22654-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
References: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
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

sound/soc/samsung/smdk_wm8994.c:179:6: style: Variable 'ret' is
reassigned a value before the old one has been
used. [redundantAssignment]
 ret = devm_snd_soc_register_card(&pdev->dev, card);
     ^
sound/soc/samsung/smdk_wm8994.c:166:8: note: ret is assigned
   ret = -EINVAL;
       ^
sound/soc/samsung/smdk_wm8994.c:179:6: note: ret is overwritten
 ret = devm_snd_soc_register_card(&pdev->dev, card);
     ^

The initial authors bothered to set ret to -EINVAL and throw a
dev_err() message, so it looks like there is a missing return to avoid
continuing if the property is missing.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/samsung/smdk_wm8994.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 681b244d5312..39a7a449f554 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -164,6 +164,7 @@ static int smdk_audio_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 			   "Property 'samsung,i2s-controller' missing or invalid\n");
 			ret = -EINVAL;
+			return ret;
 		}
 
 		smdk_dai[0].platforms->name = NULL;
-- 
2.25.1

