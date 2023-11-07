Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C347E43D0
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Nov 2023 16:48:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24F6D1CF;
	Tue,  7 Nov 2023 16:47:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24F6D1CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699372094;
	bh=GTRXkb/PnBZm51qM3/nPCGsJZs0Ktvf0gOa0EAAkkg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HrzjGSRgKbvWsgSiPZYiBNeVC0NKwJ+6SifMbc6vGeHrn15pYbnhuoXZ7ga2aPrHp
	 LTwhqjOAGlrRPqa/x8SeTslOZW3DmQD0dDVh9gbBDA081Ggh4lw802+auU+xkgLHh9
	 AS/LIvQk2QUF5IBrXpQ0BQWJx3QiN+0+4YVVM7Zo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DBFFF8016D; Tue,  7 Nov 2023 16:47:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F158DF801F5;
	Tue,  7 Nov 2023 16:47:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F160F801F5; Tue,  7 Nov 2023 16:47:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2C63F800ED
	for <alsa-devel@alsa-project.org>; Tue,  7 Nov 2023 16:47:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2C63F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OHTKYH6j
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4CAD6611C8;
	Tue,  7 Nov 2023 15:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17736C433C7;
	Tue,  7 Nov 2023 15:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699372025;
	bh=GTRXkb/PnBZm51qM3/nPCGsJZs0Ktvf0gOa0EAAkkg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OHTKYH6jtBAUcBGrsgNxboo/zQELQ6gIRIQF5xzqg+DkGPUFy1ZmUHC2rFpAh4gsE
	 7qAECDf069svzf+j4e9oLTV6lVnV/Ly+TJZYS+ESboXxS4kG5wdDHchsmXHPshxiuW
	 vheS1ReM69x3RK5xgAu0hprrDDB+WVaylC77JQA4Yo0+qfBWtgcFobKbpAvuPisiqG
	 t/7t4MKHWpdEVm9F3MxrxTzxgaEYW3JAIwZHSjXhK0vr46B9eJDFTppcepWQeYQoBv
	 LOiaOwNhmQ3lMMeTA/ZD0qa7uS974Cop/RBm6DBRZr7pXBctGqxEMVXOBo7dzbiF2t
	 jlO8f3+0cEcQA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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
	gongjun.song@intel.com,
	uday.m.bhat@intel.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 04/36] ASoC: Intel: sof_sdw: Copy PCI SSID to
 struct snd_soc_card
Date: Tue,  7 Nov 2023 10:45:46 -0500
Message-ID: <20231107154654.3765336-4-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107154654.3765336-1-sashal@kernel.org>
References: <20231107154654.3765336-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EFRITCISFYUZOYX6B6URUOAY4EQGJ4NW
X-Message-ID-Hash: EFRITCISFYUZOYX6B6URUOAY4EQGJ4NW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFRITCISFYUZOYX6B6URUOAY4EQGJ4NW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

[ Upstream commit d8b387544ff4d02eda1d1839a0c601de4b037c33 ]

If the PCI SSID has been set in the struct snd_soc_acpi_mach_params,
copy this to struct snd_soc_card so that it can be used by other
ASoC components.

This is important for components that must apply system-specific
configuration.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20230912163207.3498161-4-rf@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 842649501e303..44f583e971e65 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1934,6 +1934,12 @@ static int mc_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
 		codec_info_list[i].amp_num = 0;
 
+	if (mach->mach_params.subsystem_id_set) {
+		snd_soc_card_set_pci_ssid(card,
+					  mach->mach_params.subsystem_vendor,
+					  mach->mach_params.subsystem_device);
+	}
+
 	ret = sof_card_dai_links_create(card);
 	if (ret < 0)
 		return ret;
-- 
2.42.0

