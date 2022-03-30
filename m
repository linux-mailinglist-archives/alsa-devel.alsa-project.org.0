Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3284EC2E4
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 14:02:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BF191936;
	Wed, 30 Mar 2022 14:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BF191936
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641751;
	bh=eAu7CtqUbejdrEQNt9DreNr/zKSssNpE1NjUjFYTwPA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R2u6GI8RWLyZK8dISO2lWIiwxFAM8t/CbIyXKCuy2zMwtCGKvML5a2KoZMqmOtzZU
	 8VochzPmsBuHcENKajXORNZaGXYBhH8E+VvVMEp6EsWSO+zONKNy0+GWeHKPoBGY9H
	 2oghEK2587X6Phg4mB/P+Ehf9V4rhkLke83vosDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9238F80633;
	Wed, 30 Mar 2022 13:51:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B560F80632; Wed, 30 Mar 2022 13:51:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83238F80633
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:51:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83238F80633
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rfGWVeLs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 597C061703;
 Wed, 30 Mar 2022 11:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BB9C36AE2;
 Wed, 30 Mar 2022 11:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648641074;
 bh=eAu7CtqUbejdrEQNt9DreNr/zKSssNpE1NjUjFYTwPA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rfGWVeLsdT/b04cTMn6JSS5Ws3dkU5/qk+ViidPKBFxFf76Pxt4TZxfRa955QWLKd
 PhqulUbVq3FfJBLJkFInnTABhXOk6qW+pOIk1dHlhuFAJsWoic/WrHL7vxM9mKeCSE
 5q6GSRMY2YGZ7nEqfmRancYkFK05x1UBRhd1KIhwSWM+kLEPseIV5J6Lzm2zRhjIeP
 5qwUsH5g2jRR8CrnyJTp3HcVqcMRImmhy4Ss6ME6mKO7gKX59CvcX4J9trYmwBlqc3
 /5swOYJoMUMTvVobIBkrXqk2oLR3HLQPTk+Wl+CEj/BXMaSrZlN2ebwza0hxEWJKzy
 XJ7tCqcyz8uUQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 45/50] ASoC: Intel: sof_sdw: fix quirks for 2022
 HP Spectre x360 13"
Date: Wed, 30 Mar 2022 07:49:59 -0400
Message-Id: <20220330115005.1671090-45-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330115005.1671090-1-sashal@kernel.org>
References: <20220330115005.1671090-1-sashal@kernel.org>
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
index 76759b209906..0bf3e56e1d58 100644
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

