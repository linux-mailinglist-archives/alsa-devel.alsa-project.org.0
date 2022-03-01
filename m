Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 304F14C8CE8
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 14:46:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EE201B57;
	Tue,  1 Mar 2022 14:45:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EE201B57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646142394;
	bh=eBTzL6MmQwg+V8bbbSmjlT/a2olT1yoXStUwSJGOaog=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jxd3gJ73i9RFkAZ6Ds/KvdBSeK2MsCo4Gy9ms8BuGRsDLEqgxuqJpSWSiqGs1VW4f
	 Tc32o+jwdfDfDIveI3pHXzGgbpX3vRXyegzzeZwLxBWI1lTdJneImvotSL13udxdh3
	 lHFslM1r7zWGIik04xtuqRs3W8scMxHB0vWSgV3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43BD6F80515;
	Tue,  1 Mar 2022 14:45:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E37EF80511; Tue,  1 Mar 2022 14:45:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1131FF80507
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 14:45:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1131FF80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JBhwmukr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 63F54614BE;
 Tue,  1 Mar 2022 13:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0441AC340F0;
 Tue,  1 Mar 2022 13:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646142306;
 bh=eBTzL6MmQwg+V8bbbSmjlT/a2olT1yoXStUwSJGOaog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JBhwmukr+e7mpibQbsB6Ik/TnewToBB4tcfJUFWSmVJbM9U1pEeUrY8hdjXMTeD5+
 kGJfa1ElbsZOz+/89xaQbMSizuZxG8PBox50RgjcoxgWoFmfPRlIsdVqVP18dMD6eb
 XbclLgFMXMIbv1Ilgm3ff0bGtftgTvgfRDp2IITHd7G/SiBDM3ZnXlBMs93/VsRJFB
 J5WjZ5ZFZsKDzsCdgvQDg2+2phiYrqYeFoyo49EZuR1bNhskKT8A1F4HoCFuwvJVEZ
 5vwR8xs5IxQH/SX7g0uPnU6rrE70ui6kU4i3jmFGveW/lQvTqx7qdbgnQOj8pAd7Hp
 rw+qK/EoY3vXQ==
Date: Tue, 1 Mar 2022 13:45:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 2/2] ASoC: codecs: Add Awinic AW8738 audio amplifier driver
Message-ID: <Yh4jXfABBzXQAowc@sirena.org.uk>
References: <20220301123742.72146-1-stephan@gerhold.net>
 <20220301123742.72146-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="e0XqVz8VgxRwZibj"
Content-Disposition: inline
In-Reply-To: <20220301123742.72146-3-stephan@gerhold.net>
X-Cookie: You have a message from the operator.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jonathan Albrieux <jonathan.albrieux@gmail.com>
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


--e0XqVz8VgxRwZibj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 01, 2022 at 01:37:42PM +0100, Stephan Gerhold wrote:

> The Awinic AW8738 is a simple audio amplifier using an enable GPIO.
> The main difference to simple-amplifier is that there is a "one-wire
> pulse control" that allows configuring the amplifier to one of a few
> pre-defined modes.

What exactly are the modes here?  Looking at the web site for the part
it seems like it's selecting a power limit for the speaker so it makes
sense that the mode would be fixed in DT but it's not clear from the
driver.

> +	aw->gpiod_enable = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(aw->gpiod_enable))
> +		return dev_err_probe(dev, PTR_ERR(aw->gpiod_enable),
> +				     "Failed to get 'enable' gpio");

Are we sure that enable is the best name for this pin?  It's more
complex than just an enable since it's the 1 wire data - according to
what's on the awinic web site it looks like the actual label is /SHDN
which is similarly misleading though :/

--e0XqVz8VgxRwZibj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIeI1wACgkQJNaLcl1U
h9DwLQf+OD/DUxU01avnx4nV345JZNvT5Wb1DEdhtu8PIDWFp1tDw2khUkWGBgXO
KaU0noMXF1uM/DbNWE/9xHrOlGwtogv61Pk/Caoy5c30VUgXyewy5qCTQ3PFPy2f
oZg+s2FDE32ngKwhKy2X2Chh8GAJ3EIofbLBNS9k7KEkmx1LgC+Yd8NqB63jKfLm
ZQvSf/Rc0jZ4Est/myWYtAtYH6bk0YeG8CD+8j/etTqd6Y3pIWpP9kZisBJJt21C
NLShcpLQFDx4CS6ZdHepucLUJ0cyxdDgrkcfvg4IJ3XEfoGdcZRNkZuC5j3bBLQ/
PtWLu3EieSkTx7NoZ+Vxp5T4EAbzKg==
=pbol
-----END PGP SIGNATURE-----

--e0XqVz8VgxRwZibj--
