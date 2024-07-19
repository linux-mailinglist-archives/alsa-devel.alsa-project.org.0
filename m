Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 088C19377CC
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2024 14:35:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4322084D;
	Fri, 19 Jul 2024 14:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4322084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721392504;
	bh=RaRikpHniiTLOCqLQDWsX6BNk13sQIHrVNZDt+k3FO0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Mf1eldjcgqkxkeKWY+HvOSvOUaRtkcXlEjcu8GWGw2UihbQWqKCc4OS5RgtxVDPr9
	 d3pUX3kv0Ivv6Lz9IPfieZ7rUoi/JRQsWS4aCNKIwf1DFB9+3ed8sNWwpBa5mBU30V
	 0FiXwtUAZkfhIhLzxrJl7+Ro4+zQxBg48czDjLpA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAB9AF805AC; Fri, 19 Jul 2024 14:34:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 873A5F805A9;
	Fri, 19 Jul 2024 14:34:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15C03F80508; Fri, 19 Jul 2024 14:34:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DA30F8007E
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 14:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DA30F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=oqKAlHRX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=z5MnAkgh;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=oqKAlHRX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=z5MnAkgh
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5423121AEA;
	Fri, 19 Jul 2024 12:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721392464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhSBEAwcCSL3JxnMvtEeexK6i5ZCnaKvrbHjVnSr9Hc=;
	b=oqKAlHRX0O8uI1mbXfaRIFlCoWKmNeZK3F7DilPzU7RFBUyoLAjcAwpGNpaA/+R1ZHLiOV
	1UxY1Zqgz68yWEO/C8asFL019arltA4qRtGtK/gRKtOJ37vIsZGI/Qy4FYG5/cGGJEN7RQ
	WB9ELFol/O65gmhTx7zulGkpgDBqt1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721392464;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhSBEAwcCSL3JxnMvtEeexK6i5ZCnaKvrbHjVnSr9Hc=;
	b=z5MnAkghghq01nVO8caBApQrFusMZm35MGJzzMFFhktn2c4yrK/+AR8v2fcYUPj+3queWu
	Lv76CPtMhNIP5JDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oqKAlHRX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=z5MnAkgh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721392464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhSBEAwcCSL3JxnMvtEeexK6i5ZCnaKvrbHjVnSr9Hc=;
	b=oqKAlHRX0O8uI1mbXfaRIFlCoWKmNeZK3F7DilPzU7RFBUyoLAjcAwpGNpaA/+R1ZHLiOV
	1UxY1Zqgz68yWEO/C8asFL019arltA4qRtGtK/gRKtOJ37vIsZGI/Qy4FYG5/cGGJEN7RQ
	WB9ELFol/O65gmhTx7zulGkpgDBqt1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721392464;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhSBEAwcCSL3JxnMvtEeexK6i5ZCnaKvrbHjVnSr9Hc=;
	b=z5MnAkghghq01nVO8caBApQrFusMZm35MGJzzMFFhktn2c4yrK/+AR8v2fcYUPj+3queWu
	Lv76CPtMhNIP5JDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C1AB13808;
	Fri, 19 Jul 2024 12:34:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mGCUCVBdmmbkfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Jul 2024 12:34:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 2/2] aseqdump: Support of UMP Stream and Flex Data
 message types
Date: Fri, 19 Jul 2024 14:34:52 +0200
Message-ID: <20240719123454.24493-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240719123454.24493-1-tiwai@suse.de>
References: <20240719123454.24493-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 5423121AEA
Message-ID-Hash: TTPOGL6EKV52II2WLOUHGBRJ4DQMMAJQ
X-Message-ID-Hash: TTPOGL6EKV52II2WLOUHGBRJ4DQMMAJQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TTPOGL6EKV52II2WLOUHGBRJ4DQMMAJQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enhance aseqdump to interpret more UMP messages.  Now it includes the
standard  Stream messages and Flex Data messages.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aseqdump/aseqdump.c | 247 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 247 insertions(+)

diff --git a/seq/aseqdump/aseqdump.c b/seq/aseqdump/aseqdump.c
index b8137112d836..04901d6187f7 100644
--- a/seq/aseqdump/aseqdump.c
+++ b/seq/aseqdump/aseqdump.c
@@ -705,6 +705,247 @@ static void dump_ump_sysex_event(const unsigned int *ump)
 	printf("\n");
 }
 
+static void print_ump_string(const unsigned int *ump, unsigned int fmt,
+			     unsigned int offset, int maxlen)
+{
+	static const char *fmtstr[4] = { "Single", "Start", "Cont", "End" };
+	unsigned char buf[32];
+	int i = 0;
+
+	do {
+		buf[i] = (*ump >> (24 - offset)) & 0xff;
+		if (!buf[i])
+			break;
+		if (buf[i] < 0x20)
+			buf[i] = '.';
+		if (offset == 24) {
+			offset = 0;
+			ump++;
+		} else {
+			offset += 8;
+		}
+	} while (++i < maxlen);
+	buf[i] = 0;
+
+	printf("%6s: %s", fmtstr[fmt], buf);
+}
+
+static void dump_ump_stream_event(const unsigned int *ump)
+{
+	const snd_ump_msg_stream_t *s = (const snd_ump_msg_stream_t *)ump;
+
+	printf("          "); /* stream message is groupless */
+	switch (s->gen.status) {
+	case SND_UMP_STREAM_MSG_STATUS_EP_DISCOVERY:
+		printf("EP Discovery    ver=%d/%d, filter=0x%x\n",
+		       (ump[0] >> 8) & 0xff, ump[0] & 0xff, ump[1] & 0xff);
+		break;
+	case SND_UMP_STREAM_MSG_STATUS_EP_INFO:
+		printf("EP Info         ver=%d/%d, static=%d, fb#=%d, midi2=%d, midi1=%d, rxjr=%d, txjr=%d\n",
+		       (ump[0] >> 8) & 0xff, ump[0] & 0xff, (ump[1] >> 31),
+		       (ump[1] >> 24) & 0x7f,
+		       (ump[1] >> 9) & 1, (ump[1] >> 8) & 1,
+		       (ump[1] >> 1) & 1, ump[1] & 1);
+		break;
+	case SND_UMP_STREAM_MSG_STATUS_DEVICE_INFO:
+		printf("Device Info     sysid=%02x:%02x:%02x, family=%02x:%02x, model=%02x:%02x, rev=%02x:%02x:%02x:%02x\n",
+		       (ump[1] >> 16) & 0x7f, (ump[1] >> 8) & 0x7f, ump[1] & 0x7f,
+		       (ump[2] >> 16) & 0x7f, (ump[2] >> 24) & 0x7f,
+		       ump[2] & 0x7f, (ump[2] >> 8) & 0x7f,
+		       (ump[3] >> 24) & 0x7f, (ump[3] >> 16) & 0x7f,
+		       (ump[3] >> 8) & 0x7f, ump[3] & 0x7f);
+		break;
+	case SND_UMP_STREAM_MSG_STATUS_EP_NAME:
+		printf("EP Name        ");
+		print_ump_string(ump, (ump[0] >> 26) & 3, 16, 14);
+		printf("\n");
+		break;
+	case SND_UMP_STREAM_MSG_STATUS_PRODUCT_ID:
+		printf("Product Id     ");
+		print_ump_string(ump, (ump[0] >> 26) & 3, 16, 14);
+		printf("\n");
+		break;
+	case SND_UMP_STREAM_MSG_STATUS_STREAM_CFG_REQUEST:
+		printf("Stream Cfg Req protocl=%d, rxjr=%d, txjr=%d\n",
+		       (ump[0] >> 8) & 0xff, (ump[0] >> 1) & 1, ump[0] & 1);
+		break;
+	case SND_UMP_STREAM_MSG_STATUS_STREAM_CFG:
+		printf("Stream Cfg     protocl=%d, rxjr=%d, txjr=%d\n",
+		       (ump[0] >> 8) & 0xff, (ump[0] >> 1) & 1, ump[0] & 1);
+		break;
+	case SND_UMP_STREAM_MSG_STATUS_FB_DISCOVERY:
+		printf("FB Discovery   fb#=%d, filter=0x%x\n",
+		       (ump[0] >> 8) & 0xff, ump[0] & 0xff);
+		break;
+	case SND_UMP_STREAM_MSG_STATUS_FB_INFO:
+		printf("FB Info        fb#=%d, active=%d, ui=%d, MIDI1=%d, dir=%d, group=%d-%d, MIDI-CI=%d, SysEx8=%d\n",
+		       (ump[0] >> 8) & 0x7f, (ump[0] >> 15) & 1,
+		       (ump[0] >> 4) & 3, (ump[0] >> 2) & 3, ump[0] & 3,
+		       (ump[1] >> 24) & 0xff, (ump[1] >> 16) & 0xff,
+		       (ump[1] >> 8) * 0xff, ump[1] & 0xff);
+		break;
+	case SND_UMP_STREAM_MSG_STATUS_FB_NAME:
+		printf("Product Id     ");
+		printf("FB Name #%02d    ", (ump[0] >> 8) & 0xff);
+		print_ump_string(ump, (ump[0] >> 26) & 3, 24, 13);
+		printf("\n");
+		break;
+	case SND_UMP_STREAM_MSG_STATUS_START_CLIP:
+		printf("Start Clip\n");
+		break;
+	case SND_UMP_STREAM_MSG_STATUS_END_CLIP:
+		printf("End Clip\n");
+		break;
+	default:
+		printf("UMP Stream event: status = %d, 0x%08x:0x%08x:0x%08x:0x%08x\n",
+		       s->gen.status, ump[0], ump[1], ump[2], ump[3]);
+		break;
+	}
+}
+
+struct flexdata_text_prefix {
+	unsigned char status_bank;
+	unsigned char status;
+	const char *prefix;
+};
+
+static struct flexdata_text_prefix text_prefix[] = {
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_METADATA,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_PROJECT_NAME,
+	  .prefix = "Project" },
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_METADATA,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_SONG_NAME,
+	  .prefix = "Song" },
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_METADATA,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_MIDI_CLIP_NAME,
+	  .prefix = "MIDI Clip" },
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_METADATA,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_COPYRIGHT_NOTICE,
+	  .prefix = "Copyright" },
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_METADATA,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_COMPOSER_NAME,
+	  .prefix = "Composer" },
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_METADATA,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_LYRICIST_NAME,
+	  .prefix = "Lyricist" },
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_METADATA,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_ARRANGER_NAME,
+	  .prefix = "Arranger" },
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_METADATA,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_PUBLISHER_NAME,
+	  .prefix = "Publisher" },
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_METADATA,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_PRIMARY_PERFORMER,
+	  .prefix = "Performer" },
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_METADATA,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_ACCOMPANY_PERFORMAER,
+	  .prefix = "Accompany Performer" },
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_METADATA,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_RECORDING_DATE,
+	  .prefix = "Recording Date" },
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_METADATA,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_RECORDING_LOCATION,
+	  .prefix = "Recording Location" },
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_PERF_TEXT,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_LYRICS,
+	  .prefix = "Lyrics" },
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_PERF_TEXT,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_LYRICS_LANGUAGE,
+	  .prefix = "Lyrics Language" },
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_PERF_TEXT,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_RUBY,
+	  .prefix = "Ruby" },
+	{ .status_bank = SND_UMP_FLEX_DATA_MSG_BANK_PERF_TEXT,
+	  .status = SND_UMP_FLEX_DATA_MSG_STATUS_RUBY_LANGUAGE,
+	  .prefix = "Ruby Language" },
+	{}
+};
+
+static const char *ump_meta_prefix(const snd_ump_msg_flex_data_t *fh)
+{
+	static char buf[32];
+	int i;
+
+	for (i = 0; text_prefix[i].status_bank; i++) {
+		if (text_prefix[i].status_bank == fh->meta.status_bank &&
+		    text_prefix[i].status == fh->meta.status)
+			return text_prefix[i].prefix;
+	}
+
+	sprintf(buf, "(%d:%d)", fh->meta.status_bank, fh->meta.status);
+	return buf;
+}
+
+static void dump_ump_flex_data_event(const unsigned int *ump)
+{
+	const snd_ump_msg_flex_data_t *fh =
+		(const snd_ump_msg_flex_data_t *)ump;
+
+	printf("Group %2d, ", group_number(snd_ump_msg_group(ump)));
+
+	if (fh->meta.status_bank == SND_UMP_FLEX_DATA_MSG_BANK_SETUP &&
+	    fh->meta.status == SND_UMP_FLEX_DATA_MSG_STATUS_SET_TEMPO) {
+		printf("UMP Set Tempo          value %d\n", fh->set_tempo.tempo);
+		return;
+	}
+
+	if (fh->meta.status_bank == SND_UMP_FLEX_DATA_MSG_BANK_SETUP &&
+	    fh->meta.status == SND_UMP_FLEX_DATA_MSG_STATUS_SET_TIME_SIGNATURE) {
+		printf("UMP Set Time Signature value %d / %d, num_notes %d\n",
+		       fh->set_time_sig.numerator, fh->set_time_sig.denominator,
+		       fh->set_time_sig.num_notes);
+		return;
+	}
+
+	if (fh->meta.status_bank == SND_UMP_FLEX_DATA_MSG_BANK_SETUP &&
+	    fh->meta.status == SND_UMP_FLEX_DATA_MSG_STATUS_SET_METRONOME) {
+		printf("UMP Set Metronome      clock %d, bar %d/%d/%d, sub %d/%d\n",
+		       fh->set_metronome.clocks_primary,
+		       fh->set_metronome.bar_accent_1,
+		       fh->set_metronome.bar_accent_2,
+		       fh->set_metronome.bar_accent_3,
+		       fh->set_metronome.subdivision_1,
+		       fh->set_metronome.subdivision_2);
+		return;
+	}
+
+	if (fh->meta.status_bank == SND_UMP_FLEX_DATA_MSG_BANK_SETUP &&
+	    fh->meta.status == SND_UMP_FLEX_DATA_MSG_STATUS_SET_CHORD_NAME) {
+		printf("UMP Set Chord Name     tonic %d %d %d, alt1 %d/%d, alt2 %d/%d, alt3 %d/%d, alt4 %d/%d, bass %d %d %d, alt1 %d/%d alt2 %d/%d\n",
+		       fh->set_chord_name.tonic_sharp,
+		       fh->set_chord_name.chord_tonic,
+		       fh->set_chord_name.chord_type,
+		       fh->set_chord_name.alter1_type,
+		       fh->set_chord_name.alter1_degree,
+		       fh->set_chord_name.alter2_type,
+		       fh->set_chord_name.alter2_degree,
+		       fh->set_chord_name.alter3_type,
+		       fh->set_chord_name.alter3_degree,
+		       fh->set_chord_name.alter4_type,
+		       fh->set_chord_name.alter4_degree,
+		       fh->set_chord_name.bass_sharp,
+		       fh->set_chord_name.bass_note,
+		       fh->set_chord_name.bass_type,
+		       fh->set_chord_name.bass_alter1_type,
+		       fh->set_chord_name.bass_alter1_type,
+		       fh->set_chord_name.bass_alter2_degree,
+		       fh->set_chord_name.bass_alter2_degree);
+		return;
+	}
+
+	if (fh->meta.status_bank == SND_UMP_FLEX_DATA_MSG_BANK_METADATA ||
+	    fh->meta.status_bank == SND_UMP_FLEX_DATA_MSG_BANK_PERF_TEXT) {
+		printf("Meta (%s) ", ump_meta_prefix(fh));
+		print_ump_string(ump + 1, fh->meta.format, 0, 12);
+		printf("\n");
+		return;
+	}
+
+	printf("Flex Data: channel = %d, format = %d, addrs = %d, status_bank = %d, status = %d\n",
+	       fh->meta.channel, fh->meta.format, fh->meta.addrs,
+	       fh->meta.status_bank, fh->meta.status);
+}
+
 static void dump_ump_event(const snd_seq_ump_event_t *ev)
 {
 	if (!snd_seq_ev_is_ump(ev)) {
@@ -730,6 +971,12 @@ static void dump_ump_event(const snd_seq_ump_event_t *ev)
 	case SND_UMP_MSG_TYPE_DATA:
 		dump_ump_sysex_event(ev->ump);
 		break;
+	case SND_UMP_MSG_TYPE_FLEX_DATA:
+		dump_ump_flex_data_event(ev->ump);
+		break;
+	case SND_UMP_MSG_TYPE_STREAM:
+		dump_ump_stream_event(ev->ump);
+		break;
 	default:
 		printf("UMP event: type = %d, group = %d, status = %d, 0x%08x\n",
 		       snd_ump_msg_type(ev->ump),
-- 
2.43.0

