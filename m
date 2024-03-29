Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AEA8919C0
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 13:47:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDF9A2CA0;
	Fri, 29 Mar 2024 13:46:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDF9A2CA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711716427;
	bh=oC2Wv1oSxUrAS8eJuP0RItudpO00CkGVe6OsWXeu2A4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GNYqxqxpSLNeF0ZJoTHNvahGZOKdfp1JcF9xi4ApVqhI/oOtdQQ/znS55pBYaQwqv
	 0rmh9NkggPalTul2GwQLDl9OVheGjiVtgYGxKD82Vjoqhzk24oV7mwsXkn0fYQd+4A
	 xjk4rFsJE9lTJpHQ0UgOMq1+rEYCJ3Z/7FY4+jzk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24F0BF8059F; Fri, 29 Mar 2024 13:46:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A98F9F80580;
	Fri, 29 Mar 2024 13:46:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6362F8025F; Fri, 29 Mar 2024 13:46:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1479F801EB
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 13:46:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1479F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eL//vnsn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 155926190D;
	Fri, 29 Mar 2024 12:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF60AC433F1;
	Fri, 29 Mar 2024 12:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711716388;
	bh=oC2Wv1oSxUrAS8eJuP0RItudpO00CkGVe6OsWXeu2A4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eL//vnsngcTBpXFOJJaIPDgfDvC2LIJBvnCRtMc01/GypTlUi1VQBfNsOrt792ots
	 p8fz5Zbo1HKlQSz+cC0yVMrhqsae83zzupcHr69LNIwGflB3mJwehNCvnzFJRcBoC3
	 d4heAi6ENpQB9Z+yw55rovhka3IV2//Y5ZHZ6VBqsMa1qnG8Lf8PXkp9CbEgCs7GB4
	 4/a6pU6r7P9OOI1Oso0Y2YvvDnGW5liUnElmXgwmtoQm4mv1srqmwYYrguMBXVEE1a
	 IUppE97jFDUzT1eMDrjI8ESlYn3A+p8zaYF10QEbXBxi6ho7w6xlh9W1qfv6XrAxKD
	 h4xGTsOZLYpNQ==
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
Subject: [PATCH AUTOSEL 6.1 13/52] ASoC: Intel: common: DMI remap for
 rebranded Intel NUC M15 (LAPRC710) laptops
Date: Fri, 29 Mar 2024 08:45:07 -0400
Message-ID: <20240329124605.3091273-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329124605.3091273-1-sashal@kernel.org>
References: <20240329124605.3091273-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.83
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GGMKGZF3CFKL7AHNIQANQBOA2LIGW3E4
X-Message-ID-Hash: GGMKGZF3CFKL7AHNIQANQBOA2LIGW3E4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGMKGZF3CFKL7AHNIQANQBOA2LIGW3E4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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
index 985012f2003e2..d1e6e4208c376 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -224,6 +224,17 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
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

