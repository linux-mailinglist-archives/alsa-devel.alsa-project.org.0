Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 186BF1981E4
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 19:07:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 964E51660;
	Mon, 30 Mar 2020 19:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 964E51660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585588036;
	bh=Gz9BYkeTKsuYchamnc/KsQHb6gaEDzIkiH2pMByPde8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YeOoaAuA2H7yUYtqGArGCh2Ll1I7NBuexb6PuwBz1HFyU0MzvAQduaLEl3xjEYcrj
	 /i8PV6uhihIETpQAvYJxYAiP3jp/SXRCcR11U+05CS/WtR+2S3hWvM6sj/GcNMDAeP
	 KD5jEIXY5udJat2IwrNl3U/vu0LF3ctS5kaI9lKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1A72F800EB;
	Mon, 30 Mar 2020 19:05:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD20BF80148; Mon, 30 Mar 2020 19:05:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6EC73F800EB
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 19:05:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EC73F800EB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15D77101E;
 Mon, 30 Mar 2020 10:05:27 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 890F33F68F;
 Mon, 30 Mar 2020 10:05:26 -0700 (PDT)
Date: Mon, 30 Mar 2020 18:05:25 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?7J206rK97YOd?= <gt82.lee@samsung.com>
Subject: Re: [PATCH 1/3] ASoC: dapm: connect virtual mux with default value
Message-ID: <20200330170525.GA51888@sirena.org.uk>
References: <CGME20200330073548epcas2p3045be9d3c8b76115c76ce27679840b6f@epcas2p3.samsung.com>
 <000e01d60665$d48444b0$7d8cce10$@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <000e01d60665$d48444b0$7d8cce10$@samsung.com>
X-Cookie: You will be awarded some great honor.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com
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


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2020 at 04:35:47PM +0900, =EC=9D=B4=EA=B2=BD=ED=83=9D wrote:

> +++ b/sound/soc/soc-dapm.c
> @@ -802,7 +802,16 @@ static void dapm_set_mixer_path_status(struct
> snd_soc_dapm_path *p, int i,

It looks like your client corrupted this by at least word wrapping it,
can you resend please?

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6CJtQACgkQJNaLcl1U
h9Cwswf/aXPyQy4DMNkV+Qec1DGAcY7NNoI+Ifp9G0IOPAw4NNhCzZ7+TKA2N8Pt
C/ubE7fwONCGV2DPm/K+gNEBmc5DDacCLPJV0KNBQWdsgXnW96gDEut+5qWBk741
8urCn7VTy0fLldDr4Mc+yZjaolNZEmmlDQbhTxISm0gO5W0Ex9eatVj7Hau72bkL
hEYVtcQ5iKIQjG2CmvSGdzNpUBTNcz5IWip38DCcK0Brqn0V1Awh4ArCsPI1EsUQ
dZsrq1TB3KB5R6tJ4VmWdikG64Tk755L5+Vz9PMND39brPdq5gIQGx6SFWlV0DRN
oVCU1hfZBX3mQQQ4gTzDISduCPmpOg==
=r/9I
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
