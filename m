Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5D51ADE0C
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 15:11:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 182931607;
	Fri, 17 Apr 2020 15:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 182931607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587129061;
	bh=RRba6wPPTqjpsH0OjxHPYeFUfwOwgaWHcsijRhGcngs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J6cKavR3CJQOBl5YR+O8LCIfzRtUn8+tGk4k5RfY7XPIy2i2MTbZbcfDM8LGBsxma
	 2WDqBFIQpIncL/7fXYFBxmZloztLcwKaXQ+/6UIf8LhvImMtQlmJjCxcUdCpiyPhAF
	 2UJrWvijn6NUnoWro7xyK1m+s5sVAzqK0TWcyWaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9106F8012E;
	Fri, 17 Apr 2020 15:10:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0381DF80264; Fri, 17 Apr 2020 15:10:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4E74F8012E
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 15:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4E74F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0SipEdYF"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 40A3020776;
 Fri, 17 Apr 2020 13:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587128999;
 bh=RRba6wPPTqjpsH0OjxHPYeFUfwOwgaWHcsijRhGcngs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0SipEdYFywJX8vX1lGhp4UcOy7NWWetGIN1vCVYDam++YLGA0abuUUon8lmda9tE8
 pmwT0/tPOS8nmSRIoSSJL9Qa0Xvo5ShRJXNQY7eC6Ac/DFbHczHRMxPhYg/T0WnHoj
 m6TRHRM6MHCymSV9M+iLN2kLWmmwOyzDJs6/BUgU=
Date: Fri, 17 Apr 2020 14:09:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/2] ASoC: qdsp6: fix default FE dais and routings.
Message-ID: <20200417130957.GE5315@sirena.org.uk>
References: <20200311180422.28363-1-srinivas.kandagatla@linaro.org>
 <20200417112455.GA7558@gerhold.net>
 <03d0d14c-d52c-460b-0232-184156f62eb7@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="N1GIdlSm9i+YlY4t"
Content-Disposition: inline
In-Reply-To: <03d0d14c-d52c-460b-0232-184156f62eb7@linaro.org>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Stephan Gerhold <stephan@gerhold.net>, lgirdwood@gmail.com
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


--N1GIdlSm9i+YlY4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 17, 2020 at 02:02:08PM +0100, Srinivas Kandagatla wrote:
> On 17/04/2020 12:24, Stephan Gerhold wrote:

> > but IMO the FE DAIs are a negligible overhead compared to the routing
> > matrix and the many BE DAIs that are really never going to be used
> > (because nothing is physically connected to the ports).

> Two things, one unnecessary mixers, second thing is we need to know how many
> FE dais are in the system, which should be derived from the number of dai
> child nodes. These can potentially be SoC specific or firmware specific.

You shouldn't be worrying about unused mixers, ideally we'd be walking
the DAPM graph and masking things - this isn't something that should be
open coded at individual driver levels.

--N1GIdlSm9i+YlY4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6ZqqQACgkQJNaLcl1U
h9Dx2wf+JNU4DCIuulhKdv9CWhaYh0GdbA2kVhxyPC/Nh8Dr+PCJgEhQJbG9Pb3l
7z5u2/jJJndtNN0b0eL/mDe3NHHDlVk+yMxHpMQtQo0jKOx6T1H5sqbf1VKzUxsx
eVZbUx83uWue5jFIw/NaXReWU7Kj7nxTflD3ZsPtjNaziBKdLngMEw9LR3codEdv
pGi7O37Hq/x8M9RxaAyHMl24A004IQEJIHrovNYXh+0jkfM+F1Qa8dw+8396taVl
W9TusTxBN67tzIz0SEm/ygj2HXNDUIp4zW6MMPA9Udu0y7VntNWTs1qZ2Qs5M94/
QQUxJjIdhB5BllEj4JfxRxn3aZudAw==
=vbwg
-----END PGP SIGNATURE-----

--N1GIdlSm9i+YlY4t--
