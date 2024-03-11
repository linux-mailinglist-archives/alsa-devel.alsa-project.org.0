Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A7C8787E8
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 19:45:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23C7414E3;
	Mon, 11 Mar 2024 19:45:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23C7414E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710182718;
	bh=9sSDmvXQHGR0M8poLQXFPWiWAjJ+z04RpjNhHuw8szU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nljhHy/5fzBcTHdK3trz8EDuRF7ZAZk04W17zv3F/Q3uKv1ec/64vTEC3BSh+tD1Y
	 SAHstM4WA2XVCV6638dxGrQW3vRtiTZIG7q69QAg5YrK7da3LL21X4ot+Jqw0I2dZT
	 psR4e3nAmdwYa/E5mxz5tMF2E1B+siv4CFyfNRmE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B44C7F896B2; Mon, 11 Mar 2024 19:40:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 244FEF896B6;
	Mon, 11 Mar 2024 19:40:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44C0EF806DF; Mon, 11 Mar 2024 19:40:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5583FF80675
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 19:40:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5583FF80675
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Eci1oIyP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1FDD8CE1258;
	Mon, 11 Mar 2024 18:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A271C433F1;
	Mon, 11 Mar 2024 18:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710182407;
	bh=9sSDmvXQHGR0M8poLQXFPWiWAjJ+z04RpjNhHuw8szU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Eci1oIyPPDmbhFMCYPFha1Q3Y3daQtxVXHad+dnrWaHaTV+3RwbUMtbcfMT2UqDyL
	 l1aGTdCl/9jeVmudTthnp07wP33kZoH9rWK22MS4g1sWD8BHblOf+9gmTQJ+DU30gX
	 kDrN5H7b7s8+1E41yV4RgZINWFwsQbgydhuGEJwnn1TrENrNc8ZfdVupkZmWg60jws
	 /Hb2K9QodHgXilA9FV9VQ0bFRZTPUiQWfyR1fJ3V9ZkG+HI8QILoN4z8GqH16FZaFl
	 fvQb8saiHmzM9T795N8cK8oDjp1wZSR6bLVMCtmX+Kc2jVAp6SAWIBNIyM9q425sQu
	 yD6EVVT3R/Srw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stuart Henderson <stuarth@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 5.4 4/5] ASoC: wm8962: Enable both SPKOUTR_ENA and
 SPKOUTL_ENA in mono mode
Date: Mon, 11 Mar 2024 14:39:48 -0400
Message-ID: <20240311183950.329120-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311183950.329120-1-sashal@kernel.org>
References: <20240311183950.329120-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.271
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QD5CSTDA3XH3TOURYHTOMNQLQLKPLGRF
X-Message-ID-Hash: QD5CSTDA3XH3TOURYHTOMNQLQLKPLGRF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QD5CSTDA3XH3TOURYHTOMNQLQLKPLGRF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Stuart Henderson <stuarth@opensource.cirrus.com>

[ Upstream commit 6fa849e4d78b880e878138bf238e4fd2bac3c4fa ]

Signed-off-by: Stuart Henderson <stuarth@opensource.cirrus.com>
Link: https://msgid.link/r/20240306161439.1385643-2-stuarth@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm8962.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index c84afc1d02dab..9ccec511352a0 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2218,6 +2218,9 @@ SND_SOC_DAPM_PGA_E("HPOUT", SND_SOC_NOPM, 0, 0, NULL, 0, hp_event,
 
 SND_SOC_DAPM_OUTPUT("HPOUTL"),
 SND_SOC_DAPM_OUTPUT("HPOUTR"),
+
+SND_SOC_DAPM_PGA("SPKOUTL Output", WM8962_CLASS_D_CONTROL_1, 6, 0, NULL, 0),
+SND_SOC_DAPM_PGA("SPKOUTR Output", WM8962_CLASS_D_CONTROL_1, 7, 0, NULL, 0),
 };
 
 static const struct snd_soc_dapm_widget wm8962_dapm_spk_mono_widgets[] = {
@@ -2225,7 +2228,6 @@ SND_SOC_DAPM_MIXER("Speaker Mixer", WM8962_MIXER_ENABLES, 1, 0,
 		   spkmixl, ARRAY_SIZE(spkmixl)),
 SND_SOC_DAPM_MUX_E("Speaker PGA", WM8962_PWR_MGMT_2, 4, 0, &spkoutl_mux,
 		   out_pga_event, SND_SOC_DAPM_POST_PMU),
-SND_SOC_DAPM_PGA("Speaker Output", WM8962_CLASS_D_CONTROL_1, 7, 0, NULL, 0),
 SND_SOC_DAPM_OUTPUT("SPKOUT"),
 };
 
@@ -2240,9 +2242,6 @@ SND_SOC_DAPM_MUX_E("SPKOUTL PGA", WM8962_PWR_MGMT_2, 4, 0, &spkoutl_mux,
 SND_SOC_DAPM_MUX_E("SPKOUTR PGA", WM8962_PWR_MGMT_2, 3, 0, &spkoutr_mux,
 		   out_pga_event, SND_SOC_DAPM_POST_PMU),
 
-SND_SOC_DAPM_PGA("SPKOUTR Output", WM8962_CLASS_D_CONTROL_1, 7, 0, NULL, 0),
-SND_SOC_DAPM_PGA("SPKOUTL Output", WM8962_CLASS_D_CONTROL_1, 6, 0, NULL, 0),
-
 SND_SOC_DAPM_OUTPUT("SPKOUTL"),
 SND_SOC_DAPM_OUTPUT("SPKOUTR"),
 };
@@ -2352,12 +2351,18 @@ static const struct snd_soc_dapm_route wm8962_spk_mono_intercon[] = {
 	{ "Speaker PGA", "Mixer", "Speaker Mixer" },
 	{ "Speaker PGA", "DAC", "DACL" },
 
-	{ "Speaker Output", NULL, "Speaker PGA" },
-	{ "Speaker Output", NULL, "SYSCLK" },
-	{ "Speaker Output", NULL, "TOCLK" },
-	{ "Speaker Output", NULL, "TEMP_SPK" },
+	{ "SPKOUTL Output", NULL, "Speaker PGA" },
+	{ "SPKOUTL Output", NULL, "SYSCLK" },
+	{ "SPKOUTL Output", NULL, "TOCLK" },
+	{ "SPKOUTL Output", NULL, "TEMP_SPK" },
+
+	{ "SPKOUTR Output", NULL, "Speaker PGA" },
+	{ "SPKOUTR Output", NULL, "SYSCLK" },
+	{ "SPKOUTR Output", NULL, "TOCLK" },
+	{ "SPKOUTR Output", NULL, "TEMP_SPK" },
 
-	{ "SPKOUT", NULL, "Speaker Output" },
+	{ "SPKOUT", NULL, "SPKOUTL Output" },
+	{ "SPKOUT", NULL, "SPKOUTR Output" },
 };
 
 static const struct snd_soc_dapm_route wm8962_spk_stereo_intercon[] = {
-- 
2.43.0

