Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A439565C8
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 11:41:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8B3B1616;
	Wed, 26 Jun 2019 11:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8B3B1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561542069;
	bh=XIUa56xuEBSvKr62cWLUIuQcSEL7fZlAKGcvIHlqDdc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rF0/LdK6ffQZP0PPRum5yOGniGFXZl50muJnAh5Dh4bwGliGwCpkT/zjsTWYTvd4I
	 y4hTh/pinqUR9HBuTrdEQRpONmEqokEGG71V/fstpk3Toln/SAORi843X7HdnyrfiK
	 IlE794FehO05X9yAV+R//eEpKstfuWD28DbxSPY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 513E6F896B7;
	Wed, 26 Jun 2019 11:39:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2083F896B9; Wed, 26 Jun 2019 11:39:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18C2AF8071F
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 11:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18C2AF8071F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 02:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,419,1557212400"; d="scan'208";a="152592791"
Received: from test-hp-elitedesk-800-g1-twr.igk.intel.com ([10.237.149.38])
 by orsmga007.jf.intel.com with ESMTP; 26 Jun 2019 02:39:13 -0700
From: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 26 Jun 2019 11:38:51 +0200
Message-Id: <20190626093851.18474-1-pawel.harlozinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Szymon Mielczarek <szymonx.mielczarek@intel.com>, tiwai@suse.de,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: Intel: Skylake: Recover BXT FW on DSP
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

When DSP boots with timeout error, reinitialize, transfer
and boot firmware to recover audio.

Signed-off-by: Szymon Mielczarek <szymonx.mielczarek@intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 440bca7afbf1..a2844bdca1b8 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -455,13 +455,18 @@ static int bxt_set_dsp_D0(struct sst_dsp *ctx, unsigned int core_id)
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
+
+			ret = bxt_sst_init_fw(skl->dev, skl);
+			dev_warn(ctx->dev, "Reload fw status: %d\n", ret);
+			if (ret < 0) {
+				dev_err(ctx->dev, "Failed to set core0 to D0 state\n");
+				ret = -EIO;
+				goto err;
+			}
 		}
 	}
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
