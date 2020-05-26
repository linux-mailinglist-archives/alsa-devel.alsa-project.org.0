Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C21E30EE
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 23:06:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 417C7177D;
	Tue, 26 May 2020 23:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 417C7177D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590527197;
	bh=qZ9QP/cfhjw5u7z+4i+RvKJOtAZ997cjHR1EOCWoJ54=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y+VCGjLruCRGQ2T4YeLjXMNfmyeIKjL2daheCDivf8aKGL/Hik46J1F0Dt3s8UTJd
	 muiW1rSBeATXuY7KlobJ/Ma3nHaUO68ltHbtnmihl35bmS/0B/6CIC/Oeut/GrsbNP
	 9bLBrYT7zQ9DufL7/6Gl4zBXUGyHE2mqPkTj09G4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B981F80100;
	Tue, 26 May 2020 23:04:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59E19F80150; Tue, 26 May 2020 23:04:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from outbound.soverin.net (outbound.soverin.net
 [IPv6:2a01:4f8:fff0:2d:8::215])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B466DF80100
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 23:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B466DF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=freedom.nl header.i=@freedom.nl
 header.b="O5qW4okW"; 
 dkim=pass (1024-bit key) header.d=freedom.nl header.i=@freedom.nl
 header.b="CclHdfT4"
Received: from smtp.freedom.nl (unknown [10.10.3.36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by outbound.soverin.net (Postfix) with ESMTPS id 355A461259;
 Tue, 26 May 2020 21:04:46 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [116.202.65.211]) by
 soverin.net
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=freedom.nl; s=default;
 t=1590527085; bh=qZ9QP/cfhjw5u7z+4i+RvKJOtAZ997cjHR1EOCWoJ54=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O5qW4okWG35s8NdQDe19yoJFo369hJybN+YIq2FcV4VrC1lCB5gLZES5N6G0xjnWB
 XLFmYVYswiagR+8V5mAd6FPC3/nYJDaNXL4Ecr7HB8/uGg8km7Ei0vXTAW835nwF4t
 nkLbsBGv+TPo71dT8RM4j6IdIjYwNAgkMTOkq6ZY=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=freedom.nl; s=default;
 t=1590527086; bh=qZ9QP/cfhjw5u7z+4i+RvKJOtAZ997cjHR1EOCWoJ54=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CclHdfT4RMybfJ3NQG2bHSVDMkzycCVoiXgT/Tc7nz4+SYhIQ0lfCZIMqdPUnr7xe
 M406JDf5rqQwefVBbCMjFzPptXe7+Z6fI+Zz002Chpr6Qc5bwtKyVHAPE2F5OSs3EK
 xJw8yr9AAY4yWEqXRt940zVvkUmZv1iAOy0Fe/sQ=
From: Erwin Burema <e.burema@freedom.nl>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] Add duplex sound support for USB devices using implicit
 feedback
Date: Tue, 26 May 2020 23:04:44 +0200
Message-ID: <2281380.D2QAToNirg@alpha-wolf>
In-Reply-To: <s5ha71xwwxd.wl-tiwai@suse.de>
References: <2410739.SCZni40SNb@alpha-wolf> <1674042.U9NR2fmVFg@alpha-wolf>
 <s5ha71xwwxd.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.102.3 at c03mi01
X-Virus-Status: Clean
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Alexander Tsoy <alexander@tsoy.me>
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

On zondag 24 mei 2020 10:37:34 CEST Takashi Iwai wrote:
> On Sat, 23 May 2020 20:09:31 +0200,
>=20
> Erwin Burema wrote:
> > On zaterdag 23 mei 2020 19:53:49 CEST Alexander Tsoy wrote:
> > > =D0=92 =D0=92=D1=81, 10/05/2020 =D0=B2 20:29 +0200, Erwin Burema =D0=
=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > For USB sound devices using implicit feedback the endpoint used for
> > > > this feedback should be able to be opened twice, once for required
> > > > feedback and second time for audio data. This way these devices can
> > > > be put in duplex audio mode. Since this only works if the settings =
of
> > > > the endpoint don't change a check is included for this.
> > > >=20
> > > > This fixes bug 207023 ("MOTU M2 regression on duplex audio") and
> > > > should also fix bug 103751 ("M-Audio Fast Track Ultra usb audio
> > > > device will not operate full-duplex")
> > > >=20
> > > > Signed-off-by: Erwin Burema <e.burema@gmail.com>
> > > > ---
> > >=20
> > > This patch seems to cause kernel panic on my system. This happens
> > > during boot when gdm (with pulseaudio) is starting up.
> >=20
> > That's interesting, not running gnome (and thus also not running gdm,
> > currently KDE with SDDM) here so would need to take some time
> > troubleshooting. Suspect I missed something in the check if both input
> > and output are similarly configured.
> >=20
> > Will see if I can reproduce it and where exactly it goes wrong, in the
> > meantime would it be possible to test if 5.6 or later show the same iss=
ue
> > since I intially developed the patch against that release?
>=20
> Judging from the point triggering the bug (memset()), this can be a
> leftover URB handling that is performed even after the capture stream
> is closed.  If so, the procedure would be:
>  - start capture
>  - start playback
>  - stop capture while keeping playback running
>=20
> If my guess is correct, can the patch below work around the issue?
>=20

Have spend a large part of my free time trying to replicate it without any=
=20
luck, might be due to tryin it in a VM with USB passtrough (but wanted to b=
e=20
able to quickly itterate and easier to get debug info), so haven't been abl=
e=20
to try out the patch.

Next step is to see if I can replicate it on my HW, if that doesn't work it=
=20
might be time to rethink this whole initial patch and might need to do=20
something at substream level instead of endpoint level.

Regards,

Erwin Burema

>=20
> thanks,
>=20
> Takashi
>=20
> ---
> --- a/sound/usb/pcm.c
> +++ b/sound/usb/pcm.c
> @@ -1782,6 +1782,7 @@ static int snd_usb_substream_capture_trigger(struct
> snd_pcm_substream *substream return 0;
>  	case SNDRV_PCM_TRIGGER_STOP:
>  		stop_endpoints(subs);
> +		subs->data_endpoint->retire_data_urb =3D NULL;
>  		subs->running =3D 0;
>  		return 0;
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:




