Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0A6902090
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2024 13:45:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53253846;
	Mon, 10 Jun 2024 13:45:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53253846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718019919;
	bh=zgxmHN4eLJ1bqt1MSwrUkp6YNshYrFBJJc/pTaKu1L0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ebRLsNs6ZM9jw7wTTbteoBN4tpg+ksshYWgQuo+x+8kgFv981sqgyH0QZElfcXiSW
	 ALFItB3ZKl78d5hirSl17EP8jXwMCt56xDt/ddXixRpR/n09Ndr/fPAGbk62hcXNLX
	 Rzi7wez4QnJgSLwB4n9E6Fpqgoj+nXBFxyVrwYI4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C2DEF8059F; Mon, 10 Jun 2024 13:44:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7620AF805A1;
	Mon, 10 Jun 2024 13:44:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B17DF8028D; Mon, 10 Jun 2024 13:44:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25058F80130
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 13:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25058F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IHjbFn0Z
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB82060110;
	Mon, 10 Jun 2024 11:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E796AC2BBFC;
	Mon, 10 Jun 2024 11:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718019874;
	bh=zgxmHN4eLJ1bqt1MSwrUkp6YNshYrFBJJc/pTaKu1L0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IHjbFn0ZrFwjjLA5TagS8pgo2XsuGd9Phi18hjEBI3NFDpCB7FjxXF4kpc3oKY1Yr
	 zTZJzDgc5Wqb1NyMYNY6g6s3+mhr0ezlBdnmZXYjsSrb8HlZ+4OlD6K9NlsEaXDhVX
	 kOTfOGIQup/TU4hiV2TTWuRAe6EdCxnehS+B+10+AOxw33y2XVsOIfydgvDq5peMM+
	 wOvXvGy0v4KLTuj50XtHL6AmYAmVUIuGDGwFc8WDTW2/NdLGubNExqL+FoIwfu+BUo
	 Fwv37EvF8Q1AjoDFM+suLmpBmxOcEL5DKVCqmriaVvLyUfbBa0WVLxeI3rF5wqyY7F
	 OT7hhkyvE9YLw==
Date: Mon, 10 Jun 2024 12:44:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas GENTY <tomlohave@gmail.com>
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, alsa-devel@alsa-project.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] bytcr_rt5640 : inverse jack detect for Archos 101 cesium
Message-ID: <ZmbnHjwli2TkYGH-@finisterre.sirena.org.uk>
References: <20240608170251.99936-1-tomlohave@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7MUxxJMIgy8mpAvJ"
Content-Disposition: inline
In-Reply-To: <20240608170251.99936-1-tomlohave@gmail.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: XJ4OE6EE2V6QRO2RRRHI2AHOZNK3GOE4
X-Message-ID-Hash: XJ4OE6EE2V6QRO2RRRHI2AHOZNK3GOE4
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XJ4OE6EE2V6QRO2RRRHI2AHOZNK3GOE4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7MUxxJMIgy8mpAvJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 08, 2024 at 07:02:51PM +0200, Thomas GENTY wrote:
> When headphones are plugged in, they appear absent; when they are removed,
> they appear present.
> Add a specific entry in bytcr_rt5640 for this device

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--7MUxxJMIgy8mpAvJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZm5x0ACgkQJNaLcl1U
h9BPZgf/XvoGoqG1fH7fpcAF+FN98zeRIuZUQksCcSXvadSkwlSMkRFtr9e/fofW
ba1TeG5cKoJRwnJDof3NqJfbgFjQJ5aZsEwvDujVbByOAgObpc29whPp2q21e0z6
lEc9c10rqfHbdCgLo+6wAIxBmcmhOM7+oxz47M9Z7ai4ggbmy9mamcpENe7sL2m3
HNjvkwYoS4lgCmn3iTFOs7ZzSp9V00lpgyiGMsV82FyAYVN+iFSezRqe8+CqTBzM
USAP1kjffLRWkLmF5DRuK4ddS1GxDsl7pUFmbdcOH2UlrjGuiBLCchVZ7n0nTeKI
GOYFTvFnmBz+w/8TXg/yrv+3MW/K+g==
=B6/G
-----END PGP SIGNATURE-----

--7MUxxJMIgy8mpAvJ--
