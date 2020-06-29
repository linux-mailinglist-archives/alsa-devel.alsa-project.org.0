Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C97220D8FD
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 22:10:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D4E3165D;
	Mon, 29 Jun 2020 22:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D4E3165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593461440;
	bh=eBia/hOGJby2Wgw/Rt4bVtat1qqHofYPSo8W1xsrm7E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L5waD1Xw1OtyDvUEoSq/9RgnfO6tIVZJ9JDmYP0Pyzk2Mgp8w0nvZe9MOSPYejqUf
	 R5kMkZIJPkLLtwIzcVNxBLNKoL3iWkDH2F1jwKuUUfvcwcF8ZRulth+U7W6TdFfrzU
	 yrnA8EewhtAIJezT5smw/tmQzuH2nzQiRNIIHv1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CBBAF80229;
	Mon, 29 Jun 2020 22:09:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFA73F802A7; Mon, 29 Jun 2020 22:09:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64083F8020C
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 22:09:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64083F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W0FYyimL"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BFEA207D0;
 Mon, 29 Jun 2020 20:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593461346;
 bh=eBia/hOGJby2Wgw/Rt4bVtat1qqHofYPSo8W1xsrm7E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W0FYyimLvT9MBTtVTi2Tm5HyuK5Mk82UP5K/pmhBc7JB7uAJ3l9jw6N7nAztLpiN8
 OXbtCbczWWy4IQ0lfoPaSqSeyTF1Q0M0kOTKZ8rIu+mWvr5BZ6OfaAUkaSwCmrUuEb
 /xQ3+E1GKsRnrqlLEIfOjfRBm3Va1GgD9ezLXSw4=
Date: Mon, 29 Jun 2020 21:09:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 5/6] ASoC: rt5670: Remove struct rt5670_platform_data
Message-ID: <20200629200904.GK5499@sirena.org.uk>
References: <20200628155231.71089-1-hdegoede@redhat.com>
 <20200628155231.71089-6-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3D7yMlnunRPwJqC7"
Content-Disposition: inline
In-Reply-To: <20200628155231.71089-6-hdegoede@redhat.com>
X-Cookie: Real programs don't eat cache.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
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


--3D7yMlnunRPwJqC7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2020 at 05:52:30PM +0200, Hans de Goede wrote:
> platform_data is an obsolete concept, instead device_properties,
> set through e.g. device-tree, should be used.
>=20
> struct rt5670_platform_data is only used internally by the rt5670 codec
> driver, so lets remove it before someone starts relying on it.

This doesn't apply against current code, please check and resend.

--3D7yMlnunRPwJqC7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl76Sl8ACgkQJNaLcl1U
h9AfuQf+KIXf6Qztg+uQpHZKaDE7lIBFccGCFum9sqZS1S13FQR6Fpb5zHLFCz5t
f2ivT1j+7vtAK6ARRyJSMcwJAbVPvL63mO4H1rRi1712jTqif841lGMCJxednMOO
aG3xZ5zowIcWBL7dtfaq38axzrQKrL8086cVDPZgPYbyK4o4XIw1mTxGU+RzetVD
WUr7p07s3PZkPaurpiu336eg54BYuunts/Aa2w0yPEe2h5yvRzRHyj90b9jx7kfd
VZoBwGE7+HL6EVkQMaiP5bgtkbm4/UWxfWuAK1NhDS/ratwTB7BpFL1weURBGlxr
qswTDNyBH8QKTS5QBkWZD5RSENd0fg==
=SyIz
-----END PGP SIGNATURE-----

--3D7yMlnunRPwJqC7--
