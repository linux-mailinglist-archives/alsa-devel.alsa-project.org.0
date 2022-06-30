Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAC356127F
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 08:34:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7E9516BF;
	Thu, 30 Jun 2022 08:33:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7E9516BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656570852;
	bh=NPmKFkDP8p+QbBLWlkdmI2G6uw+d6C1zns5TXUQr7Qg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=txYS3xCtlwpdWRr8bxDQ3g5QcT3IL+YC6z7UkMOw/MNFsHEPW0xUjGiTCZgp4LKOr
	 K4biYtJ+8Jz9zfEdPs244FIi7WV183GjtlpwVFjDz/Vx+HBNyntGdNnM3puGX74oy8
	 ZaC1yJv1eccyBQ5XgVKmDcpe8zxFA46JHbd8SXhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49DB4F804FE;
	Thu, 30 Jun 2022 08:32:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D85BF8052D; Thu, 30 Jun 2022 08:32:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB43BF8014E
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 08:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB43BF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Cil88Lx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656570756; x=1688106756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NPmKFkDP8p+QbBLWlkdmI2G6uw+d6C1zns5TXUQr7Qg=;
 b=Cil88Lx1mPwOpTLFrDi3ZAXfdD6gyQUZQuxEDr6NEVh2s79rWvDYSYWd
 4VquUNfE/YTtyqaAHOlo4wtkmd7xjetrgNI4r7hIIl6sPZETRxerYBVUD
 zFWAU09jqDRr6le6Nq3oJVbBlu58XazD38MBpuzUtoBXuF0csQX42eV7A
 4UGv2TrCDo5u/iYGFI68mbwYIY+6urbvc1ab+JZEDF1KWsw/fe75Ls7gP
 ZzG+feyDahls8QwgvsFl9TEoIg/fBOGbiV82DR63NfjbDEQuTyKid4oeh
 DNhgw1B5iPxRQz+BJc57RQZkomNwlhgQ+FJmoYM9iw2igQwjDuGz2YwmJ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="262663738"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="262663738"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 23:32:27 -0700
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="658872778"
Received: from askrzypc-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.39])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 23:32:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com
Subject: [PATCH 1/2] ASoC: Intel: Skylake: Correct the ssp rate discovery in
 skl_get_ssp_clks()
Date: Thu, 30 Jun 2022 09:33:06 +0300
Message-Id: <20220630063307.23568-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630063307.23568-1-peter.ujfalusi@linux.intel.com>
References: <20220630063307.23568-1-peter.ujfalusi@linux.intel.com>
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

