Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F275EA726
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 15:28:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5BAF204;
	Mon, 26 Sep 2022 15:27:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5BAF204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664198893;
	bh=X4krFBdD4YBSMJWhMxVRmiJA8BmDJcxguLhvT2x7FMI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fBVnLEHag+ZsgE25enB8BluTOJl7Wr5g1wDzZxW3Ixg0JTL8zly4tOJ6/yb4Rts64
	 tCnbJNsaESFGdgq0k1iBsJbyBZ4yTf25QwEq0lhs4hExp0vUsM8QOgestBHQI2M308
	 cPpbhecVHDisIrMoDwqRHAcXSA+dAl4VSLTXojDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E1F5F80115;
	Mon, 26 Sep 2022 15:27:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08420F80115; Mon, 26 Sep 2022 15:27:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8874F80115
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 15:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8874F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cyJIrULj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7003460A6D;
 Mon, 26 Sep 2022 13:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE55C433D6;
 Mon, 26 Sep 2022 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664198830;
 bh=X4krFBdD4YBSMJWhMxVRmiJA8BmDJcxguLhvT2x7FMI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cyJIrULjx1jYP9GG6AwNB+942qX/pKwHpmXoEe1L7mu2qEhFvD82Izy2XNdbHH45G
 iiHPxGX4aKTRI4dmBvtj2bDcsPCcVPnSLHUl+pyXj9Dn1kQejiP+1RShvdxDzPbWfz
 CHnq1VjVrc8oOi4IRu6O9GSGRXL+l5x4HPwo+MD2b5V+OUiEB2D6jQ9aTlAIGQr0jw
 OB9S3DohbEhMfyDRrJ8jxUYhuoaYHa88yCrpQpwDBGa8M2zjLJnSfPBBNxebVDiJzh
 NsLqcgX3XXlQ5mMreiyvD/dLcbVyX2feVFNWYwmAMHsnDLge3nov1X2FDkpaVvzRdN
 kLUMefAQCMbBQ==
Date: Mon, 26 Sep 2022 14:27:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: amd: acp3x-5682: Remove SND_JACK_LINEOUT
Message-ID: <YzGoqEFunlmj+kAn@sirena.org.uk>
References: <20220924095025.7778-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZQPBE47Sg1dDVZFM"
Content-Disposition: inline
In-Reply-To: <20220924095025.7778-1-akihiko.odaki@gmail.com>
X-Cookie: You may be recognized soon.  Hide.
Cc: alsa-devel@alsa-project.org,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado
 <nfraprado@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
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


--ZQPBE47Sg1dDVZFM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 24, 2022 at 06:50:24PM +0900, Akihiko Odaki wrote:

> RT5682 only has a headset jack.

>  	ret = snd_soc_card_jack_new(card, "Headset Jack",
> -				SND_JACK_HEADSET | SND_JACK_LINEOUT |
> +				SND_JACK_HEADSET |

Will the device by any chance happily drive this as a line output
(possibly even detect if it's a headphone or a line output device
attached)?  The CODEC hardware is often interchangable.

--ZQPBE47Sg1dDVZFM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMxqKgACgkQJNaLcl1U
h9CgyQf/XdHOCs25OMxT+vFXwhG57sTC9SvLFRmQdU3/UrthbFtwSnjQ67s1gXeI
r9xy8U2nVaRVjC3aL/q6Gxhhhh4ofUV/rWs0FvCTk29dYQxDGWaD4kvo6A3F3TjS
fw0kF3fBGt4XT5/OP6Bn14BThrupUeVwKW1bIw4y/9KbR7lg5hL/ua4RszUFUsmv
0E3QuSLuz3PCfuUhC/H+5uyxTNwglwFnDq8fVVd0sbIFt79aZ9GkoY6I/PamIz2I
Cp6C1UCjDrx3KPeOi+OfE8+xK7Xm8CBD0TUvM2C2OytXSCgA+doqcW7RC+ZaSuvH
LJG72iyPpAtqquWuz/1zcpibi72eag==
=KGMW
-----END PGP SIGNATURE-----

--ZQPBE47Sg1dDVZFM--
