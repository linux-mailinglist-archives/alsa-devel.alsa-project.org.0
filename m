Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 476514AE1A7
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 19:57:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E560217D5;
	Tue,  8 Feb 2022 19:56:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E560217D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644346663;
	bh=+B2c3SFO3JyT+ODg0fu515CdW3sXCQOmqSSqTd/Vo4s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZZEnyq9bG6YSdOBUZy4mMhv+LpBO5/GIEWei6/zq9uXMMUaAZFEmnsydnqw6QWKS
	 sc9FOY3PRDXzv61t1l+GmokPprOwXS4G3/C6Vp7l2SCcdDPYlHt2wOMS6qvrtRMYOz
	 MCdfp+YQ2e64ispzBbhi/qfER0LCy0XxrRFrJfBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1312BF800E1;
	Tue,  8 Feb 2022 19:56:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D46FF8013C; Tue,  8 Feb 2022 19:56:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A468F800EB
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 19:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A468F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cY8NLLmi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 70896CE1A70;
 Tue,  8 Feb 2022 18:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5876C004E1;
 Tue,  8 Feb 2022 18:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644346585;
 bh=+B2c3SFO3JyT+ODg0fu515CdW3sXCQOmqSSqTd/Vo4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cY8NLLmilZIw3Oyw98usqMX5OmnnanNaN+gFl/byZZ46c8Oe/xXnxp92QG4RzUUO2
 mTpenBYSakYdyynqAx1xCxEAOP0CYy68PludEgXRw/302ygbG0zvumFA+3NQFbSasd
 ufJ31S1mm0t18lNy3WPe5FqD6Fr34kDeQztvlZRS4i5WRT2z7ANcO5Vvb46l7+rYKO
 N+lEjfwoi3xNvjAba7dJRwJp10ImE8DV+sQv1GDTJ9YK8l8pKNocfmBsZHZ9fz44EO
 w4+cy70ioYqb44dFp4NyC3sPAP9ufv4p6OU6VsXkPvWr3/EzcPxi6pSTfVKBZp3bzt
 A9+JpFhBfO9+g==
Date: Tue, 8 Feb 2022 18:56:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Ricard Wanderlof <ricardw@axis.com>
Subject: Re: [PATCH] ASoC: tlv320adc3xxx: Add IIR filter configuration
Message-ID: <YgK81R6ipwLagmoE@sirena.org.uk>
References: <alpine.DEB.2.21.2202071806580.31604@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="639AefcbSAdhcsbM"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2202071806580.31604@lnxricardw1.se.axis.com>
X-Cookie: This is your fortune.
Cc: alsa-devel <alsa-devel@alsa-project.org>, kernel@axis.com,
 Liam Girdwood <lgirdwood@gmail.com>
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


--639AefcbSAdhcsbM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 07, 2022 at 06:12:06PM +0100, Ricard Wanderlof wrote:

> +	/*
> +	 * Coefficient RAM registers for miniDSP are marked as volatile
> +	 * mainly because they must be written in pairs, so we don't want
> +	 * them to be cached. Updates are not likely to occur very often,
> +	 * so the performance penalty is minimal.
> +	 */
> +	if (reg >= ADC3XXX_REG(4, 2) && reg <= ADC3XXX_REG(4, 128))
> +		return true;

This is typically done for suspend/resume handling as much as for
performance, and note that reads do tend to be a bit more frequent than
writes since things get displayed in UI.  The driver doesn't currently
handle suspend/resume but it seems like something someone might want.
Other than resyncing the cache (and see below for that) a cache will
affect reads not writes, writes should be affected unless the driver
turns on cache only mode.

> +	while (index < numcoeff) {
> +		unsigned int value_msb, value_lsb, value;
> +
> +		value_msb = snd_soc_component_read(component, reg++);
> +		if ((int)value_msb < 0)
> +			return (int)value_msb;
> +
> +		value_lsb = snd_soc_component_read(component, reg++);
> +		if ((int)value_lsb < 0)
> +			return (int)value_lsb;
> +
> +		value = (value_msb << 8) | value_lsb;
> +		ucontrol->value.integer.value[index++] = value;
> +	}

Why is this not written as a for loop?  It's pretty hard to spot the
increment as written.

> +	while (index < numcoeff) {
> +		unsigned int value = ucontrol->value.integer.value[index++];
> +		unsigned int value_msb = (value >> 8) & 0xff;
> +		unsigned int value_lsb = value & 0xff;
> +
> +		ret = snd_soc_component_write(component, reg++, value_msb);
> +		if (ret)
> +			return ret;
> +
> +		ret = snd_soc_component_write(component, reg++, value_lsb);
> +		if (ret)
> +			return ret;
> +	}

Again, this looks like it should be a for loop.  This also seems to be
doing single register (though sequential) updates for the values so I
really don't see any reason why you couldn't enable caching - the only
gotcha I can see would be providing register defaults causing only the
MSB to be written if the LSB were the same as the default, that could be
avoided by just not providing defaults for these registers.

--639AefcbSAdhcsbM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmICvNUACgkQJNaLcl1U
h9B3Uwf/VQv3/vIqYRmkx+VFZoLKh/mdgfRJlEajKLm2YR5QFmF64srzYVWstGZ3
NFdw4gTaSP5tLztzhv3b+HFPZrhpEUVijq17DZ8/HP4QGFXylsaEaQOylukp0hui
je7FF95s27ColBjQUdLRic6GQqgbqVbnmV3BeyEQd/WcUlIbVz0s/1DsZ2tlnEeq
elHE5Wiqj3bkj3EFPXD54Kq8tUHon64ONtZrT6wA3FkXx8EOan1j5WWz9wZyLNmm
hD1UVtUwEcMCv3fv8x1zG/ExCY7F5+aYp+JfgdWy3ObFNPeGUwww67iiNmboygHW
NHIbB4VWfyYD8If8Keh8YSnLEPn4eA==
=2+F9
-----END PGP SIGNATURE-----

--639AefcbSAdhcsbM--
