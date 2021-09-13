Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8185B40878D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 10:52:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB5B81658;
	Mon, 13 Sep 2021 10:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB5B81658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631523157;
	bh=eK2uwffAIF5gQ9jzcNXpUUhoSLaHDuy1LVRdNoAekPs=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P2YyJ7TwjdKyyFQi7VFCcIUHikUdw45lTzRYOOzox040z7SMAq4hJ+il6DX5f29av
	 OoKYZQgqVk8GQ37zBEfgsyornRhMPlVVzuByeI8C8YoaY5oKuGJdAr1/tHP36lmWOZ
	 a7B0nHPb4eXInSckSQGlGKZf5/lmPFzIBliJ9Av8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 597F8F80128;
	Mon, 13 Sep 2021 10:51:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02E8DF8027C; Mon, 13 Sep 2021 10:51:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from confino.investici.org (confino.investici.org [212.103.72.250])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF36FF80169
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 10:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF36FF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=paranoici.org header.i=@paranoici.org
 header.b="a3MjGbJk"
Received: from mx1.investici.org (unknown [127.0.0.1])
 by confino.investici.org (Postfix) with ESMTP id 4H7KvZ2J5Xz10yb;
 Mon, 13 Sep 2021 08:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paranoici.org;
 s=stigmate; t=1631523066;
 bh=eK2uwffAIF5gQ9jzcNXpUUhoSLaHDuy1LVRdNoAekPs=;
 h=To:From:Subject:Date:From;
 b=a3MjGbJk/huKDYy33O6QyGOlst9jgloLNYi3AkKN45Dnx8bH9FyKQJfrq5bE/XkKe
 1K8UvF6MXS/1i35+WzQbTYkLXA+xnK9t8uDN5cKRmVcqTCAi/xOvsOozXqOY4Fp8EU
 UWJtoxmJvI/2FBwWxTwjZwi7gTO5S/9B1yNhvQJo=
Received: from [212.103.72.250] (mx1.investici.org [212.103.72.250])
 (Authenticated sender: orest@paranoici.org) by localhost (Postfix) with
 ESMTPSA id 4H7KvZ134dz10wD; Mon, 13 Sep 2021 08:51:06 +0000 (UTC)
To: alsa-devel@alsa-project.org, linux-audio-dev@lists.linuxaudio.org
From: AreYouLoco? <areyouloco@paranoici.org>
Subject: Mackie Onyx 1640i: Long run playback results in xrun and hang.
Message-ID: <d0981329-c31c-8ede-dfd6-2779bf2d70d1@paranoici.org>
Date: Mon, 13 Sep 2021 10:51:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

I am using custom build real-time kernel 5.12.2-rt3-fw. JACK with ALSA=20
backend on Mackie Onyx 1640i.
Lenovo Thinkpad T420 with FireWire. Debian Bullseye (11.0 - stable)=20
JACKD version 1.9.17.
I am using 512 samples 3 periods @48kHz.

The problem is that long run playback only around 1h (but the time=20
differs), result in
XRUN detected by JACK logs and the whole audio stops. So I have to=20
restart JACK in order to make it work.
DMESG is silent about that issue. But sometimes I get:

snd_oxfw fw1.0: Detect discontinuity of CIP: E8 00
And different hex values there.

Here is interesting part from the log:

Sun Sep 12 22:10:12 2021: Jack: JackRequest::Notification
Sun Sep 12 22:10:12 2021: Jack: **** alsa_pcm: xrun of at least 0.027 mse=
cs
Sun Sep 12 22:10:12 2021: Jack: Repreparing capture
Sun Sep 12 22:10:12 2021: Jack: Repreparing playback
Sun Sep 12 22:10:12 2021: Jack: ALSA XRun wait_status =3D 0
Sun Sep 12 22:10:12 2021: Jack: JackEngine::ClientNotify: no callback=20
for notification =3D 3
Sun Sep 12 22:10:12 2021: Jack: JackEngine::ClientNotify: no callback=20
for notification =3D 3
Sun Sep 12 22:10:12 2021: Jack: JackClient::ClientNotify ref =3D 2 name =3D=
=20
dbusapi notify =3D 3
Sun Sep 12 22:10:12 2021: Jack: JackClient::kXRunCallback
Sun Sep 12 22:10:12 2021: Jack: JackEngine::ClientNotify: no callback=20
for notification =3D 3
Sun Sep 12 22:10:12 2021: Jack: JackEngine::ClientNotify: no callback=20
for notification =3D 3
Sun Sep 12 22:10:12 2021: Jack: JackEngine::ClientNotify: no callback=20
for notification =3D 3
Sun Sep 12 22:10:12 2021: Jack: JackEngine::ClientNotify: no callback=20
for notification =3D 3
Sun Sep 12 22:10:28 2021: ERROR: ALSA: poll time out, polled for=20
15998655 usecs, Retrying with a recovery, retry cnt =3D 1
Sun Sep 12 22:10:44 2021: ERROR: ALSA: poll time out, polled for=20
15998654 usecs, Retrying with a recovery, retry cnt =3D 2
Sun Sep 12 22:11:00 2021: ERROR: ALSA: poll time out, polled for=20
15998659 usecs, Retrying with a recovery, retry cnt =3D 3
Sun Sep 12 22:11:16 2021: ERROR: ALSA: poll time out, polled for=20
15998649 usecs, Retrying with a recovery, retry cnt =3D 4

Anyone have idea what might be the cause of this XRUN? Or how to debug th=
at?

Its reproducible on my setup. Another log catched the same issue:

Sun Sep 12 16:50:44 2021: Jack: **** alsa_pcm: xrun of at least 0.030 mse=
cs
Sun Sep 12 16:50:44 2021: Jack: Repreparing capture
Sun Sep 12 16:50:44 2021: Jack: Repreparing playback
Sun Sep 12 16:50:44 2021: Jack: ALSA XRun wait_status =3D 0
Sun Sep 12 16:50:44 2021: Jack: JackRequest::Notification
Sun Sep 12 16:50:44 2021: Jack: JackEngine::ClientNotify: no callback=20
for notification =3D 3
Sun Sep 12 16:50:44 2021: Jack: JackEngine::ClientNotify: no callback=20
for notification =3D 3
Sun Sep 12 16:50:44 2021: Jack: JackClient::ClientNotify ref =3D 2 name =3D=
=20
dbusapi notify =3D 3
Sun Sep 12 16:50:44 2021: Jack: JackClient::kXRunCallback
Sun Sep 12 16:50:44 2021: Jack: JackEngine::ClientNotify: no callback=20
for notification =3D 3
Sun Sep 12 16:50:44 2021: Jack: JackEngine::ClientNotify: no callback=20
for notification =3D 3
Sun Sep 12 16:50:44 2021: Jack: JackEngine::ClientNotify: no callback=20
for notification =3D 3
Sun Sep 12 16:50:44 2021: Jack: JackEngine::ClientNotify: no callback=20
for notification =3D 3
Sun Sep 12 16:51:00 2021: ERROR: ALSA: poll time out, polled for=20
15998366 usecs, Retrying with a recovery, retry cnt =3D 1
Sun Sep 12 16:51:16 2021: ERROR: ALSA: poll time out, polled for=20
15998353 usecs, Retrying with a recovery, retry cnt =3D 2
Sun Sep 12 16:51:32 2021: ERROR: ALSA: poll time out, polled for=20
15998352 usecs, Retrying with a recovery, retry cnt =3D 3
Sun Sep 12 16:51:48 2021: ERROR: ALSA: poll time out, polled for=20
15998367 usecs, Retrying with a recovery, retry cnt =3D 4
Sun Sep 12 16:52:04 2021: ERROR: ALSA: poll time out, polled for=20
15998353 usecs, Retrying with a recovery, retry cnt =3D 5
Sun Sep 12 16:52:20 2021: ERROR: ALSA: poll time out, polled for=20
15998371 usecs, Reached max retry cnt =3D 5, Exiting
Sun Sep 12 16:52:20 2021: ERROR: JackAudioDriver::ProcessAsync: read=20
error, stopping...
Sun Sep 12 16:52:20 2021: Jack: JackPosixThread::ThreadHandler : exit

I am willing to provide additional info.

Thank you in advance,

AreYouLoco?


