Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A316A432
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 11:43:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FB731688;
	Mon, 24 Feb 2020 11:42:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FB731688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582541011;
	bh=24rRZ+lhiFaxPSXXVwVThASsPHGEclEo95RTWZdaT8E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EH3p1MTP0nwC9rrOFNxwjzxzrbVYKdEJ2KERJWZnoOIJ4vkZkGs0JnGhfJ6wBOGt1
	 Gq0CaywoLoqzwcpSHRcWP5hZ3XA0r/P1kDEdNtN+g28xoqJVuYk6Z0+AcpuUdB2l2g
	 dOZ7gd8f4wy3Aqgj5bIDhvOtcBy5MO9PLIkEgRDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58D06F80090;
	Mon, 24 Feb 2020 11:41:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03573F8014E; Mon, 24 Feb 2020 11:41:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC7ADF80090
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 11:41:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC7ADF80090
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 02:41:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,479,1574150400"; d="scan'208";a="230606056"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga008.jf.intel.com with ESMTP; 24 Feb 2020 02:41:32 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: Intel: Skylake: Fix available clock counter
 incrementation
Date: Mon, 24 Feb 2020 07:52:02 -0500
Message-Id: <20200224125202.13784-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: "moderated list:INTEL ASoC DRIVERS" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Incrementation of avail_clk_cnt was incorrectly moved to error path. Put
it back to success path.

Fixes: 6ee927f2f01466 ('ASoC: Intel: Skylake: Fix NULL ptr dereference when unloading clk dev')
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/skylake/skl-ssp-clk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-ssp-clk.c b/sound/soc/intel/skylake/skl-ssp-clk.c
index 1c0e5226cb5b..bd43885f3805 100644
--- a/sound/soc/intel/skylake/skl-ssp-clk.c
+++ b/sound/soc/intel/skylake/skl-ssp-clk.c
@@ -384,9 +384,11 @@ static int skl_clk_dev_probe(struct platform_device *pdev)
 				&clks[i], clk_pdata, i);
 
 		if (IS_ERR(data->clk[data->avail_clk_cnt])) {
-			ret = PTR_ERR(data->clk[data->avail_clk_cnt++]);
+			ret = PTR_ERR(data->clk[data->avail_clk_cnt]);
 			goto err_unreg_skl_clk;
 		}
+
+		data->avail_clk_cnt++;
 	}
 
 	platform_set_drvdata(pdev, data);
-- 
2.17.1

