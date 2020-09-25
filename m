Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7B1279167
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 21:24:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFB3A18F0;
	Fri, 25 Sep 2020 21:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFB3A18F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601061895;
	bh=TjCdnYxhrhRs6IUx7SmKi9bMGDHNT85NjE/zzwzZJGM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gFug1X4HdvdjNe9evm4lSflSvVctA6UOREnlz691j4pkLUHsti4jNHwQqimDe8EGq
	 asc5O7Nb/m3X71zxPmlrzWkH+H7xly6PKItdNzhXucki1qEGJinnAh0+ApBEYKTFo7
	 bfAwhI3vuI9Z73dqG3ODn9u+CzqsQk2KmYuu7YaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF8BBF801EC;
	Fri, 25 Sep 2020 21:23:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6342F801EB; Fri, 25 Sep 2020 21:23:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C335F80162
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 21:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C335F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OD76D5Su"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 473DE221EC;
 Fri, 25 Sep 2020 19:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601061777;
 bh=TjCdnYxhrhRs6IUx7SmKi9bMGDHNT85NjE/zzwzZJGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OD76D5Sup2QTO/BmeRToYNC1ABNecSeCEVCT+NNyEIlihkj2aGSf+nGbgk9Bb+qgj
 qyOei4YE3Plaz7Gw9I4OA5q8TAntGnG4TRXAwW9gwVFcb6lXnFF3eNc9N4Qab0h839
 q/l5OxgRAlvMxIBZRUpemGfd0dgy95PSscPIWNrM=
Date: Fri, 25 Sep 2020 20:22:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: More Generic Audio Graph Sound Card idea
Message-ID: <20200925192202.GA9831@sirena.org.uk>
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
 <097e3fc4-4a84-e101-e6b6-045c3e9e5bfc@nvidia.com>
 <87imdczd4i.wl-kuninori.morimoto.gx@renesas.com>
 <87blhuljkb.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <87blhuljkb.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Preserve the old, but know the new.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Sameer Pujar <spujar@nvidia.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, jonathanh@nvidia.com
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


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2020 at 10:43:59AM +0900, Kuninori Morimoto wrote:

> But multi-Codec side is difficult.
> Because it is selected via "endpoint" via CPU.
> No way to select it via "port" and/or "ports".

Indeed.

> We might want to select Multi-CPU/Codec by using multi deivces ?
> in such case, using "ports" idea is not enough.

> Using extra device like DSP can be more generic ?

> 	<--- multi-CPU --->
> 	            *******
> 	CPU0-1 <--> *     * <--> Codec0
> 	CPU0-2 <--> *     *
> 	CPU0-3 <--> *     *
> 	            *******

I think this is what we want for SoCs, represent the DSPs explicitly and
then have the FEs and BEs all be ports on the DSP.  I think a similar
thing would also work for legacy (I2S & so on) DAIs where we've got more
endpoints on the DAI - if we define slots on the DAI then from the point
of view of the DT bindings it's just a very, very inflexible DSP:

        CPU1 <--> DAI slot A <--> Codec1-1
              \-> DAI slot B <--> Codec1-2
        CPU2 <--> DAI slot C <--> Codec1-3

or whatever.  This doesn't allow for really complex setups that change
the slot mapping at runtime (TBH those probably need custom cards
anyway) but I think it should support most cases where TDM causes
difficulties today.  I'm not sure if we need this for more modern buses
like SoundWire, I'd hope we can dynamically assign slots at runtime more
easily, but ICBW.

Thanks for all your work on this!

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9uQ1kACgkQJNaLcl1U
h9CqvQf7BEaiSi9uzH5kL9C7Q0hY4q6eM6kmbTmX4TmVjW7BN7BX5v+dXLtN+qW0
4voJoKopGWd0/ZwgYRYZN7/81xxhuFfUic6LfdkkcViT2/9JAUlAm5wxH3hlF+el
6Wtyuzmu3psx0LSwVbVWqlyQFA1h5KlCE0/WFDKeumUdE/XAytpjlbFDl8nD7C6y
U/yIOXNljpnAgHvL0ssLkrhZq9c7aAlYHVg8OwPF7PTTwnxmKi5pf11U9HUPW0im
ShOYpZS1fnsZ5FJyZKL0usvLAWguV0Io7gDhF2M/zfdwVOCnPzeptIazzsu64rzq
jyHt4gK96gPIdqNK81JuNy17RSDN9w==
=aTpN
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
