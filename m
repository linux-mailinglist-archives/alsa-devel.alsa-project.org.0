Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3BA189B34
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 12:50:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1998B1740;
	Wed, 18 Mar 2020 12:49:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1998B1740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584532235;
	bh=AG9M1kcWBPSjVC2/nPK+uxXuWA73vfjU/vqttXP9AAE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xzo40PqUcIDcQSVhhKLw3YDE0BVRMBguqamtyNrdiciCrxrBRi1OnwlVtdbkrRiCE
	 rN/UTMPacuo2HUEq0I2JHo2Ck09ifLWv1McR0PgVDrGY2YA4f5W8umdeICvJgHqPbn
	 F+qJudOeWSwnGnFwZU3xOvwPVTxVucFvajAKDrJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0735FF8015B;
	Wed, 18 Mar 2020 12:48:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EEBCF80139; Wed, 18 Mar 2020 12:48:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5EFF5F800B7
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 12:48:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EFF5F800B7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 055551FB;
 Wed, 18 Mar 2020 04:48:43 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DD483F534;
 Wed, 18 Mar 2020 04:48:42 -0700 (PDT)
Date: Wed, 18 Mar 2020 11:48:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 6/6] ASoC: soc-pcm: Merge CPU/Codec MSB at
 soc_pcm_apply_msb()
Message-ID: <20200318114841.GB4553@sirena.org.uk>
References: <87y2s0olg6.wl-kuninori.morimoto.gx@renesas.com>
 <87pndcoleh.wl-kuninori.morimoto.gx@renesas.com>
 <a400680b-0334-be68-f137-19a601b43d33@metafoo.de>
 <87imj2pltk.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline
In-Reply-To: <87imj2pltk.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Oh no, not again.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>
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


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 18, 2020 at 09:07:35AM +0900, Kuninori Morimoto wrote:

> Mark, can you please ignore this patch ?

Yup.

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5yCpgACgkQJNaLcl1U
h9ANFQf/d1xfJClz0qe6tYPlRHcen7EfvQIkIV5G60hHIf/4GI9QmymX4+tvqWsY
WlzM1c4APxue0Zx6A2odZW+J7oLGDKqSt6y+R+WYQdi+m1GpSF5ZQI1BNLS2t1mt
I4JuXxO6Wems2PUejBPWLhKnxqal8vBNb8DczEkZQ8YptZVLj45uJHD0p8KgB74J
zWKcA06Y+F2qopIn31mBfEOPz7610+tSFzbXgv6Pl03Lhcs6eDfRIupplrFCb910
4GFiJCVp5bLVztYBB1ZgdVmnHz0BeUohL8iXyVAJICOd74chIrmFcbrFZUKrCWda
u8tJZDimzGNiEjznmnV8xcv6y3LBUA==
=njz5
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
