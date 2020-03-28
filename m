Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF79F196300
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Mar 2020 03:00:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38858166B;
	Sat, 28 Mar 2020 03:00:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38858166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585360856;
	bh=5ZzPWdNu1vD9wBc2yP4W318f0/wIB5ClATXt7mJYiEk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AAFZe9OF23itLBv7+IaMtqoeRv+FilfYAc42Ao811D7UF8NhXJoPc6D6C7dNB2EMH
	 6wpO0rSst8u6jmpZh8Oqk6Wv3S+Ras9CMu5cnJn9RCgHHtbEYRd7atPMqbuh6zmG2F
	 14oURNSK39lPyyxu3suxwukBtlsbFIsxf57p6cXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26C8DF8015A;
	Sat, 28 Mar 2020 02:59:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3F34F80158; Sat, 28 Mar 2020 02:59:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_SOFTFAIL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from pecan.exetel.com.au (pecan-mail.exetel.com.au [220.233.0.8])
 by alsa1.perex.cz (Postfix) with ESMTP id C0AA2F8011E
 for <alsa-devel@alsa-project.org>; Sat, 28 Mar 2020 02:59:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0AA2F8011E
Received: from 41.68.233.220.static.exetel.com.au ([220.233.68.41]
 helo=localhost.localdomain)
 by pecan.exetel.com.au with esmtp (Exim 4.91)
 (envelope-from <flatmax@flatmax.org>)
 id 1jI0kT-0001pT-BI; Sat, 28 Mar 2020 12:58:57 +1100
From: Matt Flax <flatmax@flatmax.org>
To: lgirdwood@gmail.com, broonie@kernel.org, lars@metafoo.de,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: snd_soc_dai_set_fmt add substream independence.
Date: Sat, 28 Mar 2020 12:58:31 +1100
Message-Id: <20200328015831.6230-1-flatmax@flatmax.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Matt Flax <flatmax@flatmax.org>
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

This patch is aims to start a stronger discussion on allowing both CPU
and Codec dais to set formats independently based on direction.

Currently it is very difficult to change stream formats because there
is no way to specify it independently.

A previous discussion w.r.t. a codec's stream dependent format setting
required a codec's dai to be split. See here :
https://mailman.alsa-project.org/pipermail/alsa-devel/2020-March/164492.html

A previous discussion w.r.t. changing format based on the stream direction
w.r.t. a CPU's dai showed the difficulty in setting fmt based on
direection in thw hw_params function. See here :
https://mailman.alsa-project.org/pipermail/alsa-devel/2020-March/165101.html

It seems that it may be necessary to allow the stream direction as an
input argument to snd_soc_dai_set_fmt.

This patch is not complete, as there are many codecs and cpus which would
require this change. However this patch is aimed as a discussion point.

One example of a sound card which requires independent stream formats is
an isolated sound card, such as the Audio Injector Isolated sound card.
The magnetic isolation chips on the sound card require stream fomats to
be different because of digital latency variations on the I2S lines.

Signed-off-by: Matt Flax <flatmax@flatmax.org>
---
 include/sound/soc-dai.h | 4 ++--
 sound/soc/soc-core.c    | 5 +++--
 sound/soc/soc-dai.c     | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index eaaeb00e9e84..5071e006389b 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -123,7 +123,7 @@ int snd_soc_dai_set_pll(struct snd_soc_dai *dai,
 int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio);
 
 /* Digital Audio interface formatting */
-int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt);
+int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt, int stream);
 
 int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width);
@@ -186,7 +186,7 @@ struct snd_soc_dai_ops {
 	 * DAI format configuration
 	 * Called by soc_card drivers, normally in their hw_params.
 	 */
-	int (*set_fmt)(struct snd_soc_dai *dai, unsigned int fmt);
+	int (*set_fmt)(struct snd_soc_dai *dai, unsigned int fmt, int stream);
 	int (*xlate_tdm_slot_mask)(unsigned int slots,
 		unsigned int *tx_mask, unsigned int *rx_mask);
 	int (*set_tdm_slot)(struct snd_soc_dai *dai,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 068d809c349a..27a6f01dc2d3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1474,10 +1474,11 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	unsigned int i;
-	int ret;
+	int ret, stream;
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_fmt(codec_dai, dai_fmt);
+		int stream = 0;
+		ret = snd_soc_dai_set_fmt(codec_dai, dai_fmt, stream);
 		if (ret != 0 && ret != -ENOTSUPP) {
 			dev_warn(codec_dai->dev,
 				 "ASoC: Failed to set DAI format: %d\n", ret);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 51031e330179..1f8ee7875656 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -94,11 +94,11 @@ EXPORT_SYMBOL_GPL(snd_soc_dai_set_bclk_ratio);
  *
  * Configures the DAI hardware format and clocking.
  */
-int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt, int stream)
 {
 	if (dai->driver->ops->set_fmt == NULL)
 		return -ENOTSUPP;
-	return dai->driver->ops->set_fmt(dai, fmt);
+	return dai->driver->ops->set_fmt(dai, fmt, stream);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_fmt);
 
-- 
2.20.1

