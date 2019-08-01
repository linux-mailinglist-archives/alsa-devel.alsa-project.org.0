Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8A67ED47
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 09:18:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 088B6172E;
	Fri,  2 Aug 2019 09:17:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 088B6172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564730300;
	bh=1V6pACBqqbGGX6wicMcb8q38JPRnVrlevbYZu+B1lqA=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rDvMVU1KFgVuNaWLLQKLu1mjFkeAM+2jlq67qc4uIbid7iMrwFW6HpY82exBE7Z7a
	 Qtv5Gay6KQ2gTNorGTZzo3dE+tjVvhAX8B/giqwd0D0XpNvE3fqTSKwdYiGeZ0I0Kj
	 CpFpEVN9h4uu/t69KQlxycL/TXJnI3J3YxKPPJcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 501F8F80C1B;
	Fri,  2 Aug 2019 08:53:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB733F804CC; Thu,  1 Aug 2019 09:15:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BD67F80214
 for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2019 09:15:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BD67F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JMUJv67h"
Received: by mail-io1-xd29.google.com with SMTP id o9so38505276iom.3
 for <alsa-devel@alsa-project.org>; Thu, 01 Aug 2019 00:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=h8pDsAlNglby2LeZrXF72fhmtCKXIQMfj5zaSGSebE0=;
 b=JMUJv67huEjFm05fofIZ0AKJQ1Oq4FquyCdA/r6/N9FRW61+CbBHjhyxwNRCBUhldc
 Pj+oSTY0V/Em1+ebw1u4rMGCkA8yiCUqCGRY9vf6Ml+RShmJ/HSSCj77UH2m7u/H6NEC
 LbcumRIAIFvtZ5db9bGX/dbIaYMKgY5ecXhh1BsDekMOAwZJaJmHEw1hQlr6hxuQiM3K
 4QyzITCxeh7xR9mexIH/wYYavo/hImlUoGIATZ40a5fChQGcfswJ20nubMkoq936u2zd
 3n93n1mqMckLrAM7ynTQtkTOYczmmmylPNonfuM299iiKU+e1YxwYbJQmlQEQJpAzLqF
 4z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=h8pDsAlNglby2LeZrXF72fhmtCKXIQMfj5zaSGSebE0=;
 b=KQFPoKeL4Woh/Nf0WqBk91ZBpPhX5mgI+Q/PrE5moIyaOBVz537urXeUu3fnWbE6JZ
 wx2iSNVUTNsNp1yzs7lSrA8rKK0h3ZZlsMJlbWbYF2q9Yl8UQQbOP2WJmQ7oIyjSof14
 zy61jEH4fG8IRkvakWXkTvrKwoVyl1UKCIZK9E7Oz/QkGuyDBVrde4w0HcQnlFXKUPTa
 Q9L4Gc2dMpVkp65aQdpnI+AwR2o/FNpOGawYiAHNEOSKrIBMHY7sKJw8IPMc/KDKRJba
 FD78HIgN5o/3yUqNjRCQIicT5XsI1nSjo4tN1bSvCwVU+xZnNEgMUb+KXxL8GigvFoyU
 AJDA==
X-Gm-Message-State: APjAAAVWhQtbztp/WZj7aKKlFkw+L084n23iUEgf7AXvLQnIIfm80hUo
 btw1G9uVDgD/B77p6ppiES9KlcYOvVu5gKaOGgkn1GZP/zo=
X-Google-Smtp-Source: APXvYqyOUYBWf0YBVaigD4jhzlus78zEG+f/D5SYyJ7nUzM4S3dWOc8E67knuRuWi1YV7uSkx4yeOdy17MhnR55QS7Q=
X-Received: by 2002:a6b:c081:: with SMTP id
 q123mr41710164iof.210.1564643732792; 
 Thu, 01 Aug 2019 00:15:32 -0700 (PDT)
MIME-Version: 1.0
From: Roeland Jansen <roeland.jansen69@gmail.com>
Date: Thu, 1 Aug 2019 09:15:21 +0200
Message-ID: <CAJ2u8oasenxQZFv+sddUw6nkWm-f-VOHgEfFxm8kuPooQ4yTxw@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:52:07 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] snd_pcm_delay in snd_usb_audio
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

just subscribed to the list (I hope).


while troubleshooting a different thing in audio I stumbled across the
following and it's in the logs more than once.

what do you need from me? this is opensuse 15.1 leap.


warn:2019-07-31T19:12:58.207893+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c: Most likely this is a bug in the ALSA
driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
warn:2019-07-31T19:12:58.208183+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c: snd_pcm_dump():
warn:2019-07-31T19:12:58.208473+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c: Hardware PCM card 2 'USB Audio CODEC'
device 0 subdevice 0
warn:2019-07-31T19:12:58.208760+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c: Its setup is:
warn:2019-07-31T19:12:58.209071+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   stream       : CAPTURE
warn:2019-07-31T19:12:58.209366+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   access       : MMAP_INTERLEAVED
warn:2019-07-31T19:12:58.209671+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   format       : S16_LE
warn:2019-07-31T19:12:58.209958+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   subformat    : STD
warn:2019-07-31T19:12:58.210245+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   channels     : 2
warn:2019-07-31T19:12:58.210588+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   rate         : 48000
warn:2019-07-31T19:12:58.210880+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   exact rate   : 48000 (48000/1)
warn:2019-07-31T19:12:58.211198+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   msbits       : 16
warn:2019-07-31T19:12:58.211746+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   buffer_size  : 88200
warn:2019-07-31T19:12:58.212028+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   period_size  : 44100
warn:2019-07-31T19:12:58.212261+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   period_time  : 918750
warn:2019-07-31T19:12:58.212548+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   tstamp_mode  : ENABLE
warn:2019-07-31T19:12:58.212785+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   tstamp_type  : MONOTONIC
warn:2019-07-31T19:12:58.213014+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   period_step  : 1
warn:2019-07-31T19:12:58.213238+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   avail_min    : 44100
warn:2019-07-31T19:12:58.213470+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   period_event : 0
warn:2019-07-31T19:12:58.213722+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   start_threshold  : -1
warn:2019-07-31T19:12:58.213995+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   stop_threshold   :
6206523236469964800
warn:2019-07-31T19:12:58.214465+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   silence_threshold: 0
warn:2019-07-31T19:12:58.214730+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   silence_size : 0
warn:2019-07-31T19:12:58.214971+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   boundary     : 6206523236469964800
warn:2019-07-31T19:12:58.215228+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   appl_ptr     : 45284903
warn:2019-07-31T19:12:58.215510+02:00 taplop pulseaudio[28164]:
[alsa-source-USB Audio] alsa-util.c:   hw_ptr       : 55414415
warn:2019-07-31T21:55:16.513279+02:00 taplop pulseaudio[28164]:
[alsa-sink-USB Audio] alsa-util.c: Got POLLNVAL from ALSA
warn:2019-07-31T21:55:16.513748+02:00 taplop pulseaudio[28164]:
[alsa-sink-USB Audio] alsa-util.c: Could not recover from
POLLERR|POLLNVAL|POLLHUP with snd_pcm_prepare(): No such device
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
