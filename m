Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DD678B376
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 16:46:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6724DF6;
	Mon, 28 Aug 2023 16:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6724DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693233972;
	bh=fqGGVCHBdZFfZXkRgSitLbnV7ps6uhGiami06HLbBQg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RKMEjl1Ux5IYVt10MfcMcG508er/MqfFD/Ut+BpLW1MHWH3jVdf1Lvsu/mzn/fZKd
	 CNUsBEdU+SYC5wq/i7l6ZigGCyrcxV8SIfXMy9cC9Dgxq81h7VpvhQF6c/n4AfjgGm
	 8ZUmWae9npT/V1hlH4ZHtm8csKldcEkyv5Wn8BGo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA8C0F8055C; Mon, 28 Aug 2023 16:44:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39A77F8023B;
	Mon, 28 Aug 2023 16:44:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAB66F80536; Mon, 28 Aug 2023 16:44:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDA02F80155
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 16:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDA02F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OLID40qH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=56nxCKsq
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D0DA8216DA;
	Mon, 28 Aug 2023 14:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693233857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ghjYaxVh7jogbgE7dc+bGEjQigeP9WzVjQRIH9weW+k=;
	b=OLID40qHQHfCpmkcu0VcXXVG8rEPKAq3GQ14qIo2F86s3jpxD2EqdFMjRjinh7+jziMfQh
	dNloQwoFPkB0V2KPMv9KMBJLtn3Z+6cY27Wa3iSyLMIg1zckBl//QVw0hr9QIAvpvwtPoR
	wSYwCaAhafnfwv4BU/5vTTc1Avhu8rI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693233857;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ghjYaxVh7jogbgE7dc+bGEjQigeP9WzVjQRIH9weW+k=;
	b=56nxCKsqn8dh2D5CCCUu8kyiLVD93m1IvYrePdhyG7gbVTQ8J7Gz/lLpsmyGYfJjU+F/6k
	JuI6Oy+QXzza5sBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF831139CC;
	Mon, 28 Aug 2023 14:44:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yM7kKcGy7GQMZgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 28 Aug 2023 14:44:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 2/2] aseqdump: Add options to switch view mode
Date: Mon, 28 Aug 2023 16:44:14 +0200
Message-Id: <20230828144414.8905-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230828144414.8905-1-tiwai@suse.de>
References: <20230828144414.8905-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3ZFFYHPDOB5NC5A23Y65PQBRPJIW72NC
X-Message-ID-Hash: 3ZFFYHPDOB5NC5A23Y65PQBRPJIW72NC
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZFFYHPDOB5NC5A23Y65PQBRPJIW72NC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds to switch the operation mode of aseqdump to specify
how the values are shown.  Namely, it allows to show the MIDI 2.0
values in two more different ways: compatible "normalized" view and
percentage view, in addition to the default "raw" view.

The "raw" view mode just shows the value found in the event almost as
is.  The MIDI 2.0 values are shown in 16 or 32bit hex numbers.
The channel and UMP group numbers are 0-based, taking from 0 to 15.

OTOH, in the normalized view, the 16bit or 32bit velocity and data
values of MIDI 2.0 are normalized to the value fit in MIDI 1.0,
i.e. from 0 to 127, but with decimal points.  Similarly, the pitch
wheel values are normalized between -8192 to 8191.
Also, the channel numbers and UMP group numbers are 1-based, taking
from 1 to 16.

In the percentage view, the velocity and data values are normalized
and shown in percentage, from 0% to 100%.  The pitch wheel is
normalized from -100% to 100%.  The channel and UMP groups are 1-based
as well as in normalized view mode.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aseqdump/aseqdump.1 |  25 ++++
 seq/aseqdump/aseqdump.c | 252 +++++++++++++++++++++++++++++++++-------
 2 files changed, 234 insertions(+), 43 deletions(-)

diff --git a/seq/aseqdump/aseqdump.1 b/seq/aseqdump/aseqdump.1
index 6f7904159b90..7b389bd769ae 100644
--- a/seq/aseqdump/aseqdump.1
+++ b/seq/aseqdump/aseqdump.1
@@ -36,6 +36,31 @@ Sets the client MIDI version.
 .I \-r,\-\-raw
 Suppress the automatic conversion of events among UMP and legacy clients.
 
+.TP
+.I \-R,\-\-raw-view
+Shows the raw values as is.
+The channel numbers and UMP group numbers are 0-based in this mode.
+This is the default behavior.
+
+.TP
+.I \-N,\-\-normalized-view
+Shows the normalized values to be aligned with MIDI 1.0.
+The channel numbers and UMP group numbers are shown as 1-based values,
+i.e. 1 is the lowest number.
+The velocity and data values are normalized between 0 and 127.
+The values for MIDI 2.0 are shown with two digits decimal points (from
+0.00 to 127.00).
+The pitch wheel is normalized between -8192 to 8192, too.
+
+.TP
+.I \-P,\-\-percent-view
+Shows the values in percentage.
+The channel numbers and UMP group numbers are shown as 1-based values
+in this mode, too.
+The velocity and data values are normalized between 0 and 100%, shown
+with two digits decimal points.
+The pitch wheel is normalized between -100% to 100%, too.
+
 .TP
 .I \-p,\-\-port=client:port,...
 Sets the sequencer port(s) from which events are received.
diff --git a/seq/aseqdump/aseqdump.c b/seq/aseqdump/aseqdump.c
index a15e0752f0f1..f83392f8abc4 100644
--- a/seq/aseqdump/aseqdump.c
+++ b/seq/aseqdump/aseqdump.c
@@ -33,6 +33,10 @@
 #include <alsa/ump_msg.h>
 #endif
 
+enum {
+	VIEW_RAW, VIEW_NORMALIZED, VIEW_PERCENT
+};
+
 static snd_seq_t *seq;
 static int port_count;
 static snd_seq_addr_t *ports;
@@ -42,6 +46,7 @@ static int ump_version;
 #else
 #define ump_version	0
 #endif
+static int view_mode = VIEW_RAW;
 
 /* prints an error message to stderr, and dies */
 static void fatal(const char *msg, ...)
@@ -135,6 +140,50 @@ static void connect_ports(void)
 	}
 }
 
+static int channel_number(unsigned char c)
+{
+	if (view_mode != VIEW_RAW)
+		return c + 1;
+	else
+		return c;
+}
+
+static const char *midi1_data(unsigned int v)
+{
+	static char tmp[32];
+
+	if (view_mode == VIEW_PERCENT) {
+		if (v <= 64)
+			snprintf(tmp, sizeof(tmp), "%.2f%%",
+				 ((double)v * 50.0) / 64);
+		else
+			snprintf(tmp, sizeof(tmp), "%.2f%%",
+				 ((double)(v - 64) * 50.0) / 63 + 50.0);
+		return tmp;
+	}
+
+	sprintf(tmp, "%d", v);
+	return tmp;
+}
+
+static const char *midi1_pitchbend(int v)
+{
+	static char tmp[32];
+
+	if (view_mode == VIEW_PERCENT) {
+		if (v < 0)
+			snprintf(tmp, sizeof(tmp), "%.2f%%",
+				 ((double)v * 100.0) / 8192);
+		else
+			snprintf(tmp, sizeof(tmp), "%.2f%%",
+				 ((double)v * 100.0) / 8191);
+		return tmp;
+	}
+
+	sprintf(tmp, "%d", v);
+	return tmp;
+}
+
 static void dump_event(const snd_seq_event_t *ev)
 {
 	printf("%3d:%-3d ", ev->source.client, ev->source.port);
@@ -142,47 +191,61 @@ static void dump_event(const snd_seq_event_t *ev)
 	switch (ev->type) {
 	case SND_SEQ_EVENT_NOTEON:
 		if (ev->data.note.velocity)
-			printf("Note on                %2d, note %d, velocity %d\n",
-			       ev->data.note.channel, ev->data.note.note, ev->data.note.velocity);
+			printf("Note on                %2d, note %d, velocity %s\n",
+			       channel_number(ev->data.note.channel),
+			       ev->data.note.note,
+			       midi1_data(ev->data.note.velocity));
 		else
 			printf("Note off               %2d, note %d\n",
-			       ev->data.note.channel, ev->data.note.note);
+			       channel_number(ev->data.note.channel),
+			       ev->data.note.note);
 		break;
 	case SND_SEQ_EVENT_NOTEOFF:
-		printf("Note off               %2d, note %d, velocity %d\n",
-		       ev->data.note.channel, ev->data.note.note, ev->data.note.velocity);
+		printf("Note off               %2d, note %d, velocity %s\n",
+		       channel_number(ev->data.note.channel),
+		       ev->data.note.note,
+		       midi1_data(ev->data.note.velocity));
 		break;
 	case SND_SEQ_EVENT_KEYPRESS:
-		printf("Polyphonic aftertouch  %2d, note %d, value %d\n",
-		       ev->data.note.channel, ev->data.note.note, ev->data.note.velocity);
+		printf("Polyphonic aftertouch  %2d, note %d, value %s\n",
+		       channel_number(ev->data.note.channel),
+		       ev->data.note.note,
+		       midi1_data(ev->data.note.velocity));
 		break;
 	case SND_SEQ_EVENT_CONTROLLER:
 		printf("Control change         %2d, controller %d, value %d\n",
-		       ev->data.control.channel, ev->data.control.param, ev->data.control.value);
+		       channel_number(ev->data.control.channel),
+		       ev->data.control.param, ev->data.control.value);
 		break;
 	case SND_SEQ_EVENT_PGMCHANGE:
 		printf("Program change         %2d, program %d\n",
-		       ev->data.control.channel, ev->data.control.value);
+		       channel_number(ev->data.control.channel),
+		       ev->data.control.value);
 		break;
 	case SND_SEQ_EVENT_CHANPRESS:
-		printf("Channel aftertouch     %2d, value %d\n",
-		       ev->data.control.channel, ev->data.control.value);
+		printf("Channel aftertouch     %2d, value %s\n",
+		       channel_number(ev->data.control.channel),
+		       midi1_data(ev->data.control.value));
 		break;
 	case SND_SEQ_EVENT_PITCHBEND:
-		printf("Pitch bend             %2d, value %d\n",
-		       ev->data.control.channel, ev->data.control.value);
+		printf("Pitch bend             %2d, value %s\n",
+		       channel_number(ev->data.control.channel),
+		       midi1_pitchbend(ev->data.control.value));
 		break;
 	case SND_SEQ_EVENT_CONTROL14:
 		printf("Control change         %2d, controller %d, value %5d\n",
-		       ev->data.control.channel, ev->data.control.param, ev->data.control.value);
+		       channel_number(ev->data.control.channel),
+		       ev->data.control.param, ev->data.control.value);
 		break;
 	case SND_SEQ_EVENT_NONREGPARAM:
 		printf("Non-reg. parameter     %2d, parameter %d, value %d\n",
-		       ev->data.control.channel, ev->data.control.param, ev->data.control.value);
+		       channel_number(ev->data.control.channel),
+		       ev->data.control.param, ev->data.control.value);
 		break;
 	case SND_SEQ_EVENT_REGPARAM:
 		printf("Reg. parameter         %2d, parameter %d, value %d\n",
-		       ev->data.control.channel, ev->data.control.param, ev->data.control.value);
+		       channel_number(ev->data.control.channel),
+		       ev->data.control.param, ev->data.control.value);
 		break;
 	case SND_SEQ_EVENT_SONGPOS:
 		printf("Song position pointer      value %d\n",
@@ -306,32 +369,44 @@ static void dump_event(const snd_seq_event_t *ev)
 }
 
 #ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
-static int pitchbend_value(u8 msb, u8 lsb)
+static int group_number(unsigned char c)
+{
+	if (view_mode != VIEW_RAW)
+		return c + 1;
+	else
+		return c;
+}
+
+static const char *pitchbend_value(u8 msb, u8 lsb)
 {
 	int pb = (msb << 7) | lsb;
-	return pb - 8192;
+
+	return midi1_pitchbend(pb - 8192);
 }
 
 static void dump_ump_midi1_event(const unsigned int *ump)
 {
 	const snd_ump_msg_midi1_t *m = (const snd_ump_msg_midi1_t *)ump;
-	unsigned char group = m->hdr.group;
+	unsigned char group = group_number(m->hdr.group);
 	unsigned char status = m->hdr.status;
-	unsigned char channel = m->hdr.channel;
+	unsigned char channel = channel_number(m->hdr.channel);
 
 	printf("Group %2d, ", group);
 	switch (status) {
 	case SND_UMP_MSG_NOTE_OFF:
-		printf("Note off               %2d, note %d, velocity %d",
-		       channel, m->note_off.note, m->note_off.velocity);
+		printf("Note off               %2d, note %d, velocity %s",
+		       channel, m->note_off.note,
+		       midi1_data(m->note_off.velocity));
 		break;
 	case SND_UMP_MSG_NOTE_ON:
-		printf("Note on                %2d, note %d, velocity %d",
-		       channel, m->note_off.note, m->note_off.velocity);
+		printf("Note on                %2d, note %d, velocity %s",
+		       channel, m->note_off.note,
+		       midi1_data(m->note_off.velocity));
 		break;
 	case SND_UMP_MSG_POLY_PRESSURE:
-		printf("Poly pressure          %2d, note %d, value %d",
-		       channel, m->poly_pressure.note, m->poly_pressure.data);
+		printf("Poly pressure          %2d, note %d, value %s",
+		       channel, m->poly_pressure.note,
+		       midi1_data(m->poly_pressure.data));
 		break;
 	case SND_UMP_MSG_CONTROL_CHANGE:
 		printf("Control change         %2d, controller %d, value %d",
@@ -342,10 +417,10 @@ static void dump_ump_midi1_event(const unsigned int *ump)
 		       channel, m->program_change.program);
 	case SND_UMP_MSG_CHANNEL_PRESSURE:
 		printf("Channel pressure       %2d, value %d",
-		       channel, m->channel_pressure.data);
+		       channel, midi1_data(m->channel_pressure.data));
 		break;
 	case SND_UMP_MSG_PITCHBEND:
-		printf("Pitchbend              %2d, value %d",
+		printf("Pitchbend              %2d, value %s",
 		       channel, pitchbend_value(m->pitchbend.data_msb,
 						m->pitchbend.data_lsb));
 		break;
@@ -357,12 +432,83 @@ static void dump_ump_midi1_event(const unsigned int *ump)
 	printf("\n");
 }
 
+static const char *midi2_velocity(unsigned int v)
+{
+	static char tmp[32];
+
+	if (view_mode == VIEW_NORMALIZED) {
+		if (v <= 0x8000)
+			snprintf(tmp, sizeof(tmp), "%.2f",
+				 ((double)v * 64.0) / 0x8000);
+		else
+			snprintf(tmp, sizeof(tmp), ".2%f",
+				 ((double)(v - 0x8000) * 63.0) / 0x7fff + 64.0);
+		return tmp;
+	} else if (view_mode == VIEW_PERCENT) {
+		snprintf(tmp, sizeof(tmp), "%.2f%%", (double)v * 100.0) / 0xffff);
+		return tmp;
+	}
+
+	sprintf(tmp, "0x%x", v);
+	return tmp;
+}
+
+static const char *midi2_data(unsigned int v)
+{
+	static char tmp[32];
+
+	if (view_mode == VIEW_NORMALIZED) {
+		if (!v)
+			return "0";
+		else if (v == 0xffffffffU)
+			return "127";
+		if (v <= 0x80000000)
+			snprintf(tmp, sizeof(tmp), "%.2f",
+				 ((double)v * 64.0) / 0x80000000U);
+		else
+			snprintf(tmp, sizeof(tmp), "%.2f",
+				 ((double)(v - 0x80000000U) * 63.0) / 0x7fffffffU + 64.0);
+		return tmp;
+	} else if (view_mode == VIEW_PERCENT) {
+		snprintf(tmp, sizeof(tmp), "%.2f%%", (double)v * 100.0) / 0xffffffffU);
+		return tmp;
+	}
+
+	sprintf(tmp, "0x%x", v);
+	return tmp;
+}
+
+static const char *midi2_pitchbend(unsigned int v)
+{
+	static char tmp[32];
+
+	if (view_mode == VIEW_NORMALIZED) {
+		if (!v)
+			return "-8192";
+		else if (v == 0xffffffffU)
+			return "8191";
+		if (v <= 0x80000000)
+			snprintf(tmp, sizeof(tmp), "%.2f",
+				 ((int)(v ^ 0x80000000U) * 8192.0) / 0x80000000U);
+		else
+			snprintf(tmp, sizeof(tmp), "%.2f",
+				 ((double)(v - 0x80000000U) * 8191.0) / 0x7fffffffU + 8192.0);
+		return tmp;
+	} else if (view_mode == VIEW_PERCENT) {
+		snprintf(tmp, sizeof(tmp), "%.2f%%", ((int)(v ^ 0x80000000U) * 100.0) / 0xffffffffU);
+		return tmp;
+	}
+
+	sprintf(tmp, "0x%x", v);
+	return tmp;
+}
+
 static void dump_ump_midi2_event(const unsigned int *ump)
 {
 	const snd_ump_msg_midi2_t *m = (const snd_ump_msg_midi2_t *)ump;
-	unsigned char group = m->hdr.group;
+	unsigned char group = group_number(m->hdr.group);
 	unsigned char status = m->hdr.status;
-	unsigned char channel = m->hdr.channel;
+	unsigned char channel = channel_number(m->hdr.channel);
 	unsigned int bank;
 
 	printf("Group %2d, ", group);
@@ -394,23 +540,26 @@ static void dump_ump_midi2_event(const unsigned int *ump)
 		       channel, m->rpn.bank, m->rpn.index, m->rpn.data);
 		break;
 	case SND_UMP_MSG_PER_NOTE_PITCHBEND:
-		printf("Per-note pitchbend     %2d, note %d, value 0x%x",
+		printf("Per-note pitchbend     %2d, note %d, value %s",
 		       channel, m->per_note_pitchbend.note,
-		       m->per_note_pitchbend.data);
+		       midi2_pitchbend(m->per_note_pitchbend.data));
 		break;
 	case SND_UMP_MSG_NOTE_OFF:
-		printf("Note off               %2d, note %d, velocity 0x%x, attr type = %d, data = 0x%x",
-		       channel, m->note_off.note, m->note_off.velocity,
+		printf("Note off               %2d, note %d, velocity %s, attr type = %d, data = 0x%x",
+		       channel, m->note_off.note,
+		       midi2_velocity(m->note_off.velocity),
 		       m->note_off.attr_type, m->note_off.attr_data);
 		break;
 	case SND_UMP_MSG_NOTE_ON:
-		printf("Note on                %2d, note %d, velocity 0x%x, attr type = %d, data = 0x%x",
-		       channel, m->note_off.note, m->note_off.velocity,
+		printf("Note on                %2d, note %d, velocity %s, attr type = %d, data = 0x%x",
+		       channel, m->note_off.note,
+		       midi2_velocity(m->note_off.velocity),
 		       m->note_off.attr_type, m->note_off.attr_data);
 		break;
 	case SND_UMP_MSG_POLY_PRESSURE:
-		printf("Poly pressure          %2d, note %d, value 0x%x",
-		       channel, m->poly_pressure.note, m->poly_pressure.data);
+		printf("Poly pressure          %2d, note %d, value %s",
+		       channel, m->poly_pressure.note,
+		       midi2_data(m->poly_pressure.data));
 		break;
 	case SND_UMP_MSG_CONTROL_CHANGE:
 		printf("Control change         %2d, controller %d, value 0x%x",
@@ -425,12 +574,14 @@ static void dump_ump_midi2_event(const unsigned int *ump)
 			       m->program_change.bank_lsb);
 		break;
 	case SND_UMP_MSG_CHANNEL_PRESSURE:
-		printf("Channel pressure       %2d, value 0x%x",
-		       channel, m->channel_pressure.data);
+		printf("Channel pressure       %2d, value %s",
+		       channel,
+		       midi2_data(m->channel_pressure.data));
 		break;
 	case SND_UMP_MSG_PITCHBEND:
-		printf("Channel pressure       %2d, value 0x%x",
-		       channel, m->channel_pressure.data);
+		printf("Channel pressure       %2d, value %s",
+		       channel,
+		       midi2_pitchbend(m->channel_pressure.data));
 		break;
 	case SND_UMP_MSG_PER_NOTE_MGMT:
 		printf("Per-note management    %2d, value 0x%x",
@@ -509,6 +660,9 @@ static void help(const char *argv0)
 		"  -h,--help                  this help\n"
 		"  -V,--version               show version\n"
 		"  -l,--list                  list input ports\n"
+		"  -N,--normalized-view       show normalized values\n"
+		"  -P,--percent-view          show percent values\n"
+		"  -R,--raw-view              show raw values (default)\n"
 #ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 		"  -u,--ump=version           set client MIDI version (0=legacy, 1= UMP MIDI 1.0, 2=UMP MIDI2.0)\n"
 		"  -r,--raw                   do not convert UMP and legacy events\n"
@@ -529,7 +683,7 @@ static void sighandler(int sig)
 
 int main(int argc, char *argv[])
 {
-	static const char short_options[] = "hVlp:"
+	static const char short_options[] = "hVlp:NPR"
 #ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 		"u:r"
 #endif
@@ -539,6 +693,9 @@ int main(int argc, char *argv[])
 		{"version", 0, NULL, 'V'},
 		{"list", 0, NULL, 'l'},
 		{"port", 1, NULL, 'p'},
+		{"normalized-view", 0, NULL, 'N'},
+		{"percent-view", 0, NULL, 'P'},
+		{"raw-view", 0, NULL, 'R'},
 #ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 		{"ump", 1, NULL, 'u'},
 		{"raw", 0, NULL, 'r'},
@@ -568,6 +725,15 @@ int main(int argc, char *argv[])
 		case 'p':
 			parse_ports(optarg);
 			break;
+		case 'R':
+			view_mode = VIEW_RAW;
+			break;
+		case 'P':
+			view_mode = VIEW_PERCENT;
+			break;
+		case 'N':
+			view_mode = VIEW_NORMALIZED;
+			break;
 #ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 		case 'u':
 			ump_version = atoi(optarg);
-- 
2.35.3

