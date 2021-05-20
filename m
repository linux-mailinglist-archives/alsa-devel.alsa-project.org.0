Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B234E38B6C4
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 21:09:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49E8D16A8;
	Thu, 20 May 2021 21:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49E8D16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621537793;
	bh=z8L4oCBXjvffXYsBtw3x+DRK4fRDIPDgFEx1CMHmpPo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=azw1fLa0VqZhyW5ytR/iBwsTjwmVRCuxLIMrgNwj20X3hRSLNT5yqXUsL0Tge1OHB
	 lj8I7GBRdIiYX+nlYDoBm+KuOdfG5+lEwYQ6cBBYdxm/2TjheozXOIXnF9sQaYG5nV
	 rfakcY+PmU2f9le5ZgCgD/RS+MAhhCpl0QX5mDYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A179EF80229;
	Thu, 20 May 2021 21:08:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84A3CF80217; Thu, 20 May 2021 21:08:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03496F800C8
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 21:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03496F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bWydcwtw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F98660FE8;
 Thu, 20 May 2021 19:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621537695;
 bh=z8L4oCBXjvffXYsBtw3x+DRK4fRDIPDgFEx1CMHmpPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bWydcwtw1iMbV1+JypJDPdk9CVyD6sIQC76c2/iKwBONip9AfpxVyv2a2jfbvHVEh
 QGwFuBEvuEZVWOPCZbpIwWACddUQReDqAN4mrJpoWH4hAdkx5FQLASj8Ew5VOdVgpg
 LpVRu880OHLGkmkpluS8nMpSv0/JZKso3SnO15BcJp3uIur7WoSkl2njWdKHCO0W3h
 XOG5QUUzsYaV6PdJO1KXuQwHai6Xuaknw+hsmZFKDdck2vt7nJFgLbUjMbIRFuWMcf
 F4nhPu+0e4FGaUJuoU1iCyJKcHkWU7Hbjts8pFA2XwBaSatl4LyqPwJO/Mi/9ah8q3
 jTSCn0iOlNZww==
Date: Thu, 20 May 2021 20:08:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 2/2] ASoC: tegra: Unify ASoC machine drivers
Message-ID: <20210520190812.GF3962@sirena.org.uk>
References: <20210520175054.28308-1-digetx@gmail.com>
 <20210520175054.28308-3-digetx@gmail.com>
 <8e5d4442-00a4-460b-d37a-8962960dd7ff@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
Content-Disposition: inline
In-Reply-To: <8e5d4442-00a4-460b-d37a-8962960dd7ff@perex.cz>
X-Cookie: Offer void where prohibited by law.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Svyatoslav Ryhel <clamor95@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ion Agorria <ion@agorria.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
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


--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 20, 2021 at 09:02:49PM +0200, Jaroslav Kysela wrote:
> Dne 20. 05. 21 v 19:50 Dmitry Osipenko napsal(a):
> > Squash all machine drivers into a single-universal one. This reduces
> > code duplication, eases addition of a new drivers and upgrades older
> > code to a modern Linux kernel APIs.

> > +static struct snd_soc_card snd_soc_tegra_wm9712 = {
> > +	.dai_link = &tegra_wm9712_dai,
> > +	.num_links = 1,
> > +	.fully_routed = true,
> > +};

> Please, could you also initialize snd_soc_card->components? It may be useful
> to pass the codec identification to the user space like:

> .components = "codec:wm9712"

Hrm, if this is important to userspace shouldn't the core be doing
something by default given that it already knows all the components
going into the card?

> The passed information should be consistent. You may look into the Intel ASoC
> drivers for the examples (card->components initialization). There are also
> hints about the number of connected microphones ("cfg-mic:2" - configuration
> with 2 microphones) or the codec purpose ("hs:rt711" - headset codec is RT711)
> etc.

This sort of stuff is more something that the card should layer on top.

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCms5sACgkQJNaLcl1U
h9ASfgf9HkitwSIVjMI1yhKeZnUTrueUtiYwFvJjlEJJnCnrsS2QMufsf1/0q6Bn
yfQQaL660jHo+gkzvnHz0+c+Ykd7HdPx7YRiwPQG33Sh2kva1MsGXa9Wvh+p+unZ
4rtVpcmIB3azj+sat9pKqOcjfLA0KVDA+COLeS+Yg6OVMq0RIAw+jQRQ+f4oYrlG
vqF2+bJe3GmE+N/SrrTpx1yYwnRMNEQKCA7o6e5FjaFJzASTo2XColBvEX29ttnc
7+Z7PTYRGnVlYWpH1JWY+LBd6UHc7YGGArlPeaxbHLUg/kICqq+jkQKBareaQysU
0VAdJa/rHULm49mE8NfMa45wGan8lA==
=P/CB
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
