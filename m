Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DA3408A67
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 13:38:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53A061657;
	Mon, 13 Sep 2021 13:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53A061657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631533121;
	bh=aMIW37w+Avu9X2e1EwangaqxobwlRkdYQFX5NuxLpF8=;
	h=From:To:References:Subject:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bd9Ux1IxNww3QwAjUxPmYN3NQfSuF2w4HlRUGQCYMPFXEm1igtbSW9ZETDz8LWHI/
	 5bEr0bwSD1yJh6P9F97sWSkbaFuLfdHjt5nNvOEjeFB2rEOY55uj2le3TlNyuGdzgb
	 8UdWWdH0m9uCFr3+OFeXEtYCu5FLSJtmJ7zuQ6sM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD743F802E8;
	Mon, 13 Sep 2021 13:37:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB5ABF8027C; Mon, 13 Sep 2021 13:37:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from latitanza.investici.org (latitanza.investici.org
 [IPv6:2001:888:2000:56::19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD7A7F80169
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 13:37:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD7A7F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=paranoici.org header.i=@paranoici.org
 header.b="FnYDCAKb"
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id 4H7PZz6GYNzGp3m;
 Mon, 13 Sep 2021 11:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paranoici.org;
 s=stigmate; t=1631533019;
 bh=aMIW37w+Avu9X2e1EwangaqxobwlRkdYQFX5NuxLpF8=;
 h=From:To:References:Subject:Date:In-Reply-To:From;
 b=FnYDCAKbXIPxNiW7iqVCq9wvxIf2HFzzwqbaCUn3lnPRYkyiEjmHa+TtbaWDbONvL
 yd27clYSA1whJvdsciebbs+zNjQTHVQZ3JhGumkxpzskhjd7CBBd99gzCfAMHVcelf
 2vSyl1zmm6dxf6fbGe+FBm6wHTU0zrfDeNGPwUi4=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: orest@paranoici.org) by localhost (Postfix) with
 ESMTPSA id 4H7PZz51bKzGp1x; Mon, 13 Sep 2021 11:36:59 +0000 (UTC)
From: AreYouLoco? <areyouloco@paranoici.org>
To: linux-audio-dev@lists.linuxaudio.org, alsa-devel@alsa-project.org
References: <FC940720-82E9-4091-8ED0-36AA3CC4D682@paranoici.org>
Subject: Re: [LAD] Mackie Onyx 1640i: Long run playback results in xrun and
 hang.
Message-ID: <12c47c5d-cae0-8c68-cfb5-8161e8d0d4fb@paranoici.org>
Date: Mon, 13 Sep 2021 13:36:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <FC940720-82E9-4091-8ED0-36AA3CC4D682@paranoici.org>
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

I am going to recompile the kernel with options mentioned here:

https://www.alsa-project.org/main/index.php/XRUN_Debug

And try to debug why the xrun appears.

I also checked with buffer size 1024 and exaclty one xrun and then hang=20
repeats.

On 9/13/21 12:23 PM, AreYouLoco? wrote:
> Hi,
>
> I am using custom build real-time kernel 5.12.2-rt3-fw. JACK with ALSA
> backend on Mackie Onyx 1640i.
> Lenovo Thinkpad T420 with FireWire. Debian Bullseye (11.0 - stable)
> JACKD version 1.9.17.
> I am using 512 samples 3 periods @48kHz.
>
> The problem is that long run playback only around 1h (but the time
> differs), result in
> XRUN detected by JACK logs and the whole audio stops. So I have to
> restart JACK in order to make it work.
> DMESG is silent about that issue. But sometimes I get:
>
> snd_oxfw fw1.0: Detect discontinuity of CIP: E8 00
> And different hex values there.
>
> Here is interesting part from the log:
>
> Sun Sep 12 22:10:12 2021: Jack: JackRequest::Notification
> Sun Sep 12 22:10:12 2021: Jack: **** alsa_pcm: xrun of at least 0.027 m=
secs
> Sun Sep 12 22:10:12 2021: Jack: Repreparing capture
> Sun Sep 12 22:10:12 2021: Jack: Repreparing playback
> Sun Sep 12 22:10:12 2021: Jack: ALSA XRun wait_status =3D 0
> Sun Sep 12 22:10:12 2021: Jack: JackEngine::ClientNotify: no callback
> for notification =3D 3
> Sun Sep 12 22:10:12 2021: Jack: JackEngine::ClientNotify: no callback
> for notification =3D 3
> Sun Sep 12 22:10:12 2021: Jack: JackClient::ClientNotify ref =3D 2 name=
 =3D
> dbusapi notify =3D 3
> Sun Sep 12 22:10:12 2021: Jack: JackClient::kXRunCallback
> Sun Sep 12 22:10:12 2021: Jack: JackEngine::ClientNotify: no callback
> for notification =3D 3
> Sun Sep 12 22:10:12 2021: Jack: JackEngine::ClientNotify: no callback
> for notification =3D 3
> Sun Sep 12 22:10:12 2021: Jack: JackEngine::ClientNotify: no callback
> for notification =3D 3
> Sun Sep 12 22:10:12 2021: Jack: JackEngine::ClientNotify: no callback
> for notification =3D 3
> Sun Sep 12 22:10:28 2021: ERROR: ALSA: poll time out, polled for
> 15998655 usecs, Retrying with a recovery, retry cnt =3D 1
> Sun Sep 12 22:10:44 2021: ERROR: ALSA: poll time out, polled for
> 15998654 usecs, Retrying with a recovery, retry cnt =3D 2
> Sun Sep 12 22:11:00 2021: ERROR: ALSA: poll time out, polled for
> 15998659 usecs, Retrying with a recovery, retry cnt =3D 3
> Sun Sep 12 22:11:16 2021: ERROR: ALSA: poll time out, polled for
> 15998649 usecs, Retrying with a recovery, retry cnt =3D 4
>
> Anyone have idea what might be the cause of this XRUN? Or how to debug =
that?
>
> Its reproducible on my setup. Another log catched the same issue:
>
> Sun Sep 12 16:50:44 2021: Jack: **** alsa_pcm: xrun of at least 0.030 m=
secs
> Sun Sep 12 16:50:44 2021: Jack: Repreparing capture
> Sun Sep 12 16:50:44 2021: Jack: Repreparing playback
> Sun Sep 12 16:50:44 2021: Jack: ALSA XRun wait_status =3D 0
> Sun Sep 12 16:50:44 2021: Jack: JackRequest::Notification
> Sun Sep 12 16:50:44 2021: Jack: JackEngine::ClientNotify: no callback
> for notification =3D 3
> Sun Sep 12 16:50:44 2021: Jack: JackEngine::ClientNotify: no callback
> for notification =3D 3
> Sun Sep 12 16:50:44 2021: Jack: JackClient::ClientNotify ref =3D 2 name=
 =3D
> dbusapi notify =3D 3
> Sun Sep 12 16:50:44 2021: Jack: JackClient::kXRunCallback
> Sun Sep 12 16:50:44 2021: Jack: JackEngine::ClientNotify: no callback
> for notification =3D 3
> Sun Sep 12 16:50:44 2021: Jack: JackEngine::ClientNotify: no callback
> for notification =3D 3
> Sun Sep 12 16:50:44 2021: Jack: JackEngine::ClientNotify: no callback
> for notification =3D 3
> Sun Sep 12 16:50:44 2021: Jack: JackEngine::ClientNotify: no callback
> for notification =3D 3
> Sun Sep 12 16:51:00 2021: ERROR: ALSA: poll time out, polled for
> 15998366 usecs, Retrying with a recovery, retry cnt =3D 1
> Sun Sep 12 16:51:16 2021: ERROR: ALSA: poll time out, polled for
> 15998353 usecs, Retrying with a recovery, retry cnt =3D 2
> Sun Sep 12 16:51:32 2021: ERROR: ALSA: poll time out, polled for
> 15998352 usecs, Retrying with a recovery, retry cnt =3D 3
> Sun Sep 12 16:51:48 2021: ERROR: ALSA: poll time out, polled for
> 15998367 usecs, Retrying with a recovery, retry cnt =3D 4
> Sun Sep 12 16:52:04 2021: ERROR: ALSA: poll time out, polled for
> 15998353 usecs, Retrying with a recovery, retry cnt =3D 5
> Sun Sep 12 16:52:20 2021: ERROR: ALSA: poll time out, polled for
> 15998371 usecs, Reached max retry cnt =3D 5, Exiting
> Sun Sep 12 16:52:20 2021: ERROR: JackAudioDriver::ProcessAsync: read
> error, stopping...
> Sun Sep 12 16:52:20 2021: Jack: JackPosixThread::ThreadHandler : exit
>
> I am willing to provide additional info.
>
> Thank you in advance,
>
> AreYouLoco?
> _______________________________________________
> Linux-audio-dev mailing list
> Linux-audio-dev@lists.linuxaudio.org
> https://lists.linuxaudio.org/listinfo/linux-audio-dev

