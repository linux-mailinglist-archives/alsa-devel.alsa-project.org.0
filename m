Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5285775E6C1
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:23:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97F5F86E;
	Mon, 24 Jul 2023 03:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97F5F86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690161780;
	bh=TocQGAbiJ3tvmkNMayj4SL1OAtkvMDC2WIjxvCY1vc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tVOzAZCDoTxuRfZJCx1T7gi/O0ALUR7Zoe2BdEeDL/aLWW3ht+n7s+zu/iBBz2ktK
	 8i/FLSiC+1NXlDH6viUJPnGZ0zQXDRwY35gNzV0FGJWxJM7TvkTgmzYA0ihzAfINlv
	 ukv4E02EibnSuv9v7MsMIVj5dqYP9JdJJClRNhso=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED205F80548; Mon, 24 Jul 2023 03:21:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B08CF80568;
	Mon, 24 Jul 2023 03:21:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75416F80535; Mon, 24 Jul 2023 03:21:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 440F2F800D2
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:21:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 440F2F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NHJKOphR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 36BEF60E9C;
	Mon, 24 Jul 2023 01:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03081C433C8;
	Mon, 24 Jul 2023 01:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690161703;
	bh=TocQGAbiJ3tvmkNMayj4SL1OAtkvMDC2WIjxvCY1vc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NHJKOphRO8aBrHYQINDqRg1znv3KfzxwFOX4GFjymMPuvhZKPQA3SS7BRhUKnlcWv
	 PnFhRq9gthzsqn2c/QRPEkb+wLKH9ZyWw2KoILLHAlZI2gvll5ma20rX9KAfGmbYtD
	 MGpnjnG5eRPEZ7dARnrc7NmbE8xw0Id2Mw/yUnR24Op5bWdmkpIo7VVzB/Q+9R8Uvg
	 IgyYESDQI4N1n9BlOflbRcVZ/uAjM07iPysdAiCNnu1F4qv+BWVs0dodcYZ3ICrVLi
	 RhJWrU8+f143rISrxzjp4u4FtNA0HMX+7Kumz4b/SCl/3DD9c4AZzWvfrZpB2jJlHh
	 MbxsthYdAP0Qg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	gongjun.song@intel.com,
	shumingf@realtek.com,
	yong.zhi@intel.com,
	u.kleine-koenig@pengutronix.de,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 07/41] ASoC: Intel: sof_sdw: add quirk for MTL RVP
Date: Sun, 23 Jul 2023 21:20:40 -0400
Message-Id: <20230724012118.2316073-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012118.2316073-1-sashal@kernel.org>
References: <20230724012118.2316073-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6AP74WFOSU7MTZ4JFA4EQ22GX52SGMSJ
X-Message-ID-Hash: 6AP74WFOSU7MTZ4JFA4EQ22GX52SGMSJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6AP74WFOSU7MTZ4JFA4EQ22GX52SGMSJ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

[ Upstream commit 289e1df00e49a229a1c924c059242e759a552f01 ]

We should use RT711_JD2_100K for on board rt711.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com
Link: https://lore.kernel.org/r/20230512173305.65399-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d4f92bb5e29f8..a06693827ae5b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -374,6 +374,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(RT711_JD1 | SOF_SDW_TGL_HDMI),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Meteor Lake Client Platform"),
+		},
+		.driver_data = (void *)(RT711_JD2_100K),
+	},
 	{}
 };
 
-- 
2.39.2

