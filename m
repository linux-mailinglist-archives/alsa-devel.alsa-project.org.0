Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DBF900DD3
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2024 00:00:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4889847;
	Sat,  8 Jun 2024 00:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4889847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717797650;
	bh=y150U5xq5qY1Ynt2HAmIdz9hMVvuRo0oKK6kNH1FLjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=geI6aGaWh1Rfp83m21ca5d6ErbCMoJ9c5+6ahgFjhPp7thGn8PJZv16jtFWEwrEQR
	 7vQh5HDSComDW5ZY8kFsne9carOvRo/icEXTgLXbiNMEHsYEmTuiNtvFcVbRIqDlkh
	 lw8rLaycQXMJjGr9kos5XuHoxR2Uie8clK4/YNHk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E505F805AA; Sat,  8 Jun 2024 00:00:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8CB9F8058C;
	Sat,  8 Jun 2024 00:00:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56D6EF804D6; Sat,  8 Jun 2024 00:00:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA962F800AC
	for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2024 00:00:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA962F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JJT8mVM7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 524826207D;
	Fri,  7 Jun 2024 21:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D350C32782;
	Fri,  7 Jun 2024 21:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717797598;
	bh=y150U5xq5qY1Ynt2HAmIdz9hMVvuRo0oKK6kNH1FLjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJT8mVM71YBv1FMI9RzlTppOqjMlJND79eJH8cwlad6KFykXM53wN05xBPj1mli8F
	 u3d3Ps2qyZDKDaj7uVHV84F+6OFx7d0L3Ozz0ZE4xwaIH/KYVefkKGJl41RvaSffD2
	 XkiYcix09suVmd6Jx//BjrT26l6eFVp9ybyxzWmC3Tw1XS5zOioGI6sy1daRgZkUyx
	 whhj2bWZLMQaXpvRcNqpRPV8JA/gRm+ECx1P98aMLxNUH8A7kblS1Q2MGLJrZEx/pe
	 Ytz3c5oiKl74UpDhW1T4h6CgECPecukhdJjvqioxVnBU1QZNlnmM8/DnPI03/UBi+3
	 P/zsBdr3ODQYg==
Date: Fri, 7 Jun 2024 22:59:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, tiwai@suse.de, vkoul@kernel.org,
	andriy.shevchenko@linux.intel.com,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	"open list:ACPI" <linux-acpi@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] ACPI: utils: introduce acpi_get_local_u64_address()
Message-ID: <ZmOC2rDhOmxBQ9VI@finisterre.sirena.org.uk>
References: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
 <20240528192936.16180-2-pierre-louis.bossart@linux.intel.com>
 <CAJZ5v0g8aW5FBbceYJDvDrMHRxT6i71O_LTWKALb=qr+m1BJ7w@mail.gmail.com>
 <998d53cf-c22b-4706-93af-ab38802dc531@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LB93vw5p49CVxXfi"
Content-Disposition: inline
In-Reply-To: <998d53cf-c22b-4706-93af-ab38802dc531@linux.intel.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: XRSFCE66M3JY7JNWYY4Y6SIGSIDJRUP6
X-Message-ID-Hash: XRSFCE66M3JY7JNWYY4Y6SIGSIDJRUP6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRSFCE66M3JY7JNWYY4Y6SIGSIDJRUP6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--LB93vw5p49CVxXfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 07, 2024 at 10:33:00PM +0200, Pierre-Louis Bossart wrote:
> On 6/7/24 20:51, Rafael J. Wysocki wrote:

> > Do you want me to apply this or do you want me to route it along with
> > the rest of the series?

> > In the latter case feel free to add

> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> Thanks Rafael. I think it's easier if Mark Brown takes the series in
> ASoC, I have additional ASoC patches that use the u64 helper.

> Mark?

Sure, no problem taking it via ASoC.

--LB93vw5p49CVxXfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZjgtkACgkQJNaLcl1U
h9CzQgf/bzAA0c9gFMT6UUp49/iI3Ki58T1R6v9d85wC7P6o2x7ZxcqY+VTfrGnk
DPCDNhIxHvWMXWlRrl9J1UVSQUt5FatD8+HyD5wRMUsOIbt9Llyow4Inds6vCjhT
eerz25yq4Dp3eNU3xGZLnatDScFONvNVQbKZ6lSkpSojlRIJMipglXmSn9yVAwk8
/p6kY3CbVA/sa98u6DqQQxqH05GkADSTNOSPUXzsXB65yl8wy8wn3nTEAH0thiZc
Fh8ffR/J/k7jKok+h02cIxbTOd6WZ1S7qK783GKhAYrDynLW92KlrajAsFqXxa8B
lihr6cHLXz8kOSWrwD+x6Ff4za8GRQ==
=UueQ
-----END PGP SIGNATURE-----

--LB93vw5p49CVxXfi--
