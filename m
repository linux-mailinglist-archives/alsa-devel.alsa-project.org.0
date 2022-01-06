Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B57C04864F7
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 14:09:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 549BA191D;
	Thu,  6 Jan 2022 14:09:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 549BA191D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641474598;
	bh=c0ldBFzGn7c95gDXCi8jOzBxVZ7wMTI90taZkZ5feig=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bj0dWBxHEb88yFnR2eFJ8R8nXk5JBim6BS3+6V/iwBf6DuhzZ/43s754fYpvpEOsD
	 iopSIjjKThKUMZ1+vB1WU3TcgT2wQaV/UMTT8p63KdkND44VY37d7g0J45fgKW2hfj
	 gzc9DKswvPIahTmN4zL3THljJgTDRRrAvJQnM43k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8DB0F80158;
	Thu,  6 Jan 2022 14:08:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16725F800AE; Thu,  6 Jan 2022 14:08:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18A10F800AE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 14:08:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18A10F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Sgh2kCxJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B3635B82109;
 Thu,  6 Jan 2022 13:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CACC36AE3;
 Thu,  6 Jan 2022 13:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641474521;
 bh=c0ldBFzGn7c95gDXCi8jOzBxVZ7wMTI90taZkZ5feig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sgh2kCxJzz2MjEky0CbXAOIppEIDNPk3AmRw6YXxJx292f9QnllKfbLrJEG6XRcCr
 aTJaT+6LvWycHOSEXEFAPd1DWIFf04YLwjwc9t9w1l/CdUdgGKvsXHgTpSlDpEdkYM
 UbJePnUbVrZGHMfIPKrcx+IPF6UFRVrZBIjKkRHEsewtmXHZnh03DTPp3HwdorGsML
 EWDk43RuMQ7aK/ab9BxqA/HQst1iakwfCtd4N9eVueQFpoRbxA4gJ+x5N7fsNFmiLs
 AyMClZcePZPKmWqD3sEdSCG/JDmGOVjNzxYxpwa6LDWrynlwM99KEs1C1DFGQY5Hl3
 q97bLMVc8XvEw==
Date: Thu, 6 Jan 2022 13:08:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Subject: Re: [PATCH 4/5] ASoC: simple-card: fix probe failure on platform
 component
Message-ID: <Ydbp1AeTMM10yDNx@sirena.org.uk>
References: <20220105225146.3517039-1-robert.hancock@calian.com>
 <20220105225146.3517039-5-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="M9pxQ+sHFM4+Z3eE"
Content-Disposition: inline
In-Reply-To: <20220105225146.3517039-5-robert.hancock@calian.com>
X-Cookie: I think we're in trouble.
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 michal.simek@xilinx.com, maruthi.srinivas.bayyavarapu@xilinx.com,
 tiwai@suse.com
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


--M9pxQ+sHFM4+Z3eE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 05, 2022 at 04:51:45PM -0600, Robert Hancock wrote:

>  static int asoc_simple_parse_dai(struct device_node *node,
>  				 struct snd_soc_dai_link_component *dlc,
> +				 bool is_plat,
>  				 int *is_single_link)

Why not just make a function for platforms given that your change causes
such a huge part of the function to get skipped?  This interface is
pretty confusing, if the thing isn't a DAI we probably just shouldn't be
using a function called _parse_dai().

--M9pxQ+sHFM4+Z3eE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHW6dQACgkQJNaLcl1U
h9Cb8Qf/U1J6VmEbyxI1rkZt1iJ/ytvhizpVYo6Dbtr0AexVhpF5srsbTRLfkCnk
2KxJ7Pwa6n/Pl42eusf349I9dRAsl5Zkytd9ENQ6cZAF4jh4rY7kK1ew9POyoI3z
/zGcNdAg0AtoY1I7P6sVLAli6TBMK0IRF9qjASkM4SvNKgvCIlQl296Ppmojn2MY
zXghcf5z/jZsbX2dkdrBImcmEGwIH2o6B45VIcNDyiDSoJnbNUWZGUeMj17RMvRy
fcXiFd6+HutbLefzZyaSzTMPamMDXjVJHLp1130mOpNn55Z3OTz2C6Bsc0SKZmUN
ffNqkIchgPcAyTZtSDHh7EDU1+3iGQ==
=CbTF
-----END PGP SIGNATURE-----

--M9pxQ+sHFM4+Z3eE--
