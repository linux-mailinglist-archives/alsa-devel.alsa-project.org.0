Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3A431C333
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Feb 2021 21:48:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B1961675;
	Mon, 15 Feb 2021 21:47:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B1961675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613422084;
	bh=g+xaAdEc8pl5FT3IpWH5jgtea53+rCCVgVLF2flYk4w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cyXiMNk/jhYNLx8z/ZAKV9XKHt0DWvC4LUZF1S5xw2lt7wHiDlLP6WJOwQbr4YTrw
	 KljsWeG8cJZQcVZeezRitYWCUA4ryFxBfgIlSsWDNuQ3lyd2tksyGVG1CWx9v84BMt
	 iresIMFvzdibedPRmWzk4R20MXvjskXEfAUIowx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE973F8025B;
	Mon, 15 Feb 2021 21:46:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8ECCF80258; Mon, 15 Feb 2021 21:46:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7C57F80089
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 21:46:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7C57F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J8gdqBtY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57DC964DEC;
 Mon, 15 Feb 2021 20:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613421983;
 bh=g+xaAdEc8pl5FT3IpWH5jgtea53+rCCVgVLF2flYk4w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J8gdqBtYZRUpwTmyByiwNCFSOPzN7dGnPVLZhLUWFFFjDjULhYQWQrBxKvCseiMq0
 hqQjLENlOD+moyq/8ewcbR9wCG+HnR6fwQGSulfaBIw1+WpME1GPRAcrtiMU+GQs8y
 9k3cMBPirgufi5+TDqGtQ26R3W3Cj0j8WUssuWnteA+HcIMKPEPs/5fMewKrnsfRa/
 /4lCLdtP0g9PB97PaMDBepGxQziqKSHOJzHYA6I/obKCztV/CIkcNOGQJVwWItEuPv
 QK5+XTu9gx4YwmWLOm6Sd4ftteKwpbEchdvQ/Ih5cOEWapj7Y5qmt01k6D+nb6PUFn
 lNFawZ3qHycDw==
Date: Mon, 15 Feb 2021 20:45:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 2/3] ASoC: soc-pcm: add soc_pcm_hw_update_chan()
Message-ID: <20210215204527.GC4378@sirena.org.uk>
References: <87tuqs90rl.wl-kuninori.morimoto.gx@renesas.com>
 <87r1lw90oo.wl-kuninori.morimoto.gx@renesas.com>
 <62f03ec8-7b9c-4550-d63d-cc50693e62fa@linux.intel.com>
 <alpine.DEB.2.22.394.2102142311050.864696@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2102142311050.864696@eliteleevi.tm.intel.com>
X-Cookie: Serenity through viciousness.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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


--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 14, 2021 at 11:17:03PM +0200, Kai Vehmanen wrote:
> On Fri, 12 Feb 2021, Pierre-Louis Bossart wrote:

> > > We have soc_pcm_hw_update_rate() now.
> > > This patch creates same function for chan.

> > This patch seems to break all SOF platforms. I tested manually to try a=
nd
> > reproduce the CI results and it's indeed not so good:

> ouch -- I think this will impact also non-SOF platforms.

> The new helper functions seem all correct, but the problem would seem to=
=20
> be in the dpcm_init_runtime_hw() as some of the inputs are not initialize=
d=20
> as expected here. I'll try to send a fixup patch asap. In case 5.11 is=20
> released later today, this regression needs to be fixed for first 5.12=20
> pull req.

I've applied the fixup patch, if someone could confirm that the CI looks
good I'll send the pull request for this release.

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAq3WYACgkQJNaLcl1U
h9B3hwf+JJi8FnybpBOX9SszuEKmG9qZjHrwXgpgnaHD+RTdU1VeIw1KUQOzwTgO
hKl2eJLFT5YnDqEIb+wBVJb8t+wfG5v10M9GftHnjzHHYj1gaJfponnmUOJCjr3a
6Vw/Qj6+7BKrAXNTNQE44TDwWrzEYhvakC/emDP4geZrWBBCMGCUieFovaLmneiM
8uEOqATKZeUuk0klg1ezGUpm3MZeu92oHOo0PC1mE90zZjHj8HtxcHved96igGiM
NcUDNzrZq0XF4DTh+7yOllyZgRDhRso2vCMGFtsEeJM03w8GgakHYlxmMWSDfzNw
yCRx2aiLjHpLxPMjXI8M95RSBNwiSQ==
=3K4F
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--
