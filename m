Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F143D92BFB4
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 18:24:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F614EC7;
	Tue,  9 Jul 2024 18:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F614EC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720542249;
	bh=9xPoarv9U0RMmmwGjz2KH5mcE2cMmo3OmRe08XZCiqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VVLXwgjeyMeVeyGAzbhvDATGZxZzW4imZDRyW+JF3f7kntYWPKn45J0/m3lTqCMwT
	 3V8n/8S4ffTCkuhPBKIQ+i37Knxl9bsl6NglKJqNOw79YpzUuK0yVSM9fj3D+Su3fv
	 3AR09G1m7+T1JCfeBVU0YB0a8uon/BpW2jgxyUkQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 895A3F80610; Tue,  9 Jul 2024 18:23:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4AA1F805DA;
	Tue,  9 Jul 2024 18:23:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C59BF804FC; Tue,  9 Jul 2024 18:21:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6672F8019B
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 18:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6672F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Tnwq6Khq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5BB61CE1153;
	Tue,  9 Jul 2024 16:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 539B8C32786;
	Tue,  9 Jul 2024 16:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542036;
	bh=9xPoarv9U0RMmmwGjz2KH5mcE2cMmo3OmRe08XZCiqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tnwq6KhqE1lels9ZIRLjFmP2A3enBPsQkzkb2I/6rnWx02TSeZm7/AO4ahOALwNgZ
	 Ya7qzmWVXFn8ajZvtYl8PCplX2KmucRDeh+1mdyuiNH9M61UPD34mBV9El2s7Kbf4C
	 WBy1CpoTAmAAz47fsG34ZiKL2i0Jm/H2mBON0ZEp6JXs1ZGtCSpS2nly2BDPMq0Lsl
	 CJtJX8qdY2baRYVWD6Ow/5+5tQOm7LkqYwcUxoY54+1ue0lpYVfc4qJgdq/lLYWv11
	 ZtkcH4FizPchU/TghrzEHFSbJqLC/Fi0amNwONc5ld9aXlQAJhSy1aFbJwlMNDthTG
	 GvF9UmWAz+6uQ==
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
	kuninori.morimoto.gx@renesas.com,
	alban.boye@protonmail.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 11/40] bytcr_rt5640 : inverse jack detect for
 Archos 101 cesium
Date: Tue,  9 Jul 2024 12:18:51 -0400
Message-ID: <20240709162007.30160-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162007.30160-1-sashal@kernel.org>
References: <20240709162007.30160-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DHH6HKFKFCWUFMVVRORHOL3IFIUQWXW2
X-Message-ID-Hash: DHH6HKFKFCWUFMVVRORHOL3IFIUQWXW2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DHH6HKFKFCWUFMVVRORHOL3IFIUQWXW2/>
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
index b41a1147f1c34..a64d1989e28a5 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -610,6 +610,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
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

