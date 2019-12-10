Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0334F118C8B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:30:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81D7C16B4;
	Tue, 10 Dec 2019 16:29:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81D7C16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575991838;
	bh=SQyctsErwfbEAKtSADBL7oL2bcX/th4oy5BSk0YdEt0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gAXzFyRm4k7MZVxTNyFzbA0UwGhdK5o2wCjOblIYyX1lFPLymL2HcorHmbJH60BQg
	 o0JBXU6Q2XJYARr3qTqCbec8GW3OxMNUee5TSJr7G72i7HfZGRJ8UpDmb0PMJpCkNl
	 vpRBluAoGxYuxB2X9ZRKUtpHAFskNrTECAhUACXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED50DF80217;
	Tue, 10 Dec 2019 16:28:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2560AF8020C; Tue, 10 Dec 2019 16:28:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from tschil.ethgen.ch (tschil.ethgen.ch [5.9.7.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D9B7F800B4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 16:28:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D9B7F800B4
Received: from [192.168.17.4] (helo=ikki.ket)
 by tschil.ethgen.ch with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <klaus@ethgen.ch>)
 id 1iehRN-000673-Nf; Tue, 10 Dec 2019 16:28:45 +0100
Received: from klaus by ikki.ket with local (Exim 4.93-RC7)
 (envelope-from <klaus@ethgen.ch>)
 id 1iehRM-0002Kx-Ql; Tue, 10 Dec 2019 16:28:44 +0100
Date: Tue, 10 Dec 2019 16:28:44 +0100
From: Klaus Ethgen <Klaus@ethgen.ch>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191210152844.GC23758@ikki.ethgen.ch>
References: <20191207200643.GA10092@ikki.ethgen.ch>
 <s5h4kybciir.wl-tiwai@suse.de>
 <20191208173127.GE4433@ikki.ethgen.ch>
 <s5hmuc2asa7.wl-tiwai@suse.de>
 <20191209085716.GA12935@ikki.ethgen.ch>
 <s5h4ky9hmro.wl-tiwai@suse.de>
 <20191210143245.GA30160@ikki.ethgen.ch>
 <s5ho8wgw8an.wl-tiwai@suse.de>
 <20191210151036.GB23758@ikki.ethgen.ch>
 <s5hfthsw6mo.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hfthsw6mo.wl-tiwai@suse.de>
OpenPGP: id=79D0B06F4E20AF1C;
 url=http://www.ethgen.ch/~klaus/79D0B06F4E20AF1C.txt; preference=signencrypt
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] CPU hook snd_hda_intel
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
Content-Type: multipart/mixed; boundary="===============8856934722317843023=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8856934722317843023==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jousvV0MzM2p6OtC"
Content-Disposition: inline


--jousvV0MzM2p6OtC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

Hi Takashi,

Am Di den 10. Dez 2019 um 16:19 schrieb Takashi Iwai:
> >    Dec 10 15:33:55 chua kernel: [15488.497441] snd_hdac_bus_update_rirb: 58 callbacks suppressed
> >    Dec 10 15:33:55 chua kernel: [15488.497449] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
> >    Dec 10 15:33:55 chua kernel: [15488.497453] snd_hda_intel 0000:00:1b.0: spurious response 0x7fffffff:0x0, last cmd=0x11f0900
> >    Dec 10 15:33:55 chua kernel: [15488.497457] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
> >    Dec 10 15:33:55 chua kernel: [15488.497461] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
> >    Dec 10 15:33:55 chua kernel: [15488.497464] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
> >    Dec 10 15:33:55 chua kernel: [15488.497468] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
> >    Dec 10 15:33:55 chua kernel: [15488.497471] snd_hda_intel 0000:00:1b.0: spurious response 0x7fffffff:0x0, last cmd=0x11f0900
> >    Dec 10 15:33:55 chua kernel: [15488.497475] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
> >    Dec 10 15:33:55 chua kernel: [15488.497478] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
> >    Dec 10 15:33:55 chua kernel: [15488.497481] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
> 
> OK, these lines look already suspicious.

These are logged after wakeup as at this position, most of the system
seems already been sleeping. But it is really just before the sleep.

> The driver gets stuck at executing the same verb and repeated it until
> it gets some result.  This verb is GET_PIN_SENSE to the pin 0x11, as I
> somehow expected.
> However, the pin 0x11 is the headphone pin, and this should work even
> after the undock, but by some reason, it screws up.  Or it might be
> the read of the previous one (that doesn't appear here) that stalls
> the communication.
[...]
> Then it might be a problem of the headphone jack detection in
> general.  It happens at undock because the jack detection is performed
> on all pins.

I think, I always seen the headphone pin note there. Is it possible to
disable that detection? Maybe that is not working with that old
hardware?

> > Anything you think can be done against that?
> 
> Could you try the patch below in addition to the previous one?
> The similar trick was applied to the recent Intel chips for the
> unreliable communications, and the same might work for older chips,
> too.

I'll do and by the same compilation, I'll enable
CONFIG_SND_HDA_CODEC_ANALOG.

Regards
   Klaus
-- 
Klaus Ethgen                                       http://www.ethgen.ch/
pub  4096R/4E20AF1C 2011-05-16            Klaus Ethgen <Klaus@Ethgen.ch>
Fingerprint: 85D4 CA42 952C 949B 1753  62B3 79D0 B06F 4E20 AF1C

--jousvV0MzM2p6OtC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Charset: ISO-8859-1

iQGzBAABCgAdFiEEMWF28vh4/UMJJLQEpnwKsYAZ9qwFAl3vuawACgkQpnwKsYAZ
9qxG9Qv/U7e21YniDLuKLO0HAcwa+hHk+EKn63WEq2qGgakc9J0IJYeUNvKTtaN5
gY7XRlOVydM5c+sEQJiLFtZjf+kk65HEn+/zOSwhBz8a1MTvR6Rg5ZS9/Qkwwn6q
eYlfPlEh8tyiOu8M6tEbhsgG15B78U8ZYN0he7yfgv54gwFj60KyOVeOoElHDMrU
QMjqqhgKDP93MbIsR/jobo2pfZFhMMbzIKclZaQlzvp6FgzH9mFpNcILfs4b3DYC
pnPaodNXWHjPm6EuNLJIMfhogsWeQHDaRKDDsV9iN0X4FLgpM0dZxwt3vbyt/qk+
yWYyWJ4hWctPuxuW+KGgsm7oROQR3DSD9pzN1PTSsjO4R416KqM8A75gMOEuIrtE
Sy13it8CS1J2MteAZMdkyvDBeKpknPmENW5c6dJsv/FdLjV7ETS8RU8BcV6zMZQz
imPKE79lxw39qYfazoIVahCUwv08j8l5t9lAQaXoYFoQK3/CSUOOYnCBJQS0Ddb2
1kZWYXqP
=tqTR
-----END PGP SIGNATURE-----

--jousvV0MzM2p6OtC--

--===============8856934722317843023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8856934722317843023==--
