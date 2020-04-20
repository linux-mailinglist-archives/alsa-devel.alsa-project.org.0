Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD7A1B08B6
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 14:05:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C80ED167D;
	Mon, 20 Apr 2020 14:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C80ED167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587384339;
	bh=Uz/u8Mva1bGcBUWnr+fKCRbTRah6M1SnMjedSw2/cwc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WGeCzLYEKShlBz0yxNl86zwskDxK2ZFsBXfHhsY6zU3p5E5j+n3LCQPdmWkUlAAUn
	 A91L3P0X2p6DUJfM36nNfnGHDG4aFHb6Z16FUmDT4IOe1EvF2SSgp1ELBYPtRXL2HV
	 SVeSdvN/WM9NdzTmKWOekDacyRi2qa4aLrZVhvE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E01C4F8020C;
	Mon, 20 Apr 2020 14:03:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7827F801D9; Mon, 20 Apr 2020 14:03:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C677F8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C677F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VwLVwy+T"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 63C7B2051A;
 Mon, 20 Apr 2020 12:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587384231;
 bh=Uz/u8Mva1bGcBUWnr+fKCRbTRah6M1SnMjedSw2/cwc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VwLVwy+TMYRkAkS/gh4iSe/qgG+jao+3rXaiCw2vv+AQZhmaTJrssFW6+E1RE8VL0
 1ulxmBLXavpIBjD+6zR//4dbb+LWwdDieM5X8lY17xI4EK287uMSsXsdkugPPzuHvU
 lOYL3XqhzT3zHwjN/VhhkfGOXDOnNJ9jADLxiyPw=
Date: Mon, 20 Apr 2020 13:03:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] soundwire: intel: use asoc_rtd_to_cpu() /
 asoc_rtd_to_codec() macro for DAI pointer
Message-ID: <20200420120348.GA6507@sirena.org.uk>
References: <87y2qqvdxu.wl-kuninori.morimoto.gx@renesas.com>
 <20200420070816.GU72691@vkoul-mobl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <20200420070816.GU72691@vkoul-mobl>
X-Cookie: Can you MAIL a BEAN CAKE?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, Sanyog Kale <sanyog.r.kale@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2020 at 12:38:16PM +0530, Vinod Koul wrote:
> On 20-04-20, 16:01, Kuninori Morimoto wrote:

> > Now ALSA SoC needs to use asoc_rtd_to_codec(),
> > otherwise, it will be compile error.

> Applied, thanks

This fix is needed in the ASoC tree - are you OK with me applying it
there?

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6dj6EACgkQJNaLcl1U
h9A7tQf+NlpjcVDSx9Wy6gSlg4Xu5wRpfne2xXViBwEpyhpx8CDbEYzkpAo7cK2j
iHKps3mihF/Q+DkHVcI+vZ7KIfAX1SGxKv6IxnlXb2xI61WiYoiyoBZTJ4DYtqmc
96/ZRqcepdytZeLoK1p6haNtJK7yxA0MmNp1x7hK11Vv51DL1SbUfd4zBCwLbwux
uaNbtTH/4SQBQFmrYwetsAo9xaRBVhtfGl8b/oF7alnQa+ug18EEsTB8t+WcTPw4
pL5eK2AIeyA6eKsB4+wct1XZBwosTV10JpYTjr0o4dDUUYhTN6NaSfLmsNUD0T3k
QtXAXGKRs0y4NNswDWeub7Z8hpgr7Q==
=iK34
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
