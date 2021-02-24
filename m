Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AA8323C81
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 13:59:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5699C16B5;
	Wed, 24 Feb 2021 13:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5699C16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614171567;
	bh=azpPMp/egnAbnAgk8n0XpFuoqM9PBVK5wZvuPQ5/i/E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RkEFB52ndwFbdJJEc+96ts6abG6m7u4UlBP/aIygaHJ956jw4kTzi5fB+3Aq8om2B
	 Bg7cEHwCO3ZSPtZarQPOlOehFV4uz+bwFwtuJIkn+2I3k8bljBbJ5mUuUrrjoarN0o
	 +2vFiXbc0oXCR8/X6JFyekUcAuLVVB/U3ohFdTVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0E00F80517;
	Wed, 24 Feb 2021 13:53:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70CA4F80518; Wed, 24 Feb 2021 13:53:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51424F804FC
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 13:53:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51424F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZOa1tJux"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1A7B64F6B;
 Wed, 24 Feb 2021 12:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171205;
 bh=azpPMp/egnAbnAgk8n0XpFuoqM9PBVK5wZvuPQ5/i/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZOa1tJuxJCN8swPweKviSAzERJKxQuF2p1avppjyjesoKIF/MMfaVlAeS18vXBAVs
 I10gz7PU60BO9a5lYSv7aY+oKqN/JqpyFqi4nsUl0l11flwSSVcUjq8QDcdqH3U3Jl
 t9TCT3VpyH3wjDIjnX6cqt3zomYI4f8PmPVtjQ3ZRBz0akJDBoZP6jhl6yRC7HLsx7
 b8u4yI4MK6muaztavOLxZEWQodFgSxibwBlfscvnH4sqHeUk99SNIQjOsmC4Wk5YY0
 zabPdH0fNcbR3haGB4HrnjREmrOzJQQMSqFjhkDToy8F0Ws2AvQWkeJwtnfplBseqo
 gKtVgvAb/dqNA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 55/56] ASoC: Intel: bytcr_rt5651: Add quirk for
 the Jumper EZpad 7 tablet
Date: Wed, 24 Feb 2021 07:52:11 -0500
Message-Id: <20210224125212.482485-55-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125212.482485-1-sashal@kernel.org>
References: <20210224125212.482485-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit df8359c512fa770ffa6b0b0309807d9b9825a47f ]

Add a DMI quirk for the Jumper EZpad 7 tablet, this tablet has
a jack-detect switch which reads 1/high when a jack is inserted,
rather then using the standard active-low setup which most
jack-detect switches use. All other settings are using the defaults.

Add a DMI-quirk setting the defaults + the BYT_RT5651_JD_NOT_INV
flags for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20210216213555.36555-4-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5651.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 688b5e0a49e32..bf8b87d45cb0a 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -435,6 +435,19 @@ static const struct dmi_system_id byt_rt5651_quirk_table[] = {
 					BYT_RT5651_SSP0_AIF1 |
 					BYT_RT5651_MONO_SPEAKER),
 	},
+	{
+		/* Jumper EZpad 7 */
+		.callback = byt_rt5651_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Jumper"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "EZpad"),
+			/* Jumper12x.WJ2012.bsBKRCP05 with the version dropped */
+			DMI_MATCH(DMI_BIOS_VERSION, "Jumper12x.WJ2012.bsBKRCP"),
+		},
+		.driver_data = (void *)(BYT_RT5651_DEFAULT_QUIRKS |
+					BYT_RT5651_IN2_MAP |
+					BYT_RT5651_JD_NOT_INV),
+	},
 	{
 		/* KIANO SlimNote 14.2 */
 		.callback = byt_rt5651_quirk_cb,
-- 
2.27.0

