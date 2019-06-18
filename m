Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F079249E8B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 12:48:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F13316DE;
	Tue, 18 Jun 2019 12:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F13316DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560854887;
	bh=Eye3r+S/hsk8MP4PSQrEnXt2AstZlOgXlHSCHRKOiNI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WX4IkLuAhY0VXHgsAussGKGMJ7OMI14rh+BZAZiTOJnmrpEKCz2uUzeY07RMtUEKj
	 Dgtoy9oGHDgttXzzneNtn6s/iDS1JLtV5/q8Nmrai6E4UM0OgkBspC9sg9CBlEpMdz
	 JTPzsrsrASeMBLon1SFN+0eZRVeERKg6Npd9xkI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD07DF896DB;
	Tue, 18 Jun 2019 12:46:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A699F896F4; Tue, 18 Jun 2019 12:46:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3CC0F80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 12:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3CC0F80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="VAiPzhlL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aVLmUSE1bjHNRpYTochsxHsqiLIVHQiO1axTK/WImOw=; b=VAiPzhlLlNqvLBVWH2Z1tnJw0
 LxAFFL9Di3IskZ1o5eSzaJ5+P2Ja68D61IwTjLy3HcKkS/XqKX7fBcxYG0B7D9hoRzNr6VQ4vOHVw
 s2F0ZOHiqx8kq89qLcbFPyM/JNb778BP9wZYR5SFnH/b73UYvM7cHwB2teHofly5wFhkg=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdBd2-0004vV-ON; Tue, 18 Jun 2019 10:46:16 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 2D23F440046; Tue, 18 Jun 2019 11:46:16 +0100 (BST)
Date: Tue, 18 Jun 2019 11:46:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190618104616.GK5316@sirena.org.uk>
References: <1560844059-5897-1-git-send-email-bgoswami@codeaurora.org>
 <s5hsgs7e0wr.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hsgs7e0wr.wl-tiwai@suse.de>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 srinivas.kandagatla@linaro.org, plai@codeaurora.org
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-core: export function to find
 components
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
Content-Type: multipart/mixed; boundary="===============4386972750024376590=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4386972750024376590==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HEgoE9Ku6Eog9oq6"
Content-Disposition: inline


--HEgoE9Ku6Eog9oq6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2019 at 10:46:28AM +0200, Takashi Iwai wrote:
> bgoswami@codeaurora.org wrote:

> > Drivers may need to use the ASoC core function to
> > find out whether a particular component is already
> > registered with ASoC core or not.
> > Export the function so that drivers can use it outside
> > of the file.

Why might they need to do that?

> Why not EXPORT_SYMBOL_GPL()?

All the other ASoC exports are GPL, any new ones should be too.

--HEgoE9Ku6Eog9oq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0IwPcACgkQJNaLcl1U
h9A2Hgf+MLN+CcPHI83z4dawcdkQR9dkXmxPPnBx/+6qohSXV8XhWaclTwZnF3S9
OlcFavt5pJZrMSjiK8aP5ddu4/YCEUocw2+iz6QfpFTg+FGMKEmqBA/9iQJ4nzOK
Rni3N11FRaWz8c8pMrGHqZJYfsSBN4x9ujfMGC4Gz+Rfidv39bv/bE5wgEriVtoI
WfRQwEGqyGPE/caYbtjr6iAm/RecpQdj+TsAjgYrKCnISKFChwXapzOw6zBa+LiF
Iv8LdXvEAXRJ0ESIDWwK1EDxfjhvB0NfEdfIa9CedUw6Jc5VYxE2iMJgBVWAmgyz
ZbDyXdWW8qEzyvsU1wPlGPw6tugTrg==
=bPzC
-----END PGP SIGNATURE-----

--HEgoE9Ku6Eog9oq6--

--===============4386972750024376590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4386972750024376590==--
