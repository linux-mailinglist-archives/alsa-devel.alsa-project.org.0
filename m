Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805F8BF0ED
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 01:13:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3034868;
	Wed,  8 May 2024 01:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3034868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715123606;
	bh=2kCkh82klDP0f8uMDqaHZ42FLcI8MjQ45oHOgzAbXCY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=V2PAZPS+IT2uHcjmIIr0ZQ1TOkJBLG0nkMpdqOaMZv0Qhn2FroNV5Fr33SPWJyuH3
	 /uHykF4gy/34wE7gaa3X3G5xCD/1+ojv3KzyPvPpf+9MNaaDkS9sv39UzBklyBczgD
	 vKYUvkD4Ss0C+B9aJGEKhJPzVgpP1iw70mJSNLv4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E93E0F8058C; Wed,  8 May 2024 01:12:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E851BF800E2;
	Wed,  8 May 2024 01:12:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2740FF80423; Wed,  8 May 2024 01:12:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07792F800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 01:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07792F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lF/1Y1Oj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD8E861985;
	Tue,  7 May 2024 23:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4778C2BBFC;
	Tue,  7 May 2024 23:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715123554;
	bh=2kCkh82klDP0f8uMDqaHZ42FLcI8MjQ45oHOgzAbXCY=;
	h=From:To:Cc:Subject:Date:From;
	b=lF/1Y1OjWglN7fv81DLrzNeJVdvdYIWTqBEZO0TDv2QKABptNVdIi1Hv8EpG+bxYx
	 5TQ6qbCRD3p7sSs1ZPhKDFb5DnYuGSDTc2JFYaaGEq6fINNe3upnnSlcu4TQhbcr8u
	 AdjwnUPFxaN8F/Ji2195DjUSA9aaWrcraQlQG0ukt7WA2CQ15bLkC4oJxSSYIy4CSk
	 QOyDMS/baP7ME8HybBnRDYNHAskWlowWvBs20DbA2IHq+ll96bS00nWWDVO6/5EIYr
	 mfslqoGiN12nKuv05IvTXTCm6ExNNuzDRo1Xx5Yd0GLJ/WRGfP865DjZi86X13j8qA
	 nuDtdz2jZU34Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	alban.boye@protonmail.com,
	kuninori.morimoto.gx@renesas.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 01/25] ASoC: Intel: bytcr_rt5640: Apply Asus
 T100TA quirk to Asus T100TAM too
Date: Tue,  7 May 2024 19:11:48 -0400
Message-ID: <20240507231231.394219-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.90
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LOK7CW4O37NK6FLNG5KNHGZW7SQMJPP2
X-Message-ID-Hash: LOK7CW4O37NK6FLNG5KNHGZW7SQMJPP2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LOK7CW4O37NK6FLNG5KNHGZW7SQMJPP2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit e50729d742ec364895f1c389c32315984a987aa5 ]

The Asus T100TA quirk has been using an exact match on a product-name of
"T100TA" but there are also T100TAM variants with a slightly higher
clocked CPU and a metal backside which need the same quirk.

Sort the existing T100TA (stereo speakers) below the more specific
T100TAF (mono speaker) quirk and switch from exact matching to
substring matching so that the T100TA quirk will also match on
the T100TAM models.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://msgid.link/r/20240407191559.21596-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 094445036c20f..d6ef8e850412b 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -636,28 +636,30 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_USE_AMCR0F28),
 	},
 	{
+		/* Asus T100TAF, unlike other T100TA* models this one has a mono speaker */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100TA"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100TAF"),
 		},
 		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
 					BYT_RT5640_JD_SRC_JD2_IN4N |
 					BYT_RT5640_OVCD_TH_2000UA |
 					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_MONO_SPEAKER |
+					BYT_RT5640_DIFF_MIC |
+					BYT_RT5640_SSP0_AIF2 |
 					BYT_RT5640_MCLK_EN),
 	},
 	{
+		/* Asus T100TA and T100TAM, must come after T100TAF (mono spk) match */
 		.matches = {
-			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100TAF"),
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "T100TA"),
 		},
 		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
 					BYT_RT5640_JD_SRC_JD2_IN4N |
 					BYT_RT5640_OVCD_TH_2000UA |
 					BYT_RT5640_OVCD_SF_0P75 |
-					BYT_RT5640_MONO_SPEAKER |
-					BYT_RT5640_DIFF_MIC |
-					BYT_RT5640_SSP0_AIF2 |
 					BYT_RT5640_MCLK_EN),
 	},
 	{
-- 
2.43.0

