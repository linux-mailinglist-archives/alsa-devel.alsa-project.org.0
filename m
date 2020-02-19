Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3869164A0E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 17:21:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B23D1695;
	Wed, 19 Feb 2020 17:20:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B23D1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582129290;
	bh=qa0SngggUG9j6SbMXWmBqvIR3ZgD2NVPzIFlBs3AIjs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=flkUIuosfzpBO0f1zkUrS3ww7cWAeVOHieQxaUZvgLOdmdke0MPuvZ9+8KUA0SOEF
	 u+tcJMfuXxpFjVhCFmx60YJoIJTH+ufMKW3sGhafHl38vkU9nXrG9wOO78A27oopMz
	 F3RXWax5TZUCJmpaBHEMRw70M/To4W1Kq2K4z+EQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88419F801F5;
	Wed, 19 Feb 2020 17:20:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92404F80273; Wed, 19 Feb 2020 17:20:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 25654F8025F
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 17:20:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25654F8025F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 732EB1FB;
 Wed, 19 Feb 2020 08:20:02 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB43A3F703;
 Wed, 19 Feb 2020 08:20:01 -0800 (PST)
Date: Wed, 19 Feb 2020 16:20:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 2/2] ASoC: meson: add t9015 internal DAC driver
Message-ID: <20200219162000.GF4488@sirena.org.uk>
References: <20200219161625.1078051-1-jbrunet@baylibre.com>
 <20200219161625.1078051-3-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8TaQrIeukR7mmbKf"
Content-Disposition: inline
In-Reply-To: <20200219161625.1078051-3-jbrunet@baylibre.com>
X-Cookie: FORTH IF HONK THEN
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
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


--8TaQrIeukR7mmbKf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2020 at 05:16:25PM +0100, Jerome Brunet wrote:

> +	SOC_SINGLE("Playback Mute Switch", VOL_CTRL1, DAC_SOFT_MUTE, 1, 0),
> +	SOC_DOUBLE_TLV("Playback Volume", VOL_CTRL1, DACL_VC, DACR_VC,
> +		       0xff, 0, dac_vol_tlv),

Sorry, that should just be plain "Playback Switch" - this can be used by
applications to present a combined mute/volume control together with the
Volume control (though as in this case there's no per-channel control it
is possible some applications will struggle with that).

--8TaQrIeukR7mmbKf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5NYC8ACgkQJNaLcl1U
h9CDuQf/fGT0VVRm9yQYse0qUFwaPpa/Nb3byf+rdC0Bisg4EtnyYM2uHFn0C1Mg
PEDPJX9wIjjelZpQn6pNnQjo5jcZvbnoUK4ok+t+L2+wn0qS1u9sdZHqDO0/85tB
vLFJutTkhsVu/0Ky+ejH12I+uJqIcSrWHxLdWfhOpXYoqFe+C3Jzr8WlhijxnlaR
GW5b0bdf3lS4LDOYTDCHKnPXX6PiTf80RHHqoF5ZS/JyH5E1zob3FGPSzoo/8RIN
PG/sz5w9+YJvlPHomclX1ZyMG+pnw3AdOrvtlvfkjiui7OPe8u/Z7BEoSVbKSxEF
T2IfZRw1euojF6XagOVhMMpiBoShKg==
=DBLh
-----END PGP SIGNATURE-----

--8TaQrIeukR7mmbKf--
