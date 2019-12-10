Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C0B118943
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:09:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F8FA1655;
	Tue, 10 Dec 2019 14:09:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F8FA1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575983395;
	bh=6TDzPtrXaxbyH3kOcVwnGdV8WVEoWdvoGhwQY5pibw0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bRm3LpHVhP6SQ4GDwsrGFCYWEQMtXBEpKKeqQdBE6twynA+2y4+pJkNitH980L5Wv
	 2EX1Mhla1sWyiA3FyxV+HJktmmrBWPccrtuQl3kWIUV66RkZjt83I3pTJTjy+Ny9Vp
	 SlDta1H8/NJ9fHpIxPQYeQ4BJMhDaEVsOlve4YAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CA3DF80248;
	Tue, 10 Dec 2019 14:08:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5AEAF8020C; Tue, 10 Dec 2019 14:08:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 148E9F800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:08:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 148E9F800F3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68BFA328;
 Tue, 10 Dec 2019 05:08:03 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D28A73F52E;
 Tue, 10 Dec 2019 05:08:02 -0800 (PST)
Date: Tue, 10 Dec 2019 13:08:01 +0000
From: Mark Brown <broonie@kernel.org>
To: "kernelci.org bot" <bot@kernelci.org>
Message-ID: <20191210130801.GF6110@sirena.org.uk>
References: <5def94e7.1c69fb81.2751f.190a@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <5def94e7.1c69fb81.2751f.190a@mx.google.com>
X-Cookie: We have ears, earther...FOUR OF THEM!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Brian Austin <brian.austin@cirrus.com>,
 Olivier Moysan <olivier.moysan@st.com>, tomeu.vizoso@collabora.com,
 Liam Girdwood <lgirdwood@gmail.com>, khilman@baylibre.com,
 mgalka@collabora.com, Takashi Iwai <tiwai@suse.com>,
 Paul Handrigan <Paul.Handrigan@cirrus.com>, guillaume.tucker@collabora.com,
 enric.balletbo@collabora.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] broonie-sound/for-next bisection: boot on
	rk3399-gru-kevin
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
Content-Type: multipart/mixed; boundary="===============6318893684301404653=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6318893684301404653==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QNDPHrPUIc00TOLW"
Content-Disposition: inline


--QNDPHrPUIc00TOLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 04:51:51AM -0800, kernelci.org bot wrote:
>     ASoC: cs42l51: add dac mux widget in codec routes
>    =20
>     Add "DAC mux" DAPM widget in CS42l51 audio codec routes,
>     to support DAC mux control and to remove error trace
>     "DAC Mux has no paths" at widget creation.
>     Note: ADC path of DAC mux is not routed in this patch.

This doesn't seem right, as far as I can see this device is not present
on that board (it uses some Realtek and Maxim devices AFAICT).  Is it
some sort of timing thing?

--QNDPHrPUIc00TOLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3vmLAACgkQJNaLcl1U
h9DAzwf/Vl72koOz78QabTLK3qKjJ8J8uxgv87Zxb3NykzHxogKhBYdzFKfA0EpV
xqY1oCamb7cgAnfGFc8t2WAGC6jhqCZZxmHUQCh74Iy1rh7vJxg2NhuPhAzn6TZX
S6iprOJsY2QAFVpLJfHmC/Yl55EGihn22H/CO+PaspbCuyGPc2TwwTxnyLQeqFCx
r1PojQwIdk3VJSTZf4GOfd8ufsPM7K4psVJbtoKCQ3xXkre1j2CszTPv4jso1tGw
W9YR5uLNxS3rjueAJI56FBNYV48WK3rq9hVgyx9Z5Tc9cynx93aO5cu9n5Midy7W
lmaqK3rj9MbjHWjhIHmbteP634uwHA==
=okLz
-----END PGP SIGNATURE-----

--QNDPHrPUIc00TOLW--

--===============6318893684301404653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6318893684301404653==--
