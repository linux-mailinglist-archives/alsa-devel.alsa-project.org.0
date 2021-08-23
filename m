Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3013F4999
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 13:21:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFE3E1616;
	Mon, 23 Aug 2021 13:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFE3E1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629717690;
	bh=Wclgrw6m6BxICpicnUto8OUs+4WdnXkyrzgO5hXEq08=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+5O/qDwSeLJ0slG7fbvWTOO1XzC7CO+s/i9XgAetKdHT3UfZ6YP84DkMsAExGIPd
	 wN/BZ6WnAAXBHvRjRa2ftH2yJNgwmvfdswuc0QrEmm5pxcR6lDQnzCEqVp7BzjZ+sp
	 ym8gcLKXgUvajcDGpkGIvpXTSEDKCR288UEB1O1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 095FBF800B6;
	Mon, 23 Aug 2021 13:20:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C4B9F800B6; Mon, 23 Aug 2021 13:20:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD67BF800B6
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 13:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD67BF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oekp8axD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E1CA6138F;
 Mon, 23 Aug 2021 11:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629717604;
 bh=Wclgrw6m6BxICpicnUto8OUs+4WdnXkyrzgO5hXEq08=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oekp8axDqIoeW5CHA/lnpv36WzCW/r9tpNUkqPHzTLF/4RkKXSBPHKypz90C1GJAq
 Y0jk36XHrmFMOIALTDpiRY4EwJWSZawxsOxCQcVmuqJ4qKcDXBpknPbyFBXxt+n2C8
 niInnEj6nL8gFNoItsmNvxaLJP/nVhVhOAVwp//Q25iFQ025NgBvbgqv6YQJflYu3H
 ET5thGUfqABm/ZuNuPznMUeXXM/1d2gi3DEcR56YleVsqtdc9HCvQ6RXGrR4L4aKRP
 GesMXaoltgiT4PnmU6MZWHpFX+Au89Y008wOJBFIGZ9Ht/21LU2XIwqBFAkpBF8m2z
 5zfPe32vgO79w==
Date: Mon, 23 Aug 2021 12:19:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: rockchip: add support for i2s-tdm controller
Message-ID: <20210823111938.GC4380@sirena.org.uk>
References: <20210820182731.29370-1-frattaroli.nicolas@gmail.com>
 <20210820182731.29370-2-frattaroli.nicolas@gmail.com>
 <66d6bd43-ee43-eff4-7a68-333fbb996787@linux.intel.com>
 <3469189.PC3msRC2N5@archbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eRtJSFbw+EEWtPj3"
Content-Disposition: inline
In-Reply-To: <3469189.PC3msRC2N5@archbook>
X-Cookie: APL hackers do it in the quad.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, linux-rockchip@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
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


--eRtJSFbw+EEWtPj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 21, 2021 at 10:45:52PM +0200, Nicolas Frattaroli wrote:
> On Freitag, 20. August 2021 21:02:16 CEST Pierre-Louis Bossart wrote:
> > > +	regmap_read(i2s_tdm->regmap, I2S_CLR, &val);
> > > +	/* Wait on the clear operation to finish */
> > > +	while (val) {

> > delay needed here?

> The rockchip_i2s.c code doesn't have a delay here either, but I can
> add one of 1 usec for good measure, it seems weird to retry the
> read as fast as it can.

You should probably have a cpu_relax() in there at least.

--eRtJSFbw+EEWtPj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEjhEkACgkQJNaLcl1U
h9DRvwf/eYPzwI/HK4Jzi3lJiLh1vo6ezpgKS2ev6fNjoSB5emwL3rxmM/SHYkhd
vOoWprclRkygu+R5bIiLPc9Y2h6i34D/mc8aT6D2dqG+fDq5SaHx3FSX91PTLGU0
MIZLUdFQqJAINWBwgZmtZPj5ssgK6VsZ3Re9bUsaKi+R0q43eWAqSRiZ54fqFIwI
18takfFGAfqMRNfrzAXHcIqRG3viwccrBxcxIGSbxF+RrT0O++c6q8R4rB4c5nvm
/m23A2wdczve2z2hmaV6T/48gI4gVQReDFMb/S3T3hslTd4DzghMFSBIzQZx5OEY
jWofpFXTysAcWf6nQMM48fBkf/RAAQ==
=E6qU
-----END PGP SIGNATURE-----

--eRtJSFbw+EEWtPj3--
