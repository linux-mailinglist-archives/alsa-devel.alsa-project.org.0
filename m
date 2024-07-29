Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EAE93F268
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 12:17:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B96EE80;
	Mon, 29 Jul 2024 12:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B96EE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722248255;
	bh=S2kDna0y+5oSBmGdHqrrYsJkaPHhKDJXjStLwhOwkz4=;
	h=Date:To:From:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IrxtR0yQCHfR7r0PywouZ1tWvUP0w2SjPA0LNgyWkSbhBnyn7ITug/oUrl1/6WjQv
	 v8Zj4Gm4jNlKFxvCbTx2R1YsZqX4dFQQMGIQlhZ1TpIUkEgOLdeM0SA2lFzSmnhow0
	 m95a8w61IUP7OXFg0lbWF4bnQP0xMH54KjdAdg6Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC157F802DB; Mon, 29 Jul 2024 12:17:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17B3AF802DB;
	Mon, 29 Jul 2024 12:17:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3403F8026A; Mon, 29 Jul 2024 12:16:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch
 [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 503DDF800E3
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 12:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 503DDF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256
 header.s=protonmail header.b=mc/1nV4m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722248170; x=1722507370;
	bh=S2kDna0y+5oSBmGdHqrrYsJkaPHhKDJXjStLwhOwkz4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mc/1nV4m8TMMGJeIUMii9ZkH6oZomOab96hwvnxWu2gNI3S1ZVUnJ0v7Zed2yjXbn
	 As+t2qSXVrAbemPFvrTNio927NzUZiGO68n03CRMo48JkQq0GBnNVFHQrG/9WEMvhR
	 8ITLplTApB0EwO2nJhfcW0JEAxWVLXyFfhVxjTwyeOPq/4aUrQ/y5XDjvfzp7GLTgv
	 i4JPcs1zShaNrnPF1B45jSotEIB+vq3FL+DJanNBp4XYD1KA9SweE50fAWSQ1r19TJ
	 xllms2BUBPXvfcoUZnnIdmH6ReKgnFf4032J509CYFJSqc2NiqqE4UIU48Ow4OWcrS
	 W2Smoi8ufMUvA==
Date: Mon, 29 Jul 2024 10:16:04 +0000
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
From: "edmund.raile" <edmund.raile@proton.me>
Cc: linux-sound@vger.kernel.org, stable@vger.kernel.org, tiwai@suse.com,
 clemens@ladisch.de, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ALSA: firewire-lib: restore process context
 workqueue to prevent deadlock
Message-ID: <ora25phw5xyiog2z5xmlkrwvgffpwjq27algi6hqjs7s76b2qg@wbgokl2mblbq>
Feedback-ID: 45198251:user:proton
X-Pm-Message-ID: a09e72281001a8ca1419aa95857d79dea51fda67
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ZHL4QBOPY34PUE3PZEHLCZ5OYW7VFDRK
X-Message-ID-Hash: ZHL4QBOPY34PUE3PZEHLCZ5OYW7VFDRK
X-MailFrom: edmund.raile@proton.me
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZHL4QBOPY34PUE3PZEHLCZ5OYW7VFDRK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> Thank you for your sending the revised patches, it looks better than the
> previous one. However, I have an additional request.
Allright, patch v3 it is.

> [1] https://git-scm.com/docs/git-revert
Should have known git has something like that, how handy!

> $ git revert -s b5b519965c4c
Yes, 5b5 can be removed via revert, but what is the difference in
effect? Just time saving?
> $ git revert -s 7ba5ca32fe6e
This one I'd like to ask you about:
The original inline comment in amdtp-stream.c
amdtp_domain_stream_pcm_pointer()
```
// This function is called in software IRQ context of
// period_work or process context.
//
// When the software IRQ context was scheduled by software IRQ
// context of IT contexts, queued packets were already handled.
// Therefore, no need to flush the queue in buffer furthermore.
//
// When the process context reach here, some packets will be
// already queued in the buffer. These packets should be handled
// immediately to keep better granularity of PCM pointer.
//
// Later, the process context will sometimes schedules software
// IRQ context of the period_work. Then, no need to flush the
// queue by the same reason as described in the above
```
(let's call the above v1) was replaced with
```
// In software IRQ context, the call causes dead-lock to disable the taskle=
t
// synchronously.
```
on occasion of 7ba5ca32fe6e (let's call this v2).

I sought to replace it with
```
// use wq to prevent deadlock between process context spin_lock
// of snd_pcm_stream_lock_irq() in snd_pcm_status64() and
// softIRQ context spin_lock of snd_pcm_stream_lock_irqsave()
// in snd_pcm_period_elapsed()
```
to prevent this issue from occurring again (let's call this v3).

Should I include v1, v3 or a combination of v1 and v3 in my next patch?

> Just for safe, it is preferable to execute 'scripts/checkpatch.pl' in
> kernel tree to check the patchset generated by send-email subcommand[3].
Absolutely should have done so, sorry.

Thank you for your patience and guidance,
Edmund Raile.

