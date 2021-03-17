Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E88F633FA19
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 21:46:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ECC416C1;
	Wed, 17 Mar 2021 21:45:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ECC416C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616013997;
	bh=MLyig3WWtVsDpwPpYJtjXRhdS5TArQK/uRudjZsf1kY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0Zz4xP02C4vDuhJO2tv8Ms4sWATi+YK6R38AwNyaBuS1z8r8x/WcLBwYtcke5Un6
	 CisSFiGnjz4AxrCtfkeFazjtdfkxef8FewPpk2+Ka8XrH7NngY7LJ1cZpGu35BH1el
	 cGjWCMq/k4xArudejG2IeFool+NAZUYVV/l1KGNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0151AF8013F;
	Wed, 17 Mar 2021 21:45:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8BF0F8021C; Wed, 17 Mar 2021 21:45:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01E86F80124
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 21:45:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01E86F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RU/S8D2/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8A6664E74;
 Wed, 17 Mar 2021 20:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616013897;
 bh=MLyig3WWtVsDpwPpYJtjXRhdS5TArQK/uRudjZsf1kY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RU/S8D2/0aCAU6yyGJ/XcwByX/qbjq7jhn16LAcCB6pgu9EepsPmeir+DJgZsPA8r
 n9gcgp+YIBgOZpnZIEy7DTvanpenQfYPWTdq8/Ie07fBdefeXZR/2cLzw4knURkTd8
 PvnrtfFphTDtDQsbVf3HGAtuSQOXyokWapjIVChpyhHHLvpXgatIf4geS5HV4YlceU
 NHYszCsMO+lYCDBvwV4c8VpXfiEtmehn+32NcbHr730L2czjSR8+ZXMRaTj0xJKIpk
 oDQcfrCVH4szy961/jojkZEg5kP1aOmRJUBwg5eSarsw2+1ywKowk82ytJJPLbv4uD
 VcmZrR+Be9m1Q==
Date: Wed, 17 Mar 2021 20:44:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: Add Rockchip rk817 audio CODEC support
Message-ID: <20210317204453.GF5559@sirena.org.uk>
References: <20210317202117.29926-1-macromorgan@hotmail.com>
 <SN6PR06MB53424766F673FC2427CD9AD1A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Content-Disposition: inline
In-Reply-To: <SN6PR06MB53424766F673FC2427CD9AD1A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Cookie: Please ignore previous fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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


--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 17, 2021 at 03:21:16PM -0500, Chris Morgan wrote:

> +  compatible:
> +    enum:
> +      - rockchip,rk817-codec

Sorry, should have picked this up on the previous version - you
shouldn't need the compatible here, an rk817 always has a CODEC.  The
actual driver has already been updatd and doesn't use it anyway.

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBSakQACgkQJNaLcl1U
h9ASqQf/dNuc44FkIxDZP1BWS5EqoIkt9UxIHgul808Kt7kHQWxlGV5Q+ntt/0+D
ExxGUJbgSVHJ6X4dsL7vN9eeao3uy7rbj7o/sldJHjHVpVe5hwOc7wVz6iKxcRzP
EPS7y7szp2TZcvpGIGXHOYkOKLThVZvr4Yn8uoeELRAYOKfKAWOSMisy0F7kI6KC
kcqXwn2oZ+pigAN3LPJ4EmisTy4TyBBzReaV2RcJ7gLLcV3Fc1eGpPRnPLO3RDK1
l3iA77X4hH+J7043LDcEtmjiWgQ+7V7P+DKoExSNuXqCVkFSQPXe5hqF3xasvW3Z
hm1DdXOS3YqXCepLsHygOe1kB1jIdw==
=fkN9
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--
