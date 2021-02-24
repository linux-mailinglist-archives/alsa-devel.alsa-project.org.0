Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B87323C6E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 13:56:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF31F167D;
	Wed, 24 Feb 2021 13:55:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF31F167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614171362;
	bh=Pjf957OSbAHl5h3P0ZGbKDVikZjFk27ysDU1sIxRHo8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VFyyJu9DmNaGYoecQdG4nMOdkfnBBTJPqOUaH6jfUsc8CnhAs5omU1QY9f6fyI1qV
	 FPXAzhHEaOUMKu1zuyFAETLRFsCmLHyDWtZoLWaTP1NE77CRu8V/NPpEeSlAZPT4Vt
	 YfwcabcmvFlc7xbDFgPMF8pfV0eibUXEeSydd+/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE30EF804E2;
	Wed, 24 Feb 2021 13:52:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 630B9F804B1; Wed, 24 Feb 2021 13:51:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66A7BF804AB
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 13:51:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66A7BF804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WabXzLK5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0733F64F33;
 Wed, 24 Feb 2021 12:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171113;
 bh=Pjf957OSbAHl5h3P0ZGbKDVikZjFk27ysDU1sIxRHo8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WabXzLK5wQlyn0ByWlHfzSwSfg9f4ITUUW4wA5VbitulHmTzhOxmRq+Nln8ncQ0qU
 dX73kgaV+10+Q7Ue/mIgD1S4jgoYPKF0paxa0u1eSqre14XShRXQHKfiJKEccMAwJJ
 z+efbLTcH+qAnr7jPQBAiHRcmax2xTPpUxMtJyj3VgRhR8fq5Nlnpj3os7/uy5CIdK
 gxpKZQ6Cqgi/PxN/Pcgp5L4VjOkyeF0f9Obkl5iRjapA+5KSIU8ncjKuS+JPCX3p7G
 n1hfw4YBacGKBDIlvTsL9zm2K1jSk8BhYLxo25xl3Z9RYBDNkcvqu9zDVP49q9gE2S
 VGCRmdz6olEJA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 65/67] ASoC: Intel: bytcr_rt5640: Add quirk for
 the Voyo Winpad A15 tablet
Date: Wed, 24 Feb 2021 07:50:23 -0500
Message-Id: <20210224125026.481804-65-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125026.481804-1-sashal@kernel.org>
References: <20210224125026.481804-1-sashal@kernel.org>
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
index ee41f41c8184e..ba8ea651a22e6 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -811,6 +811,20 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
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

