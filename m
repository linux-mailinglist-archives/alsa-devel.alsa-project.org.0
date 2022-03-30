Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BF04EC0C4
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:52:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24A1B1788;
	Wed, 30 Mar 2022 13:51:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24A1B1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641126;
	bh=uqLAIvzQVZ7zsBQfr13bl/skVcfcHbCBT+09pEPcM8g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rd5gee60AG5zS7a/xZhYP0EOalAtSt90DfPhgwVnaFhyi9/zPTjyTN7k13AwtK30F
	 iKkyVpB6/IMZZqkQh2wOe2FvnZV9iTjUNRyMALSSgSvdSk1D3BV5+hkNisefJY0kmc
	 7gmtHZic+k8QRw4bcqUWtgZUTl/IGppOfBbnPPxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0623F80559;
	Wed, 30 Mar 2022 13:48:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7671DF80564; Wed, 30 Mar 2022 13:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8008AF80548
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8008AF80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dHgYOBGR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDD3EB81C35;
 Wed, 30 Mar 2022 11:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11968C340F2;
 Wed, 30 Mar 2022 11:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640887;
 bh=uqLAIvzQVZ7zsBQfr13bl/skVcfcHbCBT+09pEPcM8g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dHgYOBGR8rJI0R+8xo7cMd6BZSgr8DhC2Icx13dbYLW7XIQHv2JaQ3zHlBO/YxiD4
 GD3N3+DCGFylrrTRd4xXEw0o9zSP1jILSC3xdtwB81akGwXpse/vyQx3iSAjnfZoe0
 X6vuYGmw6ULhI2nmDA1y8Sz7xluWO+jlL/jxbpNC0WIKF4gYe1fbtg9KcXKah0W7vS
 EkWXBzQRjV8rn9wCyxGj6GRqa2shBUOm4VPjZjuymRH8BNdfz0tGbievKzKs5Kl8vh
 TG/AMiCqnJLmGTU/XxT4LTx0lrCYiXBebcXa1jNqsGlnBG+IiFmKkpyT7dELDo+wmD
 QfGMG/djnQcdQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 52/66] ASoC: Intel: sof_sdw: fix quirks for 2022
 HP Spectre x360 13"
Date: Wed, 30 Mar 2022 07:46:31 -0400
Message-Id: <20220330114646.1669334-52-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114646.1669334-1-sashal@kernel.org>
References: <20220330114646.1669334-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 Anthony I Gilea <i@cpp.in>, Rander Wang <rander.wang@intel.com>
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

From: Anthony I Gilea <i@cpp.in>

[ Upstream commit ce73ef6ec67104d1fcc4c5911d77ce83288a0998 ]

HP changed the DMI identification for 2022 devices:
Product Name: HP Spectre x360 Conv 13-ap0001na
Product Name: 8709
This patch relaxes the DMI_MATCH criterion to work with all versions of this product.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Anthony I Gilea <i@cpp.in>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220304204532.54675-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/dmi-quirks.c   | 2 +-
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 0ca2a3e3a02e..747983743a14 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -59,7 +59,7 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x360 Convertible"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x360 Conv"),
 		},
 		.driver_data = (void *)intel_tgl_bios,
 	},
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index da515eb1ddbe..1f00679b4240 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -185,7 +185,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x360 Convertible"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x360 Conv"),
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					SOF_SDW_PCH_DMIC |
-- 
2.34.1

