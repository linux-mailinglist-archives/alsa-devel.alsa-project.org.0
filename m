Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 401D762008
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2019 16:04:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B35261670;
	Mon,  8 Jul 2019 16:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B35261670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562594694;
	bh=JE94R3kCuDfd1/tb9ReFdMaBIMemz+95OgYSFPGHon4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iOKAXe0QCKL9eE+qxEIhcPhOfoNuRGZtezEHJSdN30K5Tc1BezC1ADxwARWT5cD4f
	 JYi5OPeN0cy1eK6xI5vJwE6IuoKUueZA0lWgpg1PqA9YJ7G1PvX7PQAe14bhoSwsai
	 0Ke3z4Hu9xDU7navPDzQrmw3yTsBsRMOvtPmNVwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 227ACF801EC;
	Mon,  8 Jul 2019 16:03:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71FE8F80268; Mon,  8 Jul 2019 16:03:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D6E6F801D8
 for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2019 16:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D6E6F801D8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 07:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="173269922"
Received: from test-hp-elitedesk-800-g1-twr.igk.intel.com ([10.237.149.38])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2019 07:03:01 -0700
From: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  8 Jul 2019 16:02:48 +0200
Message-Id: <20190708140248.14304-1-pawel.harlozinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: cezary.rojewski@intel.com, tiwai@suse.de,
 Szymon Mielczarek <szymonx.mielczarek@intel.com>, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
Subject: [alsa-devel] [PATCH v2] ASoC: Intel: Skylake: Recover BXT FW on DSP
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

Signed-off-by: Szymon Mielczarek <szymonx.mielczarek@intel.com>
Signed-off-by: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 440bca7afbf1..dd0260557530 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -455,13 +455,19 @@ static int bxt_set_dsp_D0(struct sst_dsp *ctx, unsigned int core_id)
 	/* If core 1 was turned on for booting core 0, turn it off */
 		skl_dsp_core_power_down(ctx, SKL_DSP_CORE_MASK(1));
 		if (ret == 0) {
-			dev_err(ctx->dev, "%s: DSP boot timeout\n", __func__);
-			dev_err(ctx->dev, "Error code=0x%x: FW status=0x%x\n",
+			dev_warn(ctx->dev,
+				"DSP boot timeout: Error code=0x%x: FW status=0x%x\n",
 				sst_dsp_shim_read(ctx, BXT_ADSP_ERROR_CODE),
 				sst_dsp_shim_read(ctx, BXT_ADSP_FW_STATUS));
-			dev_err(ctx->dev, "Failed to set core0 to D0 state\n");
-			ret = -EIO;
-			goto err;
+			dev_warn(ctx->dev,"Reloading FW\n");
+
+			ret = bxt_sst_init_fw(skl->dev, skl);
+			if (ret < 0) {
+				dev_err(ctx->dev, "Reload fw failed: %d\n", ret);
+				dev_err(ctx->dev, "Failed to set core0 to D0 state\n");
+				ret = -EIO;
+				goto err;
+			}
 		}
 	}
 
@@ -486,7 +492,6 @@ static int bxt_set_dsp_D0(struct sst_dsp *ctx, unsigned int core_id)
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
