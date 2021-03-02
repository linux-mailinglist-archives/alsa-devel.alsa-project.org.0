Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE6532A56C
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 17:15:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D2491760;
	Tue,  2 Mar 2021 17:14:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D2491760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614701725;
	bh=XcaDjWsURv/8uZujGdas5wp5M1JZxAMhhXQc0wmkd0Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=luETxiB89cNfLQd7DWjqGrXmBUTNOtKqzhSCjhfIBphI7/WIEIGGBWXYIndtQwR+C
	 WcY/2PEUVPTf9pERBLtHzTb7yDxncBce69LROsewMz9KMhVrH4GTmB7neGgUnfpWpm
	 bIcOvSprADrdKuB4nN3pu2f3XUzmg8mgXEAIOkmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DF73F80088;
	Tue,  2 Mar 2021 17:13:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DA20F80269; Tue,  2 Mar 2021 17:13:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9EACF80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 17:13:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9EACF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PMdaxma/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C071B64E7C;
 Tue,  2 Mar 2021 16:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614701626;
 bh=XcaDjWsURv/8uZujGdas5wp5M1JZxAMhhXQc0wmkd0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PMdaxma/dPA8gQWX512Tik+zy7s5XhBA/c3U6rfgto/T+dowq5GR7QoNwNlgJtmt+
 pRn42HIPQeCSPnqb+0ZGZfA+D4sTTN37fgPCB2+fFB+RBCsKt+O+SNkaGlWkMcORZ6
 YcJBK6kC5WlqOP1WLs2urMyZLKwPVlhxjphw/wi/kpnSU7DWHQiRKhsCuUpjMMo/af
 ibld2EvNF/AjyFkXJAhEIijJxJoEZg9vgBFdHsT9lBNTNn2t7HdAKPeqUWnzaAVhw8
 rTIfSQAcYXobOMi96H7vpWqbCeSxvFoQFWm1Uwrv/i6BcKy4ahkt/oyK5U33ZCgBRv
 WjAepb457Ne5Q==
Date: Tue, 2 Mar 2021 16:12:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [RFC PATCH 3/5] ASoC: audio-graph-card: Add bindings for sysclk
 and pll
Message-ID: <20210302161239.GM4522@sirena.org.uk>
References: <1614276364-13655-1-git-send-email-spujar@nvidia.com>
 <1614276364-13655-4-git-send-email-spujar@nvidia.com>
 <CAL_Jsq+9esDGw7ZCLnZS_KLmLUFyVenz83ohgNKFK3bdPD2ouQ@mail.gmail.com>
 <0ea5b885-2610-8f12-569d-15a8eff50c10@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rCb8EA+9TsBVtA92"
Content-Disposition: inline
In-Reply-To: <0ea5b885-2610-8f12-569d-15a8eff50c10@nvidia.com>
X-Cookie: Friction is a drag.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>
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


--rCb8EA+9TsBVtA92
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 12:33:04PM +0530, Sameer Pujar wrote:

> This was targetted for external audio codecs. Their internal clock
> management is not exposed with the clock framework. Instead ASoC provides
> callbacks to set this up on Codec side. There are many references where t=
his
> is followed with some hardcoded settings in the drivers.

> Are you suggesting to instead expose codec internal clocks and manage via
> generic clock bindings? Would this mean each codec driver has to implement
> these clock APIs (for ex: set_rate()) and program registers accordingly?

Yes, that's what we should be doing.

> For a platform, different audio cards can be plugged in. In that case, ea=
ch
> codec has to be updated to follow this. Wouldn't it be simpler to use
> available ASoC callbacks?

If we want to use standard DT to describe things we need to use standard
bindings to do it. =20

--rCb8EA+9TsBVtA92
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA+Y/YACgkQJNaLcl1U
h9Dfkwf/VV5E+1E4QxiC9xMRf7CW6kQ6uOQUAIFgRWw7AeHnhEAPA0LxXX+G9DuH
AYLLxx8/XoQDfbuG6WC+i7VomWK2rYpg4jo1G/f93iHFiG7AhXmr4crkEUXnKoUF
6Qou31wOajsXqhh2SlOGM3EEcA73s6eMksiGFuvazFjRHQKk7V91PcAmlujX9qUA
tsn+gsy6ebjriTqxMJ0atPeKsawOlaTYvDQkefn+3DV6RtjHA7i6x+0IKxdPhbV9
ZVKc/q+sAdXJCjnGln9qDe1dRCoS3CYVvgZvteN4MH8+AC49Wm9DEIW+UNvS2XE4
eWrZTbtnc4Fqg3WqfsVOAM70RK1+cw==
=kyqj
-----END PGP SIGNATURE-----

--rCb8EA+9TsBVtA92--
