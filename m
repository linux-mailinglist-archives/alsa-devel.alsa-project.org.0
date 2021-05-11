Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2410C37A9E3
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:52:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3EF4829;
	Tue, 11 May 2021 16:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3EF4829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620744724;
	bh=DVb4nsMaCFt3nXBr488YDLVlmJokQjFflLWCJk7IUmI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+BXDp/pjT3wOftAr2IES1P30oPBp4mdkYuk58qWp0pMDosUBjqAaNWNRV9UoBLAY
	 ziCWqU1gwJtlaWPBfsABpXoTqdTHzyosX6n+9EoUO6ZSGjUOJp0XZXaY0DG+tNzWy2
	 zkWM+GWrZ933lJb5yuW5Twsqi+HsnNXwLIHrXmnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30490F80129;
	Tue, 11 May 2021 16:50:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B146F80163; Tue, 11 May 2021 16:50:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAED3F800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:50:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAED3F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MvrVCItE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D49A761396;
 Tue, 11 May 2021 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620744623;
 bh=DVb4nsMaCFt3nXBr488YDLVlmJokQjFflLWCJk7IUmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MvrVCItEkU5z9HLAww2GiPRwrAhVQ3Tw25M9Ob9pT8mLhf8LCLbxz6x3idVaBgNhk
 KghMPYN0d3hEVi3Ck3lol7ElIpF2C8hjApXnxf6HdZ+V1RFih8jNTtLMcGzd+ta3Nf
 w4i7OsnXtWQdv5kv/dm0vLSnYJDvG+V0OqugfSteDL/dYlCZeQFYPPdiHcUOyZIE8K
 Kv/n/I3WmizT9Q/L0pN0hFQLL7TtXi+lcNbFlvUtWWgG3VrvFl4Ouna1xyzRONkuBM
 AZpnoAjdUCf4dmznLC/iIAh9Cgy9nhcfzRsjfNTMpzgtyrnn1Ll5WcBUSxpdouVp6T
 P++UUBVQwhF2w==
Date: Tue, 11 May 2021 15:49:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: [PATCH 0/4] ASoC: simple-card / audio-graph re-cleanup
Message-ID: <20210511144943.GM4496@sirena.org.uk>
References: <87cztzcq56.wl-kuninori.morimoto.gx@renesas.com>
 <6bd59423-6467-3103-a596-3a85204158a6@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kunpHVz1op/+13PW"
Content-Disposition: inline
In-Reply-To: <6bd59423-6467-3103-a596-3a85204158a6@collabora.com>
X-Cookie: Beam me up, Scotty!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Michael Walle <michael@walle.cc>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--kunpHVz1op/+13PW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 10, 2021 at 01:27:17PM +0100, Guillaume Tucker wrote:

> Could you please add this trailer, or maybe the maintainers can
> add it when applying the patches?

>   Reported-by: "kernelci.org bot" <bot@kernelci.org>

If you're going to send stuff like this please send any tags you're
trying to get picked up in the normal format without any indentation at
the start of the line, that way tooling will pick it up.  Though in this
case Morimoto-san had already put this on patch 4 anyway.

--kunpHVz1op/+13PW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCamYYACgkQJNaLcl1U
h9Avggf+Klt7I6tUcB5kfrCWAGromLwo2MAd4nAC9sCyUpXga4qlAumXBtpbquBP
MKbaX8795FJgN/S1UXnzGRvGONzubGdIvYkxqkdFXS24tt7gN+RmAIEV0JMZQM0j
kE6nRoHV2RwJVsriingSVFLOC8/C2Ad1lU2iGw6ByBl/VSMm8jac/0V+1WSDuBr+
euyWyi+hYQfyYzciTLfHHVea5p8oxDYGvpWzt2tE0Nw/9oIjyG1mbEwBP8V/x4o4
zFuNmuLtyYTh4m9PlQFbms6C1BArd2WBYVtVFuCG3qWwWtIj+dFwTfzl9cNwSeAz
JDOPdVriX9AvJhwTWxTD0xbd09PjSQ==
=BFnb
-----END PGP SIGNATURE-----

--kunpHVz1op/+13PW--
