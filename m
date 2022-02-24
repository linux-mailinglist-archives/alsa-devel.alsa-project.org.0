Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8411C4C33BB
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 18:28:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FDBB1AC8;
	Thu, 24 Feb 2022 18:27:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FDBB1AC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645723700;
	bh=qCpxIPkZrPYm3MRUETUhcfW4faQsayzUe443tI29gZk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kaar6og19LBjUTglaTFMjDkuxTdbY7kC+v6w5XpzaZ7Cmy2mVMegAeOz0LyRUIksg
	 slh5cMGvtX9ki2QJb6G3jyZBL98vnpoQn4mIhREwx5sVyBDxllMLqJ/Qrua8bqIWhr
	 /w+phl1ZXOUgwT2hUcLF4iJrHH6F5+LlEJt5qa9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 799E4F80310;
	Thu, 24 Feb 2022 18:27:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB979F800B6; Thu, 24 Feb 2022 18:27:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94AC8F800B6;
 Thu, 24 Feb 2022 18:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94AC8F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WnGhCRLd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD585B827F9;
 Thu, 24 Feb 2022 17:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828C1C340E9;
 Thu, 24 Feb 2022 17:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645723620;
 bh=qCpxIPkZrPYm3MRUETUhcfW4faQsayzUe443tI29gZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WnGhCRLd8t9bKXokSUyN7vu/rS4sMRo3OjkMPiGKRxd94Bv+krIhaRp4pY8s3t8Wv
 QlYtp3yXcR/oYhxV6p6kX/QYQrNMkUrIsKa9isyu1y78T475R6sW5u68I+6BlLGg8j
 2ZnHcFOfZs9Fc7RXGQfUuQlBBenj0OXL77yltANwHw9mBKZVSlwD77R+YyPAZhGp1Q
 EXfwMkc5zfvKSa/Nof2eWmmFPhmqmNuogJ8MFxhgl/Scmk7+bKXjfTMggoEYeksMDR
 /F1sRsVapIqxee+PIWja3SqW7IWep99CGha/TrjgD4X4rDTbAIqCvc/lUF6Slt8IPG
 7itTNySzn9VUA==
Date: Thu, 24 Feb 2022 17:26:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Subject: Re: [PATCH] ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM
Message-ID: <Yhe/3rELNfFOdU4L@sirena.org.uk>
References: <20220224145124.15985-1-ammarfaizi2@gnuweeb.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="P1GVxpuNWL6fQTf7"
Content-Disposition: inline
In-Reply-To: <20220224145124.15985-1-ammarfaizi2@gnuweeb.org>
X-Cookie: I smell a wumpus.
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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


--P1GVxpuNWL6fQTf7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 09:51:24PM +0700, Ammar Faizi wrote:
> From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
>=20
> Do not call snd_dma_free_pages() when snd_dma_alloc_pages() returns
> -ENOMEM because it leads to a NULL pointer dereference bug.
>=20
> The dmesg says:
>=20
>   <6>[109482.497835][T138537] usb 1-2: Manufacturer: SIGMACHIP
>   <6>[109482.502506][T138537] input: SIGMACHIP USB Keyboard as /devices/p=
ci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0/0003:1C4F:0002.000D/input/input34
>   <6>[109482.558976][T138537] hid-generic 0003:1C4F:0002.000D: input,hidr=
aw1: USB HID v1.10 Keyboard [SIGMACHIP USB Keyboard] on usb-0000:00:14.0-2/=
input0
>   <6>[109482.561653][T138537] input: SIGMACHIP USB Keyboard Consumer Cont=
rol as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:1C4F:0002.000=
E/input/input35

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

--P1GVxpuNWL6fQTf7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIXv90ACgkQJNaLcl1U
h9DGNggAglmdN2ru7N2IfI7rxiJiO0A5rEtjeaQiUAWknIbQnz1voUjRkigNNdGY
6zRoxcOr1bqgbD5x5fLFhmsYfXpGjrCWXMTEZS+0gZdnwdhDPMbmUrzA2N2/K3Bv
+pfDNojNUKogEyIYcOv0us5bTxHFSm1OWFfFVyxhWHZz+L6MPQ2BfQiRGeh9fA4X
b2JhqifhWnbijUOAizyCtfhiaVk2O4ZOyoldhtkDiRdx6eM49ADyaEv+Kq2rnCkZ
MqOt4Oz4EKAdmCoAIv2m8/Vb8V2p9J2J91N8SVG/GUxM7zZ03kp2vbbLXyWNfb1u
foJsHidMgWYzQAWqIFvYLuIb7xZ0Qg==
=oFvq
-----END PGP SIGNATURE-----

--P1GVxpuNWL6fQTf7--
