Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7FD9FA5D9
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Dec 2024 14:56:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4B83601BC;
	Sun, 22 Dec 2024 14:56:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4B83601BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734875775;
	bh=BumS0w9aTcyHh0h4KCLOcGVuepMl9TXVUPZ6lA3hkUI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Ly27bQB2Flvl/t3L7Zr4HTkzoTma2QeKwDQ6qJijHaK5pSFF5B1wFTcRX7+oDIAfc
	 R6oM6THEN2sbNEk4LC8aKn+VUoFHOJO1pmcekJDFkLcud4vmxm+8qs+I7CKhlyaV3J
	 h+g3Q76Uxn6gc/KnsPtdXT4Lmo9I4qsLP5X1pYAk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A59FF805C4; Sun, 22 Dec 2024 14:55:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83B25F805BA;
	Sun, 22 Dec 2024 14:55:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E971F8056F; Sun, 22 Dec 2024 14:55:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 97483F800B8
	for <alsa-devel@alsa-project.org>; Sun, 22 Dec 2024 14:55:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97483F800B8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1734875727031821728-webhooks-bot@alsa-project.org>
References: <1734875727031821728-webhooks-bot@alsa-project.org>
Subject: make check fails to compile playmidi1.c: "error: expected identifier
 or '(' before numeric constant"
Message-Id: <20241222135530.1E971F8056F@alsa1.perex.cz>
Date: Sun, 22 Dec 2024 14:55:30 +0100 (CET)
Message-ID-Hash: YSMDCJZWLKAFKMTBMLKZQHEYZBU5Z5KX
X-Message-ID-Hash: YSMDCJZWLKAFKMTBMLKZQHEYZBU5Z5KX
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSMDCJZWLKAFKMTBMLKZQHEYZBU5Z5KX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #430 was opened from 746B61:

Getting the latest version from branch master (352cbc5e) and running `./gitcompile` followed by `make check` fails with:
```
Making check in test
make[1]: Entering directory '/tmp/alsa-lib-master/test'
Making check in .
make[2]: Entering directory '/tmp/alsa-lib-master/test'
make  control pcm pcm_min latency seq seq-ump-example playmidi1 timer rawmidi midiloop umpinfo oldapi queue_timer namehint client_event_filter chmap audio_time user-ctl-element-set pcm-multi-thread
make[3]: Entering directory '/tmp/alsa-lib-master/test'
  CC       control.o
  CCLD     control
  CC       pcm.o
  CCLD     pcm
  CC       pcm_min.o
  CCLD     pcm_min
  CC       latency.o
  CCLD     latency
  CC       seq.o
In file included from seq.c:12:
seq-sender.c: In function 'event_sender':
seq-sender.c:150:62: warning: variable 'pcm_flag' set but not used [-Wunused-but-set-variable]
  150 |         int client, port, queue, max, err, v1, v2, time = 0, pcm_flag = 0;
      |                                                              ^~~~~~~~
  CCLD     seq
  CC       seq-ump-example.o
  CCLD     seq-ump-example
  CC       playmidi1.o
In file included from playmidi1.c:48:
midifile.h:55:33: error: expected identifier or '(' before numeric constant
   55 | #define note_on                 0x90
      |                                 ^~~~
../include/alsa/ump_msg.h:170:41: note: in expansion of macro 'note_on'
  170 |         snd_ump_msg_midi1_note_t        note_on;        /**< MIDI1 note-on message */
      |                                         ^~~~~~~
midifile.h:54:33: error: expected identifier or '(' before numeric constant
   54 | #define note_off                0x80
      |                                 ^~~~
../include/alsa/ump_msg.h:171:41: note: in expansion of macro 'note_off'
  171 |         snd_ump_msg_midi1_note_t        note_off;       /**< MIDI1 note-off message */
      |                                         ^~~~~~~~
midifile.h:57:33: error: expected identifier or '(' before numeric constant
   57 | #define control_change          0xb0
      |                                 ^~~~
../include/alsa/ump_msg.h:173:41: note: in expansion of macro 'control_change'
  173 |         snd_ump_msg_midi1_cc_t          control_change; /**< MIDI1 control-change message */
      |                                         ^~~~~~~~~~~~~~
midifile.h:55:33: error: expected identifier or '(' before numeric constant
   55 | #define note_on                 0x90
      |                                 ^~~~
../include/alsa/ump_msg.h:432:41: note: in expansion of macro 'note_on'
  432 |         snd_ump_msg_midi2_note_t        note_on;        /**< MIDI2 note-on message */
      |                                         ^~~~~~~
midifile.h:54:33: error: expected identifier or '(' before numeric constant
   54 | #define note_off                0x80
      |                                 ^~~~
../include/alsa/ump_msg.h:433:41: note: in expansion of macro 'note_off'
  433 |         snd_ump_msg_midi2_note_t        note_off;       /**< MIDI2 note-off message */
      |                                         ^~~~~~~~
midifile.h:57:33: error: expected identifier or '(' before numeric constant
   57 | #define control_change          0xb0
      |                                 ^~~~
../include/alsa/ump_msg.h:438:41: note: in expansion of macro 'control_change'
  438 |         snd_ump_msg_midi2_cc_t          control_change; /**< MIDI2 control-change message */
      |                                         ^~~~~~~~~~~~~~
In file included from playmidi1.c:49:
midifile.c:57:33: error: expected identifier or '(' before numeric constant
   57 | #define set_tempo               0x51
      |                                 ^~~~
../include/alsa/ump_msg.h:711:41: note: in expansion of macro 'set_tempo'
  711 |         snd_ump_msg_set_tempo_t         set_tempo;      /**< Set Tempo */
      |                                         ^~~~~~~~~
make[3]: *** [Makefile:622: playmidi1.o] Error 1
make[3]: Leaving directory '/tmp/alsa-lib-master/test'
make[2]: *** [Makefile:819: check-am] Error 2
make[2]: Leaving directory '/tmp/alsa-lib-master/test'
make[1]: *** [Makefile:669: check-recursive] Error 1
make[1]: Leaving directory '/tmp/alsa-lib-master/test'
make: *** [Makefile:414: check-recursive] Error 1
```

The issue was introduced with commit 07cee0ba. playmidi1.c first [includes](https://github.com/alsa-project/alsa-lib/blob/352cbc5eb94a271a9c3c0ff5bf1742232a69e0d0/test/playmidi1.c#L48) midifile.h from the test directory, which [has](https://github.com/alsa-project/alsa-lib/blob/352cbc5eb94a271a9c3c0ff5bf1742232a69e0d0/test/midifile.h#L55) `#define note_on          	0x90`. After commit 07cee0ba, ump_msg.h gets included later, which [has](https://github.com/alsa-project/alsa-lib/blob/352cbc5eb94a271a9c3c0ff5bf1742232a69e0d0/include/ump_msg.h#L170C27-L170C34) `	snd_ump_msg_midi1_note_t	note_on;	/**< MIDI1 note-on message */`. The preprocessor replaces `note_on` with `0x90` and the compilation fails with the error above.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/430
Repository URL: https://github.com/alsa-project/alsa-lib
