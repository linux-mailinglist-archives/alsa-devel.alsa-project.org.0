Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E6338F1A
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 14:49:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECDFA16EF;
	Fri, 12 Mar 2021 14:48:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECDFA16EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615556978;
	bh=sOBXKqeGO4Nq6TKstq0SbVu8mp+HGsMEGseeBq3jg/4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lmcShXWu7q720yNwsMlZdgFWCvXQfWmlDQF5gztG6LyhpifXS4sR32jJyT05p6uOn
	 ttdM7FqJgB1NovtEwcr/nmv6QyZ9XF24o6Epnn/LfXBtxHP8nnmaK+4WaXs5zSReml
	 rQCGqrz8cFXMbD48BHOzG5zzgAS6pQSiFFG/bB3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57232F801ED;
	Fri, 12 Mar 2021 14:48:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0012F801D8; Fri, 12 Mar 2021 14:48:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 013F2F8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 14:47:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 013F2F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QfmMSgY+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDD9264F77;
 Fri, 12 Mar 2021 13:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615556876;
 bh=sOBXKqeGO4Nq6TKstq0SbVu8mp+HGsMEGseeBq3jg/4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QfmMSgY+xABbFrE8pXva2Z+2KoRJjF8hUO0QbnHV52jRHwqqsqBu7djvhyP1BlRy0
 as1td4ujPDB/8qz9pur2Fp2gmJbCC7Oz2veyQS1ykZQZMlnPnJi7PtAiSo8nXYavRX
 yzuipZUC87gUAfVZHNpqfBWdfSfBaytYgKO8hm3c+5aVI+6MjyfN+nPPIdwJikV9Nv
 Mev3vtRCjtt9qRqWV81f0qU07Ikik8s7PmqvrTtv4R0n24H+5LZcjhxjDrFXleVGUq
 gQohoQEfK/Byb0jI2I6oti8E92QWZBLs94uC2h4xdCvzg4H9boCjjP/z4QfVAJVGa8
 CBKSkeQC21f8A==
Date: Fri, 12 Mar 2021 13:46:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
Message-ID: <20210312134642.GF5348@sirena.org.uk>
References: <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
 <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
 <20210312113544.GB5348@sirena.org.uk>
 <6ed28bb5330879b1919aced5174f319f@walle.cc>
 <20210312120456.GD5348@sirena.org.uk>
 <684332700f8be9f77348a510eb6eba22@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p8PhoBjPxaQXD0vg"
Content-Disposition: inline
In-Reply-To: <684332700f8be9f77348a510eb6eba22@walle.cc>
X-Cookie: Lake Erie died for your sins.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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


--p8PhoBjPxaQXD0vg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 12, 2021 at 01:30:02PM +0100, Michael Walle wrote:

> The card calls set_sysclk(), which eventually ends up in the codec.
> The codec therefore, could figure out if it needs to configure the
> clock or if it can use its internal FLL.
> Is that what you mean?

Yes.

> But the set_sysclk() of the codec isn't even called, because the
> card itself already tries to call clk_set_rate() on the Codec's MCLK,
> which returns with an error [0].

OK, so I think we need to push this down a level so that the clock
setting is implemented by the core/CODEC rather than by simple-card,
with the helpers being something the CODEC can opt out of.

--p8PhoBjPxaQXD0vg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBLcMEACgkQJNaLcl1U
h9Dpnwf+Ma+xUvei/ETOcavme1+SPoDJipBJaYbklI5qB5IzBS+8YxBxZpncxWkY
6iuXFmnDpDu8X7u800I+d19Qu/DgQDDdLgq7zPV+NFZKGCscO21J4h3LF3xWk72f
bV2rNk5tqpGg/gYw/3eyZFr9UubaP63Ubr0iEVtxMe9zEicsmVvwLrhWxgrVsjAw
HEkX6CWSrVMdgSilAAYIUDb1usJFCd5hcyVr5zP5vOtpOnugFoV9GLd7vuT1otiV
9LCai/C2xwF+dscvm3PlXi4+acWmS1SorHpaRRZ1w6W8CH1HZp+mWGdfTUDhz+ei
0k5p1ojMOw4U8Yv+ZpbfnY4fvjxsUw==
=6MCd
-----END PGP SIGNATURE-----

--p8PhoBjPxaQXD0vg--
