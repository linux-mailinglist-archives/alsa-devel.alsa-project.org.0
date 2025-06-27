Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCB9AEB5C8
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 13:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59D50601FE;
	Fri, 27 Jun 2025 13:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59D50601FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751022297;
	bh=ILopEhlpi3Ezeg8jJ09kRy0qj4a+MztRff2cwbyCFPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t3M+CkVex32tmCZATuUZuXHSl+FOcjtRNJMe7tU9Pm4QDGOpQYnGbWeoBtv5KbaPg
	 /OOiW7/o8KXrTSVILqYdvUR0me4PPmVQmIEaQ7UbvuFktIqWmc3UfbajlmLVNgFm1q
	 M3mi0gxJqfXbE9yoEZMGD4cMXfFjeGIXMw5xB7x0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 737DAF805C9; Fri, 27 Jun 2025 13:04:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F39DF805C7;
	Fri, 27 Jun 2025 13:04:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D91BAF80217; Fri, 27 Jun 2025 13:04:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA2AEF800FA
	for <alsa-devel@alsa-project.org>; Fri, 27 Jun 2025 13:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA2AEF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Vy9i0A8c
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1CA9BA52D27;
	Fri, 27 Jun 2025 11:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D469BC4CEE3;
	Fri, 27 Jun 2025 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751022256;
	bh=ILopEhlpi3Ezeg8jJ09kRy0qj4a+MztRff2cwbyCFPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vy9i0A8cL2ZjxXzbz19E5J+jC1wg0IdB+sMIxrILXvSbcN/mpOqZbHGCMOwQElk4b
	 V4KsRKKvZNtFTNkEMtyv/z8uJ3h4EngYfas/CncPPRw7Oj93m9ZJb1CgSIbUAb3bMs
	 b8C214qGctg9UiZzJkKHnD0Ltwz0w5VYR4VFGMpUFyRX+B6bxM/0bsJbGXBm4KGuAG
	 /h6Tqs6Vnxps8wNQGrlNpARvOAH9/OKg73LXn+TYp83XeMIO5GUb7yg4/6A+tVn6Ag
	 9QHYPsB3oI6hYsFJRC0Ph2eFZqOn4s8o+wAIu21lMW0mOxRPTH4SSFX35KdxUQCpg8
	 3CGqRLgQLK4Dw==
Date: Fri, 27 Jun 2025 12:04:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com, tiwai@suse.de,
	alsa-devel@alsa-project.org, baojun.xu@ti.com, shenghao-ding@ti.com,
	liam.r.girdwood@intel.com, lgirdwood@gmail.com, robh@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	navada@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v3 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
Message-ID: <aF56q4eOqFdy7rsr@finisterre.sirena.org.uk>
References: <20250626181334.1200-1-niranjan.hy@ti.com>
 <20250626181334.1200-2-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="90qajOVw17IHWpFd"
Content-Disposition: inline
In-Reply-To: <20250626181334.1200-2-niranjan.hy@ti.com>
X-Cookie: Do not cut switchbacks.
Message-ID-Hash: SHAMRR27ZS5HGPGOYYWL7GJKJUUOJO4R
X-Message-ID-Hash: SHAMRR27ZS5HGPGOYYWL7GJKJUUOJO4R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SHAMRR27ZS5HGPGOYYWL7GJKJUUOJO4R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--90qajOVw17IHWpFd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 26, 2025 at 11:43:30PM +0530, Niranjan H Y wrote:
> tac5x1x family are series of low-power and high performance
> mono/stereo audio codecs consists of ADC and DAC combinations.
> The patch adds supports for Codecs(DAC & ADC), ADC only and
> DAC only configurations available in the tac5x1x family.

This looks basically good from a driver point of view, but I see there
will be some more changes needed due to the DT bindings review.

--90qajOVw17IHWpFd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmheepUACgkQJNaLcl1U
h9Ciiwf+PegXUaWt830Lu6e+CvncsslfB6PB+MiJe2C+Yki1zkMxYh/7bwkRjti9
dUal9lk+Iiazjv8BzYWmtKRytZFgKZFOabl0gNWiq+nKn8nOXzvPkSkmFtDNYJqC
5BerNIJrxomntBEimgLHB44Q4IlYC207EeaBHPcdQRWEFw3KSQ/MVbnGf6hupE19
7KOMvPjM2yxSDHe8qhZT2qasE3Mz4S/NpYCknvb8sccDVpqMmOKvm1aWxz39w6Ev
fmzMuxvwn6mahln7YTiOHcLDk4hz3FOtzorNJpPtK0dg5Q6BF0tqvGP7rtiGX47D
DVOOWMdOxAxmxofskITqSLL9efGsVA==
=B1lY
-----END PGP SIGNATURE-----

--90qajOVw17IHWpFd--
