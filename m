Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 398A7886E3
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2019 01:25:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B796E15F2;
	Sat, 10 Aug 2019 01:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B796E15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565393118;
	bh=mHQqBp2yBebgD0xcQJQZQTsWKZ/tsPE+NzxpkbIMIVo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MXFIgM8C11RJc1bp2sIzLMaCGrmw1tArgmzkH5Uf+A2pov6BgrW53WDcYzU29LgEp
	 yP52wOGN5iRQvJvRIkyHSOHy1RtUfponSBv1D4516UgI8cWP14ZqLv/U05xKyneU+t
	 MTd+QzbZQlcxRjXKrRrTFLWaE6r1vwtJ479NFw20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9205FF8036B;
	Sat, 10 Aug 2019 01:22:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2FBBF80483; Sat, 10 Aug 2019 01:22:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC5D2F80391
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 01:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC5D2F80391
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 16:22:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,367,1559545200"; d="scan'208";a="177770342"
Received: from jpfeiff1-mobl6.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.128.143])
 by orsmga003.jf.intel.com with ESMTP; 09 Aug 2019 16:22:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  9 Aug 2019 18:22:33 -0500
Message-Id: <20190809232236.21182-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809232236.21182-1-pierre-louis.bossart@linux.intel.com>
References: <20190809232236.21182-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/4] ASoC: Intel: boards: Match Product Family
	instead of product
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Sathya Prakash M R <sathya.prakash.m.r@intel.com>

The generic machine driver of sof_rt5682
supports more platforms of same product family.
hence match the product family instead of product name.

Signed-off-by: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index daeaa396d928..c1181bc0119e 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -91,8 +91,7 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Hatch"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Hatch"),
 		},
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_MCLK_24MHZ |
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
