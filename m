Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FF483558C
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Jan 2024 12:48:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E140E20E;
	Sun, 21 Jan 2024 12:47:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E140E20E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705837687;
	bh=ZT0AUqTtPT6wkkXqAKwHnyohCWe+XlnaDjzDGqpRN60=;
	h=Subject:From:To:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Az7fLk1zgg7bYdrlpLPmfkRZDE37eCc4BDtV+vAs8ZF2a1gUqOZY39HhmD59L/igk
	 l+jO4988dy+zakryy9hhxoudKSO9Gdp/Epd6u8h1iq7kwxRFk+oRMKKBiFGPbrCT46
	 MppK+jBFvjlHQGoOH7+r2ufbP3lFzfSjh2Mbxrvw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E5B5F8057D; Sun, 21 Jan 2024 12:47:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00F00F80578;
	Sun, 21 Jan 2024 12:47:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65225F8025F; Sun, 21 Jan 2024 12:47:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89330F8003A
	for <alsa-devel@alsa-project.org>; Sun, 21 Jan 2024 12:47:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89330F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256
 header.s=2017 header.b=e3DmSUMl
Received: from submission (posteo.de [185.67.36.169])
	by mout02.posteo.de (Postfix) with ESMTPS id A93A8240101
	for <alsa-devel@alsa-project.org>; Sun, 21 Jan 2024 12:47:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1705837637; bh=ZT0AUqTtPT6wkkXqAKwHnyohCWe+XlnaDjzDGqpRN60=;
	h=Message-ID:Subject:From:To:Date:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=e3DmSUMlV7uFtlRptSPI+IFZ7RBT+KRQe7W0mn5CRrtthJLRcf0G2eVhqJXigCGz9
	 hPH2ZsknZqbrHcqeD9ppL8hq2hvxy3P2GCLgwy1BZCt6zGLv6aBpLJklADGNHbje4E
	 STE6uLMZ9f9uLN0GyKdfFim6WWNU0bXGQJl7J8WIlNPOJwdn/EMmo284W8MjqpXIK/
	 pzKGCV7EkmCxAfwoJc8cNubhyXI6qyu3F9xJE4U+pDjmCDjJUux9ndoXrrGe6dg7u3
	 dAK7feJ1VYN7mIx1QWkmSbjN8qDPaxCb483KqjTtxzq2QwCoS+1CMDBYSs6593NsVp
	 ACS8iBu7FefDQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4THs5x0ncYz6twL
	for <alsa-devel@alsa-project.org>; Sun, 21 Jan 2024 12:47:16 +0100 (CET)
Message-ID: <dc0b7d117154a73b42b538c74f3511f0ca72b097.camel@posteo.de>
Subject: How to configure a pcm to write to it periodically?
From: Philipp Stanner <stanner@posteo.de>
To: alsa-devel@alsa-project.org
Date: Sun, 21 Jan 2024 11:47:16 +0000
Autocrypt: addr=stanner@posteo.de; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: CGV7J3Q62HXG7GXXRZ7PXX36GPT2BUJN
X-Message-ID-Hash: CGV7J3Q62HXG7GXXRZ7PXX36GPT2BUJN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CGV7J3Q62HXG7GXXRZ7PXX36GPT2BUJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi all,

hope this is the right list. [1] stated that it's also intended for
"application developers", so I ask here.

I've got a program that uses timers to periodically read samples from a
microphone and write to a sound device.
The timer's period is, for example, 20ms.
So I have a sample rate of r =3D 16000, frame sizes of 20ms, a bit depth
of 16 and therefore 320 samples per 20ms.
I try to write those 320 samples timer-controled every 20ms to the pcm
device.


That works fine when reading samples.
When writing, however, it seems that snd_pcm_writei() blocks longer
than the 20ms. Which it shouldn't do, as far as I understand
snd_pcm_set_params() delay-parameter.
I'll attach the example below.

So, I'd have a number of questions:
   1. Am I even using ALSA as it's intended? As far as I saw in the
      API, there's the possiblity to get poll()able file descriptors
      from the API. So should I, instead of using my own timers,
      configure the ALSA interface to become readable every 20ms?
   2. Why does my example not work as I intended? What does the
      "latency" parameter in snd_pcm_set_params() actually do?
   3. Is the 'size' parameter in the write functions [2] the size in
      bytes or in samples? So if I configured SND_PCM_S16_LE and pass
      size =3D 10, will it read 10 bytes or 160 bit? It seems to be that
      it's the number of samples, whose type has been set with
      snd_pcm_set_params(). The docu isn't super clear to me, though.

It seems that the size parameter has changed a bit.
At least the examples here [3] are faulting when I build them with
-fsanitize=3Daddress

Thx a lot!
Philipp


[1] https://www.alsa-project.org/wiki/Mailing-lists
[2] https://www.alsa-project.org/alsa-doc/alsa-lib/group___p_c_m.html#gabc7=
48a500743713eafa960c7d104ca6f
[3] http://equalarea.com/paul/alsa-audio.html


Example:
/*
 * This is a mini-example of the code I took for my draft ofa  broader appl=
ication.
 * The main difference is that I call snd_pcm_writei() when my timer fires.
 */
 #include <alsa/asoundlib.h> static char *device =3D "default"; /* playback=
 device */ unsigned char buffer[16*1024]; /* some random data */ int main(v=
oid) { int err; unsigned int i; snd_pcm_t *handle; snd_pcm_sframes_t frames=
; for (i =3D 0; i < sizeof(buffer); i++) buffer[i] =3D random() & 0xff; if =
((err =3D snd_pcm_open(&handle, device, SND_PCM_STREAM_PLAYBACK, 0)) < 0) {=
 printf("Playback open error: %s\n", snd_strerror(err)); exit(EXIT_FAILURE)=
; } if ((err =3D snd_pcm_set_params(handle, SND_PCM_FORMAT_S16_LE, SND_PCM_=
ACCESS_RW_INTERLEAVED, 1, 16000, 1, 20000)) < 0) { printf("Playback open er=
ror: %s\n", snd_strerror(err)); exit(EXIT_FAILURE); } for (i =3D 0; i < 16;=
 i++) { frames =3D snd_pcm_writei(handle, buffer, sizeof(buffer) / sizeof(s=
hort)); if (frames < 0)  frames =3D snd_pcm_recover(handle, frames, 0); if =
(frames < 0) { printf("snd_pcm_writei failed: %s\n", snd_strerror(frames));=
 break; } if (frames > 0 && frames < (long)(sizeof(buffer) / sizeof(short))=
) printf("Short write (expected %li, wrote %li)\n", (long)(sizeof(buffer) /=
 sizeof(short)), frames); } /* pass the remaining samples, otherwise they'r=
e dropped in close */ err =3D snd_pcm_drain(handle); if (err < 0) printf("s=
nd_pcm_drain failed: %s\n", snd_strerror(err)); snd_pcm_close(handle); retu=
rn 0; }

