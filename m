Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14682655CE3
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Dec 2022 11:59:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26157D52C;
	Sun, 25 Dec 2022 11:58:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26157D52C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671965942;
	bh=abd0mVEQM7I72cKDMmDbh2wM5oMOO1QO5jSmSc4aYHM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cGgKcX3TtZ9JXFpllo3qxkohGxoipxTtaamdJlccCu1Shku50MUDhUxiZPNX+DTi+
	 eK8ZIhFHpfNcSYncnWhyzzgk/z3h6qvBFKiIGKqpQfFVZYksJtNY8ixw3I/ootBT5n
	 sIfNgPOfr9kWvqNlgcUVJ2zyr2j8DHHgisOzdgtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 717E6F800F0;
	Sun, 25 Dec 2022 11:58:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F56CF804E4; Sun, 25 Dec 2022 11:57:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4227F80245
 for <alsa-devel@alsa-project.org>; Sun, 25 Dec 2022 11:57:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4227F80245
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YFIADri7
Received: by mail-lj1-x22d.google.com with SMTP id f20so9293460lja.4
 for <alsa-devel@alsa-project.org>; Sun, 25 Dec 2022 02:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l4s2GGFfb+sBVOtWtZXtu/rRvR+LfWk6sRTYDUUVBeg=;
 b=YFIADri7ozqVw3TbphOz0fbGSSKPuak8nX8NvAqr3nhFT4F8iSfuDXSd+NTBxMG7LE
 TbaBG5G8JfraAMwFXSdH5g9+yxH8pGEHkKFZeUhx1rV6GQxcK/3Rmr1ITeJWxL39LoZ6
 hl91IjYUHVNsPnzeQjqPEUUBu6GuvV1pTwjDgXmainR+eBQlJf9WOzQdSXuQDcPl3JIw
 JzXgIN12UTUwC+sI8SXBLnN+XKTPHAAJgbAOP667zs2IGZl7YY3bYvy7dihRqnY7GZlS
 blkJDxFKnk/eaCvwnqsT4kMSv3qdopNw5tjhAtDt6Pxhm6pq2jCXa+VvVUTDyJsFKQCd
 TTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l4s2GGFfb+sBVOtWtZXtu/rRvR+LfWk6sRTYDUUVBeg=;
 b=M3hceU7Fv8qJ2QNzaRzZhKKvUvgKmNRvVd7n5N+KjI5I+bFKKD44U8+Y6ajusEQ1KA
 3ohhMYdo5l9dm4b5D32beUygZUPeHhTrnAl446hUaI/8FKav+dA0cYeK5dxswxbn5TC5
 PbIH153kBHSDLSLW53A3fn/M6emziNgVmdkZwqcKTGKqs+uj4AcMdc3i5rdnC43XiB5I
 yl6iBBnMLsINoh8NmPTJrR2eczJuTk3yUd+ctNyKKBt0AQuV+1aWPTGEgp91GyDVJAEC
 9bh3eum7ikVW+KxWxXxGnWJMncsfjIKvgXoCDeDbpTg10TEJ5QWJFdzR3onJrXOHnYWU
 6Nrg==
X-Gm-Message-State: AFqh2koq3+kj8m870Xz2fBFdQJP7NL3VbqLxImEpDVR1lL3ze14PHPrZ
 tIPCAv2fs6ZV52cH+5srVeGVeITSWvk=
X-Google-Smtp-Source: AMrXdXs2297Q8ICmERFgiCXcKVDB9B9WXO129vj0U6rKMZjdV9TcjGWESckvGtjKoHu8TiEZ0+fJIg==
X-Received: by 2002:a05:651c:c91:b0:27a:325b:7390 with SMTP id
 bz17-20020a05651c0c9100b0027a325b7390mr4591150ljb.34.1671965863437; 
 Sun, 25 Dec 2022 02:57:43 -0800 (PST)
Received: from localhost.localdomain
 (dl5zkyyyhqvp---tn498y-3.rev.dnainternet.fi.
 [2001:14ba:4e68:8000:66c:59ff:fe0b:c778])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a2e880a000000b002771057e0e5sm1013550ljh.76.2022.12.25.02.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 02:57:42 -0800 (PST)
From: Artem Egorkine <arteme@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: line6: correct midi status byte when receiving data
 from podxt
Date: Sun, 25 Dec 2022 12:57:27 +0200
Message-Id: <20221225105728.1153989-1-arteme@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Artem Egorkine <arteme@gmail.com>, tiwai@suse.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A PODxt device sends 0xb2, 0xc2 or 0xf2 as a status byte for MIDI
messages over USB that should otherwise have a 0xb0, 0xc0 or 0xf0
status byte. This is usually corrected by the driver on other OSes.

This fixes MIDI sysex messages sent by PODxt.

Signed-off-by: Artem Egorkine <arteme@gmail.com>
---
 sound/usb/line6/driver.c  |  3 ++-
 sound/usb/line6/midi.c    |  3 ++-
 sound/usb/line6/midibuf.c | 25 +++++++++++++++++--------
 sound/usb/line6/midibuf.h |  5 ++++-
 sound/usb/line6/pod.c     |  3 ++-
 5 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index 59faa5a9a714..b41373413224 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -304,7 +304,8 @@ static void line6_data_received(struct urb *urb)
 		for (;;) {
 			done =
 				line6_midibuf_read(mb, line6->buffer_message,
-						LINE6_MIDI_MESSAGE_MAXLEN);
+						LINE6_MIDI_MESSAGE_MAXLEN,
+					       	LINE6_MIDIBUF_READ_RX);
 
 			if (done <= 0)
 				break;
diff --git a/sound/usb/line6/midi.c b/sound/usb/line6/midi.c
index ba0e2b7e8fe1..d52355de2bbc 100644
--- a/sound/usb/line6/midi.c
+++ b/sound/usb/line6/midi.c
@@ -56,7 +56,8 @@ static void line6_midi_transmit(struct snd_rawmidi_substream *substream)
 
 	for (;;) {
 		done = line6_midibuf_read(mb, chunk,
-					  LINE6_FALLBACK_MAXPACKETSIZE);
+					  LINE6_FALLBACK_MAXPACKETSIZE,
+					  LINE6_MIDIBUF_READ_TX);
 
 		if (done == 0)
 			break;
diff --git a/sound/usb/line6/midibuf.c b/sound/usb/line6/midibuf.c
index 6a70463f82c4..e7f830f7526c 100644
--- a/sound/usb/line6/midibuf.c
+++ b/sound/usb/line6/midibuf.c
@@ -9,6 +9,7 @@
 
 #include "midibuf.h"
 
+
 static int midibuf_message_length(unsigned char code)
 {
 	int message_length;
@@ -20,12 +21,7 @@ static int midibuf_message_length(unsigned char code)
 
 		message_length = length[(code >> 4) - 8];
 	} else {
-		/*
-		   Note that according to the MIDI specification 0xf2 is
-		   the "Song Position Pointer", but this is used by Line 6
-		   to send sysex messages to the host.
-		 */
-		static const int length[] = { -1, 2, -1, 2, -1, -1, 1, 1, 1, 1,
+		static const int length[] = { -1, 2, 2, 2, -1, -1, 1, 1, 1, -1,
 			1, 1, 1, -1, 1, 1
 		};
 		message_length = length[code & 0x0f];
@@ -125,7 +121,7 @@ int line6_midibuf_write(struct midi_buffer *this, unsigned char *data,
 }
 
 int line6_midibuf_read(struct midi_buffer *this, unsigned char *data,
-		       int length)
+		       int length, int read_type)
 {
 	int bytes_used;
 	int length1, length2;
@@ -148,9 +144,22 @@ int line6_midibuf_read(struct midi_buffer *this, unsigned char *data,
 
 	length1 = this->size - this->pos_read;
 
-	/* check MIDI command length */
 	command = this->buf[this->pos_read];
+	/*
+	   PODxt always has status byte lower nibble set to 0010,
+	   when it means to send 0000, so we correct if here so
+	   that control/program changes come on channel 1 and
+	   sysex message status byte is correct
+	 */
+	if (read_type == LINE6_MIDIBUF_READ_RX) {
+		if (command == 0xb2 || command == 0xc2 || command == 0xf2) {
+			unsigned char fixed = command & 0xf0;
+			this->buf[this->pos_read] = fixed;
+			command = fixed;
+		}
+	}
 
+	/* check MIDI command length */
 	if (command & 0x80) {
 		midi_length = midibuf_message_length(command);
 		this->command_prev = command;
diff --git a/sound/usb/line6/midibuf.h b/sound/usb/line6/midibuf.h
index 124a8f9f7e96..542e8d836f87 100644
--- a/sound/usb/line6/midibuf.h
+++ b/sound/usb/line6/midibuf.h
@@ -8,6 +8,9 @@
 #ifndef MIDIBUF_H
 #define MIDIBUF_H
 
+#define LINE6_MIDIBUF_READ_TX 0
+#define LINE6_MIDIBUF_READ_RX 1
+
 struct midi_buffer {
 	unsigned char *buf;
 	int size;
@@ -23,7 +26,7 @@ extern void line6_midibuf_destroy(struct midi_buffer *mb);
 extern int line6_midibuf_ignore(struct midi_buffer *mb, int length);
 extern int line6_midibuf_init(struct midi_buffer *mb, int size, int split);
 extern int line6_midibuf_read(struct midi_buffer *mb, unsigned char *data,
-			      int length);
+			      int length, int read_type);
 extern void line6_midibuf_reset(struct midi_buffer *mb);
 extern int line6_midibuf_write(struct midi_buffer *mb, unsigned char *data,
 			       int length);
diff --git a/sound/usb/line6/pod.c b/sound/usb/line6/pod.c
index cd41aa7f0385..d173971e5f02 100644
--- a/sound/usb/line6/pod.c
+++ b/sound/usb/line6/pod.c
@@ -159,8 +159,9 @@ static struct line6_pcm_properties pod_pcm_properties = {
 	.bytes_per_channel = 3 /* SNDRV_PCM_FMTBIT_S24_3LE */
 };
 
+
 static const char pod_version_header[] = {
-	0xf2, 0x7e, 0x7f, 0x06, 0x02
+	0xf0, 0x7e, 0x7f, 0x06, 0x02
 };
 
 static char *pod_alloc_sysex_buffer(struct usb_line6_pod *pod, int code,
-- 
2.38.1

