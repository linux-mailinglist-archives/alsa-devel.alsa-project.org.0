Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F4142145A6E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 17:59:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96A071698;
	Wed, 22 Jan 2020 17:58:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96A071698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579712346;
	bh=1AsIlw/u82BQScSSwz0m6qQ2Kbi7KGRCy6+DiFvoFjU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PqilCYr+DWQXlvSg79RQEtGzx8Ojm1EsWV5hCZhutHA+pqBwhtqul1EFnsI1Ilmzl
	 bAmw4UtMjBLjKf27Pg0q79ZQDdgWbhq/z4IAsciWIa277jVGQTVfdhfwiMFu5KBFy1
	 UzcA+Fkhq4gDNk0Xf8jT4Kg7NniveZycFMQuzALQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44097F80229;
	Wed, 22 Jan 2020 17:57:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDFB7F8020C; Wed, 22 Jan 2020 17:57:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 346D7F800E7
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 17:57:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 346D7F800E7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F32E91FB;
 Wed, 22 Jan 2020 08:57:16 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7408B3F6C4;
 Wed, 22 Jan 2020 08:57:16 -0800 (PST)
Date: Wed, 22 Jan 2020 16:57:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Message-ID: <20200122165714.GF3833@sirena.org.uk>
References: <20200120132928.25257-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20200120132928.25257-1-yung-chuan.liao@linux.intel.com>
X-Cookie: Sorry.  Nice try.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, bard.liao@intel.com
Subject: Re: [alsa-devel] [PATCH RFC v4 0/6] ASoC: Add Multi CPU DAI support
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
Content-Type: multipart/mixed; boundary="===============4478691339690007055=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4478691339690007055==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eNMatiwYGLtwo1cJ"
Content-Disposition: inline


--eNMatiwYGLtwo1cJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2020 at 09:29:22PM +0800, Bard Liao wrote:
> As discussed in [1], ASoC core supports multi codec DAIs
> on a DAI link. However it does not do so for CPU DAIs.

On a first, very high level, read through this makes sense to me (as did
the earlier version I looked at) but it's quite late in the release
cycle so I'll hold off actually doing anything until after the merge
window, I'll try to look through it properly before then so it gets
applied at -rc1 - hopefully other people will get a chance to too.
Thanks for picking this work up!

--eNMatiwYGLtwo1cJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4ofuoACgkQJNaLcl1U
h9DAbQf/VYeZJLhXThX5ktenDql2hXsxXCaYMm14oAqHyqXgjeHhSfyUiFnh3QPj
/P0JzVc5h9gGPu1u8nOSrrlE/oq6S+a4fjfvFv7q4fJFRciXjX2rGYVhpUVXJiGu
VexzUq3UWJuV17xNzRqWMjAi0FHVESF4WP4P/tjdiJQVY+QPOYJ6jrLBQ1g9L3+R
ptjj2KycKZPzAU9DNofplryceaTGpaVMnjCRm3szIH3ZHfLc/ocIPmwQxMXzwQPi
dFF/eEdktquRGBwK9PhBROxljeOkpgZP8nIaJNkAYaI/zt1UEWZGu8aDhUYVEN+w
fdmp3QaDKAFfevnoL6kdj64SS8hC/Q==
=mH13
-----END PGP SIGNATURE-----

--eNMatiwYGLtwo1cJ--

--===============4478691339690007055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4478691339690007055==--
