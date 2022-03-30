Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 452554EC1DD
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:58:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4F1816F0;
	Wed, 30 Mar 2022 13:57:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4F1816F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641521;
	bh=zDnDnqnkUnkvRiU0Bpg3UFg6AFN8i60eOTOfhbTGywk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZoVQPhTyHTaxOCLKe4EFKyB3rBeiv8kqklWiedFGIkQ6LeON7ZqR9AsX0t5S/8A1L
	 1JEqsZ7lQrEBlRKvyl5lo1jrYr8zU0F1DYytocVsMkhKdZ90gdi4mPXgkDzdcWvaWd
	 HXBA4PdFkVgj1WhJYFSvjLq84/Qi+RWiEfe+lYWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66483F8052D;
	Wed, 30 Mar 2022 13:50:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5677F8052D; Wed, 30 Mar 2022 13:49:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75770F8052D
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75770F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="StZLP1NS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 045A4616DD;
 Wed, 30 Mar 2022 11:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD2AC36AE2;
 Wed, 30 Mar 2022 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640989;
 bh=zDnDnqnkUnkvRiU0Bpg3UFg6AFN8i60eOTOfhbTGywk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=StZLP1NS1ZPxXBcVLgxIyWodPqWBcFODNbxver/3fxf4x2BotSHbP3oNyXFr8F1+a
 o8vfawtoEmi7Dxuq4kSpl09PgpSmG76h4Mt+u7ZTzAzhVoPLmIlUWV5D+THDskhYdo
 4U4JhXRdaPEJlr0uoe6kmNKQT3Vjg5CLbcuUni579QmQJDxEJZ/8LnLvvRt4pYN4je
 wokCkw6AhFuZEGbqu5thsd80Kxolxs/NUrYz3UV9Zmd35WcwEQPsbXz3abnbnZOhgz
 51w8zaJ+0AAInia+gju4qLkbojdWkpxuVeIsOZCzQgdwFA3wi1rQR2JG2VG9p/hxdz
 V2NPsqe2b5PSQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 50/59] ASoC: Intel: sof_sdw: fix quirks for 2022
 HP Spectre x360 13"
Date: Wed, 30 Mar 2022 07:48:22 -0400
Message-Id: <20220330114831.1670235-50-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
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
index 54eefaff62a7..182e23bc2f34 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -184,7 +184,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
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

