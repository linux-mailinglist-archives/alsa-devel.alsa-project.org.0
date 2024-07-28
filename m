Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7757793E781
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jul 2024 18:10:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0703EEF2;
	Sun, 28 Jul 2024 18:10:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0703EEF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722183041;
	bh=h5T+cJRGnbY0CGPW2MiC0k+WDQ9Czbj3yIqOiGgdWtM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RUef8d6ln8Qlp8ff9mu3nPlUqovPxurc2DIId9swDIpsrSYyc3TOZ3XTDIoVTJX80
	 hNIdkGT44AjcijHIdQt/PSMq7eUKspN+O21TvBz0IS6NbQ8+MBvnJSHGN1DHb97Afq
	 ++Bkscg/L3oAMzIJVVqm20T+Ep3yPi7+e5rH8S9w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2986F80683; Sun, 28 Jul 2024 18:09:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC435F80677;
	Sun, 28 Jul 2024 18:09:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5464F802DB; Sun, 28 Jul 2024 18:08:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95F6EF8007E
	for <alsa-devel@alsa-project.org>; Sun, 28 Jul 2024 18:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95F6EF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RbZyS0E5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 529DACE0937;
	Sun, 28 Jul 2024 16:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68569C4AF0E;
	Sun, 28 Jul 2024 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722182917;
	bh=h5T+cJRGnbY0CGPW2MiC0k+WDQ9Czbj3yIqOiGgdWtM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RbZyS0E5Yy+aKT1qxgrGbUxr6nurh4id98sFJs//MxO4qifUMmz3gJeAJIo5seOdi
	 412KMAGW1DsdvEZ5w3ClL1+k3dFx/gO44v0DpejiURub2QTvFYNxedNFRaJSYAUQAU
	 rKy4BO/kn/TdleTaGKrgUgdkUxDJTG1S3kTSCSpcXEs2puvMoLYNfJcJkQkUquSsqw
	 eic2Pv+AbcfpS5cNG0HaY6EvsMFAzz7uCI3pdOTV9by6mMfOfOVA+tZ4rqSVHYf0+L
	 1da+muoKnlagVgg6PBpD6H3iSZm4RmRXnczXPhiI/+ncHvepmjW623DWyYLJGoO+s6
	 Z1nAf0yG0J8Mw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 09/15] ASoC: Intel: sof_sdw: fix jack detection on
 ADL-N variant RVP
Date: Sun, 28 Jul 2024 12:07:53 -0400
Message-ID: <20240728160813.2053107-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728160813.2053107-1-sashal@kernel.org>
References: <20240728160813.2053107-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FHZ3TLNSG5M7RPOSXHEMUG4AIWCP5GY3
X-Message-ID-Hash: FHZ3TLNSG5M7RPOSXHEMUG4AIWCP5GY3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FHZ3TLNSG5M7RPOSXHEMUG4AIWCP5GY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 65c90df918205bc84f5448550cde76a54dae5f52 ]

Experimental tests show that JD2_100K is required, otherwise the jack
is detected always even with nothing plugged-in.

To avoid matching with other known quirks the SKU information is used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://patch.msgid.link/20240624121119.91552-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d03de37e3578c..cf501baf6f143 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -267,6 +267,15 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_SKU, "0000000000070000"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2_100K),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.43.0

