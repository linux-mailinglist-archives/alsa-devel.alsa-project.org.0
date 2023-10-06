Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3097BB5A4
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 12:49:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78B0210E;
	Fri,  6 Oct 2023 12:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78B0210E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696589389;
	bh=7wC33CFidpUhqsYtyZlKuwIraiY6vrLndrQz+qspqLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P4Zj27UWHZvHTbARatg4vvJ2RGg9RbIGYmMFsLpgXd2oF5uQnDBBeOHCqtyeDIO7M
	 RkRJOvyWlKRVU7x7NUiLNKbk7weNXHzmtCPV6mV97I//gqCdfbupcnSboKk6RROKPo
	 3uxMW0boVVyQApO4Swl51DBbezAT4kNvYtwgfRuQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7016F80551; Fri,  6 Oct 2023 12:48:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1D07F80310;
	Fri,  6 Oct 2023 12:48:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57B3CF8047D; Fri,  6 Oct 2023 12:48:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED759F80166
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 12:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED759F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M9tkoNls
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0B7D61D0F;
	Fri,  6 Oct 2023 10:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932ABC433CC;
	Fri,  6 Oct 2023 10:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696589289;
	bh=7wC33CFidpUhqsYtyZlKuwIraiY6vrLndrQz+qspqLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9tkoNls8OLWlThQGuZCsBuwn0Gm+CidnrtRvyS9TYt6if3XXxdCOrt5NzMOzv/se
	 oNowIE982Ow5QEyW7+AvihzwK0aWmXRdF9AeIrjKZ9VH4WRj8/cUkPR2TsVYs/3p/S
	 6JFNU2fkmr5aWc4Bc9kPSVy4hWVNHhPUyoRXVAGPskbcagYfZdwRQxYvriAggdAkqS
	 T+CbwG80tEh8ucFwL+3ZnxLPqmUcXwnrPizrR1hmvmNkjlAOxem/pb2R4t30av2xmG
	 J9mqHB7C6VdWwtkEniyNvzsAH6BTu5UdAg1dDgfQRj2PBsGhTrifrhmP29iDuOGPDo
	 8oreoStwpZ0xg==
Date: Fri, 6 Oct 2023 11:48:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH 3/3] ALSA: hda: Add code_loading parameter to stream setup
Message-ID: <15055bcb-af67-4041-a757-7729f2abbf6a@sirena.org.uk>
References: <20231006102857.749143-1-cezary.rojewski@intel.com>
 <20231006102857.749143-4-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bqoc/41IPglFidJ2"
Content-Disposition: inline
In-Reply-To: <20231006102857.749143-4-cezary.rojewski@intel.com>
X-Cookie: Rome wasn't burnt in a day.
Message-ID-Hash: NXBTMZC3224EXYPMXJRW3ULILIVSW46O
X-Message-ID-Hash: NXBTMZC3224EXYPMXJRW3ULILIVSW46O
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NXBTMZC3224EXYPMXJRW3ULILIVSW46O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--bqoc/41IPglFidJ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 06, 2023 at 12:28:57PM +0200, Cezary Rojewski wrote:
> AudioDSP firmware is the one who kicks SDxFIFOS calculation when a
> stream is decoupled mode. During firmware bring up procedure, there is
> no firmware running and the code-loading stream is always a decoupled
> one. So, there is none to trigger the calculation and we end up with
> false-positive timeout (-110) messages.

Acked-by: Mark Brown <broonie@kernel.org>

--bqoc/41IPglFidJ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUf5eEACgkQJNaLcl1U
h9ApdQf8CuUojDw3rxAqUQDzBoKLI5d6uIckCikEE/hGrisRWESuBkRn7Hqicihl
iQdRuLUCvYWz7ij2ULsJLaQdbJI4OpqeP9RjBy9m/jw18QM6h1gbGC8+pDZh+8BW
1/bYTqn4FizoUCW7VEJSCZvCa2Z1qv39c4R38+cr7W2C7n6CGRx/2Vg8VUnlr04W
tb+WQxJFKTYfGteh6tH5TGnDz+1j1DBiHlFYRbr7mP5aNVvtlu/0xSb1uMh7QGHV
Wn6tFJ9BK3XFHMTSHN8XKv5/RbaZUDDmDAHUfgO7b/G+ViLCsl6ibE0BE1m5gNZw
++xPL+FCovnR+Y8djlf6Max0JPTPbQ==
=CA1/
-----END PGP SIGNATURE-----

--bqoc/41IPglFidJ2--
