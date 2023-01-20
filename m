Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCF9675425
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 13:08:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C54631CA;
	Fri, 20 Jan 2023 13:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C54631CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674216518;
	bh=59rSi/VRPu6xeT5pr3e5nabXo3izJ7s9J6YeNyStd2s=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AWJOdmtAk6YDc3CurBaiGqyv0OrsKlTTqH323VpoKJ/i/YAaXJ92ts9Hz3zF7cVtk
	 N9eKMmbzl9bPbzbn2YrFHWbEwM+m4cddJqF1ygoEBphYty37aFGD3vTiAfV8s4jlPJ
	 mB8Pmy8z2ZbB1i8sQj1qz9KRiPg7eZVjaRE0zWCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E479F80246;
	Fri, 20 Jan 2023 13:07:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29BD2F8026D; Fri, 20 Jan 2023 13:07:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71116F800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 13:07:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71116F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tPAmeqmt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 584E961F3F;
 Fri, 20 Jan 2023 12:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE9DC433EF;
 Fri, 20 Jan 2023 12:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674216460;
 bh=59rSi/VRPu6xeT5pr3e5nabXo3izJ7s9J6YeNyStd2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tPAmeqmt2csu9VnCd1sjLPw+uhI+ttnEjDiNSoQEKBWdSiJncvZbUAdbXrm6FmLWV
 u3a4B59YF7EW03Gn7+KA6UrjUM7am35gpX6LndaIfZTC9PHiKbJ0JMBpeGg4l4e3Lc
 KTbf5qLgoZx9ETajRwnFWTCcCkZmvn+GbEDVjndQTVfwqEdrEGQpnufB6cAyCoTc7v
 gDfi2aHSU3lJP2o1Qp/0Opln/LsGkbRhdbp3b/xBVv4mU2Nmyz+S6XJyuEfElOJDt5
 y0F+/AFa/z9MjcZ97912liNTqh+XwHdOrIHxMe9OQ1jIEUU3r5xX/Is8ji8EhdjRvf
 4KSDxnrLqrxsA==
Date: Fri, 20 Jan 2023 12:07:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/5] ASoC: samsung: remove DMA filter function and data
Message-ID: <Y8qECf4CgsNkLNho@sirena.org.uk>
References: <20230118161110.521504-1-arnd@kernel.org>
 <Y8l21Kb42l2ZcIC+@sirena.org.uk>
 <99519eb0-399d-4972-ae09-955a34830b55@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hWy1TWofl5oPHiyo"
Content-Disposition: inline
In-Reply-To: <99519eb0-399d-4972-ae09-955a34830b55@app.fastmail.com>
X-Cookie: Serving suggestion.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Arnd Bergmann <arnd@kernel.org>, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--hWy1TWofl5oPHiyo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 20, 2023 at 10:05:59AM +0100, Arnd Bergmann wrote:

> I see, this patch still depends on the s3c24xx removal, which
> is in soc/for-next and I used for testing. I see a similar
> problem with the MMP platform in patch 2/5. The series here
> is mostly older patches I did a while ago and rebased on top
> of the boardfile removal, but it breaks when it gets applied
> first.

> Unless there is anything in here that you really want to apply
> for 6.3, lets drop all five for now, and I'll resend it
> after the dust has settled on the boardfile removal.

I'd left the ux500 stuff running through my testing, no
particular urgency just it saves rereviewing anything.  Assuming
it's fine (seems so thus far) I'll push it out.

--hWy1TWofl5oPHiyo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPKhAgACgkQJNaLcl1U
h9BUrAf/UMkGgrt0kpEybfiAhWigEbFnU1JOMdv5V+73qzx1D4vcLNB0qcRCKRsJ
avfFIgqgKKlMewmj0Ndy3JtNpza7jn7Rkfewtu+V51hTVDasZOBfZIuxsloY+gZK
aR+x0tuZIZcbDavJtchai3QD6PxZIZWP4efyNvlZMd4dokFwX4lom4rMycVsF4Mp
nS3TSfg3Zf6++dW59iduEZMG4XESx6TtS86AjIRqc6pBt1Y3YSEneV4klfQX2BzO
tOHAO9pWPxSq3DElsgnRPmfkixguKapT3+lvaseqZZw9V1AZLIbNBXjq2ujiLEYK
jBNJdGuNqVv3dfSknaSd6eB/APHYkw==
=s2qN
-----END PGP SIGNATURE-----

--hWy1TWofl5oPHiyo--
