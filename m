Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1576DC59088
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Nov 2025 18:14:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71AB660200;
	Thu, 13 Nov 2025 18:13:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71AB660200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763054043;
	bh=ii7ANwh0M0cFyeL601GA58+SOGaDe5Ox+U/KwkgBhHA=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K0GxSi73Gxr4zdyG+iE33ZK3/x/gD3Iw9oiGovzjpYtwxJulvqWD6SnpG71Qw9STM
	 abJFQxdpWO7v8kYBK1pYF79s9X8Ae7PUeU+eJlu3wlGTG4VemY5odbOjr87p8F/tfl
	 0raGXxh/y9wt+q4Ma39TLI+OIH8OutVLdBvO5uX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6D79F805BB; Thu, 13 Nov 2025 18:13:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBEE7F805B3;
	Thu, 13 Nov 2025 18:13:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D944F80533; Thu, 13 Nov 2025 18:13:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 704D3F80027
	for <alsa-devel@alsa-project.org>; Thu, 13 Nov 2025 18:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 704D3F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=AjkLSbi4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vwldWsPj;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=AjkLSbi4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vwldWsPj
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 634C61F46E;
	Thu, 13 Nov 2025 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1763053988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=F/W3XuENEln8fO67GyPaBRATX8Kdj5JU8cCSuRzIJ2I=;
	b=AjkLSbi4dPzLIgFkdxnXOShbzGhEFMNP/kIrvpJGZ551hPHB3By+r8TkJ6vAceHARlrQc4
	+O2pC7CQZuOj5W9+dvGFcEznH/NoO2O2hIB1GtQaFbKRdLxe7MsqqIXpaw7s/PlNoRpHTA
	mxSf96K6UcGLPMCOMaYvgMVJJncwDuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763053988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=F/W3XuENEln8fO67GyPaBRATX8Kdj5JU8cCSuRzIJ2I=;
	b=vwldWsPj7MkB+3SkxlfTi+HSznObOESZtDW7exgKIOwQW1DQAVJFZBl55lz4i5bOokkfWY
	qNZUccU/hoS3E5Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1763053988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=F/W3XuENEln8fO67GyPaBRATX8Kdj5JU8cCSuRzIJ2I=;
	b=AjkLSbi4dPzLIgFkdxnXOShbzGhEFMNP/kIrvpJGZ551hPHB3By+r8TkJ6vAceHARlrQc4
	+O2pC7CQZuOj5W9+dvGFcEznH/NoO2O2hIB1GtQaFbKRdLxe7MsqqIXpaw7s/PlNoRpHTA
	mxSf96K6UcGLPMCOMaYvgMVJJncwDuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763053988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=F/W3XuENEln8fO67GyPaBRATX8Kdj5JU8cCSuRzIJ2I=;
	b=vwldWsPj7MkB+3SkxlfTi+HSznObOESZtDW7exgKIOwQW1DQAVJFZBl55lz4i5bOokkfWY
	qNZUccU/hoS3E5Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B4233EA61;
	Thu, 13 Nov 2025 17:13:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7Ns+EaQRFmncRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Nov 2025 17:13:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils] amidi: Ignore inactive MIDI ports as default at
 listing
Date: Thu, 13 Nov 2025 18:13:05 +0100
Message-ID: <20251113171306.888404-1-tiwai@suse.de>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: 7IGKH7FMKYIWZ7WIPCQALDBRGMZ4T5RX
X-Message-ID-Hash: 7IGKH7FMKYIWZ7WIPCQALDBRGMZ4T5RX
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7IGKH7FMKYIWZ7WIPCQALDBRGMZ4T5RX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When listing the devices, currently we show all MIDI ports including
inactive ones.  But those inactive ports are rarely useful, and it'd
be more convenient to filter them out.

This patch introduces the filtering of inactive ports at listing
devices via amidi -l option.  When user needs to scan all MIDI ports
including inactive ports, pass the new option -x in addition.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 amidi/amidi.1 |  5 +++++
 amidi/amidi.c | 11 ++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/amidi/amidi.1 b/amidi/amidi.1
index 5bc24ba3ad54..d3d321f16558 100644
--- a/amidi/amidi.1
+++ b/amidi/amidi.1
@@ -52,6 +52,11 @@ Prints the current version.
 .I \-l, \-\-list\-devices
 Prints a list of all hardware MIDI ports.
 
+.TP
+.I \-x, \-\-list\-inactive
+Use together with \fI\-l\fP option.
+Print all MIDI ports including inactive ports.
+
 .TP
 .I \-L, \-\-list\-rawmidis
 Prints all RawMIDI definitions.
diff --git a/amidi/amidi.c b/amidi/amidi.c
index 75fb8c0a42a3..9a2aaf7205f0 100644
--- a/amidi/amidi.c
+++ b/amidi/amidi.c
@@ -57,6 +57,7 @@ static int stop;
 static int sysex_interval;
 static snd_rawmidi_t *input, **inputp;
 static snd_rawmidi_t *output, **outputp;
+static int list_all;
 
 static void error(const char *format, ...)
 {
@@ -76,6 +77,7 @@ static void usage(void)
 		"-h, --help                      this help\n"
 		"-V, --version                   print current version\n"
 		"-l, --list-devices              list all hardware ports\n"
+		"-x, --list-inactive             list inactive ports, too\n"
 		"-L, --list-rawmidis             list all RawMIDI definitions\n"
 		"-p, --port=name                 select port by name\n"
 		"-s, --send=file                 send the contents of a (.syx) file\n"
@@ -151,6 +153,9 @@ static void list_device(snd_ctl_t *ctl, int card, int device)
 			      card, device, sub, snd_strerror(err));
 			return;
 		}
+		if (!list_all &&
+		    (snd_rawmidi_info_get_flags(info) & SNDRV_RAWMIDI_INFO_STREAM_INACTIVE))
+			continue;
 		name = snd_rawmidi_info_get_name(info);
 		sub_name = snd_rawmidi_info_get_subdevice_name(info);
 		if (sub == 0 && sub_name[0] == '\0') {
@@ -471,11 +476,12 @@ static void add_send_hex_data(const char *str)
 
 int main(int argc, char *argv[])
 {
-	static const char short_options[] = "hVlLp:s:r:S::dt:aci:T:";
+	static const char short_options[] = "hVlxLp:s:r:S::dt:aci:T:";
 	static const struct option long_options[] = {
 		{"help", 0, NULL, 'h'},
 		{"version", 0, NULL, 'V'},
 		{"list-devices", 0, NULL, 'l'},
+		{"list-inactive", 0, NULL, 'x'},
 		{"list-rawmidis", 0, NULL, 'L'},
 		{"port", 1, NULL, 'p'},
 		{"send", 1, NULL, 's'},
@@ -508,6 +514,9 @@ int main(int argc, char *argv[])
 		case 'l':
 			do_device_list = 1;
 			break;
+		case 'x':
+			list_all = 1;
+			break;
 		case 'L':
 			do_rawmidi_list = 1;
 			break;
-- 
2.51.1

