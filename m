Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C593961E41F
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Nov 2022 18:07:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 616151F1;
	Sun,  6 Nov 2022 18:07:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 616151F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667754479;
	bh=9lowszxj6rXA/LOixd1q/TZywfUUYZTjyWLJrCLRuWE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A70E1/2PqXlmpX/p10XlJyb3Vlm5qkYczljJCV57Smpw/1n7k1ExT/hm9TN7NTtLD
	 NzNb6p0lZxyCHd+8wqtCLVXHo+Ms5bziF0uKAWYQd4PhVsiwR+3dYPr+ODGWd6LHJQ
	 hhYn4IaqxLmwsD2UMrODDOMg9JL9l6AeQ9jGkkNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1F51F805B4;
	Sun,  6 Nov 2022 18:04:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12313F805B5; Sun,  6 Nov 2022 18:04:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 281DBF805AF
 for <alsa-devel@alsa-project.org>; Sun,  6 Nov 2022 18:04:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 281DBF805AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uiEdlqlj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C0B36B802BD;
 Sun,  6 Nov 2022 17:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF73C433D6;
 Sun,  6 Nov 2022 17:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667754271;
 bh=9lowszxj6rXA/LOixd1q/TZywfUUYZTjyWLJrCLRuWE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uiEdlqljGXafN6OeIqjZP1adCjnLE4EY/rZ3Dhe45CRq5VCm+06RE4o/lQUsgP8iU
 j/pPAyvTEe44scJF35PYDJ5cY1GE0ufS2jnbNSGuHbqu02lef50bOFPksSuS7hnOkm
 yCx1Kz63yPj6HXI3ybNSwETKAnxDQrumtYIVbEJUHur5Fyuu+V2ilL2bBPHF/5muxP
 6V1rzM+oMeFW7QUB9lM3ib3n7nlGK9W4Tv33AGN/VQ6MuFB1UP8uBjzhNoah8oq65K
 7uFPKtoyFpT04Lf8dVc+VdCaUUquFqpRhO1N7NpjZy4Hu5ElsBee9fTMXb74x3df1H
 bZPnwHMh3SndA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 19/30] ASoC: Intel: sof_rt5682: Add quirk for Rex
 board
Date: Sun,  6 Nov 2022 12:03:31 -0500
Message-Id: <20221106170345.1579893-19-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170345.1579893-1-sashal@kernel.org>
References: <20221106170345.1579893-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 alsa-devel@alsa-project.org, mac.chiang@intel.com,
 Mark Brown <broonie@kernel.org>, akihiko.odaki@gmail.com, ajye.huang@gmail.com,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, brent.lu@intel.com,
 vamshi.krishna.gopal@intel.com, Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

[ Upstream commit b4dd2e3758709aa8a2abd1ac34c56bd09b980039 ]

Add mtl_mx98357_rt5682 driver data for Chrome Rex board support.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20221017205728.210813-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_rt5682.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 045965312245..30c53dca342e 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -225,6 +225,18 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_RT5682_SSP_AMP(2) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
+	{
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Rex"),
+		},
+		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(2) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(0) |
+					SOF_RT5682_NUM_HDMIDEV(4)
+					),
+	},
 	{}
 };
 
-- 
2.35.1

