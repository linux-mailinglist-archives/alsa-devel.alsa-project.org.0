Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAC165A6C4
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Dec 2022 21:08:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8B7742F1;
	Sat, 31 Dec 2022 21:07:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8B7742F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672517306;
	bh=N/jVfDNU1O6nNZIo0aAmILMlmj2UEOKAqJzf22iqBqs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nbDUUhWUVlfFDOrUK4jpB5Gwq5h9SHXjMCwWrMrN4cr8MpUw5SjpOCNSnabhQdy4Z
	 5rorq3koNzkEQjlPpKDpd4zsY0YjuYj7Y1mt6xefKGXxEyguD8yqsRKOnVRtTyNuSG
	 p9hO0hN2A2BBjHCdMBg6sKcOWBTas5OSMGcOQz0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAB1DF80580;
	Sat, 31 Dec 2022 21:06:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09899F80563; Sat, 31 Dec 2022 21:06:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 734CBF8055B
 for <alsa-devel@alsa-project.org>; Sat, 31 Dec 2022 21:06:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 734CBF8055B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WIghN6Nx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 35F8B60C21;
 Sat, 31 Dec 2022 20:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7F5C433F0;
 Sat, 31 Dec 2022 20:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672517179;
 bh=N/jVfDNU1O6nNZIo0aAmILMlmj2UEOKAqJzf22iqBqs=;
 h=From:To:Cc:Subject:Date:From;
 b=WIghN6NxL2lthpdVrDJGkEJKPasIfJ6sWZod9ByvoxupN0NNmlJRY8pwUOpVJZsGD
 Mm7Xv6f1xc7i4VrGhEXRV1czp8HdqolzJgLcXjNwbxY9fsQ34eWexUM++oMusrwvIy
 whZxLqRJIIiXjPpFOOmlXDdH0uXG0HZAoD9bGWdw7mDqObDyjrUjebrtALRVfTx3Ww
 VbFU7l8S0vqkfNpXJsu2dCjW1m3g9v84MV8bhW1lE0rsRGc58/PwbjuMapCLCF4/Rs
 4IRFYaODMZh0FV7vLa6dqXH5wScNB966Ealn+VbInNLEqwLdMri6l2mc60/MVL/BzC
 N5ujUJyLofGyA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4] ASoC: Intel: bytcr_rt5640: Add quirk for the
 Advantech MICA-071 tablet
Date: Sat, 31 Dec 2022 15:06:04 -0500
Message-Id: <20221231200606.1748940-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Sasha Levin <sashal@kernel.org>, oder_chiou@realtek.com,
 cezary.rojewski@intel.com, ckeepax@opensource.cirrus.com,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 akihiko.odaki@gmail.com, peter.ujfalusi@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit a1dec9d70b6ad97087b60b81d2492134a84208c6 ]

The Advantech MICA-071 tablet deviates from the defaults for
a non CR Bay Trail based tablet in several ways:

1. It uses an analog MIC on IN3 rather then using DMIC1
2. It only has 1 speaker
3. It needs the OVCD current threshold to be set to 1500uA instead of
   the default 2000uA to reliable differentiate between headphones vs
   headsets

Add a quirk with these settings for this tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20221213123246.11226-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 7830d014d924..6a8edb0a559d 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -428,6 +428,21 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF1 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{
+		/* Advantech MICA-071 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Advantech"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MICA-071"),
+		},
+		/* OVCD Th = 1500uA to reliable detect head-phones vs -set */
+		.driver_data = (void *)(BYT_RT5640_IN3_MAP |
+					BYT_RT5640_JD_SRC_JD2_IN4N |
+					BYT_RT5640_OVCD_TH_1500UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_MONO_SPEAKER |
+					BYT_RT5640_DIFF_MIC |
+					BYT_RT5640_MCLK_EN),
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ARCHOS"),
-- 
2.35.1

