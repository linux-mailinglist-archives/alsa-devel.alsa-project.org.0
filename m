Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0742218677
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 13:55:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 609811686;
	Wed,  8 Jul 2020 13:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 609811686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594209346;
	bh=ugp54eQL1bl+BnVfKGNjJc6xFCcbyZUznAo9gwoqJJI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gNGMt469nKITBDDGjqDh4wMzytoV555nxWnHhZ69jGFg94edkLuTe1Ps89l85tkKV
	 xj+dtYkMFymLxIi1148uh6XoEkuUmbPq6579usJ2LE8D7YW1JuzpYyLNeMGJW3nnoT
	 HFwXKFu+Pwuwd6/xWobpYzr5Axk4e8UoYWJ2CdJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74C29F80150;
	Wed,  8 Jul 2020 13:54:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0AF4F8015A; Wed,  8 Jul 2020 13:54:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6481F80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 13:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6481F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zzk2xxc5"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0156C20739;
 Wed,  8 Jul 2020 11:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594209234;
 bh=ugp54eQL1bl+BnVfKGNjJc6xFCcbyZUznAo9gwoqJJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zzk2xxc5CrXcIf8sNWkV7wcJ3HWiWG9zuy5l2daY1cst0KsH24f/8LhKCC8bSeRyT
 r4vycxKneCi8z2aISlmO+C9d5wG6bwGiWq5X8bQM6WJx4IxynnKz7zRHF4HN74QJ2j
 MlmHyqjOU+upTUPNx69nXSbrmdwSXdiZ4m8/fnwg=
Date: Wed, 8 Jul 2020 12:53:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: more fixes for dpcm checks
Message-ID: <20200708115349.GK4655@sirena.org.uk>
References: <20200707210439.115300-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gJNQRAHI5jiYqw2y"
Content-Disposition: inline
In-Reply-To: <20200707210439.115300-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: Oh Dad!  We're ALL Devo!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--gJNQRAHI5jiYqw2y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2020 at 04:04:36PM -0500, Pierre-Louis Bossart wrote:

> base-commit: a5911ac5790acaf98c929b826b3f7b4a438f9759

These are fixes but you're basing them off for-5.9.

--gJNQRAHI5jiYqw2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8Fs8wACgkQJNaLcl1U
h9AVpgf/ae4Usob5PYgtJPjHs2EzT5p02Jm/QbLFPFPhOu1qIkyrJ+vzOITVfUxu
SLJwYffyBq411kPxyNPBm1AZJNmcuO2tk7kodfk27oHEHwKfBqDcvpbPoC3RHdNn
5d2A9RTCV9zjDIdpkMWeVA3hk86LeGP2isXH3hftbHSQY5KRH1jJ3b38P9qj4HHS
VGr4EVrbue/z5vVa4bgD3VZgLvqR+wTCWR7uqNWE3qI7od5NHd0DgcZFADRm+NXL
tLxaO4eZmrj/Jo/1c3m3NEUbH9OXI14lRnI4voMGhNB9V8MVTXJwVY1s3/RUIxIB
blA7jAUrDTMmbIoXlkHpiO20uHohBA==
=67eb
-----END PGP SIGNATURE-----

--gJNQRAHI5jiYqw2y--
