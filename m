Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CC655124B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 10:15:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B86C18E2;
	Mon, 20 Jun 2022 10:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B86C18E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655712932;
	bh=aBOBlOyz852sglEqIR7/HbSbdqdNaRPyc8TMc0PuzuY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RlcpVNTladNzw0Ltj/3MORVOPdKEaiXV5lwoa2HHfq88v+bbVB3w1GKFSBkdI70X6
	 c3migSViP+C3lEstpI/q+IEHj0o1jbRHcBPd1rbRNXsWJHlotXM9HnjaP3t4Y461YX
	 Yg2I5sk/taSQMRgTtUosY2Pn09Be3vTYvmFpE2RQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F75FF80563;
	Mon, 20 Jun 2022 10:12:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 734D3F8052E; Mon, 20 Jun 2022 10:12:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B027F8052E
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 10:12:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B027F8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KzrmD1w2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655712751; x=1687248751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aBOBlOyz852sglEqIR7/HbSbdqdNaRPyc8TMc0PuzuY=;
 b=KzrmD1w2hjLRkYKypspjj6xsyLMuIzwoZtKjoNUeqlBZ4bpCrGX+Ba9R
 0TU21bv1eGqFhs5jDOjxn0WBEjjmyvCLz0XDvAbVopwzYYR4RgaWh66+K
 9sXx+KNBmomWpbIK3z7tV9M/N1ZMpH9OtUuI82Rdl4INpoIKa6KiRdztp
 x49bJlZTz9o9inszOOaSN8F1ZzfaTxyFVIMGfR8b1JWxvJ+pbgaXSMxMV
 5t11PBkzMBYPNvSrqi2J2ERrcT/N8/TnPsNc54RVH1vxA0TIfTLeCo9Cd
 /9B7W0ASJFh2dqqkFgaCoPhk9MvPmn3iUiz2E0IROdz+5tpF5ACJugURa g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="305270888"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="305270888"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 01:12:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="591067385"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2022 01:12:28 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 06/17] ASoC: Intel: hsw_rt5640: Improve probe() function
 quality
Date: Mon, 20 Jun 2022 10:22:15 +0200
Message-Id: <20220620082226.2489357-7-cezary.rojewski@intel.com>
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

Declare local 'dev' and make use of it plus dev_get_platdata() to
improve code readability.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/hsw_rt5640.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index f843ba5f4718..273c8e274d25 100644
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

