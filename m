Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3712323C87
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 14:00:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94D5716DB;
	Wed, 24 Feb 2021 14:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94D5716DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614171659;
	bh=yY/LWCCB9oz5zPwA1cKgSr7pfn9MxzUcXxoEfnaq0IQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WzFLsJWOaKu2utZiaLczZcCivTVYnIE1aF2nj6KVXWOPdAwhf7qFBSQZI/aMSqsDm
	 bLO1Vx7NV5ShSRPl0aogDuKADYCCZMETdNncyIkNysuLvYVc1lIqafOKNZK4ZziZyh
	 IKERJITJ3YBjmJJR3PDVxAIu7cKhfTpsSpaNCzv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 865F1F8051D;
	Wed, 24 Feb 2021 13:54:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8262F80516; Wed, 24 Feb 2021 13:54:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 484B9F8042F
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 13:54:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 484B9F8042F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WspFSiJf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5F8664F91;
 Wed, 24 Feb 2021 12:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171270;
 bh=yY/LWCCB9oz5zPwA1cKgSr7pfn9MxzUcXxoEfnaq0IQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WspFSiJf+ensdXGrFvvxHlNslyt/JERSVk+j72gb4Rs0usMkxPf0V7V5cb2YdSfal
 VmD8K+nN2J6hSzlVyHIpc1+NEoXURovKj98ehIQze8amqXkKwWdazVVjwwWB4zs1qB
 Jw9TfGnCW8MxBdCLFBThMjFj+9N4AVFqpikgLyxW99dzoBgVimHuwApn3d7j8ZhEFj
 EUDqF8WRnBS6raT7CuQ9tatinUdI2kv73ny85nfE7usE1bNYTBn81u2VF/rkbXxAkc
 k98W9Qouxj552mmh0sLokquXpA6pMQ4Ls2mbyRHseLj2d6Mc7ExpzRI+RHkLF46Ek8
 20moXpKqBoWrA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 38/40] ASoC: Intel: bytcr_rt5640: Add quirk for
 the Voyo Winpad A15 tablet
Date: Wed, 24 Feb 2021 07:53:38 -0500
Message-Id: <20210224125340.483162-38-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125340.483162-1-sashal@kernel.org>
References: <20210224125340.483162-1-sashal@kernel.org>
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

[ Upstream commit e1317cc9ca4ac20262895fddb065ffda4fc29cfb ]

The Voyo Winpad A15 tablet uses a Bay Trail (non CR) SoC, so it is using
SSP2 (AIF1) and it mostly works with the defaults. But instead of using
DMIC1 it is using an analog mic on IN1, add a quirk for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20210216213555.36555-3-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index cdbc00c773386..00e8d589a7246 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -786,6 +786,20 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF2 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{	/* Voyo Winpad A15 */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
+			/* Above strings are too generic, also match on BIOS date */
+			DMI_MATCH(DMI_BIOS_DATE, "11/20/2014"),
+		},
+		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
+					BYT_RT5640_JD_SRC_JD2_IN4N |
+					BYT_RT5640_OVCD_TH_2000UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_DIFF_MIC |
+					BYT_RT5640_MCLK_EN),
+	},
 	{	/* Catch-all for generic Insyde tablets, must be last */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
-- 
2.27.0

