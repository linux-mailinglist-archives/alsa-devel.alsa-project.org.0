Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B47A69A9F8
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 12:13:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A494EF2;
	Fri, 17 Feb 2023 12:12:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A494EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676632380;
	bh=gbELMwYg817UFw8p4tgNjb0vJPCHEhsb/q4OUGfCW04=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LZC5MjEmAsj0Vjsj/Ues8+9lwZFP7+2TbJGTSI89tNu6f8VFBHAjJC3UrXS4bUa4t
	 tYBM8yz/nu1SzYx4lDPjLp3O6yLwARxGi2p/ZjrEtp0szZW/uQV0o5WZR1/Hh3XVA8
	 J7Bnrzd+8qDmvTGFH4IJANOVNnHYiyf9zsksfDgk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE252F804B0;
	Fri, 17 Feb 2023 12:10:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD1FDF80525; Fri, 17 Feb 2023 12:10:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00517F804B0
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 12:09:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00517F804B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=FyXNbKhA
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9DF1E66021D1;
	Fri, 17 Feb 2023 11:09:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676632176;
	bh=gbELMwYg817UFw8p4tgNjb0vJPCHEhsb/q4OUGfCW04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FyXNbKhAN9r8zmjYArexKlKD/sL/zm9FLMU077oMf3dyp+R8wK+zT91Oc46vl+KiY
	 hlbPYpApmne/scmjHyIwsIni7n6RYRFS2HP7r+Ct8OlpJiw3ZQtWBVMw+h+GYdZ3Zj
	 DWXQih9MJ5S6EJjyjyAlqR5ZKSM1i3wpqwiOmiS+o+Oc5pztwONs2ba8HB5rqCaFFH
	 9/o/ufBwHO+FofaHUTL1y3lHtzKaYf70mu/kD89uRHUBS2BKVhm4d5b3zLTNzlMiAQ
	 W741CtTUXSmDNOsfftyow3Qs1wrCzUoWTO4u+Mo8ZUrvbeB0k1h6mjKXujryG+tB+o
	 UCq/bhLZf5jmA==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 9/9] ASoC: amd: vangogh: Add components prefix in structs
 and function names
Date: Fri, 17 Feb 2023 11:08:50 +0000
Message-Id: <20230217110850.1045250-10-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230217110850.1045250-1-lucas.tanure@collabora.com>
References: <20230217110850.1045250-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MQQCN3HPB7HEJQUT532NHEVFGMAEFTOM
X-Message-ID-Hash: MQQCN3HPB7HEJQUT532NHEVFGMAEFTOM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQQCN3HPB7HEJQUT532NHEVFGMAEFTOM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add prefixes 8821/35l41 in structs and function names so future platforms
can be added and reference the correct sound card.
Also include acp5x prefix to cs35l41_conf.

Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 367570e5c60f..e5bcd1e6eb73 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -250,7 +250,7 @@ static const struct snd_soc_ops acp5x_cs35l41_play_ops = {
 	.hw_params = acp5x_cs35l41_hw_params,
 };
 
-static struct snd_soc_codec_conf cs35l41_conf[] = {
+static struct snd_soc_codec_conf acp5x_cs35l41_conf[] = {
 	{
 		.dlc = COMP_CODEC_CONF(ACP5X_CS35L41_COMP_LNAME),
 		.name_prefix = "Left",
@@ -266,7 +266,7 @@ SND_SOC_DAILINK_DEF(cs35l41, DAILINK_COMP_ARRAY(COMP_CODEC(ACP5X_CS35L41_COMP_LN
 						COMP_CODEC(ACP5X_CS35L41_COMP_RNAME,
 							   ACP5X_CS35L41_DAI_NAME)));
 
-static struct snd_soc_dai_link acp5x_dai[] = {
+static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 	{
 		.name = "acp5x-8821-play",
 		.stream_name = "Playback/Capture",
@@ -294,7 +294,7 @@ static struct snd_soc_dai_link acp5x_dai[] = {
 
 
 
-static const struct snd_soc_dapm_widget acp5x_8821_widgets[] = {
+static const struct snd_soc_dapm_widget acp5x_8821_35l41_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIC("Int Mic", NULL),
@@ -303,7 +303,7 @@ static const struct snd_soc_dapm_widget acp5x_8821_widgets[] = {
 			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 };
 
-static const struct snd_soc_dapm_route acp5x_8821_audio_route[] = {
+static const struct snd_soc_dapm_route acp5x_8821_35l41_audio_route[] = {
 	/* HP jack connectors - unknown if we have jack detection */
 	{ "Headphone", NULL, "HPOL" },
 	{ "Headphone", NULL, "HPOR" },
@@ -316,17 +316,17 @@ static const struct snd_soc_dapm_route acp5x_8821_audio_route[] = {
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
-	.codec_conf = cs35l41_conf,
-	.num_configs = ARRAY_SIZE(cs35l41_conf),
+	.dai_link = acp5x_8821_35l41_dai,
+	.num_links = ARRAY_SIZE(acp5x_8821_35l41_dai),
+	.dapm_widgets = acp5x_8821_35l41_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(acp5x_8821_35l41_widgets),
+	.dapm_routes = acp5x_8821_35l41_audio_route,
+	.num_dapm_routes = ARRAY_SIZE(acp5x_8821_35l41_audio_route),
+	.codec_conf = acp5x_cs35l41_conf,
+	.num_configs = ARRAY_SIZE(acp5x_cs35l41_conf),
 	.controls = acp5x_8821_controls,
 	.num_controls = ARRAY_SIZE(acp5x_8821_controls),
 };
@@ -363,7 +363,7 @@ static int acp5x_probe(struct platform_device *pdev)
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

