Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B32749034
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 23:49:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14B6F846;
	Wed,  5 Jul 2023 23:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14B6F846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688593796;
	bh=f6qzZZCqh3StcdQmbdXHhNuewxQtRotpLidUnnuRtcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WX9Ylq/3SzrA/XmmFCgxoe4pRyyz5zF1z3puwgmwt7VszYbJ/97ZQjM9EsECt+N6N
	 NZbM342L+sTyZfUWg5y5f1Jys72Sd5jiALKXQFqgCFC123DCuYWnmpo8My+CqUp6jR
	 N1PIWCkiklvm6k/R2O8ccvs9vXx0sXmQBSE4Qgtg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA0CBF80571; Wed,  5 Jul 2023 23:48:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78229F80563;
	Wed,  5 Jul 2023 23:48:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CCB1F80564; Wed,  5 Jul 2023 23:48:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 656A2F80124
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 23:48:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 656A2F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=kUKURCXz
Received: from localhost (unknown [188.24.137.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 141E46600B9D;
	Wed,  5 Jul 2023 22:48:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688593691;
	bh=f6qzZZCqh3StcdQmbdXHhNuewxQtRotpLidUnnuRtcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kUKURCXzesKef5UuNO0S9nrGOdxIBU6hP2l1oa6onMIafbG3Egc8uHZC2bfroH2AC
	 VAcNc5oGV4CKaLY+wuvoIfnzEQXzIHnNJ1aGUs6MeCaCsjsEpMOXNPsQIdFsvHT5nr
	 jpYQs2pMyCwLOWermrrdgFCWWWpFLz10bz3bRuzyi9cyjexQpbxaXXF2md3VSquE7d
	 ZKUYBUo6JuaBBMSK5gerQBQZUb4xBoTCfdcicdX5D7OakpJMfn2bFWpZ4yHm2tDT+w
	 arZBBc81DYeuDnj6b++imWjWnC+CzhzboY6XIQscxOOvB0rQMZ2sfpar9RHaCF3UmO
	 qI2K/MzSduNCQ==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 2/3] ASoC: amd: vangogh: Use dmi_first_match() for DMI
 quirk handling
Date: Thu,  6 Jul 2023 00:47:59 +0300
Message-ID: <20230705214800.193244-3-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705214800.193244-1-cristian.ciocaltea@collabora.com>
References: <20230705214800.193244-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XBYUAJOVQ57FHSQID5APB3ODBPLJDE7N
X-Message-ID-Hash: XBYUAJOVQ57FHSQID5APB3ODBPLJDE7N
X-MailFrom: cristian.ciocaltea@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XBYUAJOVQ57FHSQID5APB3ODBPLJDE7N/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In preparation for supporting ACPI probing, move DMI quirk handling
logic at the probe's top, to be able to return as quickly as possible in
case there is no DMI matching.

Additionally, simplify the code by replacing dmi_check_system() and
related callback with dmi_first_match(). While at it, also drop a few
unnecessary empty lines.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 5e36179cf611..1efa8f8b77ab 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -22,7 +22,6 @@
 
 #define DRV_NAME			"acp5x_mach"
 #define DUAL_CHANNEL			2
-#define VG_JUPITER			1
 #define ACP5X_NAU8821_BCLK		3072000
 #define ACP5X_NAU8821_FREQ_OUT		12288000
 #define ACP5X_NAU8821_COMP_NAME 	"i2c-NVTN2020:00"
@@ -31,7 +30,6 @@
 #define ACP5X_CS35L41_COMP_RNAME	"spi-VLV1776:01"
 #define ACP5X_CS35L41_DAI_NAME		"cs35l41-pcm"
 
-static unsigned long acp5x_machine_id;
 static struct snd_soc_jack vg_headset;
 
 SND_SOC_DAILINK_DEF(platform,  DAILINK_COMP_ARRAY(COMP_PLATFORM("acp5x_i2s_dma.0")));
@@ -242,7 +240,6 @@ static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	return 0;
-
 }
 
 static const struct snd_soc_ops acp5x_cs35l41_play_ops = {
@@ -292,8 +289,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 	},
 };
 
-
-
 static const struct snd_soc_dapm_widget acp5x_8821_35l41_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
@@ -331,16 +326,8 @@ static struct snd_soc_card acp5x_8821_35l41_card = {
 	.num_controls = ARRAY_SIZE(acp5x_8821_controls),
 };
 
-static int acp5x_vg_quirk_cb(const struct dmi_system_id *id)
-{
-	acp5x_machine_id = VG_JUPITER;
-
-	return 1;
-}
-
 static const struct dmi_system_id acp5x_vg_quirk_table[] = {
 	{
-		.callback = acp5x_vg_quirk_cb,
 		.matches = {
 			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Valve"),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
@@ -351,23 +338,22 @@ static const struct dmi_system_id acp5x_vg_quirk_table[] = {
 
 static int acp5x_probe(struct platform_device *pdev)
 {
+	const struct dmi_system_id *dmi_id;
 	struct acp5x_platform_info *machine;
 	struct device *dev = &pdev->dev;
 	struct snd_soc_card *card;
 	int ret;
 
+	dmi_id = dmi_first_match(acp5x_vg_quirk_table);
+	if (!dmi_id)
+		return -ENODEV;
+
+	card = &acp5x_8821_35l41_card;
+
 	machine = devm_kzalloc(dev, sizeof(*machine), GFP_KERNEL);
 	if (!machine)
 		return -ENOMEM;
 
-	dmi_check_system(acp5x_vg_quirk_table);
-	switch (acp5x_machine_id) {
-	case VG_JUPITER:
-		card = &acp5x_8821_35l41_card;
-		break;
-	default:
-		return -ENODEV;
-	}
 	card->dev = dev;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
-- 
2.41.0

