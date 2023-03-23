Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7CF6C6AAD
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 15:20:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 701D2ED0;
	Thu, 23 Mar 2023 15:20:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 701D2ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679581254;
	bh=Ol36h+p/kQjIM0PAXDsM+TBkmxB34eJWpbGDnTLG6pU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f7OIc2Jt80AXmM1e/E/XF2JEJHTfuvrNceZcTsRNdRvdpkDfy++tQk0C+WspxbHwi
	 GfYH0q7yXJRRTRqVh5C9/bceRC8FWNOzyGSQLm24uO998O4OMvRAzzL1lZWcQReOfQ
	 Y5+P3/l0QPFrbvweNkc1orILWS0kb4QO8Owa7PMg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A548F8027B;
	Thu, 23 Mar 2023 15:20:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A6EBF802E8; Thu, 23 Mar 2023 15:20:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8548F80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 15:19:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8548F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MHzCWLPC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC1A4626D1;
	Thu, 23 Mar 2023 14:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFEF6C43442;
	Thu, 23 Mar 2023 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679581192;
	bh=Ol36h+p/kQjIM0PAXDsM+TBkmxB34eJWpbGDnTLG6pU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHzCWLPCePksgmOzxJ9O0dgIkncejQkCg9PpNDXoWOJXsRTjjZU5DzKTFcW5DhyoV
	 P0NdomBaAiLi4FEi3N/BRO8trFthV7YiiXmYQaVvvFb/CLtq+bYG7dCVUnPcfMMVZv
	 Dqag4HTFmRajrLyBA4RVDpuo+kp7nymjk+ZbD8M9sVsz8vdapjzwQXIpUPjzNFUJRN
	 NDa5T2gcoHMBiBHJJs/K0XOECZ6nQdR2NWTRCp2LPpPmqJD13xT6tuefHLGkxR3gVn
	 G6eeV/xEf1qrgHAoFs67yBPKZEYRMc18CSOWW+801N+DuX+Jg1ABiylQtJJFpK+P4t
	 4NzrJginon2SA==
Date: Thu, 23 Mar 2023 14:19:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 06/20] ASoC/soundwire: intel: pass hdac_bus pointer for
 link management
Message-ID: <65ac5ea8-1892-469d-ba3d-6c9d66aea001@sirena.org.uk>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
 <20230323054452.1543233-7-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RBVyxDlDYijhSVHm"
Content-Disposition: inline
In-Reply-To: <20230323054452.1543233-7-yung-chuan.liao@linux.intel.com>
X-Cookie: A lie in time saves nine.
Message-ID-Hash: WDSGFE5IYDW2AXZRUX4AXHMV4I5W3X2S
X-Message-ID-Hash: WDSGFE5IYDW2AXZRUX4AXHMV4I5W3X2S
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, vkoul@kernel.org, vinod.koul@linaro.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WDSGFE5IYDW2AXZRUX4AXHMV4I5W3X2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--RBVyxDlDYijhSVHm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 01:44:38PM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> The hdac_bus pointer is used to access the extended link information
> and handle power management. Pass it from the SOF driver down to the
> auxiliary devices.

Acked-by: Mark Brown <broonie@kernel.org>

--RBVyxDlDYijhSVHm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQcYAIACgkQJNaLcl1U
h9AeNAf/cK+pek4AC215/URy8g/8HXIy77j3ginP0+aorOaczHO1jbFaG8qB5jsT
UdLcTyUPxs1STd1Q9B8EEZagv2/JIhnU+01igy454TdP33yYTLwV+dO0DwXWDXs1
GHmg9S6J0HSGp1/GUsWb8AlBoo8z9vXv9Ky/4qTjrnJdvvi1NkNvO54fuRb0YlEA
oAdHWX35mtw1f1+iRR1uTcOea9onujblRbFIXaV+iTIkSCcVwEtEBC/Ic34+zT2o
2TVoA0tIzq6fE2XX6hBMlIhb22d1Wcxv4/fTEVXr+mkt+mpC4dU6vO0eosYLh+D3
OLoAVj1OIuIqUosg2jrWR4i3oUqw7A==
=NHPZ
-----END PGP SIGNATURE-----

--RBVyxDlDYijhSVHm--
