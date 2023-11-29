Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AA67FD779
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 14:05:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B175DF0;
	Wed, 29 Nov 2023 14:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B175DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701263142;
	bh=Z8kLlX8q2tc8UJlL8JluFurGTvFFVYDTlGNhquJe5Os=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=B65zyKWwXnrD4YYr6b47hmvt6LoFsWzkPdUIr1b2oj+YEl9wipvNvgKMjoGsT10k+
	 HaLYOJh4ciOdSv5K1SY96NThOrSkQ3ew+fzXzfG4xd76kmoZ7Jly6zideXrJicHChS
	 FlcC4h2M41KpOh8w3lLjlKYAuwkWe/UisT7IG1o0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E887F8056F; Wed, 29 Nov 2023 14:05:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF84EF80571;
	Wed, 29 Nov 2023 14:05:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04F43F8016E; Wed, 29 Nov 2023 14:05:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DE88F80114
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 14:05:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DE88F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O5f+rnMl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A827615B9;
	Wed, 29 Nov 2023 13:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F98FC433C7;
	Wed, 29 Nov 2023 13:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701263099;
	bh=Z8kLlX8q2tc8UJlL8JluFurGTvFFVYDTlGNhquJe5Os=;
	h=From:To:Cc:Subject:Date:From;
	b=O5f+rnMlbWm1ZMtZa8FrOFJicEAjgydWzAQF8Ng1LzcMjSoet8XS2Orbz1EyktiRw
	 mAlScQBZHScrTYvQKWyQQsKWAsK8AVGpuUJE7b3Ct8oo34U6mFk4E+Ns3sLyqklMOQ
	 Gw/5XB0xEFGpaWdT1PpZqVsfgqdGq5M0EylIRddK+A14/laWnG4RSm+wnjgATLUvQ2
	 5Pc+OchFC5J3oQy9DqX/cEWW3Xc9U1f2nCBa8nESGX4qgvO8qwUFadMtuigXbKOkM+
	 NuD9sElPq4sOEHZR3vd0ywCEC2TMQ+jhVT/p1mvAHCMHJ+UEGXSmPljz8Ur8yrOKxl
	 fMFbAhWvM03Hw==
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH] soundwire: amd: drop bus freq calculation and set
 'max_clk_freq'
Date: Wed, 29 Nov 2023 18:34:48 +0530
Message-ID: <20231129130449.9892-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5A5Z2FACTTADE23ORSEDEN4KYPOAERHX
X-Message-ID-Hash: 5A5Z2FACTTADE23ORSEDEN4KYPOAERHX
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5A5Z2FACTTADE23ORSEDEN4KYPOAERHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

max_dr_freq and curr_dr_freq is calculated and set in
sdw_bus_master_add(). Setting in the driver is reduanant, so drop that.
Set max_clk_freq instead.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/amd_manager.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a3b1f4e6f0f9..f54bb4dd2d10 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -950,13 +950,13 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 
 	amd_manager->reg_mask = &sdw_manager_reg_mask_array[amd_manager->instance];
 	params = &amd_manager->bus.params;
-	params->max_dr_freq = AMD_SDW_DEFAULT_CLK_FREQ * 2;
-	params->curr_dr_freq = AMD_SDW_DEFAULT_CLK_FREQ * 2;
+
 	params->col = AMD_SDW_DEFAULT_COLUMNS;
 	params->row = AMD_SDW_DEFAULT_ROWS;
 	prop = &amd_manager->bus.prop;
 	prop->clk_freq = &amd_sdw_freq_tbl[0];
 	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
+	prop->max_clk_freq = AMD_SDW_DEFAULT_CLK_FREQ;
 
 	ret = sdw_bus_master_add(&amd_manager->bus, dev, dev->fwnode);
 	if (ret) {
-- 
2.41.0

