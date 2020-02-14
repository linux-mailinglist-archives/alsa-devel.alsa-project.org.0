Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1852115D857
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 14:24:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9221C1674;
	Fri, 14 Feb 2020 14:23:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9221C1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581686641;
	bh=coaBlmEsSajAP0SZZMp8chDQwwzPhZDtsywwmkHPqO8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=liLl1B5o77M1zZSRAxrtD3R8ptBw8SU7IU9QPxEyWhouNb0aSHVPQXUNBT4rzdGZK
	 VXRTHMXpUd8D57c9Z+j9vjcvECwA+G9Y7l1U1y/kj+k0zRXSEpQANq4Ny0aLo5RqAI
	 rVykqGAnrlBYTSoPFF57CTURkszCjVA8RtGdDtM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96DDCF8013E;
	Fri, 14 Feb 2020 14:22:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DB98F8014F; Fri, 14 Feb 2020 14:22:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D0480F80086
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 14:22:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0480F80086
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A70E61FB;
 Fri, 14 Feb 2020 05:22:13 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2ABF23F68F;
 Fri, 14 Feb 2020 05:22:13 -0800 (PST)
Date: Fri, 14 Feb 2020 13:22:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <20200214132211.GK4827@sirena.org.uk>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
 <20200213155159.3235792-6-jbrunet@baylibre.com>
 <20200213182157.GJ4333@sirena.org.uk>
 <1j36bdfgx1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1j36bdfgx1.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Shipping not included.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 5/9] ASoC: meson: aiu: add hdmi codec
	control support
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
Content-Type: multipart/mixed; boundary="===============8214676491162802890=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8214676491162802890==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QxIEt88oQPsT6QmF"
Content-Disposition: inline


--QxIEt88oQPsT6QmF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 02:16:10PM +0100, Jerome Brunet wrote:
> On Thu 13 Feb 2020 at 19:21, Mark Brown <broonie@kernel.org> wrote:

> >> +#ifdef CONFIG_DEBUG_FS
> >> +	component->debugfs_prefix = debugfs_prefix;
> >> +#endif

> > You really shouldn't be doing this as it could conflict with something
> > the machine driver wants to do however it's probably not going to be an
> > issue in practice as it's not like there's going to be multiple SoCs in
> > the card at once and if there were there'd doubltess be other issues.

> I'm not sure I understand (and I'd prefer to :) )

> As you said before, initially the there was supposed to be a 1:1 mapping
> between device and component. The component name is directly derived
> from the device name, and the debugfs directory is created from component name.

I understand why you're doing it but that feature is intended for the
use of cards when they're integrating components, not for devices
trying to register multiple components on the same device.  This means
that a card that tries to use the feature will conflict with what the
driver is doing, but like I say there's no obvious use case for a card
doing that.

> Instead of addressing the debugfs side effect, maybe  we could just make
> sure that each component name is unique within ASoC ? I'd be happy submit
> something if you think this can helpful.

That'd be better.

--QxIEt88oQPsT6QmF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5GnwIACgkQJNaLcl1U
h9ConAf/ZGIifJ2A3GT7/6hgGBOd30DCPyZ8wpzAq0wHv/ihVoH/uLJqlLiRVglQ
Nqx0WU3HNlkMaHwiGc/1rp2fiXdZ1hzXQsCcHMX+0vQyLVRqtsITAVkHauL9RVE8
U+DlOVSjkI7k4jPw9NQgATNCA0a5cw1WMzorwS6WNeLMUS3eqQdqxBZeLgwTqtdz
zRg9Fwb/c9xmCJgQ8PdybSvDTxW0G9Mx/0BWAfeJqSUTk/2tQjpODkaGQP1fH/Az
keB6n64qi+KoaIGZNUVEfiLL2zJ0w49nfDKyb1n5KndN0+iOVbk9jxRtnDaGajYF
/ZLH5B59EjOw9RfRJTsAvNs2GO8JIA==
=YJRb
-----END PGP SIGNATURE-----

--QxIEt88oQPsT6QmF--

--===============8214676491162802890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8214676491162802890==--
