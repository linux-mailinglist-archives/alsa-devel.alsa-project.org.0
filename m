Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99743666F94
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 11:28:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 248748909;
	Thu, 12 Jan 2023 11:27:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 248748909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673519307;
	bh=cw35b8Z4PEoMl2FJPoCpQOOon+cF3EAG8E0CmxT+TBI=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=USvJaFu6qm5DzOQ9ZDBVy1BSukTOhrNxklcvQ9P/83QKJpy6N4bd+HPAP3Y/eR7bx
	 KAuivh7FNtXXN9aHZbzA9u6DsiPF392tdCco3riArXkrrakxgGMFZZfZSyhb5xoh7O
	 I2IKVIAtvMK8xKB9GHYg2pH7yBOFxT8ZUNm9OQrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E446F8016E;
	Thu, 12 Jan 2023 11:27:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B18ACF8013D; Thu, 12 Jan 2023 11:27:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E70EFF8013D
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 11:27:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E70EFF8013D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jOAh4SMk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 573C261FDB;
 Thu, 12 Jan 2023 10:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CBBC433F1;
 Thu, 12 Jan 2023 10:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673519242;
 bh=cw35b8Z4PEoMl2FJPoCpQOOon+cF3EAG8E0CmxT+TBI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jOAh4SMkdo966tScrgeaB409bzuA5MZ/m/wk0uOLK1FStvlzMQM56ZbbaxtMNH1uA
 ytPLPWS6FMC4zM6pgvh2JV3GeRxPmBRV9F1Zf82otgF3BEXMNUDknIngdX0GvJAJvr
 SwOyGGOFPAETUoJgQ5n792YTZ4XBz/Od9lCHPm6bdxadZ8+lAjArmMgx4Q3DBHDlwi
 9McnnSY8U3L0EeJKDvTz+kEXEUWN63FlXVeTzQmPaTbq7EdX9wgVBjfxldpxo2CYIa
 wnhzS1tmztVSmFS1U1zTdu2rMpFb7sJqQsiDrACe5kHlDBkjIrasz15UVyZcV1lsC4
 /Lr6dMzxpY2wA==
Date: Thu, 12 Jan 2023 10:27:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Mohammad Faiz Abbas Rizvi <faiz.abbas@arm.com>
Subject: Re: [PATCH] ASoC: dt-bindings: simple-card: Document
 simple-audio-card,plat
Message-ID: <Y7/ghAz460VQ/hXt@sirena.org.uk>
References: <20230105160346.29018-1-faiz.abbas@arm.com>
 <20230108163741.GA30997-robh@kernel.org>
 <f0ad7a4e-a8af-77d4-09e4-3717041677e7@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mfsYPpGuHog5bgZQ"
Content-Disposition: inline
In-Reply-To: <f0ad7a4e-a8af-77d4-09e4-3717041677e7@arm.com>
X-Cookie: A watched clock never boils.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, devicetree@vger.kernel.org,
 Deepak.Pandey@arm.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Anurag.Koul@arm.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--mfsYPpGuHog5bgZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 10, 2023 at 01:53:29PM +0530, Mohammad Faiz Abbas Rizvi wrote:
> On 1/8/2023 10:07 PM, Rob Herring wrote:

> > Another node, is it still 'simple card'?

> This behavior already exists in the driver. I am just documenting what already exists.

Right, I think the ship mostly sailed on the naming.  We could add a new
alias but given that we're trying to retire this binding and might
already have existing users who eventually get converted to YAML and
want to validate it seems worth at least documenting what the code has
being accepting.

--mfsYPpGuHog5bgZQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO/4IMACgkQJNaLcl1U
h9B4twf/R2QUSUszMxhRq2hWo5eHW/t5+JoKg7r66Pw11tIs4FuKEcdurtNeDbc9
zp1qF23UQzmWLriec53SgttEtEAxO9ylS4WHR7vBCDvFk5KOCgC13aL/JCru1FDK
y5JiWijjertGmWIGnu5iQe74IcHHnTECYTWFMd9wh4U62H41/ITXSA3TJLcyEpRO
FBXhrEZJDiYXsZHbUwReM7aFGJBuR5IzwAPtUcixhOfJ8HBigruq/XQwXKs7KVCO
3/wTCH/uBkY/e4kYCXRBLiTi3zGfrsBNMkhc0x53liQXqP8x6mIOR6fl/QVEXr8J
P7EiQBBUsMXl1RvJfQ6wFd2Y465uTQ==
=gNr0
-----END PGP SIGNATURE-----

--mfsYPpGuHog5bgZQ--
