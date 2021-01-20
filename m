Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF632FD6E8
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 18:32:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7002217A5;
	Wed, 20 Jan 2021 18:31:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7002217A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611163942;
	bh=sK1H8yo1jjjsymX10OU1Y996WP0s8QCFr6B+h6ojjfU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Et5d7pcOrtTbuYomYauV/9VCzPyVq/4eMohBdcP5ksXXI8d65lknV766eKnYBj6Ws
	 Iu8UhO5nlKlO+NVs/cn/g1zMZEBUWFDGtcb3/Q4C6teZSh1KUarjpHvumcRqm8c7VN
	 l4+3zCn9TOTREYcEpOry3cLBQc1ZnCIEj+FYPysk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 048B0F8019B;
	Wed, 20 Jan 2021 18:30:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71FC5F8016E; Wed, 20 Jan 2021 18:30:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D890F8012C
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 18:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D890F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="McuxXRzE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CDA6233F7;
 Wed, 20 Jan 2021 17:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611163826;
 bh=sK1H8yo1jjjsymX10OU1Y996WP0s8QCFr6B+h6ojjfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=McuxXRzERZ2uZGOBmnYGJdtWbxy16HxuxU2F1Icdd4Z3ozo9dgtjoCTs59ncuVKv0
 p1tyTDA0ABtnMHl95n0lVctPAAqBpIfyXz+HEKoS5LMt9lN+aj89DHY+UaxBanaJzp
 Xgf+i1PLdaphxcO1Vd5631IIO/l6YvRM9AquWR0jyoWis/Emk58zd1IymgZ7qpDvKw
 AUWG7/yF+Img4N5tZkr0araJMu/7H9IMKHMM22Iu04dfepH+UykplgOXJbo4fMml9F
 +bDSGi5Ll9GxMEoRi26TYUFsN2h5EgBtHoBS47aR/fijgX1FRoEOa0cYo5dWmsMAg1
 6COuhzZh/I6Ag==
Date: Wed, 20 Jan 2021 17:29:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 2/5] Revert "ASoC: soc-devres: add
 devm_snd_soc_register_dai()"
Message-ID: <20210120172948.GE6794@sirena.org.uk>
References: <20210120152846.1703655-1-amadeuszx.slawinski@linux.intel.com>
 <20210120152846.1703655-3-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Content-Disposition: inline
In-Reply-To: <20210120152846.1703655-3-amadeuszx.slawinski@linux.intel.com>
X-Cookie: Beware of Bigfoot!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 04:28:43PM +0100, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> As described in preceding patch, waiting with DAI removal until device
> is being unregistered can lead to working on freed memory, hence having

There is a potential for misuse with essentially all devm functions -
why is this one so special? =20

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

> DAIs managed by resource managed memory is a bad idea, revert commit
> creating devm_ API for this, so no one makes a mistake of using it.
>=20
> This reverts commit 0fae253af563cf5d1f5dc651d520c3eafd74f183.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAIaIsACgkQJNaLcl1U
h9BfNAf/fX7B97nG0AmW2i2T//+Rdzl1QAvhiNb05D8SGiJWFaPQCGFTqTZTOdf1
5K0dIGpNmfSBK6lu7ZoWwZh5zJwB1XH6dmIrZ7TjthdOdm1vQyhtPXC7XB8ykYNE
mXfu59HQTUD0KUDi8V2Js50Z9YnBC5FemWMe7N8n/fC4a5XD193cztPhtPtxajkZ
kOqeNX6/F9SIjl6yVQdrw1yJ4lozdsoryHeFgdB0rLZzsDk6KoD7SJaQtna2PSZB
GDqA5Cc1XCgAGxkfhWipZa73CYkxX6pR2RnEB3naYtMfrby1wSmj//M0LYjNwudJ
aTKF4dSQHxzhkaspTuHwqlB+xuN6Dw==
=lgXU
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--
