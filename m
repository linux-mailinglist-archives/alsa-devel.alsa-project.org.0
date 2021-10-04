Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50873421481
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 18:55:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC7881664;
	Mon,  4 Oct 2021 18:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC7881664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633366539;
	bh=CXreC+qTMulnaF3uX464pRdFVDY+fAdo0RwJnn/b7/s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hbsj/YJ4X/MlF4PshbVoisvlCjoBpw0HZmAJhwpyGiqnXzW878Rut0yHFWJwhlmrr
	 qZFcA+/aHNZd/MwA6XCByMFOr4hjqYipsIKi9dXkZa9My0bEUz42n9cPGMiM4aqA9X
	 RDcgyNZqG60ooHoUh74aIOYMPXYRpijqAovVhF1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FCCAF8010B;
	Mon,  4 Oct 2021 18:54:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FE15F80240; Mon,  4 Oct 2021 18:54:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71D7BF800BA
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 18:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71D7BF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JOGTcGAX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B352560EE2;
 Mon,  4 Oct 2021 16:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633366455;
 bh=CXreC+qTMulnaF3uX464pRdFVDY+fAdo0RwJnn/b7/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JOGTcGAXstbaCTL/bucriic5M1izBKlwxyOYE8w4v7K2YmH1gaoJD5cvy5e1BzeOO
 0m8MNrlXsTC8eemup2qVydcBENFoNAsaK3y4eIHqkA7ctSS/CP8gAKgZSRX3DrwdJI
 Vwv+Ohphut6OET5KCuacvE9wv/lQUFnou+nTZvpsPiixRWtaB9gi0cAPckPzh3oKjn
 9GSWqhGlKf/3JkrVZIX8+ozg+gly3jGOH8DJomHHBsVb7fZpAkNeW31XeZRGcZ4cC4
 54sB7GSNZf6zYbMs+/4DUCbBhLxfD2A+h2I92FNfCBA21hsUg6A4rSOrbWXz9/gIPa
 wdrjtj30jYzLg==
Date: Mon, 4 Oct 2021 17:54:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 00/16] ASoC: Add Rich Graph Card support
Message-ID: <YVsxtBLjkuih3yAD@sirena.org.uk>
References: <87tuitusy4.wl-kuninori.morimoto.gx@renesas.com>
 <b0dfcb22-f805-b751-3c04-ffc435df5f4e@linux.intel.com>
 <87a6jt9r5x.wl-kuninori.morimoto.gx@renesas.com>
 <20211001200137.GC5080@sirena.org.uk>
 <87o88564z7.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/nW2EQeAG7JQZAjL"
Content-Disposition: inline
In-Reply-To: <87o88564z7.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: If it heals good, say it.
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Rob Herring <robh+dt@kernel.org>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
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


--/nW2EQeAG7JQZAjL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 04, 2021 at 08:52:44AM +0900, Kuninori Morimoto wrote:

> If you are OK, I want to use audio-graph-card2 at v4 patch.

Yes, that sounds the best option we've come up with.

--/nW2EQeAG7JQZAjL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFbMbMACgkQJNaLcl1U
h9BZQwf9FPEpcORa5UnhmSEanrFkoTupU23yoEYoiWs8dnM8iNM7Fx+0c2HY7Kwc
vqe3/AeraWgdpAC4MDtdj8oBSfxqyQDetLAgCD52CK0PzI1HL8ZfG7o+lBGmI25j
j9MZHHzZeb4BpHyvOzsM2koBKc+bwwVYnRPQzbrYl5ulEscQOi5HoQEqCbosMHHJ
C4OOh4hs6CyS8vIiY6YO1vDdehDeaDwASlazzyTq6wOsmHa+CHuWMnrbYbQhOmIr
U95nSrL0DksbQLIZDf/b/1z6GvzMq4jF8NSv56hcKSihongYCszYMYCd5+wTw17A
6RqCC2X5AYeZa0b7PJxalCMjV6T4Xg==
=O7PC
-----END PGP SIGNATURE-----

--/nW2EQeAG7JQZAjL--
