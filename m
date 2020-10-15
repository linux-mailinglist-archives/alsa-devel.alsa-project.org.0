Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2A728F02A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Oct 2020 12:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E789B1762;
	Thu, 15 Oct 2020 12:26:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E789B1762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602757661;
	bh=e2OcHsN9ES6PPA3lZxwakFzA4OzuQt32BzEijRE+BpU=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LkMWLLQAlxjsszDHjWLj+sQIZ0j5ffq7QHSG132R3wGspKGMwhkOgKIcsEbCluIc5
	 7CyxxLmxiuTXatroCJ/PYqApfadZ/43trhKf6uy05GyFrppUBFTYNL3N9ItrHnZ724
	 Xz5wb4CITLDhEqgvR+8ar2BaMQpda+YkotZQCpLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D7A2F801D9;
	Thu, 15 Oct 2020 12:26:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56B33F801A3; Thu, 15 Oct 2020 12:25:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7137BF800F6
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 12:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7137BF800F6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AF2B5AC83;
 Thu, 15 Oct 2020 10:25:50 +0000 (UTC)
Message-ID: <e9db1a11519dce0938cef867179160a818ec4143.camel@suse.de>
Subject: Re: [PATCH 6/7] ARM: dts: Add dts for Raspberry Pi 4 + Cirrus Logic
 Lochnagar2
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org, 
 robh+dt@kernel.org
Date: Thu, 15 Oct 2020 12:25:49 +0200
In-Reply-To: <20201014145418.31838-7-rf@opensource.cirrus.com>
References: <20201014145418.31838-1-rf@opensource.cirrus.com>
 <20201014145418.31838-7-rf@opensource.cirrus.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-rg1Z1psyHTidcmcRlxsR"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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


--=-rg1Z1psyHTidcmcRlxsR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,
your series is very welcome, upstream support for audio codecs on the RPi4 =
has
always been lackluster.

Could you provide more information on the actual products? Are there custom
made hats for the RPi4 or this wired into a generic development board.

On Wed, 2020-10-14 at 15:54 +0100, Richard Fitzgerald wrote:
> This is based on the default bcm2711-rpi-4-b.dts.

Note that you could've included bcm2711-rpi-4.dts (as if it was a .dtsi).

> Configurations are provided for Cirrus Logic codecs CS42L92, CS47L15,
> CS47L24, CS47L35, CS47L90 and WM8998.
>=20
> For each codec there is a sound node and a codec device node and both
> default to disabled. Enable the pair for the codec in use.
>=20
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---

Sadly I don't think creating a new device tree is a good solution here. If =
we
were to do so for every RPi hat/usage it'd become unmanageable very fast. T=
here
is a way to maintain this in the open nonetheless. I suggest you build a DT
overlay and submit it to https://github.com/raspberrypi/linux, see
'arch/arm/boot/dts/overlays.' The Raspberry Pi engineers have a kernel bran=
ch
that tracks of the latest kernel release, so once you get the rest of patch=
es
sorted out and they are included in a release it'll make sense to do so.

I can't tell for other distros, but opensuse packages overlays, so the effo=
rt
will ultimately be useful to users.

Regards,
Nicolas



--=-rg1Z1psyHTidcmcRlxsR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl+II60ACgkQlfZmHno8
x/4U9wgAsWhm4/aDqQO9wUk6ramYK5rUch1Csrbbalv3FNu6rXMMkEmpue5N6A1F
4paxIRqGcyBoG8/h2v0ZwR9vtxQsfVjowhMT8Zg7I18Q5NyY8BLnpcgAVnwHaJPK
8mDXlnNW7z7lDW4iPquUynmKIXWxoEiBVU5jRiZG/z7q7Q6y6sWw0jxA9RDdW6Tb
sEqixk28Ood4n0o/F01/o3CLyiw1wc+PR/0F93eDsTrfzRhrqokO/8oAhpS9ka6S
5QdcQfiLNtmgw+pC7of84rmMxQq/cLkzz1hpy0UVUTFwrB1gns3fIPJF8DBYcoP5
xz5IwG+98djRhcojk1ncD+uTqoHi3g==
=iBXI
-----END PGP SIGNATURE-----

--=-rg1Z1psyHTidcmcRlxsR--

