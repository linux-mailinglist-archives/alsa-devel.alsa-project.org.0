Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 549B04D6975
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 21:25:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04D3D1A7E;
	Fri, 11 Mar 2022 21:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04D3D1A7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647030358;
	bh=u2mn36kDdkFJFhzFnPH6cGPDk0Rfwipws5OOiqVLFjs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KuXFLDB3k2Vu0aED9jcGqs8wv3OCIwcA+Z5nDWEzok19/0EqV6o8NahK97NlAheS2
	 bkJz8Csye0CYKuOKJp5hOTuLuWUlGbYG1eXfQXF7qtsFTcsqAOvDU/VK11UGVNt/cl
	 NY3sTXUKGFha53KAhfgsNMloOh+RrRsVqG7lcXJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07D3EF80238;
	Fri, 11 Mar 2022 21:24:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3685FF80085; Fri, 11 Mar 2022 21:24:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0403F80085
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 21:24:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0403F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TlLcQg9p"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3AE8361F67;
 Fri, 11 Mar 2022 20:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031A3C340E9;
 Fri, 11 Mar 2022 20:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647030285;
 bh=u2mn36kDdkFJFhzFnPH6cGPDk0Rfwipws5OOiqVLFjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TlLcQg9pPkT2iCcw3k2jhaWcDkEleckVmJNdrKJnIOXouIyy70xhySTZ5ZTzWmoqE
 1m6qI6Uf7S4fcVpZd5eiHFcDzXlGlkDXsCdpd8XMpgA75ZvANL7h1ZHLjpUvOm7VaM
 BNi2ItFHpBXXGmBVT6pmssa8LBdM4zx45bIAhzHL1mgZx2FRw2jmoYDUF3DghiomRt
 ftnXEki+gv1gpD4Mw48cjChhbFuPjRtRqHmmRisdfYCFHvdVeE1EMA+5RYb4GDiV1A
 JsKBhFN054gzI4zsj0ej9KJycsFwoPHI7uIoVQuSpab5txJzZZ8efAYIKVi4uOjBh+
 iwhZxHolnMRBg==
Date: Fri, 11 Mar 2022 20:24:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v5 00/17] ASoC: Intel: AVS - Audio DSP for cAVS
Message-ID: <YiuwB43XHnAYEfmo@sirena.org.uk>
References: <20220311153544.136854-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OY/BpH51VTrMQ3WT"
Content-Disposition: inline
In-Reply-To: <20220311153544.136854-1-cezary.rojewski@intel.com>
X-Cookie: A fool and his money are soon popular.
Cc: alsa-devel@alsa-project.org, rad@semihalf.com, upstream@semihalf.com,
 harshapriya.n@intel.com, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 hdegoede@redhat.com, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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


--OY/BpH51VTrMQ3WT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 11, 2022 at 04:35:27PM +0100, Cezary Rojewski wrote:
> A continuation of cleanup work of Intel SST solutions found in
> sound/soc/intel/. With two major chapters released last year catpt [1]
> and removal of haswell solution [2], time has come for Skylake-driver.

I've applied this but please do look at some of the clarifications that
Pierre is asking for - there probably is some room for improvement
there, but nothing that's going to require a restructuring of the whole
codebase so it seems better to apply and look at things incrementally
than to have to recheck the whole series again.  Splitting this into
easier to digest chunks is helping.

--OY/BpH51VTrMQ3WT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIrsAcACgkQJNaLcl1U
h9B6LAf/RayQCxQcMR+X2+YCGujwYjr3NDzwjaEkgOx3ELxvGirXV6En4ykKhMUs
WgKq2TbIJBKHL+1DTgGAqJCR1iarYQIpLq0plk+vjV5OViCJe9awIvxUYf6n+8T5
TSgZiOtGO9SUOh7u/tmsvdEUA64vk/zsRt9eTKJasnxEW6hnHe1gGZ3N4ifgWtjT
0oLLVhqHWGrDTu0m1VKJmTqwAeQJt0/8bHdL2BL8xAIQXI3RO4jXKfHMGe+UzygX
VrSKpdT26mRYlmbEFK+7A/0NwtwtxDi5AT9seQSR4hb7WWph2gHEcaigSnUTM9EQ
ioPiIWrCZUVEaPJfhg+TnZeYjN8OQw==
=6bjD
-----END PGP SIGNATURE-----

--OY/BpH51VTrMQ3WT--
