Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E842D1E7E02
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 15:07:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F3A217B7;
	Fri, 29 May 2020 15:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F3A217B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590757652;
	bh=iujYvPFgp+kMyGs/HHL6d27m94u1qo0gtVVFdFB0M/c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PNDqWTzq5or6ynxEt3TDdNkgjpIE5BC2caLUnX7+nNdaNyP7Ey0Cd5N2IHzntlVhv
	 RvmW+CHZ3EIjmIgCreM2sqpT4dBP+XQzEluQGgCxDepDmmaCWeioFzjtxxz/BsVX9K
	 89mXXox8gxNBiTocVC9UB8PTVRenGLskAZSsusn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F0EEF8016F;
	Fri, 29 May 2020 15:05:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C99AF8014E; Fri, 29 May 2020 15:05:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0FE3F800FF
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 15:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0FE3F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s2sCbN+i"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B714E206B6;
 Fri, 29 May 2020 13:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590757543;
 bh=iujYvPFgp+kMyGs/HHL6d27m94u1qo0gtVVFdFB0M/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s2sCbN+iq+BEr27d1TkCSeB+hJjmmTUlzYgQtmKUT88ehDy9jx8UgGGIPErHPLR54
 C/vcqmkGF5HZUV/dHn3msmqyvaFSHcBlTibGinAm7Kw+KMrh27uciL4Etw9ZyxZ5Pv
 HrKoTIT7/v9KH+mx6J/GeAsPi6tuIjURhuo22PFY=
Date: Fri, 29 May 2020 14:05:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] ASoC: mediatek: mt6358: support DMIC one-wire mode
Message-ID: <20200529130539.GK4610@sirena.org.uk>
References: <1590750293-12769-1-git-send-email-jiaxin.yu@mediatek.com>
 <20200529110915.GH4610@sirena.org.uk>
 <CA+Px+wVSwJK-=75chKLjSEe3bPRtV2wD95W5D_pdR0Pw0G470A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kswDJesP0akhmDn8"
Content-Disposition: inline
In-Reply-To: <CA+Px+wVSwJK-=75chKLjSEe3bPRtV2wD95W5D_pdR0Pw0G470A@mail.gmail.com>
X-Cookie: The Killer Ducks are coming!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 howie.huang@mediatek.com, Takashi Iwai <tiwai@suse.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
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


--kswDJesP0akhmDn8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 07:22:43PM +0800, Tzung-Bi Shih wrote:
> On Fri, May 29, 2020 at 7:09 PM Mark Brown <broonie@kernel.org> wrote:

> > What is DMIC one wire mode?  This doesn't sound like something I'd
> > expect to vary at runtime.

> It means: 1 PDM data wire carries 2 channel data (rising edge for left
> and falling edge for right).

I thought that was normal for DMICs - is this selecting between left and
right or something?

> The setting shouldn't and won't change at runtime.  Would you suggest
> putting it into DTS binding?

Yes.

--kswDJesP0akhmDn8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7RCKMACgkQJNaLcl1U
h9Dt/gf/avkSzsxeit+z9NWHGp2tenf6Da8cB10e6pe1usBAJnkn+iqx1Si29kpO
V/fPJbNJY31D3PVd9dnyKQs4ASO+IbdUS2URSUDI795vnUy+fZ+5gu7CWoTc9LVy
PvRBFNaVmKrSxHTR3dgeFs3Ehf1cTKnxhL3wXnqg0WrN5tXSzChYnsjz7vHs2aqo
Rt6eiUaP3GKEyOLUeI/ND7iucB6eWqh/1RcDuGobJNZkhaVnh4Vk2RbbbJoREPki
ni2aN+zVokiZj+JywoG5DP7488T3JdEjWJ84dHAAtb9QhQoZwwO75nHWXhPvRr0q
ATS32LCIvu4eZCYa7kNcUqItzPKNDA==
=TM61
-----END PGP SIGNATURE-----

--kswDJesP0akhmDn8--
