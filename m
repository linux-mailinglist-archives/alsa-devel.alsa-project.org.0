Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 213D1611A65
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 20:45:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0118857;
	Fri, 28 Oct 2022 20:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0118857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666982717;
	bh=B3JwPgDF3f7ACG62Nwjw0J32bbbGD43RnJnEc3pRdBw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hv9h2eAKWhg57Y6EcVbL1LrP949araTu33Ah7QhirwjNWuDZ4eEsa5wHZUx5usTQ1
	 Nhw+HKcisfPxnvMthK2x7SGCZkA9Fc8QzJ7DWaNI2ggSqWhm4S6deqkQX/3ILmBZk9
	 w5DtGHM2rOLT7tTuyvlixE17oTtF0x+tpbZmIQsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BAA8F804BD;
	Fri, 28 Oct 2022 20:44:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E1B9F8025A; Fri, 28 Oct 2022 20:44:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 226E2F8016A
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 20:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 226E2F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H7TzOea8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1BCA7B82BAD;
 Fri, 28 Oct 2022 18:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA66C433C1;
 Fri, 28 Oct 2022 18:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666982656;
 bh=B3JwPgDF3f7ACG62Nwjw0J32bbbGD43RnJnEc3pRdBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H7TzOea8j+chWb+NPhAXFXMuJIUbfoQGA5xIXvtR9de/3ZjdyeuVcSWkS6tDwYYY3
 qRupdmLzuYflNbmmJPaOI21mmOkrem0z3Bw03MwWu+ZAFoYs0wluwuziFAfxw1m0pd
 HD4ZanIHx5uA6xKdRrs3S2FKADSBE9aPvYVW3XGJ/qQJfNVraEZ0ODTClQkLxwkvQW
 uszkcj86aDAjZgZdiqQY+MtT9GFSG26nl7eu/w6+0dc+sphAOsA05Z666nkZNzVLNd
 xCP/5Moti05BLYAjVnaG5JYKbRQpc4Gsu5GRFZkMEFwHLfHx/+AGfS9eoc/r3KqnpL
 ZdANUAnkZiTpQ==
Date: Fri, 28 Oct 2022 19:44:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
Message-ID: <Y1wi+g9yVR+++iIg@sirena.org.uk>
References: <20221028172215.1471235-1-ajye_huang@compal.corp-partner.google.com>
 <20221028172215.1471235-2-ajye_huang@compal.corp-partner.google.com>
 <628ac98c-0755-e6f6-e010-f1e772c4b71a@linaro.org>
 <CALprXBY8FUc_w=JO3bp9m1e=1d5Fcvrou_En1JG8Hx0BYuETKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="I1UEIiYQUOnwfuPx"
Content-Disposition: inline
In-Reply-To: <CALprXBY8FUc_w=JO3bp9m1e=1d5Fcvrou_En1JG8Hx0BYuETKw@mail.gmail.com>
X-Cookie: The time is right to make new friends.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu . li" <chunxu.li@mediatek.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


--I1UEIiYQUOnwfuPx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 29, 2022 at 02:26:30AM +0800, Ajye Huang wrote:
> On Sat, Oct 29, 2022 at 1:58 AM Krzysztof Kozlowski

> > Switching how? Enabling? What is the meaning of each GPIO pin value?

> I think I should add more like an example,
>   description: dmic-gpios optional prop for switching between two DMICs.
>                     Ex, the GPIO can control a MUX HW component to
>                     select dmic clk and data form a Front or Rear dmic.

> Do you agree with that or have other suggestions? If do, I will send
> the v3 patch for you to check, thanks

There was my thing about putting the names in DT too.

--I1UEIiYQUOnwfuPx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNcIvkACgkQJNaLcl1U
h9Cpkgf/fVls3aPRMwD1mG2Hu2WQAUaJSm7fMJ++/Hu2yFAAiM+ywsOOetAk/VoZ
A5aHmyM3TF/3vuWQ+WPMUsbB/EHGCpM6hAyc277lPmd16RIza/jFt9jah3yg0Zfq
i5iEny8ZHHp0ADd0i9JCmKd9I2AFxcALnq8xKWWCZkJ9YNm/BkkXegfxx8mBa4DM
f+cGJEHyVaoHCmB1qb4okE4ZK/JUEcrJmTaC7YmggqSwS5T7bzxjy2WmCUMKakst
4cqXghPz6QglCvL4VEuFDJ4AMCKXhzDQJEJer17YeYZYnGE7Aw0w0ovTyTueQdKQ
rOPijK+3ijD8mH2K/+WvelcMadIzmQ==
=fA2V
-----END PGP SIGNATURE-----

--I1UEIiYQUOnwfuPx--
