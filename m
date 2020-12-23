Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BC12E1258
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 03:22:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 355E217B0;
	Wed, 23 Dec 2020 03:21:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 355E217B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608690129;
	bh=o1KPzr2V9JnH7zpsW4mxOYZv3sejAdmSEGOS8GeiZyM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cKXYbjS4V3XUYl4gsgT2pSD3Oj1PT8/hJptqr4Ehw/+9+wYlt1ETXLZzavnGHkbay
	 YSIBb679uL/iHsmxQDBvxGtG77qKVq5E6ohbCPCcMOBxLF6QDQz1SyJDrc80I7fOHa
	 /YZfXWxh8hP2ikLRpu15WQ50ZHRi6tLtg510O8YQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F0A8F8028D;
	Wed, 23 Dec 2020 03:20:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5D35F801EC; Wed, 23 Dec 2020 03:20:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4164CF804C3
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 03:20:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4164CF804C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p6SDPYEn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F0A522D57;
 Wed, 23 Dec 2020 02:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608690020;
 bh=o1KPzr2V9JnH7zpsW4mxOYZv3sejAdmSEGOS8GeiZyM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p6SDPYEnv6RUtZTWVu0wtfNJuYw1QUPXZisO6UKzSMkaLwLGPWah8JZxK4ZDJ2t7+
 n0sSRTeEAG8iyB41haODdgBlKmA2jWSkrEKi+x9akbBe1uWuSMhIPLU9PTOIXr3IF1
 9LwgkGW2WHex+izKH+GwpLrTdPQnDY88av/SbWCo9VBgST9nUaC8xIxcQD5te4V7YE
 VGvUaf9ZM8t4WbWb2XexAKF2wkr9TIvGQV7bWz5+W2JNkdCDc3J3pwnq/KhCdvdiy7
 PxisE+H/MApHv81Gtf5Uw0NYdgwnpDnmZRPBBT4/Qun7sfhHqsDh64uMirpEblpEH7
 QBHLeIUjX11Ng==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 098/130] ASoC: Intel: bytcr_rt5640: Add quirk for
 ARCHOS Cesium 140
Date: Tue, 22 Dec 2020 21:17:41 -0500
Message-Id: <20201223021813.2791612-98-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021813.2791612-1-sashal@kernel.org>
References: <20201223021813.2791612-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Mark Brown <broonie@kernel.org>,
 Chris Chiu <chiu@endlessos.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

From: Chris Chiu <chiu@endlessos.org>

[ Upstream commit 1bea2256aa96a2d7b1b576eb74e29d79edc9bea8 ]

Tha ARCHOS Cesium 140 tablet has problem with the jack-sensing,
thus the heaset functions are not working.

Add quirk for this model to select the correct input map, jack-detect
options and channel map to enable jack sensing and headset microphone.
This device uses IN1 for its internal MIC and JD2 for jack-detect.

Signed-off-by: Chris Chiu <chiu@endlessos.org>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20201208060414.27646-1-chiu@endlessos.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 6012367f6fe48..6b6749550fc4f 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -422,6 +422,18 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF1 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ARCHOS"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ARCHOS 140 CESIUM"),
+		},
+		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
+					BYT_RT5640_JD_SRC_JD2_IN4N |
+					BYT_RT5640_OVCD_TH_2000UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
2.27.0

