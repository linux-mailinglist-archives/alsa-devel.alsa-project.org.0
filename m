Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 128401BFDD9
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 16:21:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B77D716AF;
	Thu, 30 Apr 2020 16:20:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B77D716AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588256504;
	bh=CtV13aq5EHUV1ZS63QEGO/ZcyB2FMYXMcfBQyRvAbo8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q5jn0OJHHCqgAg+Eosy7hlB+Svmy3qX3FpQJ6mcO3kbZ64axA1+vDhN45yNRaax9r
	 rQNxbQ5hunoZWSZo0nWeHGuhHjkrFUDs+E9h8X5p/MRRp6TpMkOhpVbkZcRqPFa79c
	 QNRhHRz+Z4P1Xux4AeIqFHY4SG8uTt/n+16cCLOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1781F802A2;
	Thu, 30 Apr 2020 15:56:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EF1CF802A1; Thu, 30 Apr 2020 15:56:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B235F8029B
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 15:56:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B235F8029B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zgED640d"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7821E2072A;
 Thu, 30 Apr 2020 13:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588254972;
 bh=CtV13aq5EHUV1ZS63QEGO/ZcyB2FMYXMcfBQyRvAbo8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zgED640dEidKBx4f+5IYcttqkLLgMNsPupj8XSvfZrstPPLUzJXejf6/XpjMx1Z0O
 csJYRNoXMxf+3Vgf4ZOVgj1ukvOFOyk6NwEKmYgBbExJWm2MCAwOJKR0Ms+nhM9I2h
 YMM3VPC8n/9CDRCU7aUQSlJVoq1Vv8HuRH1iLURk=
Date: Thu, 30 Apr 2020 14:56:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.6 45/79] ASoC: meson: axg-card: fix
 codec-to-codec link setup
Message-ID: <20200430135610.GD4633@sirena.org.uk>
References: <20200430135043.19851-1-sashal@kernel.org>
 <20200430135043.19851-45-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mJm6k4Vb/yFcL9ZU"
Content-Disposition: inline
In-Reply-To: <20200430135043.19851-45-sashal@kernel.org>
X-Cookie: Sign here without admitting guilt.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
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


--mJm6k4Vb/yFcL9ZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2020 at 09:50:09AM -0400, Sasha Levin wrote:

> Since the addition of commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow
> playback/capture if supported"), meson-axg cards which have codec-to-codec
> links fail to init and Oops:

This clearly describes the issue as only being present after the above
commit which is not in v5.6.

--mJm6k4Vb/yFcL9ZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6q2PkACgkQJNaLcl1U
h9DApAf/a8MgVHko2gpdxkUsvbUQwdEzB7YRiWynwvKJ/ud0k+E08H894+NR3LF5
FBgvDURotlT45pncz5G3Rynkgvbr9IluKuJLSfVXhCzrGXHiFXxxDQZncs18Lr+f
/nmdtOzXoRLBHZiYY60a/Wzsw+b3VhM01JmFnvodnIQoEojGAkr09lEIQQhvpr3I
jJjRWp3KzVzU9z0dYXW2m4fqPeDAmvKM6G5USTnXdgx8QlRfWKs5I8EgSLFwG+gR
1pqi95AFL8hQZevt81Jl5qHQuI/Xyn2Wz0lWlGfZG3BaSDJYe6peJSiSfxdpmpV7
Nv7JtglVXZvI6Y33OxL56LJJaPVAng==
=G+K6
-----END PGP SIGNATURE-----

--mJm6k4Vb/yFcL9ZU--
