Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 810C446D50E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 15:06:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00A2826B9;
	Wed,  8 Dec 2021 15:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00A2826B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638972395;
	bh=vS1icKEjwwFDMks8ZEP6VHIjK8xXwV7tmx3OxQCGPa4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=beDPFCmID7zryFGi7ftuigOJVNEpY/i8PgmJlBURV9gpyB02rT9qpp+E/QvoDiKKk
	 hgfVCnsOxrF6qwmF8u2suk7587K5FqoavkddtoG7y/Kx0w+8DtXkgQgRyX5Jkm3H5i
	 46h6/V3ZEBKlxKg0ed4sCDjCxYgroPcUSUxdQa5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61AC1F804CC;
	Wed,  8 Dec 2021 15:05:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7983CF804E5; Wed,  8 Dec 2021 15:05:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 645F3F800AB
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 15:05:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 645F3F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dh7WNodL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9B3DB820ED;
 Wed,  8 Dec 2021 14:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D3CC00446;
 Wed,  8 Dec 2021 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638972311;
 bh=vS1icKEjwwFDMks8ZEP6VHIjK8xXwV7tmx3OxQCGPa4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dh7WNodLKyM24s9Wp1+uYZ2KSzJJiWdKVYrtanLmUsv5t74iYftQAw7bWw1LWAoqM
 KcIppoQBS6hxp5ZRgslT2XUDa6tLwcW5ONQvitQfNtXSgV7NBS9GkpD79iLRZA5OWR
 vK80u83eimkFeQZqEGYY7JXOvy6dnJU+0zcpuMZlErwmfBgzrCPjZFZABzOLAuwoTl
 cev27RMFydVyvCKmKLnQhnMINCX50WrNNS93repBbTmN0L/EEdIe6XrYPVkEeqouhD
 h/+tTMhO+9WcrrOAGggEJXxBIxfbxk/iDjygQZ/3Z9bX+F2YC9ryGL2Gntp52Jc0rt
 0VRSylJGxhwYw==
Date: Wed, 8 Dec 2021 14:05:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Qing Wang <wangqing@vivo.com>
Subject: Re: [PATCH] sound: fsl: add missing put_device() call in
 imx_hdmi_probe()
Message-ID: <YbC7kffqjbqoPkW5@sirena.org.uk>
References: <1638881818-3407-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rKb0zWUnE/0QDh3m"
Content-Disposition: inline
In-Reply-To: <1638881818-3407-1-git-send-email-wangqing@vivo.com>
X-Cookie: Alex Haley was adopted!
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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


--rKb0zWUnE/0QDh3m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 04:56:58AM -0800, Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
>=20
> of_find_device_by_node() takes a reference to the embedded struct device=
=20
> which needs to be dropped when error return.

=2E..

>  	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data) {
> +		put_device(&cpu_pdev->dev);

If it's of_find_device_by_node() you need an of_node_put() since you're
dropping a reference on the OF node.

--rKb0zWUnE/0QDh3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGwu5AACgkQJNaLcl1U
h9DDOQf+J5zK6lF7fGbSzDyocKgHfhSXm+Zi4VikzTPBrRjWBzR7I7Xb3EzyftoK
q8scd1RieKQjYG9+EwWFxAiw3o+L68/BfzK7PGEiiH6PoyGCl0woc87FdYofTIzV
bfWOkjr2i151MEEhmI7Ho00H6jrCvoAYlmyV5aZhjEkv5jLwpzkM0Otk0SIfE5Kw
pzi4d0B35D1JthsWkLp8c4R9SD1zN7G1U/RgXbBTkd3Bcj5LgFK0UpEHKt/ahqqE
mWhpqjAC9q3V0M8T4KLW1riUZ3S2UpW0KYF8y1aoFlrUN8opchz1FFR6J88ddhpi
/KdYZR2CzkcCZcFbxRILlTIJy5q6rw==
=vpxc
-----END PGP SIGNATURE-----

--rKb0zWUnE/0QDh3m--
