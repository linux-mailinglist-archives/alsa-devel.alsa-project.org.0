Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E127938F8B
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 15:00:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A60D83E;
	Mon, 22 Jul 2024 15:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A60D83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721653259;
	bh=MZcf5HKg2xGnIwe/226e4jhMx8GAo1mzF03h+MQwqgk=;
	h=Date:To:From:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qPxfCjtCZnlLZSgZMQxA4uNFlLwPYEHh+iHfWw6NXuerk7+hLQBb+Zug7qLEbmCws
	 jGzqR7uew6yXiLAuYhyt0eEzgddMZnfF2wsj8zj8TBd2N+baDEErtuf6ZPNeZ2UE3q
	 w0LihjCcQV5bdb+4Ksp3iZrhbH9ROskr1BmgE2t0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A518FF80649; Mon, 22 Jul 2024 14:59:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92682F8063C;
	Mon, 22 Jul 2024 14:59:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CBE7F8026D; Thu, 18 Jul 2024 15:05:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch
 [185.70.40.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78D86F801C0
	for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2024 15:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78D86F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256
 header.s=protonmail header.b=djHauMTi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1721307761; x=1721566961;
	bh=9Cq1kYOOh4haPvErrEi0ZorhnPKKtbTkm37WeZr/RwI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=djHauMTirdLnUoYqo5ZWLurL59I8tmXbJ+F3r1tgjiEBDOwyfr9opyrqJJyKbg7X2
	 BIRR76BLNnGgEgJRVnNU1U1ZKc8Qp8oNF5XApgoixL8AGyF/UuFX7oKIgiuK7gYuYi
	 sPk9yZsYLosuPEGC0qaGzF1OR4sACzMmcBULzKrc6XVv2nG8zG22dQmEm6segYBn5w
	 tgeZq74VZHeyKiWg444QVm1FckkgVGAqM/0BHAkgyWqvF8WHYiq6R6hNel89pNO3b8
	 6H0avnpfkGpzOhYX3HVazwj90uwjV9eRTkbYBqua8L9V23zaVSEQdeeBHKCUTLwhn+
	 1WbpD2ayW+mag==
Date: Thu, 18 Jul 2024 13:02:26 +0000
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
From: "edmund.raile" <edmund.raile@proton.me>
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de,
 linux-sound@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org, tiwai@suse.de
Subject: Re: [REGRESSION] ALSA: firewire-lib: snd_pcm_period_elapsed deadlock
 with Fireface 800
Message-ID: <stydzmsrtsdpoi7umdhxk66zsqdqaj7yyerro63eatecj5p44b@vad2xzpgdkag>
In-Reply-To: <20240717144649.GA317903@workstation.local>
References: <kwryofzdmjvzkuw6j3clftsxmoolynljztxqwg76hzeo4simnl@jn3eo7pe642q>
 <20240717144649.GA317903@workstation.local>
Feedback-ID: 45198251:user:proton
X-Pm-Message-ID: 0f8570c0bec60156c33a86ccb863c54edc02e256
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: edmund.raile@proton.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2R3DRRFK7FK5DQFHX7XPSWS5OG7YQH7G
X-Message-ID-Hash: 2R3DRRFK7FK5DQFHX7XPSWS5OG7YQH7G
X-Mailman-Approved-At: Mon, 22 Jul 2024 12:59:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2R3DRRFK7FK5DQFHX7XPSWS5OG7YQH7G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Am 24/07/17 04:46, schrieb Takashi Sakamoto:
> Hi,
>=20
> Thanks for the regression report, and I'm sorry for your inconvenience.
>=20
> As long as reading the call trace, the issue is indeed deadlock between
> the process and softIRQ (tasklet) contexts against the group lock for ALS=
A
> PCM substream and the tasklet for OHCI 1394 IT context.
>=20
> A. In the process context
>     * (lock A) Acquiring spin_lock by snd_pcm_stream_lock_irq() in
>                snd_pcm_status64()
>     * (lock B) Then attempt to enter tasklet
>=20
> B. In the softIRQ context
>     * (lock B) Enter tasklet
>     * (lock A) Attempt to acquire spin_lock by snd_pcm_stream_lock_irqsav=
e() in
>                snd_pcm_period_elapsed()
>=20
> It is the same issue as you reported in test branch for bh workqueue[1].
>=20
> I think the users rarely face the issue when working with either PipeWire
> or PulseAudio, since these processes run with no period wakeup mode of
> runtime for PCM substream (thus with less hardIRQ).
>=20
> Anyway, it is one of solutions to revert both a commit b5b519965c4c ("ALS=
A:
> firewire-lib: obsolete workqueue for period update") and a commit
> 7ba5ca32fe6e ("ALSA: firewire-lib: operate for period elapse event in
> process context"). The returned workqueue is responsible for lock A, thus=
:
>=20
> A. In the process context
>     * (lock A) Acquiring spin_lock by snd_pcm_stream_lock_irq() in
>                snd_pcm_status64()
>     * (lock B) Then attempt to enter tasklet
>=20
> B. In the softIRQ context
>     * (lock B) Enter tasklet
>     * schedule workqueue
>=20
> C. another process context (workqueue)
>     * (lock A) Attempt to acquire spin_lock by snd_pcm_stream_lock_irqsav=
e()
>                in snd_pcm_period_elapsed()
>=20
> The deadlock would not occur.
>=20
> [1] https://github.com/allenpais/for-6.9-bh-conversions/issues/1
>=20
>=20
> Regards
>=20
> Takashi Sakamoto

Thank you for taking the issue seriously!
Yes, indeed it was the same issue reported to the test branch for
bh workqueue!

It was "fun" living with this "hilarious" bug for years and not knowing
where it comes from.
Having it solved is almost like christmas to me, I am very glad I was
able to.

Your explaination of what was happening here also helped me understand
the issue better, so thank you.

Of course there will be better solutions in the future but for now,
the kernel freeze is banished, I hope [2].

Trying to implement my "fix" on the latest kernel (I was only testing
with 6.9.9) revealed that 6.10.0 introduced another regression [3],
resulting in heavy digital distortion.
I'd like to ask you to look into it.
Despite the horrible distortion, I'm happy to report that the patch [2]
also works on the latest kernel!

Thank you for your hard work on the firewire sound drivers!

[2] https://lore.kernel.org/linux-sound/20240718115637.12816-1-edmund.raile=
@proton.me/T/#u
[3] https://lore.kernel.org/linux-sound/n4jdkizinqfoztqn2cwv7uqqqnvkyu2xk32=
qebazqznh74b3d3@r23skt4k7mqe/T/#u

