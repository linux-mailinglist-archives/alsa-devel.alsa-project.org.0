Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FE24731E6
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 17:36:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87ED118A9;
	Mon, 13 Dec 2021 17:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87ED118A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639413373;
	bh=wnOhd0uugHq1/ztVIeKV8oKWDawezTEWep8Ktuozols=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gZCfBRNAEqZbIb1K52cuDcZdwf4+HE4Xb7yU7ioUWnCMGhYU3BqppVXaovaS/Nvqf
	 d2O0cFuJFas6+N09k3YYpmRc1VVjlJa60d+6KP1PFl4hIIxvZHiqe6lZxqBwr0lw+0
	 mXw8eHnJHaN89ayaEMhqp9qKNKB37uDGmErleVfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D352F8013C;
	Mon, 13 Dec 2021 17:35:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D12BF8025D; Mon, 13 Dec 2021 17:35:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82CA2F8013C
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 17:35:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82CA2F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iHx90Veb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B43F26118C;
 Mon, 13 Dec 2021 16:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A8BC34603;
 Mon, 13 Dec 2021 16:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639413297;
 bh=wnOhd0uugHq1/ztVIeKV8oKWDawezTEWep8Ktuozols=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iHx90Veb6E2b1Q+kSSLbX8VMNXhEa0DEAnEw/GW5LThCYBLRa7Q2V6Vbab1p/pY+M
 nDhiVTWBs71CBj+zDFsHdOzRqez3TI1aT2s/qkV3Nzl/ym19lAN1qA9vg6n0B+w5VB
 S1Ln8hP4imkqRSiKwczKb/Gig80wHnfn/zU+TjExt6kxQmjETIcpEpT6gbv3qykYtM
 CGCSjtsdB450aT+uKty7RjCpr/O526BcnE8YazrC4JG+G8Mw1PzTt9TfNimgdG/nLE
 bGJot3ieeyL0tTN5Nokv36YggiKHbiaaa7IAJgYhrSr428y9K3AFkd/OQEFtt3nbRa
 qxqn/jUK3Eh8w==
Date: Mon, 13 Dec 2021 16:34:52 +0000
From: Mark Brown <broonie@kernel.org>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] ASoC: dt-bindings: add missing pins
Message-ID: <Ybd2LMZ8+UqcUZTS@sirena.org.uk>
References: <20211211215120.70966-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vmxQrrQTZR4eGkiO"
Content-Disposition: inline
In-Reply-To: <20211211215120.70966-1-david@ixit.cz>
X-Cookie: No solicitors.
Cc: Oder Chiou <oder_chiou@realtek.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 ~okias/devicetree@lists.sr.ht
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


--vmxQrrQTZR4eGkiO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 11, 2021 at 10:51:19PM +0100, David Heidelberg wrote:

> Add pins missing in documentation, but present in the hardware.

> Fixes: 0e826e867264 ("ASoC: add RT5677 CODEC driver")

Please don't just add nonsense fixes tags for the sake of it, this just
creates noise and gets in the way of people trying to use the tags to
work out if thy need fixes.  The commit you're mentioning doesn't even
contain any changes to the binding document.

> @@ -54,9 +54,21 @@ Pins on the device (for linking into audio routes):
>    * DMIC2
>    * DMIC3
>    * DMIC4
> +  * DMIC L1
> +  * DMIC L2
> +  * DMIC L3
> +  * DMIC L4
> +  * DMIC R1
> +  * DMIC R2
> +  * DMIC R3
> +  * DMIC R4

These clearly aren't pins you're adding, digital microphones use PDM
and carry a stereo pair on a single physical pin (which is what should
be and already is in the bindings).  This is adding an extra set of pins
to the binding duplicating the existing ones.

>    * LOUT1
>    * LOUT2
>    * LOUT3
> +  * PDM1L
> +  * PDM1R
> +  * PDM2L
> +  * PDM2R

I'd expect these to be just PDM1 and PDM2, assuming that that's what the
pins are called in the chip datasheet.

--vmxQrrQTZR4eGkiO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG3disACgkQJNaLcl1U
h9BZSwf+OOcBl5DrmVF88D9eLae6ah84DXOIEIStolvdAuNRSWnUdkm1RQ4G99zC
LBwG7K6/O6vcGdcGQ4JO2+r8MvFhGlQxs9cJAZOqBvUUXlZHJhS75Ki7N6Y95T4n
vOK5yRKGcBUEdTB6455YsppRqEkpNZ9XzCVzN3dLNZHvWUkGpAcRQCggDTfT6wBK
ApDK+YWsRjUCGboPu5k9COT/l2N36qSbkFoe8BVadhNBCKYMVqD1bhlgcUExqbU7
E4PkP5TOJZ7PKnIUx73lRSf7LfOrDU9sH06rvB2ER/hcwo2vwDlZxKNuMAyU9Bd0
5vu9vqUY+iaLxeDdxv66WH0IykLN4A==
=EMvB
-----END PGP SIGNATURE-----

--vmxQrrQTZR4eGkiO--
