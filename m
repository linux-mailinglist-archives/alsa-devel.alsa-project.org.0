Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5751FDDC0
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:28:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A10A1672;
	Thu, 18 Jun 2020 03:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A10A1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592443698;
	bh=xS/sOfYhQmXqBYyWzUfT3F1aKVDn9c/U3LLDYZoLQBo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E0vuFF82cuZA7OUd2Wjs+M/g1JhH7bC8jBssIQeQ9ZrQMPWM03zJdcaO7hpThJlb9
	 W5TeIfr2WLnO+rXLi141UKpeODUaejbWE9qFod5wv8iLFhAa/aN0xOdBA8pfeOA5HX
	 1D2vPhpGykh86xCVDzrFvm4Tykz7t19wUK8wf8qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA2E8F80304;
	Thu, 18 Jun 2020 03:14:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E5FDF802FE; Thu, 18 Jun 2020 03:14:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C97AF802A2
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C97AF802A2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rSqBk/p2"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B79BD20EDD;
 Thu, 18 Jun 2020 01:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442867;
 bh=xS/sOfYhQmXqBYyWzUfT3F1aKVDn9c/U3LLDYZoLQBo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rSqBk/p2Gpech5rbXDPzjkIRxoMPl9bf7930YnJRV7z2ak/2B+BbGz3mJydyIAw3C
 gZZKz5ugKpWL01EpY/51YLmT+v390duizNr9GeuRJiHYVuquT/x7YDHzWF3CZsuNbO
 /Uv59FhObY/tjp2SxTpciV9o9xMDRCmyBzKku3jg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 294/388] ASoC: dapm: Move dai_link widgets to
 runtime to fix use after free
Date: Wed, 17 Jun 2020 21:06:31 -0400
Message-Id: <20200618010805.600873-294-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit f4aa5e214eeaf7f1c7f157526a5aa29784cb6a1f ]

The newly added CODEC to CODEC DAI link widget pointers in
snd_soc_dai_link are better placed in snd_soc_pcm_runtime.
snd_soc_dai_link is really intended for static configuration of
the DAI, and the runtime for dynamic data.  The snd_soc_dai_link
structures are not destroyed if the card is unbound. The widgets
are cleared up on unbind, however if the card is rebound as the
snd_soc_dai_link structures are reused these pointers will be left at
their old values, causing access to freed memory.

Fixes: 595571cca4de ("ASoC: dapm: Fix regression introducing multiple copies of DAI widgets")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20200526161930.30759-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/sound/soc.h  |  6 +++---
 sound/soc/soc-dapm.c | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index e0371e70242d..8e480efeda2a 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -790,9 +790,6 @@ struct snd_soc_dai_link {
 	const struct snd_soc_pcm_stream *params;
 	unsigned int num_params;
 
-	struct snd_soc_dapm_widget *playback_widget;
-	struct snd_soc_dapm_widget *capture_widget;
-
 	unsigned int dai_fmt;           /* format to set on init */
 
 	enum snd_soc_dpcm_trigger trigger[2]; /* trigger type for DPCM */
@@ -1156,6 +1153,9 @@ struct snd_soc_pcm_runtime {
 	struct snd_soc_dai **cpu_dais;
 	unsigned int num_cpus;
 
+	struct snd_soc_dapm_widget *playback_widget;
+	struct snd_soc_dapm_widget *capture_widget;
+
 	struct delayed_work delayed_work;
 	void (*close_delayed_work_func)(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_DEBUG_FS
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index e2632841b321..c0aa64ff8e32 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4340,16 +4340,16 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	codec = codec_dai->playback_widget;
 
 	if (playback_cpu && codec) {
-		if (dai_link->params && !dai_link->playback_widget) {
+		if (dai_link->params && !rtd->playback_widget) {
 			substream = streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
 			dai = snd_soc_dapm_new_dai(card, substream, "playback");
 			if (IS_ERR(dai))
 				goto capture;
-			dai_link->playback_widget = dai;
+			rtd->playback_widget = dai;
 		}
 
 		dapm_connect_dai_routes(&card->dapm, cpu_dai, playback_cpu,
-					dai_link->playback_widget,
+					rtd->playback_widget,
 					codec_dai, codec);
 	}
 
@@ -4358,16 +4358,16 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	codec = codec_dai->capture_widget;
 
 	if (codec && capture_cpu) {
-		if (dai_link->params && !dai_link->capture_widget) {
+		if (dai_link->params && !rtd->capture_widget) {
 			substream = streams[SNDRV_PCM_STREAM_CAPTURE].substream;
 			dai = snd_soc_dapm_new_dai(card, substream, "capture");
 			if (IS_ERR(dai))
 				return;
-			dai_link->capture_widget = dai;
+			rtd->capture_widget = dai;
 		}
 
 		dapm_connect_dai_routes(&card->dapm, codec_dai, codec,
-					dai_link->capture_widget,
+					rtd->capture_widget,
 					cpu_dai, capture_cpu);
 	}
 }
-- 
2.25.1

