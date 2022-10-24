Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC19560B1A8
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:31:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 767B984A;
	Mon, 24 Oct 2022 18:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 767B984A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666629066;
	bh=CzXAAVXU8uovyyam9kE9AIWp43j0hYtT9V7waGerSQA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ikom1MAtVa2QG/98I9mfLydhiovJJIA2xSF6RMevdLGSEZdyv8F77even2qlC+w5F
	 MJWDv4KmrjMpmofzJ/4c3oK3XZX+Sv8V/dRnvYBI42zWpoPbUaJbqjgWKl+gJhfTAU
	 sCcdhLYDG9ZJvDj3Q72YYu5aTIh39goUaiKKRdrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F6DFF80557;
	Mon, 24 Oct 2022 18:30:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C0E7F8054A; Mon, 24 Oct 2022 18:30:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF3F7F80506
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:30:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF3F7F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bBhQKKLs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 057B4614AB;
 Mon, 24 Oct 2022 16:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26B9C433D7;
 Mon, 24 Oct 2022 16:30:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bBhQKKLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666628999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z+4g9EF5Uj8HK2ZYL+/8gzSFpissp8WBpzlDIf+LycQ=;
 b=bBhQKKLs/ha9Td5EXWg8rIzTS4WpSoRdc5PibFDrqLttl5GpJ4FVA4cimnUtUxwTXUQOEQ
 2GlRPeTAtjQ4l1eQKSlYIXQ6Ag88F84VAs7olV68Vox5ghNw6zeNG80Jvo/+pQLne9xD0w
 0C3vuA9r7+S38fSpqM42qT7KykdPD7U=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6421b49d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 24 Oct 2022 16:29:59 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: rme9652: use explicitly signed char
Date: Mon, 24 Oct 2022 18:29:47 +0200
Message-Id: <20221024162947.536060-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
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

With char becoming unsigned by default, and with `char` alone being
ambiguous and based on architecture, signed chars need to be marked
explicitly as such. This fixes warnings like:

sound/pci/rme9652/hdsp.c:3953 hdsp_channel_buffer_location() warn: 'hdsp->channel_map[channel]' is unsigned
sound/pci/rme9652/hdsp.c:4153 snd_hdsp_channel_info() warn: impossible condition '(hdsp->channel_map[channel] < 0) => (0-255 < 0)'
sound/pci/rme9652/rme9652.c:1833 rme9652_channel_buffer_location() warn: 'rme9652->channel_map[channel]' is unsigned

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 sound/pci/rme9652/hdsp.c    | 26 +++++++++++++-------------
 sound/pci/rme9652/rme9652.c | 22 +++++++++++-----------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index dcc43a81ae0e..902508e4fecc 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -433,7 +433,7 @@ struct hdsp_midi {
     struct snd_rawmidi           *rmidi;
     struct snd_rawmidi_substream *input;
     struct snd_rawmidi_substream *output;
-    char                     istimer; /* timer in use */
+    bool 		     istimer; /* timer in use */
     struct timer_list	     timer;
     spinlock_t               lock;
     int			     pending;
@@ -480,7 +480,7 @@ struct hdsp {
 	pid_t                 playback_pid;
 	int                   running;
 	int                   system_sample_rate;
-	const char           *channel_map;
+	const signed char    *channel_map;
 	int                   dev;
 	int                   irq;
 	unsigned long         port;
@@ -502,7 +502,7 @@ struct hdsp {
    where the data for that channel can be read/written from/to.
 */
 
-static const char channel_map_df_ss[HDSP_MAX_CHANNELS] = {
+static const signed char channel_map_df_ss[HDSP_MAX_CHANNELS] = {
 	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
 	18, 19, 20, 21, 22, 23, 24, 25
 };
@@ -517,7 +517,7 @@ static const char channel_map_mf_ss[HDSP_MAX_CHANNELS] = { /* Multiface */
 	-1, -1, -1, -1, -1, -1, -1, -1
 };
 
-static const char channel_map_ds[HDSP_MAX_CHANNELS] = {
+static const signed char channel_map_ds[HDSP_MAX_CHANNELS] = {
 	/* ADAT channels are remapped */
 	1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23,
 	/* channels 12 and 13 are S/PDIF */
@@ -526,7 +526,7 @@ static const char channel_map_ds[HDSP_MAX_CHANNELS] = {
 	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
 };
 
-static const char channel_map_H9632_ss[HDSP_MAX_CHANNELS] = {
+static const signed char channel_map_H9632_ss[HDSP_MAX_CHANNELS] = {
 	/* ADAT channels */
 	0, 1, 2, 3, 4, 5, 6, 7,
 	/* SPDIF */
@@ -540,7 +540,7 @@ static const char channel_map_H9632_ss[HDSP_MAX_CHANNELS] = {
 	-1, -1
 };
 
-static const char channel_map_H9632_ds[HDSP_MAX_CHANNELS] = {
+static const signed char channel_map_H9632_ds[HDSP_MAX_CHANNELS] = {
 	/* ADAT */
 	1, 3, 5, 7,
 	/* SPDIF */
@@ -554,7 +554,7 @@ static const char channel_map_H9632_ds[HDSP_MAX_CHANNELS] = {
 	-1, -1, -1, -1, -1, -1
 };
 
-static const char channel_map_H9632_qs[HDSP_MAX_CHANNELS] = {
+static const signed char channel_map_H9632_qs[HDSP_MAX_CHANNELS] = {
 	/* ADAT is disabled in this mode */
 	/* SPDIF */
 	8, 9,
@@ -3939,7 +3939,7 @@ static snd_pcm_uframes_t snd_hdsp_hw_pointer(struct snd_pcm_substream *substream
 	return hdsp_hw_pointer(hdsp);
 }
 
-static char *hdsp_channel_buffer_location(struct hdsp *hdsp,
+static signed char *hdsp_channel_buffer_location(struct hdsp *hdsp,
 					     int stream,
 					     int channel)
 
@@ -3964,7 +3964,7 @@ static int snd_hdsp_playback_copy(struct snd_pcm_substream *substream,
 				  void __user *src, unsigned long count)
 {
 	struct hdsp *hdsp = snd_pcm_substream_chip(substream);
-	char *channel_buf;
+	signed char *channel_buf;
 
 	if (snd_BUG_ON(pos + count > HDSP_CHANNEL_BUFFER_BYTES))
 		return -EINVAL;
@@ -3982,7 +3982,7 @@ static int snd_hdsp_playback_copy_kernel(struct snd_pcm_substream *substream,
 					 void *src, unsigned long count)
 {
 	struct hdsp *hdsp = snd_pcm_substream_chip(substream);
-	char *channel_buf;
+	signed char *channel_buf;
 
 	channel_buf = hdsp_channel_buffer_location(hdsp, substream->pstr->stream, channel);
 	if (snd_BUG_ON(!channel_buf))
@@ -3996,7 +3996,7 @@ static int snd_hdsp_capture_copy(struct snd_pcm_substream *substream,
 				 void __user *dst, unsigned long count)
 {
 	struct hdsp *hdsp = snd_pcm_substream_chip(substream);
-	char *channel_buf;
+	signed char *channel_buf;
 
 	if (snd_BUG_ON(pos + count > HDSP_CHANNEL_BUFFER_BYTES))
 		return -EINVAL;
@@ -4014,7 +4014,7 @@ static int snd_hdsp_capture_copy_kernel(struct snd_pcm_substream *substream,
 					void *dst, unsigned long count)
 {
 	struct hdsp *hdsp = snd_pcm_substream_chip(substream);
-	char *channel_buf;
+	signed char *channel_buf;
 
 	channel_buf = hdsp_channel_buffer_location(hdsp, substream->pstr->stream, channel);
 	if (snd_BUG_ON(!channel_buf))
@@ -4028,7 +4028,7 @@ static int snd_hdsp_hw_silence(struct snd_pcm_substream *substream,
 			       unsigned long count)
 {
 	struct hdsp *hdsp = snd_pcm_substream_chip(substream);
-	char *channel_buf;
+	signed char *channel_buf;
 
 	channel_buf = hdsp_channel_buffer_location (hdsp, substream->pstr->stream, channel);
 	if (snd_BUG_ON(!channel_buf))
diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index 1d614fe89a6a..e7c320afefe8 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -230,7 +230,7 @@ struct snd_rme9652 {
 	int last_spdif_sample_rate;	/* so that we can catch externally ... */
 	int last_adat_sample_rate;	/* ... induced rate changes            */
 
-	const char *channel_map;
+	const signed char *channel_map;
 
 	struct snd_card *card;
 	struct snd_pcm *pcm;
@@ -247,12 +247,12 @@ struct snd_rme9652 {
    where the data for that channel can be read/written from/to.
 */
 
-static const char channel_map_9652_ss[26] = {
+static const signed char channel_map_9652_ss[26] = {
 	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
 	18, 19, 20, 21, 22, 23, 24, 25
 };
 
-static const char channel_map_9636_ss[26] = {
+static const signed char channel_map_9636_ss[26] = {
 	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 
 	/* channels 16 and 17 are S/PDIF */
 	24, 25,
@@ -260,7 +260,7 @@ static const char channel_map_9636_ss[26] = {
 	-1, -1, -1, -1, -1, -1, -1, -1
 };
 
-static const char channel_map_9652_ds[26] = {
+static const signed char channel_map_9652_ds[26] = {
 	/* ADAT channels are remapped */
 	1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23,
 	/* channels 12 and 13 are S/PDIF */
@@ -269,7 +269,7 @@ static const char channel_map_9652_ds[26] = {
 	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
 };
 
-static const char channel_map_9636_ds[26] = {
+static const signed char channel_map_9636_ds[26] = {
 	/* ADAT channels are remapped */
 	1, 3, 5, 7, 9, 11, 13, 15,
 	/* channels 8 and 9 are S/PDIF */
@@ -1819,7 +1819,7 @@ static snd_pcm_uframes_t snd_rme9652_hw_pointer(struct snd_pcm_substream *substr
 	return rme9652_hw_pointer(rme9652);
 }
 
-static char *rme9652_channel_buffer_location(struct snd_rme9652 *rme9652,
+static signed char *rme9652_channel_buffer_location(struct snd_rme9652 *rme9652,
 					     int stream,
 					     int channel)
 
@@ -1847,7 +1847,7 @@ static int snd_rme9652_playback_copy(struct snd_pcm_substream *substream,
 				     void __user *src, unsigned long count)
 {
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
-	char *channel_buf;
+	signed char *channel_buf;
 
 	if (snd_BUG_ON(pos + count > RME9652_CHANNEL_BUFFER_BYTES))
 		return -EINVAL;
@@ -1867,7 +1867,7 @@ static int snd_rme9652_playback_copy_kernel(struct snd_pcm_substream *substream,
 					    void *src, unsigned long count)
 {
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
-	char *channel_buf;
+	signed char *channel_buf;
 
 	channel_buf = rme9652_channel_buffer_location(rme9652,
 						      substream->pstr->stream,
@@ -1883,7 +1883,7 @@ static int snd_rme9652_capture_copy(struct snd_pcm_substream *substream,
 				    void __user *dst, unsigned long count)
 {
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
-	char *channel_buf;
+	signed char *channel_buf;
 
 	if (snd_BUG_ON(pos + count > RME9652_CHANNEL_BUFFER_BYTES))
 		return -EINVAL;
@@ -1903,7 +1903,7 @@ static int snd_rme9652_capture_copy_kernel(struct snd_pcm_substream *substream,
 					   void *dst, unsigned long count)
 {
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
-	char *channel_buf;
+	signed char *channel_buf;
 
 	channel_buf = rme9652_channel_buffer_location(rme9652,
 						      substream->pstr->stream,
@@ -1919,7 +1919,7 @@ static int snd_rme9652_hw_silence(struct snd_pcm_substream *substream,
 				  unsigned long count)
 {
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
-	char *channel_buf;
+	signed char *channel_buf;
 
 	channel_buf = rme9652_channel_buffer_location (rme9652,
 						       substream->pstr->stream,
-- 
2.38.1

