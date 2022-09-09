Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2D55B3E20
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 19:46:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17A7516A5;
	Fri,  9 Sep 2022 19:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17A7516A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662745599;
	bh=KdPZ5U4EtJZbXVT6+9r/auhCgT6zhp52ldzOwpEGufI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KmJ81pV4HwVKU/rMPN0Yx5D9X44+cgvzkN4oJA2khHaDju27PLl9DSIcZL7iDkDwi
	 AbhH6HvKnSgtjCnXraO9Bs2eNrAKrnjPMNaMBkGiacftYEK4yazi2Rpo6uKLj84wXJ
	 zCvVe8ZXGxDsaww8aFKFAa5q1EvuayXY/ibiPby0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56F34F8032B;
	Fri,  9 Sep 2022 19:45:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2A33F8023A; Fri,  9 Sep 2022 19:45:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A986F80105
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 19:45:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A986F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lE0Q59pe"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 22AA2B8248D;
 Fri,  9 Sep 2022 17:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2482DC433D6;
 Fri,  9 Sep 2022 17:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662745530;
 bh=KdPZ5U4EtJZbXVT6+9r/auhCgT6zhp52ldzOwpEGufI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lE0Q59peidqpfqCr5rwID2so6f9iQIwghhiR8I8idiD/eC/uM3t4ssp4jnIg41eqa
 +PUbTkEsLCddgx+9zCfZA6JDlXWhn56ZWSHXX9K/7W2GilhenR4C6ZJ7KucuSyztqE
 STW+tdexhxx8rkaBLa+tUr4pxUZZGsQuK5bdLUBYEOKjvmLlyVJcv4uJh69TkHz+7i
 GTcS4D/UH1dCjUvVzNNUhrtJAfa2Jvpk5KFDym3K84U6xui9tZHLjJJqWfRWpP9ggV
 w9tM2d+HCAoBgcYAdiBGvy9JT4d6H2z2FfOEKtPli7u33GR1giiagl2u7CDuQMiDyu
 F4FXQwQqO3D9Q==
Date: Fri, 9 Sep 2022 18:45:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Astrid Rost <astrid.rost@axis.com>
Subject: Re: [PATCH] ASoC: ts3a227e: allow enabling the jack detect in driver
Message-ID: <Yxt7tfm6MRMaDthO@sirena.org.uk>
References: <20220909093001.13110-1-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iaEPXYJpK/+YHHRT"
Content-Disposition: inline
In-Reply-To: <20220909093001.13110-1-astrid.rost@axis.com>
X-Cookie: FORTH IF HONK THEN
Cc: alsa-devel-mejlinglistan <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, kernel@axis.com
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


--iaEPXYJpK/+YHHRT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 09, 2022 at 11:30:01AM +0200, Astrid Rost wrote:

> ti,jack-detect enables the jack detection input device

New properties need to be documented, I'm happy for that to be in the
existing document though obviously a conversion to YAML would be very
much appreciated.  However...

> +	if (enable) {
> +		/* Enable Headset and 4 Buttons Jack detection */
> +		ts3a227e->jack = devm_kzalloc(component->dev,
> +				sizeof(struct snd_soc_jack), GFP_KERNEL);
> +
> +		ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
> +					    SND_JACK_HEADSET |
> +					    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +					    SND_JACK_BTN_2 | SND_JACK_BTN_3,
> +					    ts3a227e->jack,
> +					    ts3a227e_jack_pins,
> +					    ARRAY_SIZE(ts3a227e_jack_pins));
> +		if (ret)
> +			return ret;
> +
> +		ret = ts3a227e_enable_jack_detect(component, ts3a227e->jack);
> +	}

...this is something that should be done in the machine driver rather
than the CODEC, the way the device is wired up in an individual system
may be surprising or the system may have some more specific labelling
that can be usefully applied so this is all deferred to the card.

It would sense to convert ts3a277e_enable_jack_detect() to be a
component set_jack() operation, that'd enable it to be used more easily
with generic cards (though I see that it's not yet wired up for
audio-graph-card unfortunately).

--iaEPXYJpK/+YHHRT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMbe7QACgkQJNaLcl1U
h9C7nAf/QdfOK4zJRdJvo2aFm0+Re0RQ56ntnchc2zx6RmSDPMQ6JKO3yHNVSQp0
hll5NvMnaDhaCOj0NaoXKq1hk8lAW5nsHINJZAU7M7QjrhJ2c6yskIDtlyPJHVOI
1sT8YNwlwTvKDlPWvnmz8rqcHoXx2IN4m1e/uDtKWu3edI50pKNuz06YB0dJIzt9
NXpaRlrCLQVUtE9Rb6iKW/pH6fRIe3l/nCd6PhA6GCPtL4TKglTOWkaQkB0p0kXP
hnGfThWfAf8SVe19JNwg2X2IsNdDe7bJ3Y9AqWoEH6fLBxmzqiBvcjsfWXI2mKQw
bY38NzYd3Ls9HTWRaCpTMmJ/Iy5PxQ==
=L8qU
-----END PGP SIGNATURE-----

--iaEPXYJpK/+YHHRT--
