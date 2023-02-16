Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1A1699175
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 11:36:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCCA5DF4;
	Thu, 16 Feb 2023 11:35:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCCA5DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676543769;
	bh=UYYJ0M2hdv/ks6BhqzkrJ1QZa+6pdX9WvWLId0MXbes=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pR53kq0muPSMhkBkb2qCKWEe5tqPkOURy8jrFmcBiUIn/ORFqWpIPqmzrSKmUUxb3
	 LrdKNPEXXRPW4i4XTTClcMzfeQYzLcMAIEzaC2v6SXFFgNNAmAID1n7G/sSBlnDn5Y
	 YU3pOi5aBNj72+M+NkbtgrJOvSSvm1Qo5glzK3SE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C171F80557;
	Thu, 16 Feb 2023 11:33:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2E9DF80533; Thu, 16 Feb 2023 11:33:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDB5AF8047C
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 11:33:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDB5AF8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=htA0/nVI
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8386566021A2;
	Thu, 16 Feb 2023 10:33:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676543598;
	bh=UYYJ0M2hdv/ks6BhqzkrJ1QZa+6pdX9WvWLId0MXbes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=htA0/nVIfuHIK/ZlEBWjGYeFc0DijyYp0DzlKu2YTcm+yiPCm0zhTUEpwo96JG4Rx
	 UFmBf/1gABVxj3WthcHUt/cn4iVtZ9VTDHVPrY4D+cH87kBMICI7f+/H3/TCBa4iAF
	 W3RRIy40XQdW1JCKYGZcP7/8EQhbYKVQ2cn7NoMSDx7HXlBgBCp6PLbBqXE3nVMQ9m
	 6HNC7dfgHQedpEj34syVxc3nSyzPLGWFbJEYw1okzF80Iiq+nTHo5W8ey7j1ZKQ0Ht
	 XZbJhFI9KK2VSxTQR4Pi0YI1YFMd5meKCfvya+BVu8XNJ3zzaaBk3Y0nKc5kN4tZ9p
	 9UL6lMKGkPmqQ==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 9/9] ASoC: amd: vangogh: Include cs35l41 in structs names
Date: Thu, 16 Feb 2023 10:33:00 +0000
Message-Id: <20230216103300.360016-10-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230216103300.360016-1-lucas.tanure@collabora.com>
References: <20230216103300.360016-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EADE7UZ6P3LRZPWNGNB7NL5SYYZ5DGHM
X-Message-ID-Hash: EADE7UZ6P3LRZPWNGNB7NL5SYYZ5DGHM
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <lucas.tanure@collabora.com>, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EADE7UZ6P3LRZPWNGNB7NL5SYYZ5DGHM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Include cs35l41 in structs names so future platforms can be added and
reference the correct sound card

Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 74c7b267dcfd..129cadcdf468 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -251,7 +251,7 @@ static struct snd_soc_codec_conf cs35l41_conf[] = {
 SND_SOC_DAILINK_DEF(cs35l41, DAILINK_COMP_ARRAY(COMP_CODEC(CS35L41_LNAME, CS35L41_DAI),
 						COMP_CODEC(CS35L41_RNAME, CS35L41_DAI)));
 
-static struct snd_soc_dai_link acp5x_dai[] = {
+static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 	{
 		.name = "acp5x-8821-play",
 		.stream_name = "Playback/Capture",
@@ -273,7 +273,7 @@ static struct snd_soc_dai_link acp5x_dai[] = {
 	},
 };
 
-static const struct snd_soc_dapm_widget acp5x_8821_widgets[] = {
+static const struct snd_soc_dapm_widget acp5x_8821_35l41_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIC("Int Mic", NULL),
@@ -281,7 +281,7 @@ static const struct snd_soc_dapm_widget acp5x_8821_widgets[] = {
 			    platform_clock_control, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 };
 
-static const struct snd_soc_dapm_route acp5x_8821_audio_route[] = {
+static const struct snd_soc_dapm_route acp5x_8821_35l41_audio_route[] = {
 	/* HP jack connectors - unknown if we have jack detection */
 	{ "Headphone", NULL, "HPOL" },
 	{ "Headphone", NULL, "HPOR" },
@@ -294,15 +294,15 @@ static const struct snd_soc_dapm_route acp5x_8821_audio_route[] = {
 	{ "Int Mic", NULL, "Platform Clock" },
 };
 
-static struct snd_soc_card acp5x_card = {
+static struct snd_soc_card acp5x_8821_35l41_card = {
 	.name = "acp5x",
 	.owner = THIS_MODULE,
-	.dai_link = acp5x_dai,
-	.num_links = ARRAY_SIZE(acp5x_dai),
-	.dapm_widgets = acp5x_8821_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(acp5x_8821_widgets),
-	.dapm_routes = acp5x_8821_audio_route,
-	.num_dapm_routes = ARRAY_SIZE(acp5x_8821_audio_route),
+	.dai_link = acp5x_8821_35l41_dai,
+	.num_links = ARRAY_SIZE(acp5x_8821_35l41_dai),
+	.dapm_widgets = acp5x_8821_35l41_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(acp5x_8821_35l41_widgets),
+	.dapm_routes = acp5x_8821_35l41_audio_route,
+	.num_dapm_routes = ARRAY_SIZE(acp5x_8821_35l41_audio_route),
 	.codec_conf = cs35l41_conf,
 	.num_configs = ARRAY_SIZE(cs35l41_conf),
 	.controls = acp5x_8821_controls,
@@ -341,7 +341,7 @@ static int acp5x_probe(struct platform_device *pdev)
 	dmi_check_system(acp5x_vg_quirk_table);
 	switch (acp5x_machine_id) {
 	case VG_JUPITER:
-		card = &acp5x_card;
+		card = &acp5x_8821_35l41_card;
 		break;
 	default:
 		return -ENODEV;
-- 
2.39.2

