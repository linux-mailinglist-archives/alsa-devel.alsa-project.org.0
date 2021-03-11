Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E963378B1
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 17:03:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8B6E18B1;
	Thu, 11 Mar 2021 17:03:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8B6E18B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615478634;
	bh=k5Mt9Qg9aBLbjUdebuqcA0/O+qs6ydLJzvh3zLJ9niA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XdZz9t4bj4/JojZ7TAs1KGegDumMhPa7FInDQg+7AjumMusIvbOxZc1b0bvdsBmD4
	 Sf3UqpnvSgrnlFBMU31Ba3iq2DXe6WBpjulAwsvfIFHcprMtRgPs+IqcjhsxcywYha
	 mv6qXYFcNRTq0z77RZeEk10S0ysbGzJlJXMxkHEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B8D9F8015B;
	Thu, 11 Mar 2021 17:02:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 305CFF80227; Thu, 11 Mar 2021 17:02:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DECBF8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 17:02:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DECBF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="asvfWEmR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 402CA64FDD;
 Thu, 11 Mar 2021 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615478525;
 bh=k5Mt9Qg9aBLbjUdebuqcA0/O+qs6ydLJzvh3zLJ9niA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=asvfWEmRsr+DqDZNyr2S+UZNW58YvwhqdM66MSke1wE6gY3SsOw3zraq7u+bjslnB
 8hZT7z/PEmV5nT7/PXtFhqDTS4IWH1tMMnl7Raz9XSFsc/nN1qu5zeEy5DQY5ardn9
 gm3a/tSCbRbEnkDFD3x20EXp1YiUlebjGo+3c2DrmVXGC6NBvIfoXNKTgQ8iDgrLsP
 WPTGMzlSUc1KNxK27EX7j5L9K1Iix0nUaVD2hgwu8YMPqXbEvKoeOjUPz33zWpweAe
 Wb2iQ4F8Q298TbIygnWKpPEQS+VuVL5xw+DQbsi0aYAwgKyHlHJLicrGcq/gWl5k3/
 46eigJX9Epi5A==
Date: Thu, 11 Mar 2021 16:00:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
Message-ID: <20210311160052.GF4962@sirena.org.uk>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eDB11BtaWSyaBkpc"
Content-Disposition: inline
In-Reply-To: <20210309144156.18887-1-michael@walle.cc>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org, spujar@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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


--eDB11BtaWSyaBkpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 03:41:56PM +0100, Michael Walle wrote:
> Hi,
>=20
> > If "clocks =3D <&xxx>" is specified from the CPU or Codec component
> > device node, the clock is not getting enabled. Thus audio playback
> > or capture fails.

> This actually breaks sound on my board
> (arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts).

Please, when sending replies format the subject line like normal replies
with a "Re: " at the start so people can tell it's a reply to an
existing discussion and not a new patch.

--eDB11BtaWSyaBkpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBKPrQACgkQJNaLcl1U
h9Bz8wf/TDlUuWpXDfOMG5KASnW4G2LE4KydQVmKQgJJQ9RT3sRl9JYT7iCFpfVx
nROTNxkE6gbvTO8YCwzPOKPqDgTM5GvWjxAgoxAEDf0Zw6RnoWeBxDxp5IeahvRG
e0i0dlSczfB1KOytXcjTSg1l6HMl41kUpsS8mTuEuIQv23rGbLfykAsXFHxvIbIt
y0sZUgwflgw0dC8CtUObQWnYnepiUvCYoCXwv66lvIW7nnLu+gIPjjAlB3SOZDrc
yM9sBXsvhLSAmKiGL3FcvqDV401wrMG2poryA9BHvAH50rVdHgyiaxSEOJWn1weF
AmzzM+gHNpzb5iWKDYON4aX0ZEh+OA==
=z+cv
-----END PGP SIGNATURE-----

--eDB11BtaWSyaBkpc--
