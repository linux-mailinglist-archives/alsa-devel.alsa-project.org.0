Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F75544E93
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 16:19:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DADEA1B40;
	Thu,  9 Jun 2022 16:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DADEA1B40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654784394;
	bh=I+cyGTwBi/7kSRYcxLWlDRMui0F2M/Q+zDER9wat+cY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AFOpfv2xc9zejRcZXhUJIVFNw/oXcdxkt46BOqcrQITp0MfO78JrDEgEJAZ94bbDk
	 /94o/6JdaIvUbzrtKvmQHtlHxL0XKRtRncBSSHfLEC2sOWPr5vUDmvnikZsTIeSlvY
	 GlEJerGoWVuhOb1H9tzQOYlcjCqKc4+opZBsC23c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B760F80240;
	Thu,  9 Jun 2022 16:18:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DEADF8019D; Thu,  9 Jun 2022 16:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E1B2F80116
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 16:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E1B2F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lBqy7k3W"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4710861DCE;
 Thu,  9 Jun 2022 14:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2143EC34114;
 Thu,  9 Jun 2022 14:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654784329;
 bh=I+cyGTwBi/7kSRYcxLWlDRMui0F2M/Q+zDER9wat+cY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lBqy7k3WJhy4nfUVWcvX2+nLZRgs2hmr9m+/Ja2/FtqnATitPL/Z5L7Np9RXCkYFU
 hxuRrXlX3i7EvUKA8cPsLikwTU5bMmmtH8ndincwoA0ByicFV3KRYzG5nVPUzOuyf7
 QX6bHWRt+YgJlfron8rSkC5a4T92/EY4TthkhjwEDnAWgxDC79SvL5vO71ekxSzOJJ
 xGFUVHEEaeElPzIaNRFxQ6wghJ709HPQJLr1teStxhZxUnHNdsDspB7gzLsfc5OjPe
 ADQI5i46qO75V6ggRr8/kbz8tcHt9E7CkRcr/d0BwcTMPcJ/gsMaSOS9JMkOn8reLP
 IHvSGuLLDraCQ==
Date: Thu, 9 Jun 2022 15:18:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 07/11] ASoC: codecs: rt274: Enable irq only when needed
Message-ID: <YqIBRGNAOfxPJjc+@sirena.org.uk>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
 <20220609133541.3984886-8-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m806SB0irtBBNaT7"
Content-Disposition: inline
In-Reply-To: <20220609133541.3984886-8-amadeuszx.slawinski@linux.intel.com>
X-Cookie: Space is limited.
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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


--m806SB0irtBBNaT7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 03:35:37PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> Interrupt is only needed when jack detection is enabled, so enable it
> then, similarly disable it when jack detection is being disabled.

>  	if (jack =3D=3D NULL) {
>  		/* Disable jack detection */
> +		disable_irq(rt274->i2c->irq);

There is absolutely no need to do this, it'll interfere with any sharing
of the interrupt and if the interrupt isn't firing then there is no cost
to having the interrupt registered.

The driver could use some cleanup of the interrupt handler, it currently
unconditionally clears anything that fires and reports IRQ_HANDLED but
should only report IRQ_HANDLED if there was anything from the device.
Practically speaking it shouldn't make much difference unless there's
spurious interrupts or the interrupt gets shared.

--m806SB0irtBBNaT7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKiAUQACgkQJNaLcl1U
h9AecggAgNu3TIFHR1lgO/jUMCljJ53BHKszbimkb61iPAkOG9YMF/n9TYaPuezx
7CglK7FQJ+OFxsXHDVvHLEmI79GkyAXnGfGqdkSjiduyJJ+GEDnEKJOuc74YkRcG
gzN0O9uzhOHSpg++qhHQ3SA1ca97LhAOVi/3oiuO5HwMo1KITB11VczCj7eIWAGH
a7wTJRFoqg3svxegM4RNyjWeo/Fim9Nmh5zRFpW/TayPJV6OeQR8EtcD4ywtJzUe
fDDC8amfnhToMGcTLL7nhzmOvdjzSE/+AygAF1H8a0HQ/GgvAyRtXfSdfGLdbDxV
B4HrGL1NXyjivKYNDZGJfhELxkxs8A==
=IVzp
-----END PGP SIGNATURE-----

--m806SB0irtBBNaT7--
