Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3999723EFD2
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 17:11:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E50171612;
	Fri,  7 Aug 2020 17:10:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E50171612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596813088;
	bh=VR2uh23+IX8beEmgSrP7ki/sxi5tiHnmQRq0iObTAmQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A5i5jRFOGdQH3MbyNsg0KkVHpX6qiSyknEcJ47bDUTSds8tKDJRZXnKg3Wdg90GQb
	 Ht52w+8858tZQSMML+UBCetXNx7cS6TjicHrnRPICkXOC5rH74zGl7NxY9FZCdY0wh
	 d1RpjUhw7RHSmi5bQlDnyVkB36recqwyTHYKl08k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12F8EF80234;
	Fri,  7 Aug 2020 17:09:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFAFFF80218; Fri,  7 Aug 2020 17:09:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24A8AF800B7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 17:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24A8AF800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XUBWVwRR"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 006692075D;
 Fri,  7 Aug 2020 15:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596812972;
 bh=VR2uh23+IX8beEmgSrP7ki/sxi5tiHnmQRq0iObTAmQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XUBWVwRRoKx8ZQ3s0yloIAvCSv3evdyvfilE/Lpg+abjgipCzw2xjVNl00B1SMJqt
 wZjNNnOYlHLXO2PxM2B/5QVD3d8vWQEhcdEYosWC1feZ7AJ6NJNdyp3Q273X8Eppnn
 R/sPRi02g4vRYoDNrCZzaH2AzNUMEQ9270GpyzYU=
Date: Fri, 7 Aug 2020 16:09:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 07/13] ASoC: Intel: catpt: Event tracing
Message-ID: <20200807150908.GN5435@sirena.org.uk>
References: <20200807110649.17114-1-cezary.rojewski@intel.com>
 <20200807110649.17114-8-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jdM5ZcN/ZcXXVwZs"
Content-Disposition: inline
In-Reply-To: <20200807110649.17114-8-cezary.rojewski@intel.com>
X-Cookie: Disposable, use only once.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 andriy.shevchenko@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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


--jdM5ZcN/ZcXXVwZs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2020 at 01:06:43PM +0200, Cezary Rojewski wrote:
> Define tracing macros for easy catpt debug. These are divided into
> memory, registry and ipc event categories.
>=20
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/catpt/trace.h | 169 ++++++++++++++++++++++++++++++++++

Usually events go into include/trace/events/

> +/* SPDX-License-Identifier: GPL-2.0

This needs to be a separate comment to match the spec.

--jdM5ZcN/ZcXXVwZs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8tbpQACgkQJNaLcl1U
h9DZUgf/YcjbjDs7u+33Jqtk9UM6jUY13RI+N7Lv9ghq1yLYmhrUz/Tm6TyN1pt6
hnrD2q1NGBY28SUM7w7q0QgvG+ZPN7l/Q4uaguV/cB/nM7/QSY1b5RZZXCX8KsHq
p0PRKrVGStZGGnqW+OCinZvePhUK40lN27plttvXL8gvLPORRj6i9sK6eH3uvBXy
AlKC21YRNWEYsXtlWobQ618hyiKGHqoHun3sMrSK31PRYSEBFJ8VTMXWAHBR6HFX
dCKrYJzjuKlMHxHmZtd1xxuM0gcPafOaGSdeAVfkagz94OKjFIQVPydt/C45qwTc
DKSGemGHFcjCBg9NcjpiaDIwe64JmQ==
=vTPC
-----END PGP SIGNATURE-----

--jdM5ZcN/ZcXXVwZs--
