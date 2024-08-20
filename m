Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 974AC95801D
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 09:44:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7F2E839;
	Tue, 20 Aug 2024 09:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7F2E839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724139890;
	bh=p8vuxpUxh2OhlH5U89wEOgTvJ8YGD3hjVqTj+Xh+jtw=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Yxql4dDCGkkz7npeLGkhI6obvXoH+KcBzHvzDXkoXq2/4DwpiN07RlVDMSInEemGW
	 FcoRsutIIro7mBndKaoqW4J9jBJ8kP6vNGudmYAdIQulLaEpDIu1sqmZEjh2CpeIl5
	 vSaISlndMG0/kWOUAplp1IBYUdyKmcPyk9cuQ1ng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0605F8057A; Tue, 20 Aug 2024 09:44:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 451BEF80107;
	Tue, 20 Aug 2024 09:44:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A20AFF80494; Tue, 20 Aug 2024 09:44:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67BCDF800F0
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 09:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67BCDF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=z+ZzLYsJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=k9Uhe4F0;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=z+ZzLYsJ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=k9Uhe4F0
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9BB571FFA8;
	Tue, 20 Aug 2024 07:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724139845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=ck2q2LY/yVhxi/17zRkTeUX5qmxJpfmVPAyIcbNiXeU=;
	b=z+ZzLYsJB+ElJ87o9z+7i1EPvA06VC3EGBR1uj14YFcOW5DLnRjVBtZxzXkAHb20TGN0aH
	bBY6gUTGF1+U2f6/tHOFxlwzSUe/xLa2SWrIdYeRzMt06wzNWPvrM5oEYML2xA8NDobQ6q
	B3MJOE3BmzigcpMKsKskmYzaKwR728g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724139845;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=ck2q2LY/yVhxi/17zRkTeUX5qmxJpfmVPAyIcbNiXeU=;
	b=k9Uhe4F0fA8XMV+nNdxUIp5ahENK64PvjBPx+bqa4hWpycXaAr59BuXlLxED0YRfJMqFuW
	+nXz55LSbTFKISCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724139845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=ck2q2LY/yVhxi/17zRkTeUX5qmxJpfmVPAyIcbNiXeU=;
	b=z+ZzLYsJB+ElJ87o9z+7i1EPvA06VC3EGBR1uj14YFcOW5DLnRjVBtZxzXkAHb20TGN0aH
	bBY6gUTGF1+U2f6/tHOFxlwzSUe/xLa2SWrIdYeRzMt06wzNWPvrM5oEYML2xA8NDobQ6q
	B3MJOE3BmzigcpMKsKskmYzaKwR728g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724139845;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=ck2q2LY/yVhxi/17zRkTeUX5qmxJpfmVPAyIcbNiXeU=;
	b=k9Uhe4F0fA8XMV+nNdxUIp5ahENK64PvjBPx+bqa4hWpycXaAr59BuXlLxED0YRfJMqFuW
	+nXz55LSbTFKISCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82FE313770;
	Tue, 20 Aug 2024 07:44:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PL+yHkVJxGa1HwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Aug 2024 07:44:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib] ump_msg: Add missing definition for Set Key
 Signature Message
Date: Tue, 20 Aug 2024 09:44:41 +0200
Message-ID: <20240820074445.15003-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
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
Message-ID-Hash: KNTTWY2RU4JHDTTP7IXV6XAWOUGTAE7R
X-Message-ID-Hash: KNTTWY2RU4JHDTTP7IXV6XAWOUGTAE7R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KNTTWY2RU4JHDTTP7IXV6XAWOUGTAE7R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Set Key Signature message was missing at the time we defined
for Flex Data types.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/ump_msg.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/include/ump_msg.h b/include/ump_msg.h
index a64cb317889e..5f0a45acd44c 100644
--- a/include/ump_msg.h
+++ b/include/ump_msg.h
@@ -606,6 +606,39 @@ typedef struct _snd_ump_msg_set_metronome {
 #endif
 } __attribute((packed)) snd_ump_msg_set_metronome_t;
 
+/** Set Key Signature Message (128bit) */
+typedef struct _snd_ump_msg_set_key_sig {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t format:2;	/**< Format */
+	uint8_t addrs:2;	/**< Address */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status_bank;	/**< Status Bank */
+	uint8_t status;		/**< Status */
+
+	uint8_t sharps_flats:4;	/**< Sharps/Flats */
+	uint8_t tonic_note:4;	/**< Tonic Note 1 */
+	uint8_t reserved1[3];	/**< Unused */
+
+	uint32_t reserved2[2];	/**< Unused */
+#else
+	uint8_t status;		/**< Status */
+	uint8_t status_bank;	/**< Status Bank */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t addrs:2;	/**< Address */
+	uint8_t format:2;	/**< Format */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+
+	uint8_t reserved1[3];	/**< Unused */
+	uint8_t tonic_note:4;	/**< Tonic Note */
+	uint8_t sharps_flats:4;	/**< Sharps/Flats */
+
+	uint32_t reserved2[2];	/**< Unused */
+#endif
+} __attribute((packed)) snd_ump_msg_set_key_sig_t;
+
 /** Set Chord Name Message (128bit) */
 typedef struct _snd_ump_msg_set_chord_name {
 #ifdef SNDRV_BIG_ENDIAN_BITFIELD
@@ -678,6 +711,7 @@ typedef union _snd_ump_msg_flex_data {
 	snd_ump_msg_set_tempo_t		set_tempo;	/**< Set Tempo */
 	snd_ump_msg_set_time_sig_t	set_time_sig;	/**< Set Time Signature */
 	snd_ump_msg_set_metronome_t	set_metronome;	/**< Set Metronome */
+	snd_ump_msg_set_key_sig_t	set_key_sig;	/**< Set Key Signature */
 	snd_ump_msg_set_chord_name_t	set_chord_name;	/**< Set Chord Name */
 	snd_ump_msg_hdr_t		hdr;		/**< UMP header */
 	uint32_t			raw[4];		/**< raw UMP packet */
-- 
2.43.0

