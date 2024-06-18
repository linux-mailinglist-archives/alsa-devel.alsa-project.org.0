Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DBF90DB91
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 20:30:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37A8B832;
	Tue, 18 Jun 2024 20:30:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37A8B832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718735413;
	bh=7bLhYkjr29u1uDPZatu2b4bFKJXc72SlCcgNPXPtuAk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=R4BF6wsIweM2WwlKtPVTq5lV29B30xwK58TN8y8/OEGCosWISQxTVNnzdmzyIQF+S
	 qochEwA2fXNbDvidcQn22jTXxEA2uHXalQ/RuDx9Osw7Ew1Dt4AQgYUjDV6dGxLrEM
	 0iD2BCsQ/V0mvVPZw2sEyFCyfSsg30xN9hA3x3RI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 221A2F805AF; Tue, 18 Jun 2024 20:29:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7470EF805A8;
	Tue, 18 Jun 2024 20:29:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58A3BF8023A; Tue, 18 Jun 2024 20:29:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68CE7F800FA
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 20:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68CE7F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MdYli37Y
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1f6a837e9a3so37029975ad.1
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jun 2024 11:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718735359; x=1719340159;
 darn=alsa-project.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAj5IAF5CrMHySHXsmIl0rXFNcX7IEdGTt5pWkrJE9c=;
        b=MdYli37YMgS2YaSGmo1vU3PwhPAjk6jxVyi0g2Fw8mHdhW9ukNpg4GRFLhf4TH+5ol
         HaI3Xx/OSdyw3l/PMDkOqW3/Dm1583xPAcPzlH/aH7c/69lqeh8IYa74iQmwtKvVeiOc
         oqJ12PIuZYF66c0FIXFe1yi5PtLjDhwgeMID3r1g99ohsr4G8cjXu4BHsq1yh8yLxEt4
         Uy1NkFDld59L+3CO3f5sfMdyJSkDB1B6NISLnqoNQSAJ+TAQ6bIiPXwGdjjAioELth5b
         lLTNZRMWYuTmgcYQPbZX6svIeuKFqIxXrQSt3saLmevjKTAP34jtOD3wLd590aWOZege
         UIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718735359; x=1719340159;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAj5IAF5CrMHySHXsmIl0rXFNcX7IEdGTt5pWkrJE9c=;
        b=f6avuMVTRugQwaKrZO19VTHV+Kfo+19bF1X8JyCjlCBk6bLfLjR4i7jXYMNP3lcUIN
         xCYHA4gU8LabMZEvUzRGcwhcF1iJHk9K6PdDvUo8BxxbeDuE7l3q+/H8IUsXWXKhVnll
         RYsAy9nSPiruf5ESfJeLQcOoaRSUL0obYBuXkEzPtOR4hxoJNdmdq++fknFdQibi4kiZ
         cK9nOhInN6nnvXBvi4PJMEh3gg2xRA1iV8GaLWG6sbm413e1d0G/POhqnq9XvhvFc8yQ
         wGgDrGk5B6oY87Y6iIRN2Wfk98OcjjnlT70z+wbqedehtQ2YLc0CskID0t0ND90PHJU5
         GjqA==
X-Gm-Message-State: AOJu0YxMTvqnYFXfJ5hiJw1p0W4t8fHNYXcEluE53de4ostM1pBBgsVr
	sxGJu6JDQinSvg1HNHDeLiHHULTWEzwQJWRSO9CfpLQ2QKdh2gqqg500mC1ox/2ZkbuPV9ulbko
	XE0JMT/qRUqc11iiNQJxwasLO6zn+wzj0
X-Google-Smtp-Source: 
 AGHT+IGcqy3ANaEvMzwjmiRYJuZoaWMij1YFNLBJG6J8tsRBw0zOZgUOgXQ2lYSffU/wc27o2xeQQHKy8ljBC8PRUM4=
X-Received: by 2002:a17:903:2385:b0:1f9:8c1f:d535 with SMTP id
 d9443c01a7336-1f9aa470be1mr4560445ad.58.1718735359395; Tue, 18 Jun 2024
 11:29:19 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAES_P+_=Yx3_0mMyRDjMEYEV=2rx69ry1PFzBE=-VVUvvPOvEg@mail.gmail.com>
In-Reply-To: 
 <CAES_P+_=Yx3_0mMyRDjMEYEV=2rx69ry1PFzBE=-VVUvvPOvEg@mail.gmail.com>
From: noman pouigt <variksla@gmail.com>
Date: Tue, 18 Jun 2024 11:29:07 -0700
Message-ID: 
 <CAES_P+_nBpA=DaoCYPV0v=X7pqwF=EsD3BztM62T-GDOd9ATOg@mail.gmail.com>
Subject: Re: aloop driver introducing glitches
To: alsa-devel@alsa-project.org, perex@perex.cz, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7XDBWHWBS62TJKAEDAMNC44TOR5MGHTT
X-Message-ID-Hash: 7XDBWHWBS62TJKAEDAMNC44TOR5MGHTT
X-MailFrom: variksla@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XDBWHWBS62TJKAEDAMNC44TOR5MGHTT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

adding debug logs. I don't see any problem
with the logs below but still I can see in the
recorded data there are missing frames or
corruption.

# cat /proc/asound/Loopback/cable#0
Cable 0 substream 0:
  valid: 3
  running: 3
  pause: 0
  Playback
    buffer_size: 96000
    buffer_pos: 72576
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 576000
    period_frac: 24000000
    last_jiffies: 4613492552 (4613492610)
    timer_expires: 4613492674
  Capture
    buffer_size: 96000
    buffer_pos: 73152
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 1152000
    period_frac: 24000000
    last_jiffies: 4613492552 (4613492610)
    timer_expires: 4613492671
Cable 0 substream 1:
  inactive
Cable 0 substream 2:
  inactive
Cable 0 substream 3:
  inactive
Cable 0 substream 4:
  inactive
Cable 0 substream 5:
  inactive
Cable 0 substream 6:
  inactive
Cable 0 substream 7:
  inactive
# cat /proc/asound/Loopback/cable#0
Cable 0 substream 0:
  valid: 3
  running: 3
  pause: 0
  Playback
    buffer_size: 96000
    buffer_pos: 48768
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 768000
    period_frac: 24000000
    last_jiffies: 4613494928 (4613495026)
    timer_expires: 4613495049
  Capture
    buffer_size: 96000
    buffer_pos: 49344
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 1344000
    period_frac: 24000000
    last_jiffies: 4613494928 (4613495026)
    timer_expires: 4613495046
Cable 0 substream 1:
  inactive
Cable 0 substream 2:
  inactive
Cable 0 substream 3:
  inactive
Cable 0 substream 4:
  inactive
Cable 0 substream 5:
  inactive
Cable 0 substream 6:
  inactive
Cable 0 substream 7:
  inactive
# cat /proc/asound/Loopback/cable#0
Cable 0 substream 0:
  valid: 3
  running: 3
  pause: 0
  Playback
    buffer_size: 96000
    buffer_pos: 48768
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 768000
    period_frac: 24000000
    last_jiffies: 4613495928 (4613495963)
    timer_expires: 4613496049
  Capture
    buffer_size: 96000
    buffer_pos: 49344
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 1344000
    period_frac: 24000000
    last_jiffies: 4613495928 (4613495963)
    timer_expires: 4613496046
Cable 0 substream 1:
  inactive
Cable 0 substream 2:
  inactive
Cable 0 substream 3:
  inactive
Cable 0 substream 4:
  inactive
Cable 0 substream 5:
  inactive
Cable 0 substream 6:
  inactive
Cable 0 substream 7:
  inactive
# cat /proc/asound/Loopback/cable#0
Cable 0 substream 0:
  valid: 3
  running: 3
  pause: 0
  Playback
    buffer_size: 96000
    buffer_pos: 1152
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 1152000
    period_frac: 24000000
    last_jiffies: 4613496680 (4613496783)
    timer_expires: 4613496799
  Capture
    buffer_size: 96000
    buffer_pos: 1728
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 1728000
    period_frac: 24000000
    last_jiffies: 4613496680 (4613496783)
    timer_expires: 4613496796
Cable 0 substream 1:
  inactive
Cable 0 substream 2:
  inactive
Cable 0 substream 3:
  inactive
Cable 0 substream 4:
  inactive
Cable 0 substream 5:
  inactive
Cable 0 substream 6:
  inactive
Cable 0 substream 7:
  inactive
# cat /proc/asound/Loopback/cable#0
Cable 0 substream 0:
  valid: 3
  running: 3
  pause: 0
  Playback
    buffer_size: 96000
    buffer_pos: 72576
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 576000
    period_frac: 24000000
    last_jiffies: 4613497552 (4613497610)
    timer_expires: 4613497674
  Capture
    buffer_size: 96000
    buffer_pos: 73152
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 1152000
    period_frac: 24000000
    last_jiffies: 4613497552 (4613497610)
    timer_expires: 4613497671
Cable 0 substream 1:
  inactive
Cable 0 substream 2:
  inactive
Cable 0 substream 3:
  inactive
Cable 0 substream 4:
  inactive
Cable 0 substream 5:
  inactive
Cable 0 substream 6:
  inactive
Cable 0 substream 7:
  inactive
# cat /proc/asound/Loopback/cable#0
Cable 0 substream 0:
  valid: 3
  running: 3
  pause: 0
  Playback
    buffer_size: 96000
    buffer_pos: 49536
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 1536000
    period_frac: 24000000
    last_jiffies: 4613498432 (4613498501)
    timer_expires: 4613498549
  Capture
    buffer_size: 96000
    buffer_pos: 50112
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 2112000
    period_frac: 24000000
    last_jiffies: 4613498432 (4613498501)
    timer_expires: 4613498546
Cable 0 substream 1:
  inactive
Cable 0 substream 2:
  inactive
Cable 0 substream 3:
  inactive
Cable 0 substream 4:
  inactive
Cable 0 substream 5:
  inactive
Cable 0 substream 6:
  inactive
Cable 0 substream 7:
  inactive
# cat /proc/asound/Loopback/cable#0
Cable 0 substream 0:
  valid: 3
  running: 3
  pause: 0
  Playback
    buffer_size: 96000
    buffer_pos: 25152
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 1152000
    period_frac: 24000000
    last_jiffies: 4613499305 (4613499373)
    timer_expires: 4613499424
  Capture
    buffer_size: 96000
    buffer_pos: 25728
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 1728000
    period_frac: 24000000
    last_jiffies: 4613499305 (4613499373)
    timer_expires: 4613499421
Cable 0 substream 1:
  inactive
Cable 0 substream 2:
  inactive
Cable 0 substream 3:
  inactive
Cable 0 substream 4:
  inactive
Cable 0 substream 5:
  inactive
Cable 0 substream 6:
  inactive
Cable 0 substream 7:
  inactive
# cat /proc/asound/Loopback/cable#0
Cable 0 substream 0:
  valid: 3
  running: 3
  pause: 0
  Playback
    buffer_size: 96000
    buffer_pos: 384
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 384000
    period_frac: 24000000
    last_jiffies: 4613500176 (4613500195)
    timer_expires: 4613500299
  Capture
    buffer_size: 96000
    buffer_pos: 960
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 960000
    period_frac: 24000000
    last_jiffies: 4613500176 (4613500195)
    timer_expires: 4613500296
Cable 0 substream 1:
  inactive
Cable 0 substream 2:
  inactive
Cable 0 substream 3:
  inactive
Cable 0 substream 4:
  inactive
Cable 0 substream 5:
  inactive
Cable 0 substream 6:
  inactive
Cable 0 substream 7:
  inactive
# cat /proc/asound/Loopback/cable#0
Cable 0 substream 0:
  valid: 3
  running: 3
  pause: 0
  Playback
    buffer_size: 96000
    buffer_pos: 48768
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 768000
    period_frac: 24000000
    last_jiffies: 4613500928 (4613500964)
    timer_expires: 4613501049
  Capture
    buffer_size: 96000
    buffer_pos: 49344
    silent_size: 0
    period_size: 24000
    bytes_per_sec: 192000
    sample_align: 4
    rate_shift: 100000
    update_pending: 0
    irq_pos: 1344000
    period_frac: 24000000
    last_jiffies: 4613500928 (4613500964)
    timer_expires: 4613501046
Cable 0 substream 1:
  inactive
Cable 0 substream 2:
  inactive
Cable 0 substream 3:
  inactive
Cable 0 substream 4:
  inactive
Cable 0 substream 5:
  inactive
Cable 0 substream 6:
  inactive
Cable 0 substream 7:
  inactive

On Fri, Jun 14, 2024 at 7:50=E2=80=AFPM noman pouigt <variksla@gmail.com> w=
rote:
>
> Hello Folks,
>
> I wanted to use aloop driver to dump playback
> audio data to a file in userspace for debugging
> without data being sent to hardware (just as a
> debug feature for future use).
>
> Command flow is this:
> 1. aloop capture device is started using below command
> first: "arec -D hw:0,1 /data/rec.wav &"
>
> 2. using aplay, userspace sends the playback data.
> "aplay -D hw:0,0 /data/test.wav"
>
> Using jiffies. Wondering if changing rate_shift
> (don't know what is that for) will help?
>
> However, even in this simple setup I can see aloop driver
> is corrupting the data and sinetone sent from playback
> has glitches. I have tried different period sizes as well
> but nothing worked. Wondering if this is by design i.e.
> if the aloop driver shouldn't be used for this purpose?
> Any debug steps will be highly appreciated.
>
> Thanks for your help,
