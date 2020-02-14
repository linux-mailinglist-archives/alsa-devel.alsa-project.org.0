Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A1215DC8C
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 16:54:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 034E51677;
	Fri, 14 Feb 2020 16:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 034E51677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581695668;
	bh=kHTvThyaNLDZlahT8VgloJuavXIYi/UxtktXsRjKTFU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EOEPQIx+uyRZHtxeoQ94eTwvEckogFBy2M87McHTULgLtkRMz+DGUBp8VCU2qLhq0
	 yXn4rg2cAXnAa7n11C8QncUry+JH52exnS6JrpxlbBTx32DMyqrjZDM21EY/ZrzPNW
	 Bk/PL7Avc0Qjad8neLnv0PfodAlIFp8QZ38XBAOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D04BF80158;
	Fri, 14 Feb 2020 16:52:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0300FF8014F; Fri, 14 Feb 2020 16:52:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F09DF80086
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 16:52:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F09DF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wDNBQyVJ"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B955E24676;
 Fri, 14 Feb 2020 15:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695559;
 bh=Xtj/2LP1zyfjNHngLDdDkOuIo8CJqF67tevzFrepR9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wDNBQyVJWy3BOFIAoS3PZJD8vbaSVy0PdikejYpQHmvyUvfOGpFW0FA5wl3nVvPL1
 M+y8EHOIxkFDtQ7fnbyxjR0+1pAXgh6Vsqkln5HCCmnHMmqvuIbVXhPBWPViefY89K
 J4A8jSg80N4aRsUMeswziPZz2d/85cF7exVAFdG8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 14 Feb 2020 10:42:45 -0500
Message-Id: <20200214154854.6746-173-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Jairaj Arava <jairaj.arava@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Subject: [alsa-devel] [PATCH AUTOSEL 5.5 173/542] ASoC: intel: sof_rt5682:
	Add quirk for number of HDMI DAI's
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

From: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>

[ Upstream commit c68e07970eca79106b0c35b88a12298569590081 ]

TGL supports one more HDMI DAI than previous models.
So add quirk support for number of HDMI DAI's.

Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191126143205.21987-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_rt5682.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 751b8ea6ae1f5..57adadacbf436 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -35,6 +35,10 @@
 #define SOF_RT5682_SSP_AMP(quirk)	\
 	(((quirk) << SOF_RT5682_SSP_AMP_SHIFT) & SOF_RT5682_SSP_AMP_MASK)
 #define SOF_RT5682_MCLK_BYTCHT_EN		BIT(9)
+#define SOF_RT5682_NUM_HDMIDEV_SHIFT		10
+#define SOF_RT5682_NUM_HDMIDEV_MASK		(GENMASK(12, 10))
+#define SOF_RT5682_NUM_HDMIDEV(quirk)	\
+	((quirk << SOF_RT5682_NUM_HDMIDEV_SHIFT) & SOF_RT5682_NUM_HDMIDEV_MASK)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
@@ -594,6 +598,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
+	dmi_check_system(sof_rt5682_quirk_table);
+
 	if (soc_intel_is_byt() || soc_intel_is_cht()) {
 		is_legacy_cpu = 1;
 		dmic_be_num = 0;
@@ -604,11 +610,13 @@ static int sof_audio_probe(struct platform_device *pdev)
 						SOF_RT5682_SSP_CODEC(2);
 	} else {
 		dmic_be_num = 2;
-		hdmi_num = 3;
+		hdmi_num = (sof_rt5682_quirk & SOF_RT5682_NUM_HDMIDEV_MASK) >>
+			 SOF_RT5682_NUM_HDMIDEV_SHIFT;
+		/* default number of HDMI DAI's */
+		if (!hdmi_num)
+			hdmi_num = 3;
 	}
 
-	dmi_check_system(sof_rt5682_quirk_table);
-
 	/* need to get main clock from pmc */
 	if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
 		ctx->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
