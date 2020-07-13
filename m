Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A12AA21DE4F
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jul 2020 19:18:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 091A61665;
	Mon, 13 Jul 2020 19:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 091A61665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594660735;
	bh=8UV6eEHawzQd7Kaxt0mEs5TpufrEnQ7RfVj1+dhwjaM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V7OBbFxh2cx9fAWaR/+R4vZLWPIbHqdRm0GElDu64MH6J/dZtJtRXcad4iNSBaOqh
	 AYN/UyniZeXEB6xCujgYgMrHDtwp0GKNOSQ4fbTnWP7so1H3AWWyNMPjUmUusbMdO8
	 sgOsm9AVcrKP1f40VmPyHGUKlct6d9svqcnmT0C0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03329F800B2;
	Mon, 13 Jul 2020 19:17:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C318DF8021D; Mon, 13 Jul 2020 19:17:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B3DCF80116
 for <alsa-devel@alsa-project.org>; Mon, 13 Jul 2020 19:17:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B3DCF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X3H6uEEG"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BED8B20663;
 Mon, 13 Jul 2020 17:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594660625;
 bh=8UV6eEHawzQd7Kaxt0mEs5TpufrEnQ7RfVj1+dhwjaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X3H6uEEGXq6gy7mJowH9pbntO4DfPFJCiApNAHIx2oBjsHS8khFHybzuD+2CbagxF
 RzyUsBsYteiQFQc8+RfamkUpxzi9XrpNlufUK92C94E/8YycLTCihvWmkQecEi/HCp
 m9JrHQioUH6t6g16nfFncZ2GUjLYVXErqBzZgWBg=
Date: Mon, 13 Jul 2020 18:16:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 1/3] ASoC: rsnd: don't use discriminatory terms for
 function names
Message-ID: <20200713171656.GD4420@sirena.org.uk>
References: <87r1tg3swv.wl-kuninori.morimoto.gx@renesas.com>
 <87pn903svl.wl-kuninori.morimoto.gx@renesas.com>
 <9819df17-228b-78e4-3de8-71344292de01@marcan.st>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZARJHfwaSJQLOEUz"
Content-Disposition: inline
In-Reply-To: <9819df17-228b-78e4-3de8-71344292de01@marcan.st>
X-Cookie: Fast, cheap, good: pick two.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
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


--ZARJHfwaSJQLOEUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2020 at 01:44:40AM +0900, Hector Martin 'marcan' wrote:
> On 13/07/2020 14.08, Kuninori Morimoto wrote:

> > -u32 rsnd_ssi_multi_slaves_runtime(struct rsnd_dai_stream *io);
> > +u32 rsnd_ssi_multi_followers_runtime(struct rsnd_dai_stream *io);

> I don't have full context here, but AIUI this is about bundling different
> links together? If so, primary/secondary or main/secondary might work better
> than leader/follower, in my opinion. The latter implies more of a "one
> device follows another one" scenario, like for clocks.

That does make sense to me.

--ZARJHfwaSJQLOEUz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8MlwcACgkQJNaLcl1U
h9AYLAf9GpUFXU/y8BS63DFsduiPNLMdJQ0Nx06cKNmRf7Icq23KRo8DrRqCPh95
xu/7b4fcZkEAJvjQDchDnf+QP3voe6ohammMRefpl7FCHPRUThYT3qsfMUYfSXCp
PVwUXW0QSZ4OiOFR2M+2QoGUVyAPtpjUbsWovMqK406hu3CCX2k6KjahSAnX9VXa
Ernk/NgNkWHelSaFNZnGIfCoJP/kQRtwXDxlRYVNygs3Dt7M/8i0zbmVg6q9/ibv
g128ITyWpupR/qT0WiN3S3Vd1CGs/XbbNJt+ahzzhpqnWxJb+IJqHY/gLhMciyk8
0/aprPlE9tdJHsc1W+Iu+Duf7Xl8iw==
=vNvm
-----END PGP SIGNATURE-----

--ZARJHfwaSJQLOEUz--
