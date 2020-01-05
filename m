Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E05AF130872
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 15:52:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AA68178A;
	Sun,  5 Jan 2020 15:52:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AA68178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578235976;
	bh=m0yatFXFPhcuzJU4ThPQ7pNynr53ORDZbWue+1W5fCU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a2WwmcSBileV5JFvix90zB7PlUrcECk47WRdxnvGLmeS3Sy4GtPmUp6eih0raAKs2
	 gdnQR1y20VRHFPT6DXgcX9/o5ikqtsxfoKe9vCm2i5WPeUtf3PiyUt41R1ngWudK9s
	 m4OflAMNJcuUOOuD3FjtdK9knpSLoVJ5DHzhbb0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17ADFF80272;
	Sun,  5 Jan 2020 15:48:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FD08F80308; Sun,  5 Jan 2020 15:48:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 T_FILL_THIS_FORM_SHORT, 
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28990F80213
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28990F80213
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CE771B174
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:31 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:20 +0100
Message-Id: <20200105144823.29547-6-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 05/68] ALSA: pcm: More constifications
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Apply const prefix to more possible places: the string tables for PCM
format and co, the table for the PCM type helpers, etc.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm.c      | 12 ++++++------
 sound/core/pcm_lib.c  |  2 +-
 sound/core/pcm_misc.c |  5 +++--
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index a0f704b72a78..a141a301369f 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -163,7 +163,7 @@ static int snd_pcm_control_ioctl(struct snd_card *card,
 
 #define FORMAT(v) [SNDRV_PCM_FORMAT_##v] = #v
 
-static char *snd_pcm_format_names[] = {
+static const char * const snd_pcm_format_names[] = {
 	FORMAT(S8),
 	FORMAT(U8),
 	FORMAT(S16_LE),
@@ -237,12 +237,12 @@ EXPORT_SYMBOL_GPL(snd_pcm_format_name);
 #define START(v) [SNDRV_PCM_START_##v] = #v
 #define SUBFORMAT(v) [SNDRV_PCM_SUBFORMAT_##v] = #v 
 
-static char *snd_pcm_stream_names[] = {
+static const char * const snd_pcm_stream_names[] = {
 	STREAM(PLAYBACK),
 	STREAM(CAPTURE),
 };
 
-static char *snd_pcm_state_names[] = {
+static const char * const snd_pcm_state_names[] = {
 	STATE(OPEN),
 	STATE(SETUP),
 	STATE(PREPARED),
@@ -253,7 +253,7 @@ static char *snd_pcm_state_names[] = {
 	STATE(SUSPENDED),
 };
 
-static char *snd_pcm_access_names[] = {
+static const char * const snd_pcm_access_names[] = {
 	ACCESS(MMAP_INTERLEAVED), 
 	ACCESS(MMAP_NONINTERLEAVED),
 	ACCESS(MMAP_COMPLEX),
@@ -261,11 +261,11 @@ static char *snd_pcm_access_names[] = {
 	ACCESS(RW_NONINTERLEAVED),
 };
 
-static char *snd_pcm_subformat_names[] = {
+static const char * const snd_pcm_subformat_names[] = {
 	SUBFORMAT(STD), 
 };
 
-static char *snd_pcm_tstamp_mode_names[] = {
+static const char * const snd_pcm_tstamp_mode_names[] = {
 	TSTAMP(NONE),
 	TSTAMP(ENABLE),
 };
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 18f498ab7af1..872a852de75c 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1452,7 +1452,7 @@ EXPORT_SYMBOL(snd_pcm_hw_constraint_step);
 
 static int snd_pcm_hw_rule_pow2(struct snd_pcm_hw_params *params, struct snd_pcm_hw_rule *rule)
 {
-	static unsigned int pow2_sizes[] = {
+	static const unsigned int pow2_sizes[] = {
 		1<<0, 1<<1, 1<<2, 1<<3, 1<<4, 1<<5, 1<<6, 1<<7,
 		1<<8, 1<<9, 1<<10, 1<<11, 1<<12, 1<<13, 1<<14, 1<<15,
 		1<<16, 1<<17, 1<<18, 1<<19, 1<<20, 1<<21, 1<<22, 1<<23,
diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
index c4eb561d2008..a6a541511534 100644
--- a/sound/core/pcm_misc.c
+++ b/sound/core/pcm_misc.c
@@ -42,7 +42,7 @@ struct pcm_format_data {
 /* we do lots of calculations on snd_pcm_format_t; shut up sparse */
 #define INT	__force int
 
-static struct pcm_format_data pcm_formats[(INT)SNDRV_PCM_FORMAT_LAST+1] = {
+static const struct pcm_format_data pcm_formats[(INT)SNDRV_PCM_FORMAT_LAST+1] = {
 	[SNDRV_PCM_FORMAT_S8] = {
 		.width = 8, .phys = 8, .le = -1, .signd = 1,
 		.silence = {},
@@ -415,7 +415,8 @@ EXPORT_SYMBOL(snd_pcm_format_silence_64);
 int snd_pcm_format_set_silence(snd_pcm_format_t format, void *data, unsigned int samples)
 {
 	int width;
-	unsigned char *dst, *pat;
+	unsigned char *dst;
+	const unsigned char *pat;
 
 	if ((INT)format < 0 || (INT)format > (INT)SNDRV_PCM_FORMAT_LAST)
 		return -EINVAL;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
