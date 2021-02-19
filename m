Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2009932019B
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:12:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB2A8165D;
	Sat, 20 Feb 2021 00:12:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB2A8165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613776378;
	bh=Qd05lEaMggCXh8hwz1nt+mDXxpbgcgL95gCdYubtXrA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D066ERYSuyl2tRvd2gNTq9d2G5FXs0yNMw3V+rqTo28p+xn5rqMmFnc1K2HsVyIFG
	 nO23eLGHRqO+4E/IcFoqMtmGWMN1HmjntKyyH1dYlMead9jxATAG1D5BfOeLNoqndb
	 E2FYaD/Aut10+JPZ7HSwoyndPFmWBKbYUF2fGJ1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29603F802E2;
	Sat, 20 Feb 2021 00:09:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 183F7F802C9; Sat, 20 Feb 2021 00:09:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FC15F80258
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:09:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FC15F80258
IronPort-SDR: 3FYhoxYARTdIlqVCbQd4rju31ZBmcapUg+9HF0QYQKjdZB6BXs5E+fzo0MGZCO+RqZlxDly6+T
 KNNUCp84jAgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="163139060"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="163139060"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:09:31 -0800
IronPort-SDR: liz9y5lECxm6wfqvRl5fLRT5rL6aph/gAFDmPNXozv4NTHrHPdUnHTfcn+K52JkJxKZ3bKGVJO
 JRogAxvJRWOQ==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="365362854"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:09:30 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/6] ASoC: samsung: smdk_wm8994: add missing return
Date: Fri, 19 Feb 2021 17:09:15 -0600
Message-Id: <20210219230918.5058-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
References: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
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

