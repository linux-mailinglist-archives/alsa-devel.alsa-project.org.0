Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB905B59F0
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 14:06:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F5F51670;
	Mon, 12 Sep 2022 14:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F5F51670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662984418;
	bh=s4fh6cO8L48Qsh2ebVQCOBSgE8J6my9CboFPL6tq+6c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=chw+ctfmT9bqkAUuU2Fkmuc3k5EPifBy07OMQyGXfn8jmzcwUJOhqt/t1waKwpXnu
	 G9xaPNN/qDNVgs/bsQwVoY6i2r4ga6SoN4/8h5jP/OU5YKJmHVp87oBOwc7/XQIkgs
	 7vL2ybhqu3j1i/x2AOWfgqgs/n5JYyZKe/j46Yac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BE1BF8020D;
	Mon, 12 Sep 2022 14:05:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D6F1F80095; Mon, 12 Sep 2022 14:05:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2A31F80095
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 14:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2A31F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fM2fd/jE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB7FE611B0;
 Mon, 12 Sep 2022 12:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D02C433C1;
 Mon, 12 Sep 2022 12:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662984350;
 bh=s4fh6cO8L48Qsh2ebVQCOBSgE8J6my9CboFPL6tq+6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fM2fd/jE8dlvHRoOLOh0CHP9SoVFA4HBUFKz+fEG8yWEZtj//zKnGsp9osdVzj49s
 4059Zo52+0manhlWczXVfrYstt+DZnfZpsiwXGcLzXFukgAShzdp6h0vyQ/hZS/LRx
 g8cfR4KEl6ObStqmEMgnfXB4yD3r2wmutIA4VmejAz2ikhvnYhkutV41EV/FQdbsCV
 C6ruU4TlpD4p+L51jiNB5WFABU6PYz2LNzmFCrXm4ubpjt9Uuh2Y/V9LJO9jsuGsbK
 nxIdDR143lMAvOYpul1z+KHBQavCuQjyBG7Emkg2Tg0aI7fwE9t+rNLIGfsVFZTpdY
 /WGnMj0y696uQ==
Date: Mon, 12 Sep 2022 13:05:47 +0100
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: nau8825: Add ADCOUT IO drive
 strength control
Message-ID: <Yx8gm2iIsr04r5Fm@sirena.org.uk>
References: <20220912115427.710417-1-CTLIN0@nuvoton.com>
 <20220912115427.710417-2-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CQNT5QrVYdmXwE7k"
Content-Disposition: inline
In-Reply-To: <20220912115427.710417-2-CTLIN0@nuvoton.com>
X-Cookie: One FISHWICH coming up!!
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com
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


--CQNT5QrVYdmXwE7k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 12, 2022 at 07:54:29PM +0800, David Lin wrote:

> +  - nuvoton,adcout-drive-str: make ADCOUT IO drive strength with stronger if set.
> +

This isn't the clearest property name or description TBH.  For a
device specific setting like this it might be clearer to add a
reference to the register bit so it's easier for people to tie
the behaviour back to the actual device behaviour change.
There's also probably something clearer than "stronger" that
could be used here.

Perhaps adding something like "strong" would be good - with the
name I'd expected the property to be a numerical strength rather
than a boolean.

--CQNT5QrVYdmXwE7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMfIJoACgkQJNaLcl1U
h9BUswf/SZ1RGs0/Tlm5zKYBW9VmCRdNI+qlJF2TL2pRjZ6PSVvRKsc05JdBzL7o
XNvV9swbqXC//mLUUBvmPLroAFG6kb+ffeIUL+POlL5DSMdhpAFtiNlvNq2/HsKK
VoLrB+NXYYtykdh98MuIdMZzs+wrkByDpAwLFVuDboGpofVqVkbx2cjMV89TxQ4e
ykwI06XEE/cEUe09GO7sIaiVzovHsS0iNFhbfSVYey93UOZ27oAbEk6WcC+318Iz
wGJ8G/O50oPmeK2osfX9kl0E6t0lhY70z/eakYPju2Nsa9kUe47HKWZQNf909HA+
f9WVOka3OPl5/QfZYaSaRFrm+JX9Xg==
=tUcb
-----END PGP SIGNATURE-----

--CQNT5QrVYdmXwE7k--
