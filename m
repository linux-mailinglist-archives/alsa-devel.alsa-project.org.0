Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 423AC30DF89
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 17:22:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEAD11761;
	Wed,  3 Feb 2021 17:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEAD11761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612369339;
	bh=1yMtRmiXEbjhnyEHQCW06t598A7qF+k9oLej17rISL0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uw7rMUdU6J/MsnQ6ZHChPVPWbuXI61LBHlpckdRDEpu2bK8qd8bJV97HoOhWnNwwO
	 IfeAfiojQN02+TqKx5pkhKAE8SqeLLGh24aquDP2KQYOzi1i5G2GHWXZhbKKsYx+fc
	 EFWRdfEyiuaFIvClUSKiadvZK3Ic9B2+haFfKZHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BF64F8013C;
	Wed,  3 Feb 2021 17:20:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7BA5F8015A; Wed,  3 Feb 2021 17:20:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A8BCF8013C
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 17:20:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A8BCF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SV94P1m4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F05CB64F7C;
 Wed,  3 Feb 2021 16:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612369240;
 bh=1yMtRmiXEbjhnyEHQCW06t598A7qF+k9oLej17rISL0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SV94P1m4W/3UrOwSqq2xe2/ru3TeU0LEFT1oUMFGtlOPfRMe+Ch19HqGo4N7HrzuB
 YYBEvBx4J8JZ3LglWnvl9anEgayHsiOMEGOmsBbRHyQ72btUyCvqVJ3GGa+CsRqrW7
 wDAjaXMYWznXl/fTOlLNAskkIfmkjxduGvHV0dmJ5SodW7uExRYDFV+tKO1ICdM39v
 /btzFvd7/68r51dv8IhroL4Wsui1MgcIkcrBLLUMEV7J9ATr02MSSF7KMRAKOkNjFm
 4qVjLYezSu7pKBFB6dMacDzYg04yogihkw/4Jxh3O9+oyBlc/46Ina5P29GxJdeZ0t
 IhIRHm4zQWWDw==
Date: Wed, 3 Feb 2021 16:19:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 1/2] ASoC: audio-graph: Export graph_remove() function
Message-ID: <20210203161951.GG4880@sirena.org.uk>
References: <1612368575-25991-1-git-send-email-spujar@nvidia.com>
 <1612368575-25991-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3607uds81ZQvwCD0"
Content-Disposition: inline
In-Reply-To: <1612368575-25991-2-git-send-email-spujar@nvidia.com>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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


--3607uds81ZQvwCD0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 03, 2021 at 09:39:34PM +0530, Sameer Pujar wrote:

> +int graph_remove(struct platform_device *pdev);

I think this needs better namespacing if it's going to be exported.

--3607uds81ZQvwCD0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAazScACgkQJNaLcl1U
h9AwjAf/XixFJdwXumZh6e4G4JogNNq4rLyk1Po+DOZ3Dmp5LtzCNj1hwALHxlvm
gDH7sKvnVZ3+Ve9dSq0W3qi4SWSuvwTE/pMCxggeMawZvhYvFjzs43j0y4CwPAWZ
8A8l6dBgWZNLwK89wvUEvampht9g7dVya2Lu4+Y1UhCr+KrzJTtNTFmCfTsjnSHD
J2s/mfxZGuVewx9x5LeDeI3Oq1NlPJ1tGhXZKTsJlle8PBmULi2V4b3cFS4Al8W5
OOKCXsA9y5RmPHKYiTF4Zwae+u9d8RfmWuYGsGRxM1UarrDmUahphJQQ7Z0mqWc9
OKbLHvjn5eNiEr2NUJbHS1Rvjy1/dw==
=Z2ls
-----END PGP SIGNATURE-----

--3607uds81ZQvwCD0--
