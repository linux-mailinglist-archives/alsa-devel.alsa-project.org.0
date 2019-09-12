Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 536A0B0DBE
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 13:26:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B6F3174A;
	Thu, 12 Sep 2019 13:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B6F3174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568287613;
	bh=Z9+xQYUs6tRsUpCE+kBTllBAX+9q67Bng0yazWGLpcY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V7Ei384Gq99JeBivvI7o8IrG7zQq/+h0iOdvkHD46hpNA4EbnfYRM42p2ZmDTce4g
	 7yM8OeZkusXYy2d9lnElW+IGk9eLUErztpKVZkCQEjY/S6AwjolGL/kNRWFMJLHWly
	 rfM6R4CNKd7pL1Zvcoih1wNCOV20iIxWAY3Xq3Eo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68346F80393;
	Thu, 12 Sep 2019 13:25:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF6F2F80368; Thu, 12 Sep 2019 13:25:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA780F80143;
 Thu, 12 Sep 2019 13:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA780F80143
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 04:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,495,1559545200"; d="scan'208";a="192397565"
Received: from test-hp-elitedesk-800-g1-twr.igk.intel.com ([10.237.149.38])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Sep 2019 04:24:58 -0700
From: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
To: alsa-devel@alsa-project.org,
	cezary.rojewski@intel.com
Date: Thu, 12 Sep 2019 13:24:41 +0200
Message-Id: <20190912112441.28327-1-pawel.harlozinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Szymon Mielczarek <szymonx.mielczarek@intel.com>, patch@alsa-project.org,
 tiwai@suse.de, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
Subject: [alsa-devel] [PATCH v3] ASoC: Intel: Skylake: Recover BXT FW on DSP
	boot timeout error
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When DSP boots with timeout error try to reload firmware
to keep best user expeirience.

Change-Id: Ic7377da687e7441a487c443f9de1ebae5967afa2
Signed-off-by: Szymon Mielczarek <szymonx.mielczarek@intel.com>
Signed-off-by: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 92a82e6b5fe6..fdf4c198445e 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -446,14 +446,19 @@ static int bxt_set_dsp_D0(struct sst_dsp *ctx, unsigned int core_id)
 
 	/* If core 1 was turned on for booting core 0, turn it off */
 		skl_dsp_core_power_down(ctx, SKL_DSP_CORE_MASK(1));
+		/* FIXME this FW recovery applies only for BXT */
 		if (ret == 0) {
-			dev_err(ctx->dev, "%s: DSP boot timeout\n", __func__);
-			dev_err(ctx->dev, "Error code=0x%x: FW status=0x%x\n",
+			dev_warn(ctx->dev,
+				"DSP boot timeout: Error code=0x%x: FW status=0x%x. Reloading FW\n",
 				sst_dsp_shim_read(ctx, BXT_ADSP_ERROR_CODE),
 				sst_dsp_shim_read(ctx, BXT_ADSP_FW_STATUS));
-			dev_err(ctx->dev, "Failed to set core0 to D0 state\n");
-			ret = -EIO;
-			goto err;
+
+			ret = bxt_sst_init_fw(skl->dev, skl);
+			if (ret < 0) {
+				dev_err(ctx->dev, "Reload fw failed: %d. Failed to set core0 to D0 state\n",
+				ret);
+				goto err;
+			}
 		}
 	}
 
@@ -478,7 +483,6 @@ static int bxt_set_dsp_D0(struct sst_dsp *ctx, unsigned int core_id)
 	if (core_id == SKL_DSP_CORE0_ID)
 		core_mask |= SKL_DSP_CORE_MASK(1);
 	skl_dsp_disable_core(ctx, core_mask);
-
 	return ret;
 }
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
