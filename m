Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2E32A073F
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 15:00:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A82F165D;
	Fri, 30 Oct 2020 14:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A82F165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604066413;
	bh=adyPaigieWINvpIzCWk3XM6mFalffwbDJrfjZBicvkY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iWiN7bXaVaOVKkKXpbUjZ3WUs6kQJ/+G5qu9u9/E/HhH6USiKAW+bC1wQN5Du58lI
	 vaUFGNtrP4wl3oo5PQ8pMduZ9CzR5HtoLKTupO5X3ysZ1luNEsJKL5otzbQh/fFTgT
	 jYNMyOHRI/j1CE7kzvQZtJydR5tE3OjDInvwGdw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E81EEF80249;
	Fri, 30 Oct 2020 14:58:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F784F80212; Fri, 30 Oct 2020 14:58:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BA74F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 14:58:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BA74F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LssxqxVe"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4F552072C;
 Fri, 30 Oct 2020 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604066307;
 bh=adyPaigieWINvpIzCWk3XM6mFalffwbDJrfjZBicvkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LssxqxVewnCDY1JEzRLqdoHAD1GDS9d+ghDN2JRk2WfI6f/FIMqucTLWc5iK/D4Fh
 WtJeaq9SSuBGjWSDn8+lWrYhq62u/c4wjuWuA+oUCLUawzURUyth1ybsuhHMLm84UE
 UdHPJSJoRMUSKI1Cu7f/aPlNv/fDDPevgVAYG61c=
Date: Fri, 30 Oct 2020 13:58:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v4 00/15] Audio graph card updates and usage with
 Tegra210 audio
Message-ID: <20201030135820.GD4405@sirena.org.uk>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <c98d63a7-f311-a94f-abcc-1c5a87ba8025@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rqzD5py0kzyFAOWN"
Content-Disposition: inline
In-Reply-To: <c98d63a7-f311-a94f-abcc-1c5a87ba8025@nvidia.com>
X-Cookie: Blow it out your ear.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 rlokhande@nvidia.com, swarren@nvidia.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, jonathanh@nvidia.com,
 devicetree@vger.kernel.org, nicoleotsuka@gmail.com, robh+dt@kernel.org,
 linux-tegra@vger.kernel.org, mkumard@nvidia.com, viswanathl@nvidia.com,
 lgirdwood@gmail.com, nwartikar@nvidia.com, p.zabel@pengutronix.de,
 sharadg@nvidia.com, dramesh@nvidia.com
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


--rqzD5py0kzyFAOWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 30, 2020 at 12:04:50PM +0530, Sameer Pujar wrote:
> Hi Mark, Morimoto-san,

> > Sameer Pujar (15):
> >    ASoC: soc-core: Fix component name_prefix parsing
> >    ASoC: soc-pcm: Get all BEs along DAPM path
> >    ASoC: audio-graph: Use of_node and DAI for DPCM DAI link names
> >    ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM
> >    ASoC: audio-graph: Support empty Codec endpoint
> >    ASoC: audio-graph: Expose new members for asoc_simple_priv
> >    ASoC: audio-graph: Expose helpers from audio graph

> Would you suggest to keep above in a separate series and thus not blocked by
> below doc updates? If so do I need to resend above in a next revision or if
> these are good to be picked up?

It's probably better to split things up given that the dependencies for
the last bit are on another series.

--rqzD5py0kzyFAOWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+cG/sACgkQJNaLcl1U
h9CSfAf/X5PzOOD5Jon1mVsaFPbij6n6esmY9LRtfZ4vDDwLZec683WNghZ/F/R6
GxeVN81r0vv+6uhh6f4TaTD0+/XU0nc8aXQBgXs/6DHNALqX5b6GWaiCQRioYP6W
QCD4gpybdIGuWvb2ONWsApLC9ciddNTZvNFeM5RprZQloeMjYUKGiQJ+tzUrTfrs
Qce0dpEqTMk/37BF9z9fDqOPwScX4a0529QSD7zbAaSDKe4Pfcnad45MnjYprNZk
Eaf9QiHtxpfvpqrIHvuIhPMgdOWGSsaZKbdQx6p7QLoftcJdFKD6sXjfUuKntPzY
BY7H6q9Z+nxCOCm3uRkD3YIGXPefqw==
=mqrB
-----END PGP SIGNATURE-----

--rqzD5py0kzyFAOWN--
