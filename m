Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDA4338A97
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 11:52:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF8DD16F5;
	Fri, 12 Mar 2021 11:51:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF8DD16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615546356;
	bh=fgKpPGWl7vdkjYlq9KFgP4TmOGenokxAgG3aU4o71JY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lWcOgvIu6R60TxTnGof47SReOE1TSiBqmZ2TJzfTGZGl/v4VuAG3F08rHPAtcWona
	 YbLa/NFEQ6xbzQHSFoi/sZLqivwBow2P/Jc1GfSRW0X+1XeUL8fwvcnKB8YibTKalJ
	 RuTsdrCBuCAodfzxzpGpxYjoY8V+SOlipmRxyiOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A6A2F8020D;
	Fri, 12 Mar 2021 11:51:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 897E2F801ED; Fri, 12 Mar 2021 11:51:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9F9AF8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 11:50:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9F9AF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EGkoAHZ7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F174B65021;
 Fri, 12 Mar 2021 10:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615546244;
 bh=fgKpPGWl7vdkjYlq9KFgP4TmOGenokxAgG3aU4o71JY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EGkoAHZ79zm0HpbPJC1fOXOeeVwESsGko2HmFJdypim7agTxOBhI1QIl8NgHn4jnH
 u1lKjyKNHRY3jwRJnAwgFSfErfSW0fHdFR6Bk4BGeOczdoGAKSyOi/PDMVsedTUcZV
 rppAP5450ZSZ5geAA3vLXaZ0eoMnCWYxD8alfsUsNGMCd8v22EEYtlyxCFmcskiK4y
 0E5YAPYum2/u5+gjOAOizGwbK5UALblRhWac40JBSs5fZDkdMRvvcTsktyBo/DiIAM
 PqAAV0xM5DD8d04jkpkKLMTvaSzBtrJ/G04MY5mAbdMDc+sp2JdixHQIGb3WNBN94t
 W5Napa7mNglcA==
Date: Fri, 12 Mar 2021 10:49:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH] ASoC: core: Don't set platform name when of_node is set
Message-ID: <20210312104931.GA5348@sirena.org.uk>
References: <20210309082328.38388-1-daniel.baluta@oss.nxp.com>
 <20210309153455.GB4878@sirena.org.uk>
 <CAEnQRZB_VgsEPYgxtWQWUgs2+noRt1AMMHf2crJ_9Hg7s7NJ0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <CAEnQRZB_VgsEPYgxtWQWUgs2+noRt1AMMHf2crJ_9Hg7s7NJ0Q@mail.gmail.com>
X-Cookie: Lake Erie died for your sins.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, dl-linux-imx <linux-imx@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 12, 2021 at 10:32:54AM +0200, Daniel Baluta wrote:
> On Tue, Mar 9, 2021 at 5:38 PM Mark Brown <broonie@kernel.org> wrote:

> > > +                     if (!dai_link->platforms->of_node)
> > > +                             dai_link->platforms->name = component->name;

> > Why would we prefer the node name over something explicitly configured?

> Not sure I follow your question. I think the difference stands in the
> way we treat OF vs non-OF platforms.

If an explicit name has been provided why would we override it with an
autogenerated one?

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBLRzoACgkQJNaLcl1U
h9DHLgf/dCrl7QiN+jfF0cGbC1JdfYVq4HAVtswUrQEnPISDtyOBMpD2WjMCmM8j
mAv2nD3wC8p0mFgDWKn/KEcmsj7KXiFO3sD63kQsiolJrk5rTX5NAtvHeVuXxZ8+
yQVlP6G8CVpAcjk6CcKpEtWp+cT1H2uDXq4XyGzILCfzlPNqfRRLU9wZesvB3mtS
mpd1v/6aN6iXcbKYQWzD4jR70WsTAJw3IFcUtJCGejos6hHYSsrdhD8rPuT59WY7
T/lXXFVZM7+nwbd5AeL/CqlldmKcS40nfRevG9GbIkpm37kFdWvk0g1shf83owPB
6HOiE4Gctdl3DTxDYJgLfMNNXrZF/w==
=pOj0
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
