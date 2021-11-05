Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB5F446ADA
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 23:20:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDC351685;
	Fri,  5 Nov 2021 23:20:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDC351685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636150851;
	bh=YOKsBsFqLxQ0HInH6hzyPIsDCsbLj+1DnwkpMukB7FE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o5ebyLAwcAU+wbHyBzrDC7QXxFg/mWRgH8woP9EXDJlnA+5a21YL5UqyB2zQQwPwK
	 WnH1o9zBwqBwnEFK63DxGBNQ4vup9X3P2sTUAVS9T3FowuKDowat2hPVOCfoUdFZXF
	 /7lvEJAQTefBZecXnVjcBq8lIURlGc0hfNdCzkTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F339F8012A;
	Fri,  5 Nov 2021 23:19:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DE2CF8026A; Fri,  5 Nov 2021 23:19:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from pdx1-sub0-mail-fallback-mx200.dreamhost.com (mx2.dreamhost.com
 [64.90.62.164])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B484AF80148
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 23:19:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B484AF80148
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=thevertigo.com header.i=@thevertigo.com header.b="FJN0wGL7"
Received: from pdx1-sub0-mail-a308.dreamhost.com (unknown [10.35.49.102])
 by pdx1-sub0-mail-fallback-mx200.dreamhost.com (Postfix) with ESMTP id
 4HmFKb02D8zSDc; Fri,  5 Nov 2021 15:19:15 -0700 (PDT)
Received: from kip-desktop.kip-router (unknown [192.252.230.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: kip@thevertigo.com)
 by pdx1-sub0-mail-a308.dreamhost.com (Postfix) with ESMTPSA id 4HmFKZ2SJsz10; 
 Fri,  5 Nov 2021 15:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=thevertigo.com;
 s=thevertigo.com; t=1636150754; bh=URKreZsPSpALeMEa43jHT6+DtZk=;
 h=Subject:From:To:Cc:Date:Content-Type;
 b=FJN0wGL78yTTW2BsHI6ox8yB7oGmEOauciey6V66GEzNdTh58TtldY/xoApN4Eb0H
 pJAWFZS/+5VBl5eDfadNQO71EkilzGvN07bm6T0OFTMvvdAn5eg12CKeP5BIqpE3DJ
 4Mz9EMrwsb0SBVTNTMRyLTYUNwHa7xQ3NwxKdS9E=
Message-ID: <35c65f0177395968c01ea4b00d52c021cf2f9191.camel@thevertigo.com>
Subject: Re: [Alsa-user] USB audio on riscv64
From: Kip Warner <kip@thevertigo.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Fri, 05 Nov 2021 15:19:13 -0700
In-Reply-To: <s5hr1bue8fz.wl-tiwai@suse.de>
References: <f2ec64dab6a74c7eee0625533d3c3630adb62a41.camel@thevertigo.com>
 <CAJZ5D0bnMA=zZPztvQB4h0sXhU2og9D84QH8CXx5-GRWeu+4Ug@mail.gmail.com>
 <e91d7a44b9a456141d856ea57aa2948c3be4422f.camel@thevertigo.com>
 <s5h35oahppb.wl-tiwai@suse.de>
 <3832054fd315605b19bd9d74977f83078a95ee08.camel@thevertigo.com>
 <s5hr1bue8fz.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-PbqpGr8dZdRtRu+SJi+M"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Cc: Alsa-user@lists.sourceforge.net, alsa-devel@alsa-project.org,
 Dmitri Seletski <drjoms@gmail.com>
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


--=-PbqpGr8dZdRtRu+SJi+M
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-11-05 at 19:58 +0100, Takashi Iwai wrote:
> No, it contains the card entry.=C2=A0 You can see it in alsa-info.sh outp=
ut
> you attached, which is:

I thought cards was supposed to be a directory populated with
something, but I see now that its a file containing the aforementioned.

> Try to run like
> =C2=A0 % aplay -Dplughw:1 -vv foo.wav
> =C2=A0=20
> If this works, the problem is rather the access via PulseAudio.

Unfortunately it didn't:

   $ aplay -Dplughw:1 -vv /usr/share/games/lincity-ng/sounds/Water1.wav=20
   ALSA lib pcm_hw.c:1829:(_snd_pcm_hw_open) Invalid value for card
   aplay: main:852: audio open error: No such file or directory
  =20
   $ aplay -l
   aplay: device_list:276: no soundcards found...

--=20
Kip Warner -- Senior Software Engineer
OpenPGP=C2=A0signed/encrypted mail preferred
https://www.thevertigo.com

--=-PbqpGr8dZdRtRu+SJi+M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEaUi0dj/qpTzsKe4xRLRlxF7U4wQFAmGFreEACgkQRLRlxF7U
4wTdNQ/+NhFVb6Bmon8tax1FEGzJWb3Ue8aqDv6RsJGXCrUK4MuRYj0CVAp2Y68p
6M7N7F5oTVsNmDvggcjiy86fpsVoZfD3BkCTYBZqv8iIEhzKkp2sZW6aRp0+NqLw
gVV5VaXhTO9YTSAn+QH1v082Be8SIDPtSg2LC2dg4QpYu0/5iBdoD/DtTuwU6IDW
wVifj08+inQ0s+jgO1HLnB9fydKnZnvQ4TK15PIJD7rn+ulvn/LYn9hy7+o1O5aA
2iT/aaUx8qKm4coIZiy6Dh5EXqi0p5KA9+hlwFxrexVMaBuX83aCcTibCS+m2SPg
kE4YJjJnHpkFkZce0EORDyBcF3K7U7XMN8TgxIn9QR3eKASb/8LHbVeMc0Nxa9Os
jiREl4rh1k0LFGWxgSgG0891B9bIfJTuGk+Em+isF4HJ+jpQIa+FurmJQOuBSeoy
P4ztC5rzBxypocUzR2tu4y6aH+9Ie+CRkDHGRdM5chFgW1ZbIy1gHzXUxWKjy2FK
i75YXVIghi3hpegIUNRcghynluKFPzCwi/1JyV7EBa0ycOODmNYWeg/WTBTUNrSJ
3vUzaMb0NwkOxIWkd8Ad+BwY9TTlSUCegIZDE6Ft92k2hBdATujgTbLQJKd0BKJ7
tUdexhCmJUKQLPoi8Nh0mp7vG1jFf06UpY39bbGE5SUwJKQFtTU=
=x2WI
-----END PGP SIGNATURE-----

--=-PbqpGr8dZdRtRu+SJi+M--

