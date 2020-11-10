Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE70D2ACC5F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 04:55:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5726316AD;
	Tue, 10 Nov 2020 04:54:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5726316AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604980505;
	bh=l2Jw2CD3tgByn9HdhbfrTBIjqlt2hug4S+cpuWnQWY4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X3gqv2FvYqKo1CqUvyyybJ0tTklV2foc1QO3t2KTFtz2m/nDjhgJw6BG9pHTWIu5U
	 HxFjURdSCbDlGL0z0+LCADUI7D0RawdlnYfjm2dySCpMoM3FcDPMA3+/jIGCHFE7jP
	 U9fVBuQxzX1OZBiGP4BwkbTO8EBgBl6zd3vsYpQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBB37F8027C;
	Tue, 10 Nov 2020 04:53:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11EBDF801D5; Tue, 10 Nov 2020 04:53:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EFB8F801D5
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 04:53:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EFB8F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oNVLxxvO"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C930820721;
 Tue, 10 Nov 2020 03:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604980400;
 bh=l2Jw2CD3tgByn9HdhbfrTBIjqlt2hug4S+cpuWnQWY4=;
 h=From:To:Cc:Subject:Date:From;
 b=oNVLxxvOLFF15IPriSG19FFGsvMsX/1R5oD4xRTQ/Lj+uicQP5xDr/O96YsSZwc0f
 AzbQfxOxoqdlv/F0ZWHALiESbwxFLqoPevskplkhR8KzB9VMxVgqLD9l4IHfWjIrAB
 WfZG0icvRSXIPFmNanS+ImsUIYnfw6Xwd7/8Vepk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 01/55] ASoC: mediatek: mt8183-da7219: fix DAPM
 paths for rt1015
Date: Mon,  9 Nov 2020 22:52:24 -0500
Message-Id: <20201110035318.423757-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Tzung-Bi Shih <tzungbi@google.com>

[ Upstream commit eb5a558705c7f63d06b4ddd072898b1ca894e053 ]

RT1015's output widget name is "SPO" instead of "Speaker".  Fixes it to
use the correct names.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20201019044724.1601476-1-tzungbi@google.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 31 +++++++++++++++----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index a6c690c5308d3..58b76e985f7f3 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -624,15 +624,34 @@ static struct snd_soc_codec_conf mt8183_da7219_rt1015_codec_conf[] = {
 	},
 };
 
+static const struct snd_kcontrol_new mt8183_da7219_rt1015_snd_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+};
+
+static const
+struct snd_soc_dapm_widget mt8183_da7219_rt1015_dapm_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+	SND_SOC_DAPM_PINCTRL("TDM_OUT_PINCTRL",
+			     "aud_tdm_out_on", "aud_tdm_out_off"),
+};
+
+static const struct snd_soc_dapm_route mt8183_da7219_rt1015_dapm_routes[] = {
+	{"Left Spk", NULL, "Left SPO"},
+	{"Right Spk", NULL, "Right SPO"},
+	{"I2S Playback", NULL, "TDM_OUT_PINCTRL"},
+};
+
 static struct snd_soc_card mt8183_da7219_rt1015_card = {
 	.name = "mt8183_da7219_rt1015",
 	.owner = THIS_MODULE,
-	.controls = mt8183_da7219_max98357_snd_controls,
-	.num_controls = ARRAY_SIZE(mt8183_da7219_max98357_snd_controls),
-	.dapm_widgets = mt8183_da7219_max98357_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(mt8183_da7219_max98357_dapm_widgets),
-	.dapm_routes = mt8183_da7219_max98357_dapm_routes,
-	.num_dapm_routes = ARRAY_SIZE(mt8183_da7219_max98357_dapm_routes),
+	.controls = mt8183_da7219_rt1015_snd_controls,
+	.num_controls = ARRAY_SIZE(mt8183_da7219_rt1015_snd_controls),
+	.dapm_widgets = mt8183_da7219_rt1015_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8183_da7219_rt1015_dapm_widgets),
+	.dapm_routes = mt8183_da7219_rt1015_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8183_da7219_rt1015_dapm_routes),
 	.dai_link = mt8183_da7219_dai_links,
 	.num_links = ARRAY_SIZE(mt8183_da7219_dai_links),
 	.aux_dev = &mt8183_da7219_max98357_headset_dev,
-- 
2.27.0

