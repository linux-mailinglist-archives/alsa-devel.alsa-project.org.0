Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA5021E1F8
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jul 2020 23:19:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E91491673;
	Mon, 13 Jul 2020 23:18:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E91491673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594675179;
	bh=sGOjC6BMu6x8LTeHIsWMHGIJmd4rJydmIQ1dRE3+dnU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rj9poUivb/NYLuqHZ77k5J3YvvBe/R4ev9pHj5pr70tNQ8XPqKRr1HjzzKyafwKJl
	 3IIDLSzm6xG0PsfMtm0Tlfz41fMXXtg0qtWnuZwspfbtWLWddL0wOnJQ0XTkOmd5Uw
	 P7hYiI1FZ+b9yNVk3cKTstnoeV0cToBlpRSXjKtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18BD4F800B2;
	Mon, 13 Jul 2020 23:17:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAE0BF80260; Mon, 13 Jul 2020 23:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.horus.com (mail.horus.com [78.46.148.228])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0188DF8021D
 for <alsa-devel@alsa-project.org>; Mon, 13 Jul 2020 23:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0188DF8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=horus.com header.i=@horus.com
 header.b="Bs8A1aEQ"
Received: from lenny.lan (178-190-192-205.adsl.highway.telekom.at
 [178.190.192.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "E-Mail Matthias Reichl Lenny",
 Issuer "HiassofT CA 2014" (verified OK))
 by mail.horus.com (Postfix) with ESMTPSA id 0BC026409C;
 Mon, 13 Jul 2020 23:17:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
 s=20180324; t=1594675025;
 bh=9dGOAJ8Jf6y6N0rgi1GL8exTfI2Y7e66iae2xbJ5Mx8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bs8A1aEQ8zPcwkXhVHVExx0n6BALO6CqT5esgQMa8EBWjNb/MBG4Jb6I0PPTYeLZ+
 DQDAN/wTzmz8M7hwn3brbrvviZE0CCQV8m4Hjnz3mXdDzX+xX29TdM3hEoDHTRK//E
 gNwY1V5utRUi5meHikNlsUfzv55/wVARwdnxUFlg=
Received: by lenny.lan (Postfix, from userid 1000)
 id 695A52021C3; Mon, 13 Jul 2020 23:17:04 +0200 (CEST)
From: Matthias Reichl <hias@horus.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 1/2] pcm: iec958: implement HDMI HBR audio formatting
Date: Mon, 13 Jul 2020 23:17:03 +0200
Message-Id: <20200713211704.19083-2-hias@horus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200713211704.19083-1-hias@horus.com>
References: <20200713211704.19083-1-hias@horus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Dom Cobley <popcornmix@gmail.com>, alsa-devel@alsa-project.org
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

High bitrate compressed audio data like DTS HD or MAT is usually
packed into 8-channel data. The HDMI specs state this has to be
formatted as a single IEC958 stream, compared to normal multi-
channel PCM data which has to be formatted as parallel IEC958 streams.

As this single-stream formatting mode may break existing setups that
expect non-PCM multichannel data to be formatted as parallel IEC958
streams it needs to be explicitly selected by setting the hdmi_mode
option to true.

The single-stream formatting implementation is prepared to cope with
arbitrary channel counts but only limited testing was done for channel
counts other than 8.

Signed-off-by: Matthias Reichl <hias@horus.com>
---
 src/pcm/pcm_iec958.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/src/pcm/pcm_iec958.c b/src/pcm/pcm_iec958.c
index 76d3ca7b..17ade957 100644
--- a/src/pcm/pcm_iec958.c
+++ b/src/pcm/pcm_iec958.c
@@ -63,6 +63,7 @@ struct snd_pcm_iec958 {
 	unsigned int byteswap;
 	unsigned char preamble[3];	/* B/M/W or Z/X/Y */
 	snd_pcm_fast_ops_t fops;
+	int hdmi_mode;
 };
 
 enum { PREAMBLE_Z, PREAMBLE_X, PREAMBLE_Y };
@@ -193,6 +194,10 @@ static void snd_pcm_iec958_encode(snd_pcm_iec958_t *iec,
 	unsigned int channel;
 	int32_t sample = 0;
 	int counter = iec->counter;
+	int single_stream = iec->hdmi_mode &&
+			    (iec->status[0] & IEC958_AES0_NONAUDIO) &&
+			    (channels == 8);
+	int counter_step = single_stream ? ((channels + 1) >> 1) : 1;
 	for (channel = 0; channel < channels; ++channel) {
 		const char *src;
 		uint32_t *dst;
@@ -205,7 +210,12 @@ static void snd_pcm_iec958_encode(snd_pcm_iec958_t *iec,
 		src_step = snd_pcm_channel_area_step(src_area);
 		dst_step = snd_pcm_channel_area_step(dst_area) / sizeof(uint32_t);
 		frames1 = frames;
-		iec->counter = counter;
+
+		if (single_stream)
+			iec->counter = (counter + (channel >> 1)) % 192;
+		else
+			iec->counter = counter;
+
 		while (frames1-- > 0) {
 			goto *get;
 #define GET32_END after
@@ -217,9 +227,11 @@ static void snd_pcm_iec958_encode(snd_pcm_iec958_t *iec,
 			*dst = sample;
 			src += src_step;
 			dst += dst_step;
-			iec->counter++;
+			iec->counter += counter_step;
 			iec->counter %= 192;
 		}
+		if (single_stream) /* set counter to ch0 value for next iteration */
+			iec->counter = (counter + frames * counter_step) % 192;
 	}
 }
 #endif /* DOC_HIDDEN */
@@ -473,6 +485,7 @@ static const snd_pcm_ops_t snd_pcm_iec958_ops = {
  * \param close_slave When set, the slave PCM handle is closed with copy PCM
  * \param status_bits The IEC958 status bits
  * \param preamble_vals The preamble byte values
+ * \param hdmi_mode When set, enable HDMI compliant formatting
  * \retval zero on success otherwise a negative error code
  * \warning Using of this function might be dangerous in the sense
  *          of compatibility reasons. The prototype might be freely
@@ -481,7 +494,8 @@ static const snd_pcm_ops_t snd_pcm_iec958_ops = {
 int snd_pcm_iec958_open(snd_pcm_t **pcmp, const char *name, snd_pcm_format_t sformat,
 			snd_pcm_t *slave, int close_slave,
 			const unsigned char *status_bits,
-			const unsigned char *preamble_vals)
+			const unsigned char *preamble_vals,
+		        int hdmi_mode)
 {
 	snd_pcm_t *pcm;
 	snd_pcm_iec958_t *iec;
@@ -519,6 +533,8 @@ int snd_pcm_iec958_open(snd_pcm_t **pcmp, const char *name, snd_pcm_format_t sfo
 
 	memcpy(iec->preamble, preamble_vals, 3);
 
+	iec->hdmi_mode = hdmi_mode;
+
 	err = snd_pcm_new(&pcm, SND_PCM_TYPE_IEC958, name, slave->stream, slave->mode);
 	if (err < 0) {
 		free(iec);
@@ -566,9 +582,14 @@ pcm.name {
 	[preamble.z or preamble.b val]
 	[preamble.x or preamble.m val]
 	[preamble.y or preamble.w val]
+	[hdmi_mode true]
 }
 \endcode
 
+When <code>hdmi_mode</code> is true, 8-channel compressed data is
+formatted as 4 contiguous frames of a single IEC958 stream as required
+by the HDMI HBR specification.
+
 \subsection pcm_plugins_iec958_funcref Function reference
 
 <UL>
@@ -605,6 +626,7 @@ int _snd_pcm_iec958_open(snd_pcm_t **pcmp, const char *name,
 	unsigned char preamble_vals[3] = {
 		0x08, 0x02, 0x04 /* Z, X, Y */
 	};
+	int hdmi_mode = 0;
 
 	snd_config_for_each(i, next, conf) {
 		snd_config_t *n = snd_config_iterator_entry(i);
@@ -633,6 +655,13 @@ int _snd_pcm_iec958_open(snd_pcm_t **pcmp, const char *name,
 			preamble = n;
 			continue;
 		}
+		if (strcmp(id, "hdmi_mode") == 0) {
+			err = snd_config_get_bool(n);
+			if (err < 0)
+				continue;
+			hdmi_mode = err;
+			continue;
+		}
 		SNDERR("Unknown field %s", id);
 		return -EINVAL;
 	}
@@ -707,7 +736,7 @@ int _snd_pcm_iec958_open(snd_pcm_t **pcmp, const char *name,
 		return err;
 	err = snd_pcm_iec958_open(pcmp, name, sformat, spcm, 1,
 				  status ? status_bits : NULL,
-				  preamble_vals);
+				  preamble_vals, hdmi_mode);
 	if (err < 0)
 		snd_pcm_close(spcm);
 	return err;
-- 
2.20.1

