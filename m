Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A899683559A
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Jan 2024 13:06:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 238B0822;
	Sun, 21 Jan 2024 13:06:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 238B0822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705838794;
	bh=NRxnkw+/xzznzrXCJFcXALsLPfawXGfEYjEvC2nwLT4=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=m8X8HrhmBuFb/zioZkhtdC/A9944MbdYNfk7w3ST5KAMUZh7nkYMqy6b7iKLyDCC9
	 ETZnd6lL5KksxjeZusAGRKYy4ZGDV3UUd6d6iCtHmJBY+AmHHwA8opP0ALdPFuiAei
	 aexXApQ1SRKS7WygqavsjQCbRFqxlj/SiWVznekY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22409F80587; Sun, 21 Jan 2024 13:06:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89C8FF8057D;
	Sun, 21 Jan 2024 13:06:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 516A2F8025F; Sun, 21 Jan 2024 13:05:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FBACF8003A
	for <alsa-devel@alsa-project.org>; Sun, 21 Jan 2024 13:05:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FBACF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256
 header.s=2017 header.b=ihDxKTMz
Received: from submission (posteo.de [185.67.36.169])
	by mout02.posteo.de (Postfix) with ESMTPS id 8EA48240104
	for <alsa-devel@alsa-project.org>; Sun, 21 Jan 2024 13:05:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1705838752; bh=NRxnkw+/xzznzrXCJFcXALsLPfawXGfEYjEvC2nwLT4=;
	h=Message-ID:Subject:From:To:Date:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=ihDxKTMzjvOINARZ0eyhCVI6BUx5v0Coz3Pqja2zokAlR6RsMcE4IbsL12P7hVZj2
	 lMAYP/S2Z55mjOMaNRroFavTcQslbN8Lbzp+XqmD7utYqVxUMH2vs+hmU/O0JSi2j7
	 4lQgFKgPsY79jOItrHEYK6WNQx6Cg4+RimNsaqgeFaigCjk3tZLvG8tOwO4iGDdK0h
	 5/e6L+CV3CvyredngJeZpNsxCzZ9heJZgNmuROifVwsJGnhlFpEUmSW1hgqVfgp2MC
	 7zdPH9oV+h10648Ra4FaZSBVko244pWFgQsRl5fothfhhhY/Ny6s6a2DbWasGbeJOD
	 McqVph8NdtoDg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4THsWN0RNqz9rxD
	for <alsa-devel@alsa-project.org>; Sun, 21 Jan 2024 13:05:51 +0100 (CET)
Message-ID: <73dca2afb4e3e86421a3863a64a90f1e3bea8bfb.camel@posteo.de>
Subject: Re: How to configure a pcm to write to it periodically?
From: Philipp Stanner <stanner@posteo.de>
To: alsa-devel@alsa-project.org
Date: Sun, 21 Jan 2024 12:05:51 +0000
In-Reply-To: <dc0b7d117154a73b42b538c74f3511f0ca72b097.camel@posteo.de>
References: <dc0b7d117154a73b42b538c74f3511f0ca72b097.camel@posteo.de>
Autocrypt: addr=stanner@posteo.de; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: RLO5R6KQECEI7SCB37EZYBU24ZBYVZIO
X-Message-ID-Hash: RLO5R6KQECEI7SCB37EZYBU24ZBYVZIO
X-MailFrom: stanner@posteo.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RLO5R6KQECEI7SCB37EZYBU24ZBYVZIO/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PS:
Seems the formatting for my example broke.

Here's a paste:
https://paste.debian.net/1304802/

Am Sonntag, dem 21.01.2024 um 11:47 +0000 schrieb Philipp Stanner:
> Hi all,
>=20
> hope this is the right list. [1] stated that it's also intended for
> "application developers", so I ask here.
>=20
> I've got a program that uses timers to periodically read samples from
> a
> microphone and write to a sound device.
> The timer's period is, for example, 20ms.
> So I have a sample rate of r =3D 16000, frame sizes of 20ms, a bit
> depth
> of 16 and therefore 320 samples per 20ms.
> I try to write those 320 samples timer-controled every 20ms to the
> pcm
> device.
>=20
>=20
> That works fine when reading samples.
> When writing, however, it seems that snd_pcm_writei() blocks longer
> than the 20ms. Which it shouldn't do, as far as I understand
> snd_pcm_set_params() delay-parameter.
> I'll attach the example below.
>=20
> So, I'd have a number of questions:
> =C2=A0=C2=A0 1. Am I even using ALSA as it's intended? As far as I saw in=
 the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 API, there's the possiblity to get poll()a=
ble file descriptors
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from the API. So should I, instead of usin=
g my own timers,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 configure the ALSA interface to become rea=
dable every 20ms?
> =C2=A0=C2=A0 2. Why does my example not work as I intended? What does the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "latency" parameter in snd_pcm_set_params(=
) actually do?
> =C2=A0=C2=A0 3. Is the 'size' parameter in the write functions [2] the si=
ze in
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bytes or in samples? So if I configured SN=
D_PCM_S16_LE and pass
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size =3D 10, will it read 10 bytes or 160 =
bit? It seems to be
> that
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it's the number of samples, whose type has=
 been set with
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_pcm_set_params(). The docu isn't super=
 clear to me, though.
>=20
> It seems that the size parameter has changed a bit.
> At least the examples here [3] are faulting when I build them with
> -fsanitize=3Daddress
>=20
> Thx a lot!
> Philipp
>=20
>=20
> [1] https://www.alsa-project.org/wiki/Mailing-lists
> [2]
> https://www.alsa-project.org/alsa-doc/alsa-lib/group___p_c_m.html#gabc748=
a500743713eafa960c7d104ca6f
> [3] http://equalarea.com/paul/alsa-audio.html
>=20
>=20
> Example:
> /*
> =C2=A0* This is a mini-example of the code I took for my draft ofa=C2=A0
> broader application.
> =C2=A0* The main difference is that I call snd_pcm_writei() when my timer
> fires.
> =C2=A0*/
> =C2=A0#include <alsa/asoundlib.h> static char *device =3D "default"; /*
> playback device */ unsigned char buffer[16*1024]; /* some random data
> */ int main(void) { int err; unsigned int i; snd_pcm_t *handle;
> snd_pcm_sframes_t frames; for (i =3D 0; i < sizeof(buffer); i++)
> buffer[i] =3D random() & 0xff; if ((err =3D snd_pcm_open(&handle, device,
> SND_PCM_STREAM_PLAYBACK, 0)) < 0) { printf("Playback open error:
> %s\n", snd_strerror(err)); exit(EXIT_FAILURE); } if ((err =3D
> snd_pcm_set_params(handle, SND_PCM_FORMAT_S16_LE,
> SND_PCM_ACCESS_RW_INTERLEAVED, 1, 16000, 1, 20000)) < 0) {
> printf("Playback open error: %s\n", snd_strerror(err));
> exit(EXIT_FAILURE); } for (i =3D 0; i < 16; i++) { frames =3D
> snd_pcm_writei(handle, buffer, sizeof(buffer) / sizeof(short)); if
> (frames < 0)=C2=A0 frames =3D snd_pcm_recover(handle, frames, 0); if (fra=
mes
> < 0) { printf("snd_pcm_writei failed: %s\n", snd_strerror(frames));
> break; } if (frames > 0 && frames < (long)(sizeof(buffer) /
> sizeof(short))) printf("Short write (expected %li, wrote %li)\n",
> (long)(sizeof(buffer) / sizeof(short)), frames); } /* pass the
> remaining samples, otherwise they're dropped in close */ err =3D
> snd_pcm_drain(handle); if (err < 0) printf("snd_pcm_drain failed:
> %s\n", snd_strerror(err)); snd_pcm_close(handle); return 0; }
>=20

