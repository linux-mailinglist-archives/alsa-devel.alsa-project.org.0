Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB61D92BFDC
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 18:27:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C0B714FD;
	Tue,  9 Jul 2024 18:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C0B714FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720542430;
	bh=wAZ+Grzu74r7NV0k7+V/B3eHPzCOMyeqQO5ycBzqCaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vJFOR1OySB0dy7wNs9MG1I5e6k+H7AYZFYgcvKjQNEtsgij2iB9bwk283y/BN5EQx
	 uDVCvflP9JFSf49NGyA47koUv2wCv8KiDlqQgGf41gvdFCF68YsT9LmAL/bS9kk6KJ
	 WokcmzqFHdkc43XOgonfp6ZsBQ3t4xx9FjqDHDu4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC715F805AF; Tue,  9 Jul 2024 18:25:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F77F805C0;
	Tue,  9 Jul 2024 18:25:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20801F805A1; Tue,  9 Jul 2024 18:25:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94D35F804FC
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 18:25:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94D35F804FC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L2/5M84R
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB9E8614A6;
	Tue,  9 Jul 2024 16:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928F0C3277B;
	Tue,  9 Jul 2024 16:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542326;
	bh=wAZ+Grzu74r7NV0k7+V/B3eHPzCOMyeqQO5ycBzqCaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L2/5M84R01tXbgit+6FZP3rLQ2SQxQUyMfA4JNAaHxSbM4eApLqgdG9iBQJB2VeEz
	 mywn+uFIjWoE2riqzJ0Wt0880ttLbleKfHlsf3CNC36zGH2gMYR57ITKKC7KoDl8ys
	 nxpQSDiaJDGQMpJJfJsXusi9edtjmRjdA//Bd/T41e1FWX1f+bSrFa9ospwd1aCy1d
	 G7T5noJcH6NcX60fRUMWPosZVysloqFEYPODtIM2EUA9PRvTfgE+TUn1mSSyvxgsht
	 LqwPwRfvmQmipqsAX1vFz7uFG+JOTwReShUWJjj0Ibkx+6MrTp1QO7MxmAOSWg2x86
	 ybGxf+HTN4RFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Thomas GENTY <tomlohave@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
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
	alban.boye@protonmail.com,
	kuninori.morimoto.gx@renesas.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 03/17] bytcr_rt5640 : inverse jack detect for
 Archos 101 cesium
Date: Tue,  9 Jul 2024 12:24:47 -0400
Message-ID: <20240709162517.32584-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162517.32584-1-sashal@kernel.org>
References: <20240709162517.32584-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.162
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NA5X5W7S34GFY3YVSBKUI4YQOUUPDSGJ
X-Message-ID-Hash: NA5X5W7S34GFY3YVSBKUI4YQOUUPDSGJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NA5X5W7S34GFY3YVSBKUI4YQOUUPDSGJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Thomas GENTY <tomlohave@gmail.com>

[ Upstream commit e3209a1827646daaab744aa6a5767b1f57fb5385 ]

When headphones are plugged in, they appear absent; when they are removed,
they appear present.
Add a specific entry in bytcr_rt5640 for this device

Signed-off-by: Thomas GENTY <tomlohave@gmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20240608170251.99936-1-tomlohave@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 434679afa7e1a..3d2a0e8cad9a5 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -607,6 +607,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF1 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ARCHOS"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ARCHOS 101 CESIUM"),
+		},
+		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
+					BYT_RT5640_JD_NOT_INV |
+					BYT_RT5640_DIFF_MIC |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ARCHOS"),
-- 
2.43.0

