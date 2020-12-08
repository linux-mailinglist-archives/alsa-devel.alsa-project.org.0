Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A852D2C3C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 14:53:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9E4B16F1;
	Tue,  8 Dec 2020 14:52:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9E4B16F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607435620;
	bh=/NZjxJrxrQwf7bNsWIBVqxJnmiGIcXleRZj+izHwU9U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W7G8OYIS4x4HRaqdWlNSUOlwMnxkr+UrsXDikG5KHGvR8cygQ8OS02h+lfW7j2oUR
	 nJNTMbTzWPODDE6CpyFWEg3l6e+YyHbZcL/POwlb6FBrHpqUjHGGdDnY93uINoL2VN
	 bgmaOToDmW9TbTPWtjpvv97xae7EfwticCWvcReQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DC7FF80130;
	Tue,  8 Dec 2020 14:52:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EB76F80130; Tue,  8 Dec 2020 14:52:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 493D7F80130
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 14:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 493D7F80130
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C755AC94;
 Tue,  8 Dec 2020 13:51:56 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: cx2072x: Fix doubly definitions of Playback and Capture
 streams
Date: Tue,  8 Dec 2020 14:51:54 +0100
Message-Id: <20201208135154.9188-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

The cx2072x codec driver defines multiple DAIs with the same stream
name "Playback" and "Capture".  Although the current code works more
or less as is as the secondary streams are never used, it still leads
the error message like:
 debugfs: File 'Playback' in directory 'dapm' already present!
 debugfs: File 'Capture' in directory 'dapm' already present!

Fix it by renaming the secondary streams to unique names.

Fixes: a497a4363706 ("ASoC: Add support for Conexant CX2072X CODEC")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cx2072x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 2ad00ed21bec..2f10991a8bdb 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1579,7 +1579,7 @@ static struct snd_soc_dai_driver soc_codec_cx2072x_dai[] = {
 		.id	= CX2072X_DAI_DSP,
 		.probe = cx2072x_dsp_dai_probe,
 		.playback = {
-			.stream_name = "Playback",
+			.stream_name = "DSP Playback",
 			.channels_min = 2,
 			.channels_max = 2,
 			.rates = CX2072X_RATES_DSP,
@@ -1591,7 +1591,7 @@ static struct snd_soc_dai_driver soc_codec_cx2072x_dai[] = {
 		.name = "cx2072x-aec",
 		.id	= 3,
 		.capture = {
-			.stream_name = "Capture",
+			.stream_name = "AEC Capture",
 			.channels_min = 2,
 			.channels_max = 2,
 			.rates = CX2072X_RATES_DSP,
-- 
2.26.2

