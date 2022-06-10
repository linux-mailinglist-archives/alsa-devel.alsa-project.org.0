Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA4054669B
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:27:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 063AC1B3A;
	Fri, 10 Jun 2022 14:27:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 063AC1B3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654864079;
	bh=sNYVYVE2ky9o1xmfL+Ctpt9c5/YEj5m36st4gg2yEO4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s8uyeM/pTGrlzyupcvcOlmLKwbuosmjkn5A/D7NhxGB8Rc2/9Anr7jRiP9cA8Kr68
	 WwbPdKPiBzAT5C7K655Aa2qDK2jN21NRIontKMUELa1qKNpW7T6t5WXT/1vnWjZi+v
	 WljL867GFaAzxtN0nTGd1qVnm1sO1PhnYrIMRaPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7627F80527;
	Fri, 10 Jun 2022 14:26:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 956A3F804CF; Fri, 10 Jun 2022 14:26:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 622B7F80528
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:26:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 622B7F80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bMomP+7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654863981; x=1686399981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sNYVYVE2ky9o1xmfL+Ctpt9c5/YEj5m36st4gg2yEO4=;
 b=bMomP+7upmQPpkNEZmaMjgOZSWpFWlGngdDOXIJXR0a1IhcTkVa1mUcL
 SL/Ms8/fCweZ60rRj6hyPoxhNW4yfj7bOHyGAXFJ68L0fgccW2rz6NyVc
 nokrh6hcWGm8IRAxyTozL/Kg90NaCSFTLJ5b0DfPgGpJbxtNrGkaOgASd
 kuBQ1Bd9LwRL/o+8MJP5A3q0Kai4qpABH1Z63569h1+Rm7B1t1W2uYexm
 hmswAXtsw5eutKbjUI0a1kNoLvkmW5pugqLGwLqmKJbb7nLcekjWMl+5F
 mwjsvxw5jo5rrtSGDbwtNZV8EPcu8gVt4LCgczFnYbQdXBk1T+Ydcgo6X g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278414375"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="278414375"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 05:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="684517872"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2022 05:26:18 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 06/17] ASoC: Intel: hsw_rt5640: Improve probe() function
 quality
Date: Fri, 10 Jun 2022 14:36:16 +0200
Message-Id: <20220610123627.1339985-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610123627.1339985-1-cezary.rojewski@intel.com>
References: <20220610123627.1339985-1-cezary.rojewski@intel.com>
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

Declare local 'dev' and make use of it plus dev_get_platdata() to
improve code readability.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/hsw_rt5640.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index 0cd788a73694..94f96de0b62a 100644
--- a/sound/soc/intel/boards/hsw_rt5640.c
+++ b/sound/soc/intel/boards/hsw_rt5640.c
@@ -147,16 +147,17 @@ static struct snd_soc_card hsw_rt5640_card = {
 static int hsw_rt5640_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach;
+	struct device *dev = &pdev->dev;
 	int ret;
 
-	hsw_rt5640_card.dev = &pdev->dev;
-	mach = pdev->dev.platform_data;
+	hsw_rt5640_card.dev = dev;
+	mach = dev_get_platdata(dev);
 
 	ret = snd_soc_fixup_dai_links_platform_name(&hsw_rt5640_card, mach->mach_params.platform);
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(&pdev->dev, &hsw_rt5640_card);
+	return devm_snd_soc_register_card(dev, &hsw_rt5640_card);
 }
 
 static struct platform_driver hsw_rt5640_driver = {
-- 
2.25.1

