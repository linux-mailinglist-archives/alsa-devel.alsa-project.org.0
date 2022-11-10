Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A04624C04
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 21:37:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CF181660;
	Thu, 10 Nov 2022 21:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CF181660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668112647;
	bh=bCmHFzNSY03F/mNbxzkAkXDoKUIb84vHMVmOs8FgiW4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D7kEa5S+14vG2yZzJUn1Vt1RVsIoDABL3OaoCGNqZuOcFAv6yfo6hgDM+v1RjjCWI
	 QIx9uxvZq7YKM+kO+w5V4NY0wuT+3+pRiyYMMj50svyblJoOtLIbBAV6krkJs2Byxm
	 Ve5B3TNtm7zdEIKPzZ+Ew38nqgKLQRCJR2hxVU5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BDE2F80104;
	Thu, 10 Nov 2022 21:36:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69868F8021D; Thu, 10 Nov 2022 21:36:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A9C1F80114
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 21:36:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A9C1F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sRGSRDPQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D9DC761E06;
 Thu, 10 Nov 2022 20:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD88DC433D6;
 Thu, 10 Nov 2022 20:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668112582;
 bh=bCmHFzNSY03F/mNbxzkAkXDoKUIb84vHMVmOs8FgiW4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sRGSRDPQ5WtN3//4aNfHkT0ms1AfziN5jFFdbrt66a9b/6jQjqbaM+SpuWNMsRmXe
 JrOEMqk5HTdtkJL1eE8aIqXc6aXcdx6XgAOy3ChlncQJU54qH/xKEJTj9p2MW/9c+t
 Lzg5U90CyCbG1ktMd/XGX9XGnjpaEya8qRdJuUvXjKpFhgMc2aFZU6b7kTKRsF7468
 kcuG5KUcGg58Tr4f+fYnSnLllXaKAeeAl9e5PCXN2FC0i73vWq/KNxMlvEbvxNhDBI
 TGKe8ZTRWksTmOfMqaPzQUB8dhl1DuYX0x5jZmRZR2+v3RApGVN7MzDt8v/GEsr/JL
 PXN4axqNziG6Q==
Date: Thu, 10 Nov 2022 20:36:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 09/12] irqchip: cirrus: Add driver for Cirrus Logic
 CS48L31/32/33 codecs
Message-ID: <Y21gwGDb5CFft0kp@sirena.org.uk>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
 <20221109165331.29332-10-rf@opensource.cirrus.com>
 <87mt8zutib.wl-maz@kernel.org>
 <c0c05799-6424-7edf-01b3-e28a10907b2c@opensource.cirrus.com>
 <86pmdvow5y.wl-maz@kernel.org>
 <ef60cbdb-f506-7bd6-a8e1-c92b6963a0f4@opensource.cirrus.com>
 <86k042q1uc.wl-maz@kernel.org>
 <05ae0e20-b472-f812-1afc-ef8c2a97cdeb@opensource.cirrus.com>
 <87iljmve87.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cLWr1cCMwWOX3sxh"
Content-Disposition: inline
In-Reply-To: <87iljmve87.wl-maz@kernel.org>
X-Cookie: Torque is cheap.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linus.walleij@linaro.org, lee@kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de
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


--cLWr1cCMwWOX3sxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 10, 2022 at 06:47:20PM +0000, Marc Zyngier wrote:

> Read again what I have written. Having to expose a device-specific API
> for endpoint drivers to obtain their interrupts, and requiring them to
> know about some magic values that describe the interrupts source are
> not a acceptable constructs.

> We have firmware descriptions to expose interrupt linkages, and your
> HW is not special enough to deserve its own top level API. Yes, we
> accepted such drivers in the past, but it has to stop.

> Either you describe the internal structure of your device in DT or
> ACPI, and make all client drivers use the standard API, or you make
> this a codec library, purely specific to your device and only used by
> it. But the current shape is not something I'm prepared to accept.

ACPI gets to be a lot of fun here, it's just not idiomatic to describe
the internals of these devices in firmware there and a lot of the
systems shipping this stuff are targeted at other OSs and system
integrators are therefore not in the least worried about Linux
preferences.  You'd need to look at having the MFD add additional
description via swnode or something to try to get things going.  MFD
does have support for that, though it's currently mainly used with
devices that only have ACPI use (axp20x looks like the only potentially
DT user, from the git history the swnode bits are apparently for use on
ACPI systems).  That might get fragile in the DT case since you could
have multiple sources for description of the same thing unless you do
something like suppress the swnode stuff on DT systems.

Given that swnode is basically DT written out in C code I'm not actually
convinced it's that much of a win, unless someone writes some tooling to
generate swnode data from DT files you're not getting the benefit of any
of the schema validation work that's being done.  We'd also need to do
some work for regulators to make sure that if we are parsing DT
properties on ACPI systems we don't do so from _DSD since ACPI has
strong ideas about how power works and we don't want to end up with
systems with firmware providing mixed ACPI/DT models without a clear
understanding of what we're geting into.

I do also have other concerns in the purely DT case, especially with
chip functions like the CODEC where there's a very poor mapping between
physical IPs and how Linux is tending to describe things internally at
the minute.  In particular these devices often have a clock tree
portions of which can be visible and useful off chip but which tends to
get lumped in with the audio IPs in our current code.  Ideally we'd
describe that as a clock subdevice (or subdevices if that fits the
hardware) using the clock bindings but then that has a bunch of knock on
effects the way the code currently is which probably it's probably
disproportionate to force an individual driver author to work through.
OTOH the DT bindings should be OS neutral ABI so...

--cLWr1cCMwWOX3sxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNtYL8ACgkQJNaLcl1U
h9Bdegf+M0O5xuz080mqCfkEStEVXEa7vgYTaXJ5kSDWE8EVR2JGupMqABM77ylJ
E4ccbboETZSH5UmTskY7AeAGlD6u/n1jy2P8eluNxXMoQ9IS+qNpJgyKMfeKKRYE
ZbqkECcs70AOIyOe5ntQS+sxpEDPlKsQvGkV+0rXiX2bMNVSpcst84eYr9bayPrV
YBFdrEuMwCcCjH3tx+7pcaxaghZHX5r4MtZYjhR8kHZ28RN5eesTg1LsblDM5abo
mWGOe/hrQocDzuUSl3WmPGoFJIKk5a+xcex4kO1/0CouI+b6Id4M06qMdU6cwoKv
R9QO9gnPCJjkAFOWmx4hPA6ripXBqQ==
=FGs4
-----END PGP SIGNATURE-----

--cLWr1cCMwWOX3sxh--
