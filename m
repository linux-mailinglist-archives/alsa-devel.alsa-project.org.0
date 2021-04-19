Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 320E5364892
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 18:53:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA128167F;
	Mon, 19 Apr 2021 18:52:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA128167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618851196;
	bh=t9sKdxxzF27jAaOVI4eHqjzPUfXADPMgQYX+irmFUk0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u5QhS34TFg9qL8Tght5zn2cXkZqaY03tUEniv0kekUF9fQV1WXVt/pqxx3melZkrO
	 m6CxNwT6Zm4gqMp1qwuXrcvefzrJhC51+ogTlXEiwnAksch2W0baZEZSLZfI2ckYsI
	 opeZVYXXBNGsjaJLJwzVZnKYdK3VqB4ge1z9P4EI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33DBFF8025A;
	Mon, 19 Apr 2021 18:51:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6791F800C5; Mon, 19 Apr 2021 18:51:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D878EF800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 18:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D878EF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CwFymYgI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB17761157;
 Mon, 19 Apr 2021 16:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618851101;
 bh=t9sKdxxzF27jAaOVI4eHqjzPUfXADPMgQYX+irmFUk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CwFymYgI15t5RJdIt0yPfIuTQtPQwHkpO6pDwb1d03MI1+VR896Udz77inzmv2zMF
 /bEaNAulEu3ZnL6QUlbSgsDZzVvOU6zOx6vhgMvzDi4Cpa74ty3D7bZSjRuZ7e/890
 PP2hnN7E6696JYCxvrl/n3thppWVNEQVWGEU9gAvyRNHtPDyl6TIPbowwwzwSk82EX
 7VGl4ZuN3VnpNEE4Y6USl56WYdeQ4JD0vTD1x4gtlrolDEbTpbIdSfP0QGc02kJdbk
 2FB1c+T9zrzhHmIY3Qi6v1vnkyjtgWftIFEHy6Cu4h4MPxPIypfcQOkhQ8SowtK4FA
 uFZLY2Tpvgihw==
Date: Mon, 19 Apr 2021 17:51:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [v6 1/3] mfd: Add Rockchip rk817 audio CODEC support
Message-ID: <20210419165116.GE5645@sirena.org.uk>
References: <SN6PR06MB5342B036562B085C95BDAB42A5499@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
Content-Disposition: inline
In-Reply-To: <SN6PR06MB5342B036562B085C95BDAB42A5499@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Cookie: I will never lie to you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 lee.jones@linaro.org
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


--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 19, 2021 at 10:57:16AM -0500, Chris Morgan wrote:

> +#ifdef CONFIG_SND_SOC_RK817
> +	case RK817_CODEC_DTOP_LPT_SRST:
> +#endif

The register map of the device isn't going to change based on the kernel
configuration, I wouldn't expect any ifdefs for it.

--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB9tQMACgkQJNaLcl1U
h9CIoAf8D+K0DW5kV8X4IhrEH80ku3GWfao1S2OxCs8G5XD7/051b/5x8HhBIHBQ
pvgT9Tm1ggkXtVNknjxzDKtmZbKngRQ31gqUJtYw9emHlD2CAk6pj9BpH+gq7RBZ
OWq8WRHO83aTGFJ66Q7kc8z6j+0t6nMKe9/IB+fDq0AbH/eKlYK1UZDOLWvG2XI/
R5PZ21SuIrA5iVCBJnKs9y9Re5Cj+bTVL0Kkp4LQAeB+v+1OglgYC8dMag2al52c
vvCibAvGmJ2CzJxgZX6reyY5n1r0Op/3a4NHRIi2bSeI/tOPXRoSn+R5Ad4VUEJD
ZO08QlNJkRlB6Q/4iQIwP30aexXaBg==
=9x18
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--
