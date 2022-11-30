Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CC463E07E
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 20:13:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E346816D1;
	Wed, 30 Nov 2022 20:12:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E346816D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669835610;
	bh=7/PmRXrq9zlqvQApzLYyYr2iRBg23UOELSQ0LVfNJ8k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CJbB2sfdibrBpbd+zrrrtXKkAgZHpV1b8g8U/U/9h7wk/GC4zNNLYb8IEfyZmA2Bg
	 u0BAIZo1Iv+RPhDgX6vQ8DFpBGcd36lSjJonCQ/0t0jiRzEa5QAakV/DcgHe+Yd+4X
	 pBeCuuTGTHNDUsxOuPxcXqbTiT+sg4zF1KqbnDkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DFFAF800B6;
	Wed, 30 Nov 2022 20:12:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19094F8023A; Wed, 30 Nov 2022 20:12:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A65FAF800B6
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 20:12:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A65FAF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uxG6GHRb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B16F61D72;
 Wed, 30 Nov 2022 19:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A70C433D6;
 Wed, 30 Nov 2022 19:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669835548;
 bh=7/PmRXrq9zlqvQApzLYyYr2iRBg23UOELSQ0LVfNJ8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uxG6GHRbl0BoIBYr+GpnFqa7iZ5d6WuBRII+WEgu6cHbjQH6CSNuezpNqqgcU+k7S
 9+wygEZGbaspf2ZoQH2YSbLLRWF6d1p/1TBc57LCgkWJUg84YCpeGPB/leJ6F2Wxn8
 yiFJdVHqzzlgOTiquZGiRQjINWai/GDjDVsN+7mc3O3+nos2b7BSgzSI9gsLtuOseR
 OieYfp8JlW4H7dgmTcJMh39cxVm1GhAa4Y5RMYQTB2q9M0rGSMCEl6kG89pPzy8Aen
 V5h6RG26HF3n3IzYL9taskFWUKg7XxCg5MLNKnJYjOdg3M33n7GNrq881GJukMUHdK
 zCQcSDqHKO+uw==
Date: Wed, 30 Nov 2022 19:12:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add maybe_unused tag for
 system PM ops
Message-ID: <Y4erFaRfGXbSJLMm@sirena.org.uk>
References: <1669726428-3140-1-git-send-email-quic_srivasam@quicinc.com>
 <Y4eN4utrDnEnKu/8@google.com> <Y4eP2yFKsmxzyX/4@sirena.org.uk>
 <Y4eU7ra4w3Fm+wLM@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s1pYjTMRz+F+fT4W"
Content-Disposition: inline
In-Reply-To: <Y4eU7ra4w3Fm+wLM@google.com>
X-Cookie: Jesus is my POSTMASTER GENERAL ...
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, quic_plai@quicinc.com,
 swboyd@chromium.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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


--s1pYjTMRz+F+fT4W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2022 at 05:37:50PM +0000, Matthias Kaehlcke wrote:

> The tag of the applied patch is incorrect too, which is actually what I n=
oticed:
>=20
> Fixes: a3a96e93cc88 ("ASoC: qcom: lpass-sc7280: Add system suspend/resume=
 PM ops")
>=20
> This patch is for sc7180, so it should be:
>=20
> Fixes: 2d68148f8f85 ("ASoC: qcom: lpass-sc7180: Add system suspend/resume=
 PM ops")

Oh, well.  It's just a fixes tag for something that has only been in
-next, it doesn't really matter that much.

--s1pYjTMRz+F+fT4W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOHqxQACgkQJNaLcl1U
h9DOSAf7BTiWGZhA0UbkwiQEXLZETjGS0qh2Tl7tkdQlpncLUU0hNi0Jzd6Ql4eH
uXUNDqRlRqKmsVM0VzSCESQNEAXIau9rYdpe1dR+cW2+a9jUBUfCcV/tYaoIvOuG
rr4vwWg4vFEleOqXCHGUqMyoONyefdj8ZB8PaiZ+98WU/Syz/GIAvRxWErCOWI2s
xErZ8rzIq3w+AEtHw41neAl5kyPpkwceuxI+h7Gv3cjC0QMCLD1QfQJJLnQx/hvW
wIRHWTXFpyZoO2u4oZkyq4KepyuACdhDfet4UeEp3AB/FFV92SABhsg4Lgo3upbv
SxI9wVuIDTxfFiXnNMg8+DIJqkbvhw==
=H3n3
-----END PGP SIGNATURE-----

--s1pYjTMRz+F+fT4W--
