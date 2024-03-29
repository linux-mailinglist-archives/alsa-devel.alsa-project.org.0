Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF74589196D
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 13:41:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF7BC2C88;
	Fri, 29 Mar 2024 13:41:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF7BC2C88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711716088;
	bh=Jeq9r5IKNEZOepJLLoxhHkdVWMA6SpDKq9T/qzbQ2zA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CNnlb/o72tTb6kkanQH2RJC/RCS/qbcYihSic+sRxRyroY6b+DwEqBx4evOFyz5JT
	 v9eg9JP6YlR68Mn8WZbL9hz/hOUwc/RmF93sHQLFd4cUMHt0DLRg8PlrZ8dtyWNIFw
	 CzqMftlDeoorbhK45P5+7mk/uLeu234qSYxoDPEs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 422BAF8058C; Fri, 29 Mar 2024 13:40:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ECA8F805A0;
	Fri, 29 Mar 2024 13:40:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C2FCF8025F; Fri, 29 Mar 2024 13:40:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF02FF80236
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 13:40:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF02FF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dQRH69yK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BCD6ECE2F8B;
	Fri, 29 Mar 2024 12:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDECC433C7;
	Fri, 29 Mar 2024 12:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711716046;
	bh=Jeq9r5IKNEZOepJLLoxhHkdVWMA6SpDKq9T/qzbQ2zA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dQRH69yK2FEO7d7VmGonmnrVyADTuSgW1smwzCzFQQj+ilwke5NByzzUQ4T0NMDZJ
	 LAKUIYIPChSNExPhqoIFD84dP+FoqdNZR/2eY3Pob83tQCxWrks6rGZnfiYJ5HihMz
	 Wx4AUsD2lEtWr8w2FuS5/V6O2Mp8ri7WJTYgATkFnPy2JMIbE5PHrRszi3q0yQDADq
	 w3XNAVLskNogZgEXOX3We6hPQh9fWghsRPsdvHoHgIxEPaXXpsHEo690snKjSTE7h4
	 N+HaGd99vtq6q0o5SlwdWHsaUVvIp4ZRls+BOgTueqinynjp+LxWLl9iubYA3Ml9Zn
	 WLzD/prnvgR/Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	htcheong@chromium.org,
	uday.m.bhat@intel.com,
	kuninori.morimoto.gx@renesas.com,
	mac.chiang@intel.com,
	apoorv@intel.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 26/98] ASoC: Intel: sof_rt5682: dmi quirk cleanup
 for mtl boards
Date: Fri, 29 Mar 2024 08:36:57 -0400
Message-ID: <20240329123919.3087149-26-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329123919.3087149-1-sashal@kernel.org>
References: <20240329123919.3087149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7O2O7J5PZQR3QFNCXM7C2W3UN24DKJEO
X-Message-ID-Hash: 7O2O7J5PZQR3QFNCXM7C2W3UN24DKJEO
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7O2O7J5PZQR3QFNCXM7C2W3UN24DKJEO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

[ Upstream commit 7a2a8730d51f95b263a1e8b888598dc6395220dc ]

Some dmi quirks are duplicated since codec and amplifier type are
removed from board quirk. Remove redundant quirks.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20240208165545.93811-7-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_rt5682.c | 40 -----------------------------
 1 file changed, 40 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index cd50f26d1edbe..02705034e5713 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -154,46 +154,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_RT5682_SSP_AMP(2) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
-	{
-		.callback = sof_rt5682_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Rex"),
-			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98360_ALC5682I_I2S"),
-		},
-		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(2) |
-					SOF_RT5682_SSP_AMP(0) |
-					SOF_RT5682_NUM_HDMIDEV(3) |
-					SOF_BT_OFFLOAD_SSP(1) |
-					SOF_SSP_BT_OFFLOAD_PRESENT
-					),
-	},
-	{
-		.callback = sof_rt5682_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Rex"),
-			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98360_ALC5682I_DISCRETE_I2S_BT"),
-		},
-		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(2) |
-					SOF_RT5682_SSP_AMP(0) |
-					SOF_RT5682_NUM_HDMIDEV(3) |
-					SOF_BT_OFFLOAD_SSP(1) |
-					SOF_SSP_BT_OFFLOAD_PRESENT
-					),
-	},
-	{
-		.callback = sof_rt5682_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Rex"),
-			DMI_MATCH(DMI_OEM_STRING, "AUDIO-ALC1019_ALC5682I_I2S"),
-		},
-		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(2) |
-					SOF_RT5682_SSP_AMP(0) |
-					SOF_RT5682_NUM_HDMIDEV(3)
-					),
-	},
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
-- 
2.43.0

