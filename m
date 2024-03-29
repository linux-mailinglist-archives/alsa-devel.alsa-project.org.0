Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5436989199B
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 13:44:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 713D62CA1;
	Fri, 29 Mar 2024 13:44:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 713D62CA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711716282;
	bh=m0fZKpmsrS5/P6jiQgqtymoIVNQHI2xeq5VXDil035g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A4PyCPREuqqBEffBURmXvEXbVU1IC31k9cHAMFqJ5LIEccozjIRJ1yauzn+o4mVAW
	 thZgHpc4rKkTRMlHHObXjFSxrq0Zv0gu79uAbyFcin0w8uVXJ/TLm47M3KNzP2fYIp
	 FqMaBdoxPEo3gyJ2W7941T+h0xvkKc7WAwZpKffc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90B94F805A8; Fri, 29 Mar 2024 13:44:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9BF4F80570;
	Fri, 29 Mar 2024 13:44:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 824F9F8025F; Fri, 29 Mar 2024 13:44:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95DADF801EB
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 13:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95DADF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JlsrtjJa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A38AD61888;
	Fri, 29 Mar 2024 12:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B56C433C7;
	Fri, 29 Mar 2024 12:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711716241;
	bh=m0fZKpmsrS5/P6jiQgqtymoIVNQHI2xeq5VXDil035g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JlsrtjJaiA/IA1GHq2xnyJQCdMv0r7hvz/H7YduS/rTYySQn2ja1y3SFoZWyMv3b5
	 e+sgJdpdf8xoBVYp/bpZz06dEZogs+5uwTZK/YmWQniOLwSp1/z8f9CmRz54tmZ8yX
	 164s99IMd8k/Ivb+zBLFfx4YSxFL+/EtOblI1danOQPtO1YhVoRla6cfzTW0Cdua27
	 5v71lIhnWC3+8tR4xwXhlcTSHXp4sAfsEMqgnC8lu93Ro3P6Bw7YFPPBO3vpS1D9dx
	 /WOJEWA08yQ04Ym9ru3WEEvnicMMhVQY8cl7/3AN3NNaU5D7sIjn5IuK0lJZhTJXrd
	 WmXla3QxN9+cg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: mosomate <mosomate@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	vkoul@kernel.org,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	uday.m.bhat@intel.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 17/75] ASoC: Intel: common: DMI remap for
 rebranded Intel NUC M15 (LAPRC710) laptops
Date: Fri, 29 Mar 2024 08:41:58 -0400
Message-ID: <20240329124330.3089520-17-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329124330.3089520-1-sashal@kernel.org>
References: <20240329124330.3089520-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.23
Content-Transfer-Encoding: 8bit
Message-ID-Hash: USL4TSPVKCQVVW2V26EC2XT3Q7IZGN27
X-Message-ID-Hash: USL4TSPVKCQVVW2V26EC2XT3Q7IZGN27
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/USL4TSPVKCQVVW2V26EC2XT3Q7IZGN27/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: mosomate <mosomate@gmail.com>

[ Upstream commit c13e03126a5be90781084437689724254c8226e1 ]

Added DMI quirk to handle the rebranded variants of Intel NUC M15
(LAPRC710) laptops. The DMI matching is based on motherboard
attributes.

Link: https://github.com/thesofproject/linux/issues/4218
Signed-off-by: Máté Mosonyi <mosomate@gmail.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20240208165545.93811-20-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/dmi-quirks.c   |  8 ++++++++
 sound/soc/intel/boards/sof_sdw.c | 11 +++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 9ebdd0cd0b1cf..91ab97a456fa9 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -130,6 +130,14 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)intel_rooks_county,
 	},
+	{
+		/* quirk used for NUC15 LAPRC710 skew */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPRC710"),
+		},
+		.driver_data = (void *)intel_rooks_county,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 9ed572141fe5b..0ea7812125fee 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -243,6 +243,17 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_SDW_PCH_DMIC |
 					RT711_JD2_100K),
 	},
+	{
+		/* NUC15 LAPRC710 skews */
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPRC710"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOF_SDW_PCH_DMIC |
+					RT711_JD2_100K),
+	},
 	/* TigerLake-SDCA devices */
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.43.0

