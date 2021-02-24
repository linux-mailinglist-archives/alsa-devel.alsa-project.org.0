Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E413B323C8D
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 14:02:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 714AE1679;
	Wed, 24 Feb 2021 14:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 714AE1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614171771;
	bh=SreHj1v1+j1+8Ef1SthpCnlcga9XVWYo/NuZlFVKo3I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sCYLc89zhAO12nUKjlUW7p9N7eYcDX0QtrXvDQh+O8rXdNBxO04cWZZdw7h8PXL7B
	 cQSyvutTdJf0jXlK8jFg9RZQyTU0GTJeJL91FB8MHDZK6Ry+9b/Xy45rT7fNjP/y6U
	 DXlJzrSOtSyBMa5KVVdhBaLPA4nTxL6kp6N1D5O0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F4B0F80524;
	Wed, 24 Feb 2021 13:55:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1A81F804D8; Wed, 24 Feb 2021 13:55:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 734C1F80482
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 13:55:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 734C1F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rODnQXsA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1554464F94;
 Wed, 24 Feb 2021 12:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171308;
 bh=SreHj1v1+j1+8Ef1SthpCnlcga9XVWYo/NuZlFVKo3I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rODnQXsApPlqDkf/Dio8GKkm4+ygLstW0iLWqYOP62KLGFgQlW6MhXkFVjDMdMo7w
 +GjLZ2CLTyWdY8z2V867GdcLrfD7uDU0m3UUq1So5adyLdDngQlUCHmdYoKPRh0pEH
 FC8LtpqmV58rVUko2Us55wemAqM/1Q2zYuIg8tSprJeOckNYMWJQrLizSZVoXLhXfK
 G2JjcTXbizrpNlZcPZIdsB4cKUyPGC0AoOrdQgcId0b+1asWIbvEYm+gDpc4jFNkpq
 pjxmdjq4L1sFgWf51Wkn3MlvN6gItud8LCV09f6lKRhY9xQxhIWL86gDWEhHDVWVrg
 jpn4baRnCboXg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 26/26] ASoC: Intel: bytcr_rt5640: Add quirk for
 the Acer One S1002 tablet
Date: Wed, 24 Feb 2021 07:54:34 -0500
Message-Id: <20210224125435.483539-26-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125435.483539-1-sashal@kernel.org>
References: <20210224125435.483539-1-sashal@kernel.org>
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

[ Upstream commit c58947af08aedbdee0fce5ea6e6bf3e488ae0e2c ]

The Acer One S1002 tablet is using an analog mic on IN1 and has
its jack-detect connected to JD2_IN4N, instead of using the default
IN3 for its internal mic and JD1_IN4P for jack-detect.

Note it is also using AIF2 instead of AIF1 which is somewhat unusual,
this is correctly advertised in the ACPI CHAN package, so the speakers
do work without the quirk.

Add a quirk for the mic and jack-detect settings.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20210216213555.36555-5-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 910214ab140e5..8a943de1e5b55 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -409,6 +409,19 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF1 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{	/* Acer One 10 S1002 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "One S1002"),
+		},
+		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
+					BYT_RT5640_JD_SRC_JD2_IN4N |
+					BYT_RT5640_OVCD_TH_2000UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_DIFF_MIC |
+					BYT_RT5640_SSP0_AIF2 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-- 
2.27.0

