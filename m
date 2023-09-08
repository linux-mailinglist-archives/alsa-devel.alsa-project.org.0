Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CAB799025
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 21:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D422DF5;
	Fri,  8 Sep 2023 21:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D422DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694201842;
	bh=0ZsfsoJOKXIeI+l34s8JwbThse74fekFNNPL2g9b1Hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QeN9y1zlwszssfTUMT7yxsy/3fR4uJtD1w04apYr0ZuxBvtO8LFM0ecmwfjCSYXWv
	 ApIhLHejOWl0Dbwjjqp94xpWEGSCFJXVitLJfY037tqQIyFZCviBlIGbCwrgJ8Ku1d
	 WgaA4OIGlh4shxLXyJ46qyI6UfOhTeJZUR6aaHes=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDFE0F80558; Fri,  8 Sep 2023 21:36:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87F30F804F3;
	Fri,  8 Sep 2023 21:36:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CC04F80549; Fri,  8 Sep 2023 21:36:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6DD2F8047D
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 21:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6DD2F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mV+w5JG9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9228B61562;
	Fri,  8 Sep 2023 19:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EB1C116AD;
	Fri,  8 Sep 2023 19:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694201784;
	bh=0ZsfsoJOKXIeI+l34s8JwbThse74fekFNNPL2g9b1Hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mV+w5JG91qPr98NtEnUo8H5DoXBz7GmNnJGpPVO9l/P94yxS6et1mSWaVJMvSBKAD
	 ZAugdQ+6WNL+obQCMDJqgH37tp7isNk6XDF3GcZSmUkoerwZg2GttM9sGArmE0Vxnm
	 JFa3oosCswoU4OGUX1pscnebjXr9qaTilpZxJl5rG92FJGMJ2sn/Y9SNlFhrHVN3rk
	 zyzyRSndSU4AWLFKi+7b5g+Orpobs9JVsYGZFHzzC3+pELR+GZFwsb0nuOFdlz2A8S
	 LSYQEI1sto+JWBAdRzEhOfcbT3cs595JgFnd+7SXc8EDr4SHTuSTVlW3/RGhruzJOu
	 JXkPwqj1gpQpQ==
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
Subject: [PATCH AUTOSEL 5.10 3/9] ASoC: Intel: sof_sdw: Update BT offload
 config for soundwire config
Date: Fri,  8 Sep 2023 15:36:04 -0400
Message-Id: <20230908193611.3463821-3-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193611.3463821-1-sashal@kernel.org>
References: <20230908193611.3463821-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.194
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UCON4W5S43SQFHCEEVO3TF3WBKRZYPL2
X-Message-ID-Hash: UCON4W5S43SQFHCEEVO3TF3WBKRZYPL2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UCON4W5S43SQFHCEEVO3TF3WBKRZYPL2/>
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
index f36a0fda1b6ae..1955d277fdf20 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -214,7 +214,9 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
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

