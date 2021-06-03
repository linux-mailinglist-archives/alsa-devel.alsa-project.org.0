Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 573B039A80C
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 19:14:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8A89173C;
	Thu,  3 Jun 2021 19:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8A89173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622740449;
	bh=oH9KvCZqz+qN93L7YgzU5dEiuvT/c0JMItOzKdDDHic=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gIFbUR76FD1bOpE/20i37kD9tqgyOMVo1x3IqOWjfQtY2C4pW+pRHvOKLgr1UQugN
	 ayIhq5qNAVlXvEO14dqy8Xwu1IfasJdg7RL0hGzJcPU7Y/oRW85fyRQHhi+pkScSJ4
	 wuHbmLkhQqLO4kj21tA0YX18MWXOKXTiiq4+lvZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56847F804BC;
	Thu,  3 Jun 2021 19:09:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53DB8F8051D; Thu,  3 Jun 2021 19:09:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F21C7F8051B
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 19:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F21C7F8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GNIBst33"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9333761412;
 Thu,  3 Jun 2021 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622740167;
 bh=oH9KvCZqz+qN93L7YgzU5dEiuvT/c0JMItOzKdDDHic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GNIBst33Dwb5Yf3Uebe9VBMM+QyHKS88DgnEfpvUfe5+zee6CWjzZaxHTxkKeqejP
 n/JCHVLuWINWuU8ce36J6xHuUPRVLqzbRzmpCFTsBJ2zSSPhbHLkn6TJ2SKZMNYtG9
 A1mLXdIkZl7Yghdk3q3u44zPefbSZZafiVw0OCbdqmh7ryQrkvE+SF6zLJpihtOwVk
 F64zhuyGlHotfH9w7XIIi177FSkOiKmxhrQoKJoLH37I8Aw9Qb/w/WPi1+NTf9nWeR
 IRV4pZICifNkMaeziP1Q/RrJ3os2wZbyGoZt+rlj1ExXEjuMa7vY62aUo77a5Tjf+O
 F1+4WMHOof64g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 06/31] ASoC: Intel: bytcr_rt5640: Add quirk for
 the Lenovo Miix 3-830 tablet
Date: Thu,  3 Jun 2021 13:08:54 -0400
Message-Id: <20210603170919.3169112-6-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210603170919.3169112-1-sashal@kernel.org>
References: <20210603170919.3169112-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

[ Upstream commit f0353e1f53f92f7b3da91e6669f5d58ee222ebe8 ]

The Lenovo Miix 3-830 tablet has only 1 speaker, has an internal analog
mic on IN1 and uses JD2 for jack-detect, add a quirk to automatically
apply these settings on Lenovo Miix 3-830 tablets.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20210508150146.28403-2-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 1e6c86f2306f..c67b86e2d0c0 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -646,6 +646,20 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_MONO_SPEAKER |
 					BYT_RT5640_MCLK_EN),
 	},
+	{	/* Lenovo Miix 3-830 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo MIIX 3-830"),
+		},
+		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
+					BYT_RT5640_JD_SRC_JD2_IN4N |
+					BYT_RT5640_OVCD_TH_2000UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_MONO_SPEAKER |
+					BYT_RT5640_DIFF_MIC |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{	/* Linx Linx7 tablet */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LINX"),
-- 
2.30.2

