Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9846775E76C
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:28:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C87E4208;
	Mon, 24 Jul 2023 03:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C87E4208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690162091;
	bh=mxeAprAukg5+vo2ahTVMvq7xdC35g/vWkmBmw26VmAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JqbefxlENQOdDJFAI5QIBwIiVor8onNpEqEoz5f6/kUV0ev3idVzP0MyBaiez6Zp+
	 1z0GgKs59bKDHatSAsDYHpngrLnQdN7xqH/COKOzQNlfd2EpbBVWvFuMHVunKvXehL
	 PabCzTdFC/V97U9mhMvnsdcHxnTj6ZV9QJ4j7ksg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AC14F805FD; Mon, 24 Jul 2023 03:24:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FFF2F80548;
	Mon, 24 Jul 2023 03:24:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A316EF805FA; Mon, 24 Jul 2023 03:24:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BDDEF805C8
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BDDEF805C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lDctIC5B
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 19E0B60F1B;
	Mon, 24 Jul 2023 01:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACC4C433C9;
	Mon, 24 Jul 2023 01:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690161871;
	bh=mxeAprAukg5+vo2ahTVMvq7xdC35g/vWkmBmw26VmAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lDctIC5BdUWJpIEryh5AxQ+fSRibZ3P9XpjmXkrYznf2tIpmbWJYQfn6Gm/1xUkPd
	 tSS3qqyEqbWzsXweg2oVF6ibR8DXEyiuaNukJfh1gxaN6H6zMcLJzSj4JSz/jfyLQv
	 AdgmcslO/YebJaL4O2+4ZGpbNcJTTdTDQ8cLASW9vMEVcmwMmTSmph86w6yp+6F3KN
	 e3a/TSqX6YevZfxxoH9vVQs+DTC7iTSirxX8Drd7JX667koGwnCC++boPIAKbuN7G3
	 llfRPkBf4POeY2P5jkrZWiJCL3W08Q2g6O/44H42DfF2PB5SNkduh5/ZpeC5y6ZVBJ
	 2KCULnPMTYtbw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Uday M Bhat <uday.m.bhat@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 5.10 07/22] ASoC: Intel: sof_sdw: Add support for Rex
 soundwire
Date: Sun, 23 Jul 2023 21:24:04 -0400
Message-Id: <20230724012419.2317649-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012419.2317649-1-sashal@kernel.org>
References: <20230724012419.2317649-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.186
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JLW5DZSVDYGRP5MF2GK3QEETDX5SHK37
X-Message-ID-Hash: JLW5DZSVDYGRP5MF2GK3QEETDX5SHK37
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLW5DZSVDYGRP5MF2GK3QEETDX5SHK37/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Uday M Bhat <uday.m.bhat@intel.com>

[ Upstream commit 164e5dc17525181c05563f0a06796f1a363801d5 ]

Add rex entry in the soundwire quirk table

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20230602202225.249209-28-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 30cc8bbceb79b..cbbb50ddc7954 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -207,6 +207,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(RT711_JD2_100K),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Rex"),
+		},
+		.driver_data = (void *)(SOF_SDW_PCH_DMIC),
+	},
 	/* LunarLake devices */
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.39.2

