Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4E36C55E1
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 21:01:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 667D0EEA;
	Wed, 22 Mar 2023 21:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 667D0EEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515304;
	bh=S7xw1KZi9wgWBe4cQ7BxQezBNrU2pPn0w8A9pR4J7cI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ijKFLbKi3X7lweq4aXvuRVTfMJSNEUMLZtLXlAHO7q1mTXiHDl15o1tgpcgGMRu0M
	 XSOVGkG4kBXkoYLx+R7DlJ1U5CsqODPn5t1YGP9iOTQG7+MciwJzbiZzyIbmzbLc5o
	 pMuBopoVidP+hnl9fnNbP4oTgpsZeFIt67CmuAIg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9F59F805B4;
	Wed, 22 Mar 2023 20:58:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22387F80588; Wed, 22 Mar 2023 20:58:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73EFDF8057E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 20:58:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73EFDF8057E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=plJmx5Ai
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AB1F3622B6;
	Wed, 22 Mar 2023 19:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D680FC433A4;
	Wed, 22 Mar 2023 19:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515102;
	bh=S7xw1KZi9wgWBe4cQ7BxQezBNrU2pPn0w8A9pR4J7cI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=plJmx5Aiq+9nx+iTeESo0tAUoRiB+fnpwOj3zbvTbeowMtYNhmX9AvqQKp3Oiu9GM
	 ArvgCzh7IoGfWmhXhND0aBxNb87ZKBBbAluq3oeIIU6RSD4ppf/Xd5YCN6+nuymstP
	 lGU24l9yzllUSREWpudHR4lQz3pdLBDWfD++wiqXYiKvFo+frCJCjZCvPAZ0fB7QOj
	 Po0FBm5wmVhHyHg5ynLoQvdjgpGkXJeFg/N3jmtv1fowtAlZALryyK8eTKQ2Lintt0
	 Qg2cywCIdoVtOQU+9u+DdPDCqyIuGyKLtQ1rtJyhJA9mYpIOuddRSTOZU2aSJO2VFz
	 q35Ns6N81AAVw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 20/45] ASoC: hdmi-codec: only startup/shutdown on
 supported streams
Date: Wed, 22 Mar 2023 15:56:14 -0400
Message-Id: <20230322195639.1995821-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195639.1995821-1-sashal@kernel.org>
References: <20230322195639.1995821-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HNMWUYMCCXPPEJ26UF4V4GWDKEQIRMLS
X-Message-ID-Hash: HNMWUYMCCXPPEJ26UF4V4GWDKEQIRMLS
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
 Emil Svendsen <emas@bang-olufsen.dk>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, pierre-louis.bossart@linux.intel.com,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HNMWUYMCCXPPEJ26UF4V4GWDKEQIRMLS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>

[ Upstream commit e041a2a550582106cba6a7c862c90dfc2ad14492 ]

Currently only one stream is supported. This isn't usally a problem
until you have a multi codec audio card. Because the audio card will run
startup and shutdown on both capture and playback streams. So if your
hdmi-codec only support either playback or capture. Then ALSA can't open
for playback and capture.

This patch will ignore if startup and shutdown are called with a non
supported stream. Thus, allowing an audio card like this:

           +-+
 cpu1 <--@-| |-> codec1 (HDMI-CODEC)
           | |<- codec2 (NOT HDMI-CODEC)
           +-+

Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
Link: https://lore.kernel.org/r/20230309065432.4150700-2-emas@bang-olufsen.dk
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/hdmi-codec.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 74cbbe16f9aec..a22f2ec95901f 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -428,8 +428,13 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool has_capture = !hcp->hcd.no_i2s_capture;
+	bool has_playback = !hcp->hcd.no_i2s_playback;
 	int ret = 0;
 
+	if (!((has_playback && tx) || (has_capture && !tx)))
+		return 0;
+
 	mutex_lock(&hcp->lock);
 	if (hcp->busy) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
@@ -468,6 +473,12 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool has_capture = !hcp->hcd.no_i2s_capture;
+	bool has_playback = !hcp->hcd.no_i2s_playback;
+
+	if (!((has_playback && tx) || (has_capture && !tx)))
+		return;
 
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
-- 
2.39.2

