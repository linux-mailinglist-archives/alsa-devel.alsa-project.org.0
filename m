Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A12B1798FF1
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 21:35:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D16B7E72;
	Fri,  8 Sep 2023 21:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D16B7E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694201751;
	bh=S/+e8vSnvjEreRsIYzcU3feEfLazb7Crtt7AWvhNrJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eTXQBYyvGZWZ7CO8N5mM/0snUH+vWGnR46GpSsPHrv/oegE3yUCAMkOl95/GfTeKx
	 hP0cpndq0y+jd8yKebdZft5A4SJH7vEwPasO6bUGZ+n57w49i3lffKwxtbW/5jZFuU
	 EGJMXjFUSLoxegq09OkPGWbg6AioARy0xmsu6hSU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96CD0F80558; Fri,  8 Sep 2023 21:35:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1E6AF80567;
	Fri,  8 Sep 2023 21:35:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40EF9F804F3; Fri,  8 Sep 2023 21:34:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6D1AF800F5
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 21:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6D1AF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GZjDgIth
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 453ACB821E6;
	Fri,  8 Sep 2023 19:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F952C116A4;
	Fri,  8 Sep 2023 19:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694201693;
	bh=S/+e8vSnvjEreRsIYzcU3feEfLazb7Crtt7AWvhNrJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GZjDgIthh91xD0zX1Qj46OATBnKH/7zQOqfJ+dxPuRrKC0swa6VS/sTrQxffLqwv4
	 lwC03gI+tAq5hmUZowNoUeNEHFDDSRbkcPPbHuBWTz3iQtbfE9Xmvfka6ozfnr4n+G
	 3/7j/pUhaEwX9H0VHXrdSiZUFwNbzeuRiqeYx1rB2TErmNyVoo42MTk8nF3A9qK7PN
	 VvajsYiHgNBVnpSeg5ofYw/N2rjqee9zKcgd2FhSkxKypLh3QzKz0RKqbERcFHd6no
	 Z2PhiO6q67P6Dk/Hh9n4nT3zcFR28j2KiQXvdpx+gvw1xbTqAqiUm9qQxbqhyMWlYg
	 GQBmM3jwNdCZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Uday M Bhat <uday.m.bhat@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jairaj Arava <jairaj.arava@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	gongjun.song@intel.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 12/22] ASoC: Intel: sof_sdw: Update BT offload
 config for soundwire config
Date: Fri,  8 Sep 2023 15:33:56 -0400
Message-Id: <20230908193407.3463368-12-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193407.3463368-1-sashal@kernel.org>
References: <20230908193407.3463368-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.52
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S4YL7JEO6MU7P26H75L4IK53YVGLYSKJ
X-Message-ID-Hash: S4YL7JEO6MU7P26H75L4IK53YVGLYSKJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S4YL7JEO6MU7P26H75L4IK53YVGLYSKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Uday M Bhat <uday.m.bhat@intel.com>

[ Upstream commit a14aded9299187bb17ef90700eb2cf1120ef5885 ]

For soundwire config, SSP1 is used for BT offload. This is enabled
in sof_sdw_quirk_table

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20230731214257.444605-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 064b6feb76167..414ac90273810 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -388,7 +388,9 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Rex"),
 		},
-		.driver_data = (void *)(SOF_SDW_PCH_DMIC),
+		.driver_data = (void *)(SOF_SDW_PCH_DMIC |
+					SOF_BT_OFFLOAD_SSP(1) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	/* LunarLake devices */
 	{
-- 
2.40.1

