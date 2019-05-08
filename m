Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F198E174B3
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:10:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 863A61A97;
	Wed,  8 May 2019 11:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 863A61A97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557306614;
	bh=jZ18K9yTV6curnyut1vgEakOAsGKxhnT2s+xZaFq6HM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=orAz9wdZg9/jr1fgmuMOIvdj7gBWA7ctByg1RIswP/kzL+wR7/zEbD2O3E5h/T5q0
	 FRoUoy4dnEZo+w4AJ5hVhK0sxTMF7XBWQaJF/hNP7NsNl+qiHGT/7zbNULiT2nJWh2
	 8EFa5k0yPrHYoPvpOxoeg0+JIR49rke2HdiZG7/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6ED4F896F0;
	Wed,  8 May 2019 11:04:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89D67F896F0; Wed,  8 May 2019 11:04:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63087F807B5
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63087F807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FQeEtDtI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SLaCDPhxMMikTFAxLcu81CNC9LBPAJdG+62+3Qu31NA=; b=FQeEtDtIcZI9ZQMa/x0LAQ2ZC
 Rnt8PX8I2lrNjW5u2IoCgI3gJ74gce8ps6jeYXvH2RfU0kglDYAqZyMnbNpdUAGOcHnlLmNPOYEs5
 tHQO1Itm5msJT070ncRBpnC4rePdXjci8sEPJBTo1X50hKVSshtcqp/PPrtIA4MRV3rug=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOIUm-0007fG-5K; Wed, 08 May 2019 09:04:12 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id D81CB44000C; Wed,  8 May 2019 10:04:06 +0100 (BST)
Date: Wed, 8 May 2019 18:04:06 +0900
From: Mark Brown <broonie@kernel.org>
To: Fletcher Woodruff <fletcherw@chromium.org>
Message-ID: <20190508090406.GG14916@sirena.org.uk>
References: <20190507220115.90395-1-fletcherw@chromium.org>
 <20190507220115.90395-4-fletcherw@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20190507220115.90395-4-fletcherw@chromium.org>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [PATCH v5 3/3] ASoC: rt5677: fall back to DT prop
	names on error
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
Content-Type: multipart/mixed; boundary="===============1041327024948235339=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1041327024948235339==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+if5tLMzDwmTCkiQ"
Content-Disposition: inline


--+if5tLMzDwmTCkiQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 07, 2019 at 04:01:15PM -0600, Fletcher Woodruff wrote:
> The rt5677 driver uses ACPI-style property names to read from the
> device API. However, these do not match the property names in _DSD
> used on the Chromebook Pixel 2015, which are closer to the Device Tree
> style.  Unify the two functions for reading from the device API so that
> they try ACPI-style names first and fall back to the DT names on error.

This is OK and should probably be the first patch in the series since
it's much simpler than the other ones but depends on them.

--+if5tLMzDwmTCkiQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSm4UACgkQJNaLcl1U
h9BXYgf9HL6kgqhLX5BgKf3C1D9thjRYiOmKbp5R2x6lp5KlyJkhLSBNUFaJVciZ
6cshYtsU42VNjyT9ICN7OD3CoROo+HDvy5PaPfylSaNSUq180OQV6t4KE2SNrGZ8
5O1GpwPLUJ2Q+0biQMPOp4eic90mz3usZtSIFgg9K8i0ZsYtmV2t75OeSETJY1au
nxnYwLttQ1R73oRfaB7/uvYETekume/zHZ5BNi6xFPRgKY2cPoK+qUvWKH6CaaLa
WOufUF3Os1nB7azLSxLfZvhRleqVmpv95d/jHtdYOH4920YbHqsImkyInJc8Uh0z
tkxlqDjblH4PgakMTEmJ+T0M7JEAKA==
=gN76
-----END PGP SIGNATURE-----

--+if5tLMzDwmTCkiQ--

--===============1041327024948235339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1041327024948235339==--
