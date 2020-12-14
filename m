Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 695D02D9E2C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 18:52:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D499C1793;
	Mon, 14 Dec 2020 18:51:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D499C1793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607968324;
	bh=7c3uSBpWEkrGyLpkCUlDnIX7pZbHL7FF3A2/sYOnzDo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZJw6G13nnDPZ1+cC++KF15BXv4O35Zhsk6Uq4BEKB0mPKdh2u7amREwyDzOxSTck+
	 Yf519KS2+UoPvLHqOE8RtIY02eu4rBQT2tMefPX+sXrMxEvwy4wi7rq6fQ6YSvBJGF
	 GrqF6kHW8hT7ExL//xRq5hznI/2QnGO6nnhiPXgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B473F800ED;
	Mon, 14 Dec 2020 18:50:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B46DF801F7; Mon, 14 Dec 2020 18:50:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC05EF800ED
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 18:50:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC05EF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GX0fbQrY"
Date: Mon, 14 Dec 2020 17:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607968220;
 bh=7c3uSBpWEkrGyLpkCUlDnIX7pZbHL7FF3A2/sYOnzDo=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=GX0fbQrYdnWDEYLpMP3jiWLRtIOOsYgtpKSu6yRM+pJCcIH+FjzS9ask4+GRjrpQm
 vkp46yljFoJQIui6UqV8RfkTeHcu6wzxYgXHKIQ/3o3ZLOYjmPeszYEBKGvBn4RApP
 NYtJ+bibI0AiaE6nRP/4CWo0GBPClDFZBfnn8s2qb0MAi9Ga1tcGSRX9KZyUJbxiWE
 lL6X1hc15h2A37GjepLfSflyzPimNZlF0NjNG7F+HOjeaYSiCDxXsq2dWiBuKndVGO
 rTRaY0eLW7M8UsOiYnZCeCu6AdWVDwVGeNljzNEl9N3ZP9qkoqA3qKCI1pK3YXKPZN
 OX7F6tJJhKANA==
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v4 1/2] Partially revert ASoC: qcom: Fix enabling BCLK
 and LRCLK in LPAIF invalid state
Message-ID: <20201214175009.GD4880@sirena.org.uk>
References: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
 <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
 <20201130124617.GC4756@sirena.org.uk>
 <966993b7-4720-bdd2-cf4d-cf5a7c11a0c1@codeaurora.org>
 <20201201175135.GO5239@sirena.org.uk>
 <89456f01-aa02-7a7d-a47b-bf1f26e66d4c@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Content-Disposition: inline
In-Reply-To: <89456f01-aa02-7a7d-a47b-bf1f26e66d4c@codeaurora.org>
X-Cookie: Everything you know is wrong!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-kernel@vger.kernel.org
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


--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 06:13:22PM +0530, Srinivasa Rao Mandadapu wrote:
> On 12/1/2020 11:21 PM, Mark Brown wrote:

> > > Later from review comments by Srinivas kandagatla, I got to know
> > >=20
> > > about regcache sync APIs, which can be used=A0 to sync cache after re=
sume and
> > >=20
> > > HW registers can be updated with=A0 original values. With that playba=
ck can be
> > > continued.

> > > So is the reason, I am reverting partial changes in the commit b18249=
68221c.

> > I don't understand why a fix for the register cache not being in sync
> > with the hardware doesn't involve syncing the register cache with the
> > hardware.

> I am sorry I couldn't understand your point. Could you please elaborate y=
our
> query?

Your changelog talks about syncing the cache but neither the driver nor
your change actually does that.

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/XpdAACgkQJNaLcl1U
h9D/Zwf/fjn9hyBot5AFRtqGND9G8HLpAtWHKW70cPH+wBsFuqB0CLI8tZbBwh0q
kWZwfm8x8OxC44uZBFactuNZmp1+PgJ6Gj9f7wUuFBAYWUAIMjERH3qmIdBnNKwk
iVor+tLIrpGRfncjfL0tK7Xxd6YPQx0G7pDkxMHbP7sg6SS094m2CtHFo+jPRtec
AKRcvjIy7xw561ot5vqjMz62CTazM87RuqnVJsE81XcST4slkJLD9IUOSWTLDivK
UHNg/3hc3fAUBHwvPC+0t9suBwSMkifi9hJuTGbhPTnPILmRF9GJ0l4+PCqpnrVn
v5oEVRw7ErT3avD1VlAlKlN49wz43Q==
=jFTq
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--
