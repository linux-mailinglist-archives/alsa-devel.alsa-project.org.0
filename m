Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE585612D0
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 08:57:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BA4B16C3;
	Thu, 30 Jun 2022 08:56:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BA4B16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656572256;
	bh=NPmKFkDP8p+QbBLWlkdmI2G6uw+d6C1zns5TXUQr7Qg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LuSL+CBjaw7Pk7vy7jGjxhgcufACqPsPkxO1ahCAGW49B8leFVZqzsJ3xPgDWPp62
	 c3T9J+vFLTv3HyctUmT08Mo+hTyCiPbUn/SfGIK6E57jXsygX0pEQcFC2QhWQXf1Mw
	 6CLn47uiIAm+Cy59bLiXFltHM1xmQeMCsxJU6qkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C3A7F8052D;
	Thu, 30 Jun 2022 08:56:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79EFEF8014E; Thu, 30 Jun 2022 08:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B19CAF8014E
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 08:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B19CAF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QcAHnaDP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656572164; x=1688108164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NPmKFkDP8p+QbBLWlkdmI2G6uw+d6C1zns5TXUQr7Qg=;
 b=QcAHnaDPZsLFBZmbX0hhnyWVoty1xTGLlMdMx1xerN80aWB3hLWz7Om8
 D73QOxh3LFCPowEVVjdEMlIydrLamcUuM1rjwU4x+pqluDlJ3N9xv3Qc8
 0pCuwy/ZiEftI8AjHZsxo+dh84y/CZqPEZyaZ8Q+F9ZOlQstTZLKCmG2k
 V76a4hqwEn6/ImiiEsgX+H/DIgtpOVRRa29wbSFWaUKhZBm82E+MdGUYF
 bfMgByd9RCUAFAN8QupADsrvtUqiIIcO31vpTgb0EyYkRIM9A/pmKpVVr
 hQNyneQzbKHawZT9NH59/CLcwhfu/WLFg+Yte/3l+xqjor2yr6sh+Ilgx Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="343951698"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="343951698"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 23:56:00 -0700
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="595575016"
Received: from askrzypc-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.39])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 23:55:57 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com
Subject: [PATCH v2 1/2] ASoC: Intel: Skylake: Correct the ssp rate discovery
 in skl_get_ssp_clks()
Date: Thu, 30 Jun 2022 09:56:37 +0300
Message-Id: <20220630065638.11183-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630065638.11183-1-peter.ujfalusi@linux.intel.com>
References: <20220630065638.11183-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 tiwai@suse.com, kai.vehmanen@linux.intel.com
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

The present flag is only set once when one rate has been found to be saved.
This will effectively going to ignore any rate discovered at later time and
based on the code, this is not the intention.

Fixes: bc2bd45b1f7f3 ("ASoC: Intel: Skylake: Parse nhlt and register clock device")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/skylake/skl-nhlt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-nhlt.c b/sound/soc/intel/skylake/skl-nhlt.c
index 2439a574ac2f..366f7bd9bc02 100644
--- a/sound/soc/intel/skylake/skl-nhlt.c
+++ b/sound/soc/intel/skylake/skl-nhlt.c
@@ -99,7 +99,6 @@ static void skl_get_ssp_clks(struct skl_dev *skl, struct skl_ssp_clk *ssp_clks,
 	struct nhlt_fmt_cfg *fmt_cfg;
 	struct wav_fmt_ext *wav_fmt;
 	unsigned long rate;
-	bool present = false;
 	int rate_index = 0;
 	u16 channels, bps;
 	u8 clk_src;
@@ -113,6 +112,8 @@ static void skl_get_ssp_clks(struct skl_dev *skl, struct skl_ssp_clk *ssp_clks,
 		return;
 
 	for (i = 0; i < fmt->fmt_count; i++) {
+		bool present = false;
+
 		fmt_cfg = &fmt->fmt_config[i];
 		wav_fmt = &fmt_cfg->fmt_ext;
 
-- 
2.37.0

