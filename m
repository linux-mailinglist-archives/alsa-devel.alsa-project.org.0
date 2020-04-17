Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3552E1ADFF0
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 16:30:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB8C71666;
	Fri, 17 Apr 2020 16:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB8C71666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587133832;
	bh=txzchbzT5cI72CRmQqeLJjyrLrAIn+FVo7sH6SEzmyg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KQIAhBo4UgygYMrI1KbYx6WM0a255/mDuuZ3kfe3OfA5MqDbEpMhHM7s4kdn5HFqU
	 6PSiPZSmjKW8ETiNqMa1SSM3U50Z6Z1W6Rcl5i3K35fpeYcMtei/WsSHkyN1HDfHSs
	 uIWnQZgoRmDRHOeKtwqFY5yJit6S7sls365oofmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3AF9F800AB;
	Fri, 17 Apr 2020 16:28:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48495F80245; Fri, 17 Apr 2020 16:28:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC6CEF800AB
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 16:28:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC6CEF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mjTtoAaY"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C64720B1F;
 Fri, 17 Apr 2020 14:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587133717;
 bh=txzchbzT5cI72CRmQqeLJjyrLrAIn+FVo7sH6SEzmyg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mjTtoAaYh5dgQ+OUnmDkh9HZkIbruhhZBoJkQFr6nffDHw6FXL1hvM9VML91ACDx9
 hdDx4IwwZluuGvmKQDWYZthQoU0jMiE+6+oX1wamnylFrhAxwweoyhiEKLw9cJRh8d
 Ft4Dxp70q+jAv5Q7t4ZYv7msg5mXdu/hJ2Kt5Zek=
Date: Fri, 17 Apr 2020 15:28:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: next/master bisection: baseline.dmesg.alert on meson-sm1-sei610
Message-ID: <20200417142834.GF5315@sirena.org.uk>
References: <5e997ca0.1c69fb81.f69a1.620e@mx.google.com>
 <20200417122732.GC5315@sirena.org.uk>
 <1j7dyeb6pt.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QNDPHrPUIc00TOLW"
Content-Disposition: inline
In-Reply-To: <1j7dyeb6pt.fsf@starbuckisacylon.baylibre.com>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 tomeu.vizoso@collabora.com, khilman@baylibre.com, mgalka@collabora.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 guillaume.tucker@collabora.com, enric.balletbo@collabora.com
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


--QNDPHrPUIc00TOLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 17, 2020 at 03:08:14PM +0200, Jerome Brunet wrote:
> On Fri 17 Apr 2020 at 14:27, Mark Brown <broonie@kernel.org> wrote:

> >>   Result:     9b5db059366ae ASoC: soc-pcm: dpcm: Only allow playback/capture if supported

> > This change to check the playback and capture constraints is also
> > causing issues on at least Meson - I'm a bit worried that this is also
> > causing oopses here, not just audio problems so copying in Morimoto-san
> > too.  We should fix the things that are broken by this change since it's
> > a thing we should be able to rely on and do enforce for non-DPCm links
> > but I'm wondering if we should revert for 5.7 and reapply for 5.8.

> I have the device with me. I'll check an report back

Thanks!  Note that the commit above got dropped from -next due to some
scripting stuff, it's in my tree or yesterday's -next.

--QNDPHrPUIc00TOLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6ZvREACgkQJNaLcl1U
h9BhXAf/UP7MBZ2vl7VlkE8bu38A+aovGQQFQZJRgruyN2JNg7n2YeUq/2Qp6sOw
QsG96PvOrAIN847qzanvuSmBwTlmDS10l2RjKXDWC0x9VX5L0pHX5KaPgywyOZv7
z5DptFt6sqmE9BhwCOUBwc/z47sZduhMyT6UGhlhAfkf+Fn6DAJfihJXbZsnl1jA
3CULs/u7DXvCjM6/M5ySAB3qzOu2EjHYjoly90fdDQp9oHWrMeW8ZOsWBSmX8FjV
eU5HNmboEHfsMrzSGR11X4JIbPrJHR3StCblpISPokfIhLizyOehaxd8eEZKoFqF
o4AtRCQaXruki9X+6Z3Fd+807u2zCA==
=lkBa
-----END PGP SIGNATURE-----

--QNDPHrPUIc00TOLW--
