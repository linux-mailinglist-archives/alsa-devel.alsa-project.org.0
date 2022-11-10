Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 605DE6242C4
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 14:02:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF6031674;
	Thu, 10 Nov 2022 14:01:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF6031674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668085352;
	bh=awwjva4KZ2j6QkTmvpKuu4ND/OJmD/rXZYyLj3sJfwc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GMhIsW5owxGTetI5T+i/7oAOR06d5cQYHht0LNzIu9qElvxmaiQf0GXj47iHDuXrq
	 rDDDEsXKSlUBwlmlBkKuWLUCowBt6IGF1FnjMkAwRccxx9NnL4bdoeWXU5XWzDKroK
	 lClzyMGIN+rGXApp4Pmy3W1W2mcykcVrw9HB/F4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87318F80507;
	Thu, 10 Nov 2022 14:01:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEAD6F804FB; Thu, 10 Nov 2022 14:01:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54384F802E8
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 14:01:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54384F802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Jm9tzOZc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B948615DC;
 Thu, 10 Nov 2022 13:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE11C433D6;
 Thu, 10 Nov 2022 13:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668085293;
 bh=awwjva4KZ2j6QkTmvpKuu4ND/OJmD/rXZYyLj3sJfwc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jm9tzOZcyJIRkxz7zAA+lg5GrAqQE5jY8nqiPAzzaitR7BL1dlyOn3R4o4DTpkube
 VKe6xwKP3LHcCNVnvG3OW4+VcDDhAluV0oaYk4v5Iw/tYJ7g5BK69aMrzpQWHsugRn
 kIgnnS79DTmx33sU6b+3kQvoqUl49qUFPIzqPmrjp1vYLXKjQBNt2++rQysPMSJkv4
 NDGpPk+kPNtvoTl6GT+5yTu8KrACOKvA19ux3Bx3+a65/7m9PsobskNEzXSZlFAHvU
 1q8tjQVf/owO2La1VNPfL2EOfASIk8tobrMF2tWMuiW4lMdQVmPUHtGbWDa9szj606
 Nb5j/pDAiraSg==
Date: Thu, 10 Nov 2022 13:01:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 09/12] irqchip: cirrus: Add driver for Cirrus Logic
 CS48L31/32/33 codecs
Message-ID: <Y2z2JwQaYS9N5A8x@sirena.org.uk>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
 <20221109165331.29332-10-rf@opensource.cirrus.com>
 <87mt8zutib.wl-maz@kernel.org>
 <c0c05799-6424-7edf-01b3-e28a10907b2c@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s9XagPH0CfsDB+cb"
Content-Disposition: inline
In-Reply-To: <c0c05799-6424-7edf-01b3-e28a10907b2c@opensource.cirrus.com>
X-Cookie: Torque is cheap.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Marc Zyngier <maz@kernel.org>, linus.walleij@linaro.org, lee@kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, patches@opensource.cirrus.com,
 tglx@linutronix.de
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


--s9XagPH0CfsDB+cb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 10, 2022 at 11:22:26AM +0000, Richard Fitzgerald wrote:
> On 10/11/2022 08:02, Marc Zyngier wrote:

> > belongs IMO to the MFD code.

> We did once put interrupt support in MFD for an older product line but
> the MFD maintainer doesn't like the MFD being a dumping-ground for
> random other functionality that have their own subsystems.

There's bits of this like logging the top level error interrupts that
seem like they clearly fit in the driver for the top level chip (SYSCLK
possibly in the audio driver, dunno if it gets used by other functions),
they're users of the interrupt controller rather than part of the
interrupt controller.

> >  It is also a direct copy of the existing
> > irq-madera.c code, duplicated for no obvious reason.

> It's not a duplicate. The register map of this device is different
> (different addressing, 32-bit registers not 16-bit)

Isn't that just a data difference which could be parameterised?

--s9XagPH0CfsDB+cb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNs9iYACgkQJNaLcl1U
h9C6/gf9GfHmYBwIwz3hP4w+omdX4OnqxZu0y5L3ZYq/q7x3gRz+YHxA83Z+7rrN
1PEYL9nJmSYS1niCtRDCT3EDLrcoD5AX7Ouv7wc6m7cze4zQaLH8h92foGwPZd5u
AMo6jxPBMTOhL5+8LQfOTSJFOBuQEMb3i8rPWG7Sx+YeIseD1xWvoevpBPWYjjwW
zqpPB+lfEF9o+gmnrbyAXOGWsTxYoa7PjCQkSwrvzrDj7GLzHvVhmDKI8wrp+tSt
ldgt7y1VZfMUinAsmYl2PtPy8tLkfxDfd/NvFxZydwtBNbxo+EAcam7aOSWx1Wkv
g6zdzussbdiTH3+QlsfyUy9gKCnnbQ==
=dwPr
-----END PGP SIGNATURE-----

--s9XagPH0CfsDB+cb--
