Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 843DB787B7D
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 00:28:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F05E84C;
	Fri, 25 Aug 2023 00:27:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F05E84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692916102;
	bh=zX2dcD0Q2tqtivEcgMKudTTam8VbtuveSl/t4lowkLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DVvbWGyzORI8+54waEE7KeJQZso/Vi4VSh0OPWyb9A5oKPfN7tZzZXOrohkORItGm
	 0nsWCvrzIxp/4dkXFP6RJHrtzceoghjPy8pQwsX4miENACNUYVQA/yGAmxDZrk8FEr
	 EEWm3enAa7wR7+727VAu76KyqP1/h080vYsbXkIw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5FFFF800AE; Fri, 25 Aug 2023 00:27:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B32B0F800D1;
	Fri, 25 Aug 2023 00:27:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1026F80549; Fri, 25 Aug 2023 00:27:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FDCCF800AE
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 00:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FDCCF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mYhqYL0X
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03BAF646C8;
	Thu, 24 Aug 2023 22:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81A5C433C8;
	Thu, 24 Aug 2023 22:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692916042;
	bh=zX2dcD0Q2tqtivEcgMKudTTam8VbtuveSl/t4lowkLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYhqYL0Xkca5emmMneHe47V1Hhq8uUmBdA6mDh3KREWvM+x2X+M4ZdwLPSyRHTpso
	 B5VVkvKwIa62joqdCObNRM1+s5kvJ92nZJk7W8LSN0mY/nUbJ+LxwgFEilzlxmKQGc
	 u6zj8xwHzrZsJ9Zl4EQj10U1zMFIaw7zWR64guMzVcxVmucEqIRZBZbpnvUsY84WGy
	 F3EDLAfnunx4NlxO3nXDmHCTfy7gsCVmjtjLD7Ze2dWXYDFRrPnrZ6DiQAngEJw62P
	 fnDbPv/whfb3ZL0ugcoKqr7jvw1XRBDhZ8cMo352ibfOOvY4OLSLroY8uYzD0wCXUy
	 c0go/HF45pA3A==
Date: Thu, 24 Aug 2023 23:27:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH 04/17] ASoC: pcm: Honor subformat when configuring runtime
Message-ID: <ZOfZP/uxTH4kfipa@finisterre.sirena.org.uk>
References: <20230823080546.2224713-1-cezary.rojewski@intel.com>
 <20230823080546.2224713-5-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bnl6kmc2y5pQBJdM"
Content-Disposition: inline
In-Reply-To: <20230823080546.2224713-5-cezary.rojewski@intel.com>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: NQVMDBJFPJNMNGWS3LR2U235F322KTVZ
X-Message-ID-Hash: NQVMDBJFPJNMNGWS3LR2U235F322KTVZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NQVMDBJFPJNMNGWS3LR2U235F322KTVZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Bnl6kmc2y5pQBJdM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 10:05:33AM +0200, Cezary Rojewski wrote:
> Subformat options are ignored when setting up hardware parameters and
> assigning PCM stream capabilities. Account for them to allow for
> granular format selection.

Acked-by: Mark Brown <broonie@kernel.org>

--Bnl6kmc2y5pQBJdM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTn2T4ACgkQJNaLcl1U
h9Ay8gf+IeL6/OAAubIa/2nvTqlWZ1IDupj8fUUDBSpdifDefdZDAH3/R0PprP3Z
WQTgBlDFgX+2jHV+BSWD76l+GVF19wPlW24UGgIZ4O6oyehZcuQo2xYndoZ0+XY6
zQXRKtAqXWuH9YrJ3PnstoTuZ6DMwy4YgDZQliE8h1wiWaL7JGL5BR6/deYb/FsC
HGQol6T7xAd3mymbLpewVWuXM7RAksPnZ4p3cyjt1w0cQwdrkWOgBk2M0Kt6Aerk
rYIiCFHDGnBcazrYwBWcWSpXuP+8vdOqOPpI0k640acVIygMrK0ki1LucEINnTOF
OdLtMWsVBNhiie+I+OmSlGoVhCrvVw==
=+R2N
-----END PGP SIGNATURE-----

--Bnl6kmc2y5pQBJdM--
