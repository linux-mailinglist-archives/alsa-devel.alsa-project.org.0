Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9303654829D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 11:08:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31061185F;
	Mon, 13 Jun 2022 11:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31061185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655111309;
	bh=sNYVYVE2ky9o1xmfL+Ctpt9c5/YEj5m36st4gg2yEO4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bze92u56CDsmxOZeSkAdKzq8YpZ1sC3VMWL/JpW/zgLyjvhaukSv0c6R+mCyteH/d
	 vseS4zwkxmUSP+JRf6l7zX2lQqin4Ui98v6JXI7fNN+1CrFdsqlaATUCoZDA2Wy9Bw
	 TVFVGSlgXCYrkItRuxixnHsJjQNvVTRQMXFoid+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D397EF8054A;
	Mon, 13 Jun 2022 11:05:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 943D0F804F1; Mon, 13 Jun 2022 11:05:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBFDEF8051F
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 11:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBFDEF8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VvWOUGa3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655111142; x=1686647142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sNYVYVE2ky9o1xmfL+Ctpt9c5/YEj5m36st4gg2yEO4=;
 b=VvWOUGa3rXcvfFnc7OXyCWgTdxV/jNLR5chT4ObHz7hTUrSgIAQscfW2
 IVA1IsivNM+rXpec1i6pG9BMRnYA5g0nysYXjgZx4+XG+VsfsHo6AK0RU
 bE8L8bFwdACtMkv9N5ThG+3gp5X8i1brFB/UN9NdTCfji7puTpVeru36B
 8XMGxDg62aShDMEgucGdgZynZYE0iYA4jppTDYs7sDdNKtH1hNtEj4teR
 bEeN/8kbJ7Nuhdlw6XpCMfJ6vrFcgLqm+eCT2lpBwDRVWmkYpgXBdTNr9
 vFIp2wXyt7tpkbwP4n/a8VSEicpyRNTW2wcnBYRJVfJoy+F3j8CP6N0OL A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="275753825"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="275753825"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 02:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="639625831"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jun 2022 02:05:38 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 06/17] ASoC: Intel: hsw_rt5640: Improve probe() function
 quality
Date: Mon, 13 Jun 2022 11:15:35 +0200
Message-Id: <20220613091546.1565167-7-cezary.rojewski@intel.com>
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

