Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A533930E0F3
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 18:26:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44308172A;
	Wed,  3 Feb 2021 18:25:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44308172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612373205;
	bh=/yhI2spPcVGMBVmOZvUkwECDxBhVNdZcA9Cpql60alQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CrmhzEC+hOpdNnYwZmewS/bWefPu0oUJwpRcl6hobciHLZ6XT5c91b0DJP3BTCF1A
	 hz0uXLUJVR8hbWKVmY9VlBbut30UOKbZ1fClh2z+WscRWN7B2ZBAL94dFq3dfcHon6
	 K23bhGQRxN9jrxC6sOZxtLy7CZJH/g3Wxax2bBL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90146F8016E;
	Wed,  3 Feb 2021 18:25:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41526F8015A; Wed,  3 Feb 2021 18:25:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E102FF80154
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 18:25:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E102FF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q5Psc9RE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B16764F68;
 Wed,  3 Feb 2021 17:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612373104;
 bh=/yhI2spPcVGMBVmOZvUkwECDxBhVNdZcA9Cpql60alQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q5Psc9RErW69hu2Tr1n6s+KkTUj4xSf0zHcNvDJdxOyrw2F+Ipb905Dw68xwg+Dgc
 MEV6TVp32DMji47F1WpFteX8ZGBp1IGmR618GmlHPSrzDCYEkiftCGGJrSv0G27gN7
 A9QHaPGatDcFj+TvMcu19I/IEb+Ir6zRkuXUSgJScgaIbS7pKL2C4Er1G4c8vTrC9n
 C676XaaTFguU4XtUWtn1fWuiVSmw7RVsZLByOKsuwhkjiMv6hUC9GE1BC/lZv6ao8y
 ZhTt2fUOJ/l3dIieaH9J1oc9yMqPzu1Y5ctN9/LaFRZw+387zMPWzuow+pTOPdr8EX
 tehoZ7/GrxRSg==
Date: Wed, 3 Feb 2021 17:24:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: Re: [PATCH 1/2] ASoC: audio-graph: Export graph_remove() function
Message-ID: <20210203172415.GH4880@sirena.org.uk>
References: <1612368575-25991-1-git-send-email-spujar@nvidia.com>
 <1612368575-25991-2-git-send-email-spujar@nvidia.com>
 <20210203161951.GG4880@sirena.org.uk>
 <64b65aaf-9971-e071-5d52-02286fe0cacc@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZYOWEO2dMm2Af3e3"
Content-Disposition: inline
In-Reply-To: <64b65aaf-9971-e071-5d52-02286fe0cacc@nvidia.com>
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


--ZYOWEO2dMm2Af3e3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 03, 2021 at 10:09:01PM +0530, Sameer Pujar wrote:
> On 2/3/2021 9:49 PM, Mark Brown wrote:
> > On Wed, Feb 03, 2021 at 09:39:34PM +0530, Sameer Pujar wrote:

> > > +int graph_remove(struct platform_device *pdev);

> > I think this needs better namespacing if it's going to be exported.

> audio_graph_remove() can be a better choice?

Yeah, that looks reasonable.

--ZYOWEO2dMm2Af3e3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAa3D8ACgkQJNaLcl1U
h9DgsQf9GzN3MtpiKxC9z9VC6D/VDCcjNVKfBH4n8AsORm22h3JUl7Y5j1VQE1aO
feY09SDZ/Xyfu868hB3PC2NhljwRUkkA0s8gnCTMvgprT08OjHZDqzi0nQd2Z0BH
2V5vO7RgGB0jFXEWwIvFM0AqtcufWjUUDKnlbVGSi/rbOrQCiT6zoUC3BJmGmQLP
DVPeklIGLqLzbwu+OkWzp0ZImxtonyE07PDnuek2MaH/41HoBRbPRrzfgREgzTt3
+QSL8GQecG+2Ia0+4LnCy7g528weLNEFB7HDBtqx4SGMct1lD7xhWTPM89sxNq65
fIRzGZOE8p1RYsstGe04kKxpHBxB4g==
=qMSx
-----END PGP SIGNATURE-----

--ZYOWEO2dMm2Af3e3--
