Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D91452F4FD
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 23:21:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C24251758;
	Fri, 20 May 2022 23:20:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C24251758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653081696;
	bh=slqrcm7FpXNOFE4MzHtYKHZu8oxm6Ns10pm+G+gRZdc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cd97pDlLbFJmEx+IgHYjyIvJM1tV8+ZHfOtRZx8ZXUkn3cOAszML+i6GY61nHfzwP
	 aQyjWnRau6PKvT9x7KXCXLNmTSBdpe5bLDC9fRg1BFNsI6+ethCFBwXGZr7/VfgYrs
	 PA590M1tijteY5msTO8ZvvXZ6u4PgVZV1nDfzjFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 769D2F8055A;
	Fri, 20 May 2022 23:17:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A83DF80544; Fri, 20 May 2022 23:17:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4086AF8019D
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 23:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4086AF8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BJwb/Gnj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653081465; x=1684617465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=slqrcm7FpXNOFE4MzHtYKHZu8oxm6Ns10pm+G+gRZdc=;
 b=BJwb/Gnj6ZcHKW4EjhByYpKsHF5QMWu05nPs1EH0YrdxGWg6uT2Q8LLS
 QZrorwgPLVa0pEOjF2RAwApCIXgkW4hazerXrm+M33tub2rBTLIAeuVeG
 hj9NpPKDjSIvQxNbl2MSfJOdS/I7mNW28lfIvEA+qmBC41ojd+YN1Hxe9
 ypKDrmPqUiFpAEQBpMZvos+n5vSExjC3+JoAYeETXuhGEssNnL/Z6ihyZ
 GZbB5rzv88T8g3hWznoDZPxNT3SvYS0RmmXLamlEZQOY2CSDR1DnzZepQ
 atXSfsVXPBINl7H3pT6BrY5idLLNRX6NXF/OmU1NZBti1xguCsOCTgeS3 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="270324246"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="270324246"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="674796034"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.181.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/16] ASoC: mediatek: mt8195: simplify error handling
Date: Fri, 20 May 2022 16:17:14 -0500
Message-Id: <20220520211719.607543-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
References: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
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

cppcheck warnings:

sound/soc/mediatek/mt8195/mt8195-afe-clk.c:311:9: warning: Identical
condition and return expression 'ret', return value is always 0
[identicalConditionAfterEarlyExit]
 return ret;
        ^
sound/soc/mediatek/mt8195/mt8195-afe-clk.c:297:6: note: If condition
'ret' is true, the function will return/exit
 if (ret)
     ^
sound/soc/mediatek/mt8195/mt8195-afe-clk.c:311:9: note: Returning
identical expression 'ret'
 return ret;
        ^
sound/soc/mediatek/mt8195/mt8195-afe-clk.c:341:9: warning: Identical
condition and return expression 'ret', return value is always 0
[identicalConditionAfterEarlyExit]
 return ret;
        ^
sound/soc/mediatek/mt8195/mt8195-afe-clk.c:338:6: note: If condition
'ret' is true, the function will return/exit
if (ret)
     ^
sound/soc/mediatek/mt8195/mt8195-afe-clk.c:341:9: note: Returning
identical expression 'ret'
return ret;
        ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index efd5cc364a351..2ee3872c83c36 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -284,7 +284,7 @@ static int mt8195_afe_enable_apll_tuner(struct mtk_base_afe *afe,
 {
 	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
 	unsigned long flags;
-	int ret = 0;
+	int ret;
 
 	if (!cfg)
 		return -EINVAL;
@@ -308,7 +308,7 @@ static int mt8195_afe_enable_apll_tuner(struct mtk_base_afe *afe,
 
 	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
 
-	return ret;
+	return 0;
 }
 
 static int mt8195_afe_disable_apll_tuner(struct mtk_base_afe *afe,
@@ -316,7 +316,7 @@ static int mt8195_afe_disable_apll_tuner(struct mtk_base_afe *afe,
 {
 	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
 	unsigned long flags;
-	int ret = 0;
+	int ret;
 
 	if (!cfg)
 		return -EINVAL;
@@ -338,7 +338,7 @@ static int mt8195_afe_disable_apll_tuner(struct mtk_base_afe *afe,
 	if (ret)
 		return ret;
 
-	return ret;
+	return 0;
 }
 
 int mt8195_afe_get_mclk_source_clk_id(int sel)
-- 
2.30.2

