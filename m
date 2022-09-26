Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA23E5EAB33
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 17:34:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08C99827;
	Mon, 26 Sep 2022 17:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08C99827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664206467;
	bh=lR9YMrtNF7szVtcHTRUgZvSVis9W6/Y0uxPP0R+swGg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CNjvwsmfSeyUqx1GC6OHKk8dT4FDiagugfvQIJRi10eTMN0snTLNiN5hzK/f7Q4qI
	 mmkNxFEUQGSEpJCiOasKrtFaFZ/i11MZBQyV2vnshSM0wLCg1/KJgS+34w0drmGo9U
	 aI0HfpG+gnh/Y+vWJ125wTQMh0gRoMp7FhszRgTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A171F802BE;
	Mon, 26 Sep 2022 17:33:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E200EF8027D; Mon, 26 Sep 2022 17:33:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E8D5F80115
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 17:33:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E8D5F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QR9tnT0y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E564DB80ACE;
 Mon, 26 Sep 2022 15:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA62C433D6;
 Mon, 26 Sep 2022 15:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664206402;
 bh=lR9YMrtNF7szVtcHTRUgZvSVis9W6/Y0uxPP0R+swGg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QR9tnT0ybS1jVjIRwHL664FFBe+MX8Hs3IIIOtAEGBjGjAPK6srC4l01fwd7dLCd2
 l70rXXV3v3gyQtOpikowkeEkLj5g9Tu7lO+vyUAY+lw6IIJse/vulBd2lKA8Aoebca
 SFLn0Bf+ESX8/Oyv9YiAllGwnfxY0zxoj5sXBGsC1x/D22rhbZb35fuTz9llPMyaGY
 eV6nwCQduZKCb3aSczEA3th3eZ2rmP2Spaor6k5VoWOC+NXCg0dFtouSZhbqSCjfzA
 LNEVjL8WbwbdM4KbbAyGDrjoEAzNLzJPUnTO9z4mif9uiP78eCswgcTjv8kQXYkAqo
 L0UyPDPPZ6xyw==
Date: Mon, 26 Sep 2022 16:33:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/1] ASoC: soc-dai: export some symbols
Message-ID: <YzHGPuajS54y1SV6@sirena.org.uk>
References: <20220920034545.2820888-1-jason.zhu@rock-chips.com>
 <20220920034545.2820888-2-jason.zhu@rock-chips.com>
 <Yym2aURe2+pA3ocn@sirena.org.uk>
 <dfeac54a-a264-835a-f155-90eb8f093314@rock-chips.com>
 <Yy2s2PA/C1ngeb//@sirena.org.uk>
 <155e10c4-7b08-f1ec-9f28-42a3d982740f@rock-chips.com>
 <1dc563bf-feda-e11a-c159-91ae0529a36b@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vMa8EY6sJBiaqYUH"
Content-Disposition: inline
In-Reply-To: <1dc563bf-feda-e11a-c159-91ae0529a36b@linux.intel.com>
X-Cookie: You may be recognized soon.  Hide.
Cc: Jason Zhu <jason.zhu@rock-chips.com>, sugar.zhang@rock-chips.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com
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


--vMa8EY6sJBiaqYUH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 09:52:34AM +0200, Pierre-Louis Bossart wrote:
> On 9/26/22 03:34, Jason Zhu wrote:
> > =E5=9C=A8 2022/9/23 20:55, Mark Brown =E5=86=99=E9=81=93:

> >>> The data can not be lost in this process. So we attach VAD & PDM
> >>> in the same card, then close the card and wake up VAD & PDM again
> >>> when the system is goto sleep. Like these code:

> >> This sounds like a very normal thing with a standard audio stream -
> >> other devices have similar VAD stuff without needing to open code acce=
ss
> >> to the PCM operations?

> > At present, only VAD is handled in this way by Rockchip.

The point here is that other non-Rockchip devices do similar sounding
things?

> >> Generally things just continue to stream the voice data through the sa=
me
> >> VAD stream IIRC - switching just adds complexity here, you don't have =
to
> >> deal with joining the VAD and regular streams up for one thing.

> > Yes, this looks complicated. But our chip's sram which is assigned to V=
AD
> >=20
> > maybe used by other devices when the system is alive.=C2=A0 So we have =
to copy
> >=20
> > sound data in sram firstly, then use the DDR(SDRAM) to record sound dat=
a.

> There are other devices that requires a copy of the history buffer from
> one PCM device and a software stitching with the real-time data coming
> from another PCM device. It's not ideal but not uncommon either, even
> for upcoming SDCA devices, combining data from 2 PCM devices will be an
> allowed option (with additional control information to help with the
> stitching).

If this is something that's not uncommon that sounds like an even
stronger reason for not just randomly exporting the symbols and open
coding things in individual drivers outside of framework control.  What
are these other use cases, or is it other instances of the same thing?

TBH this sounds like at least partly a userspace problem rather than a
kernel one, as with other things that tie multiple audio streams
together.

--vMa8EY6sJBiaqYUH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMxxj0ACgkQJNaLcl1U
h9CK+gf+KdY/fgDeQdpiXw/0Ql8ImlWfSdKhtGuCqqUvhP6zhg012HLjm++LtlEy
qSgPJaynpFmi9dTy7V+60jrRQ1gP56W4NV12Gb0F81kXKWWncXe/RtaVnnru4IUc
X6E63WJgW3YnePAQK0lHftcplbyYme+cBlbLAlB5R43CM3glS0FpjZcvO6ZIzN51
krrzL5zxBsRjH0mZ82B407peFhpDibPlJ2VdHGJlUakuAgIcqdFrguLt6FtZanvb
1FGZqKqVw8pzWesyVtQaVLmw0B5+KC6npO24scAkHYHYgwQWp5sQX+OtbR/eYdzl
vhaqZcm7ohAuVc9GPA2R+1ODWm3xpg==
=Iz3O
-----END PGP SIGNATURE-----

--vMa8EY6sJBiaqYUH--
