Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A23812ED494
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 17:45:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 283721684;
	Thu,  7 Jan 2021 17:44:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 283721684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610037932;
	bh=vuM9vAjQJkgCU4xBUoFmKddeaCN97wvKiCrb9wFq5Rs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q+gGMKOg96MrHIGJ7pCf2Gn6Rcz+ZifnLL5hFB3k2T2TxGmJxAs5QPUFQ79Cj1yWy
	 zW2KHFSTzrJypPKd+cun/08vYeoWq2Zi3SiggNI0hUEoOfyGZxY7AbWs7/UHqd7eo+
	 LK1PoSY8h6GHiBptDXYZSRNBvrsoP7lD8buMoZUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9943F800E9;
	Thu,  7 Jan 2021 17:43:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAA26F80258; Thu,  7 Jan 2021 17:43:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B391BF800E9
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 17:43:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B391BF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D3c+nbeK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06DA923403;
 Thu,  7 Jan 2021 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610037832;
 bh=vuM9vAjQJkgCU4xBUoFmKddeaCN97wvKiCrb9wFq5Rs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D3c+nbeK0+kwJq39ghmw5I0A2Sw54HCgrv/tFM+DIHWYNS3ROj+9a3hGG/ymGzI+U
 Pu/rXvAE/ZQSwa0q//9N/EPrkdjLh0vVY7DxaJ2Dl397bBnVDmJKFh9D/VwUypQUdp
 Koza40wb43KKwHbactJTZwJb6+Lfd4gI28RLFuDEu4ytqWPOykodoaP3uyYKRp6H49
 IqdKD5U5ReSi/UR6ny56E3jUPVg35RtPdVfWOd7PdDhiZ5cDQsI/at36xOfyfq17CN
 A9Y2/u0XWCDapFMk+HKm9WPeJuUFo5n6Ahsnik1mLa3Q2JgipctO2/gyBqRrmfOu5f
 yF6y3JnRGKLFA==
Date: Thu, 7 Jan 2021 16:43:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH resend] sound: Convert strlcpy to strscpy when return
 value is unused
Message-ID: <20210107164322.GF4726@sirena.org.uk>
References: <22b393d1790bb268769d0bab7bacf0866dcb0c14.camel@perches.com>
 <s5hpn2j2rr3.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uTRFFR9qmiCqR05s"
Content-Disposition: inline
In-Reply-To: <s5hpn2j2rr3.wl-tiwai@suse.de>
X-Cookie: See store for details.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Joe Perches <joe@perches.com>
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


--uTRFFR9qmiCqR05s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 05, 2021 at 06:55:12PM +0100, Takashi Iwai wrote:
> Mark, could you check the ASoC part?

Acked-by: Mark Brown <broonie@kernel.org>

--uTRFFR9qmiCqR05s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/3OikACgkQJNaLcl1U
h9CliQf/fWBovJb9ILFKC38hv8wOmoZfK1W6JdCZ51RizmOwpB+ucVe7GG03haN1
hrh54Tj0NzpYo3cuAEWPMRIXiWisE77mm2MOGuf005H8oB58ETQ1B6GM/odbNEuA
MiHC0MdNL87krLHKIKQLKfx0FZ8K1T3VjvmJminiHTKtP90SPWWh+m260M7rFaMN
IreAoGI0QSZd2QYlX4/rcLgcAWhQdGBBSmn5L0bzHD41sobO5Cy74nJfIUovvtMQ
HZsgPZH/VmGJm931ztYmln9NuI9vhi76GYVeWlXvo8NNa+1zzGqpyQMjp9I8vUob
Nc1ec/s5nRsTNcrfpEiiUwOd5EMVCg==
=u4EK
-----END PGP SIGNATURE-----

--uTRFFR9qmiCqR05s--
