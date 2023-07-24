Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFF875E657
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:18:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31AFA93A;
	Mon, 24 Jul 2023 03:17:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31AFA93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690161483;
	bh=+5MksG+P6ytN/Xz7RVsEED/f12onU/pWhz06gkgmRz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uYdNXRrniuOLBY2wsj8EjQ+p05oLsuAwd0rwzzmOwuBehB2TpCZw1hMi5AemQizls
	 xo5LK3QK9X/FBnCUd8MzMxu41KYmwcVRQ6EUpvloV7262O6OXKczCneqH0+vtCsjlD
	 6uXmRkHVDEdD8L9tlDPwJeVGp+VYzF7U8GXKNs30=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83023F805CA; Mon, 24 Jul 2023 03:15:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B3D4F80310;
	Mon, 24 Jul 2023 03:15:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC029F805CA; Mon, 24 Jul 2023 03:15:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E1FFDF805BE
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1FFDF805BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RPXxO5nv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A326660F19;
	Mon, 24 Jul 2023 01:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C80C433C7;
	Mon, 24 Jul 2023 01:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690161323;
	bh=+5MksG+P6ytN/Xz7RVsEED/f12onU/pWhz06gkgmRz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RPXxO5nvc1r81sCr1Y73oFQBq39rC1wRJ7xWi2GCemNOJ3Q6rRhjUenjNNBBMSbMF
	 CdJ2yHdnwFIXd2pFuyw2lEBmoSn3vncZiWXkQRcPUkK193UMKODblAVvS8g2n7TMev
	 VA5s7Xvnq6eMbqxc33xLqYGfpbB0bFjOVMgdKqzItE23NIksy2rBtYJD3U3KuhnYG9
	 c4KXIOZ/+P7gB7IMVXzt0+zlMnV55Mmgzo9pLw1e1eQhUcib4b+Qq6bInH4ajnaeUx
	 my07szHxXccSJgka/5FHTHWZfH7ypvYNCr4AQaii1UKuLnXPb8UK0ekcSoF+kn33VG
	 RQkzH3kxe0xnQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	gongjun.song@intel.com,
	uday.m.bhat@intel.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.4 23/58] ASoC: Intel: sof_sdw: add quick for Dell
 SKU 0BDA
Date: Sun, 23 Jul 2023 21:12:51 -0400
Message-Id: <20230724011338.2298062-23-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724011338.2298062-1-sashal@kernel.org>
References: <20230724011338.2298062-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DHCZSYMHA6B6QUUQF2Q5VLDKUMOGFDPC
X-Message-ID-Hash: DHCZSYMHA6B6QUUQF2Q5VLDKUMOGFDPC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DHCZSYMHA6B6QUUQF2Q5VLDKUMOGFDPC/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 3daf02819ac3fd8d7605804a00213cf123ac880d ]

The SKU numbering isn't quite consistent with the existing RaptorLake
SKUs but the PCI ID is definitively RaptorLake.

Closes: https://github.com/thesofproject/linux/issues/4380
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20230602202225.249209-17-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 342d4f23a8dc6..1238a13744e2e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -367,6 +367,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					RT711_JD2),
 	},
 	/* RaptorLake devices */
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0BDA")
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2 |
+					SOF_SDW_FOUR_SPK),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.39.2

