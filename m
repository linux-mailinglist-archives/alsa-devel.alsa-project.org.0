Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6335767543E
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 13:13:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A372B31E2;
	Fri, 20 Jan 2023 13:12:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A372B31E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674216829;
	bh=bYTCpxpMUaj0u9NVrjzlxJiwlSH7GhZL8wVTYhvi1kk=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=E23WLX4NOhvNRhtfEvmCJQZaQn6CrZXEEFl/eRitmWWlnJYQp0mIC75KYBE34CUyT
	 m7/HFUCf9x9Uzvg03zZ9jF00jed5Nh8ChDXCQhZguGZVyzr+1kVuiK3hTjH7BB1p8z
	 bssmJqQkKrPCmPPlsGLPBgklZx3PD0jmG4jVNac0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69F39F8026D;
	Fri, 20 Jan 2023 13:12:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD690F800F0; Fri, 20 Jan 2023 13:12:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 471DEF800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 13:12:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 471DEF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qoXeMA5I
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4E3BFB82714;
 Fri, 20 Jan 2023 12:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983BCC433EF;
 Fri, 20 Jan 2023 12:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674216767;
 bh=bYTCpxpMUaj0u9NVrjzlxJiwlSH7GhZL8wVTYhvi1kk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qoXeMA5IEcu8/YWtvxIdMEIAJOVuAuu0rHb3KldXH7yvXPpMMaipN0ptWsqquCLLr
 YGpaGwaJkGMl75bP9I0beehAiUZEgbK9RI6zxQnT/xueeKtx7wNbYnc7tRY3496dYc
 c7czRz4IT1hCuVGnsxUyTrnrmJVVs+18GGWLVZCDpG59qSXolyCdAP7YIdSHSqBx5/
 UeexsOh/Fq6NppIEkNK24lneWzF3Dfby1XsJyRYL5Kc5TusGA0mDLgghVpG+WQ7bXN
 oCeL6JDyMeZF8q0zsiEz1X5i+sAE6drGy8w+fNtsWsAEf2i1BNlmEkHRL5MzczBuKk
 V8FBgyAgoqqsw==
Date: Fri, 20 Jan 2023 12:12:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 2/3] ASoC: codecs: Add support for the Renesas
 IDT821034 codec
Message-ID: <Y8qFPBEYJ1gH/Ycv@sirena.org.uk>
References: <20230120095036.514639-1-herve.codina@bootlin.com>
 <20230120095036.514639-3-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wlRMvD60qIyTikCQ"
Content-Disposition: inline
In-Reply-To: <20230120095036.514639-3-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--wlRMvD60qIyTikCQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 20, 2023 at 10:50:35AM +0100, Herve Codina wrote:

> +static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct idt821034 *idt821034 = snd_soc_component_get_drvdata(component);
> +	struct idt821034_amp *amp;

> +
> +	amp->gain = val;
> +	ret = 0;
> +end:
> +	mutex_unlock(&idt821034->mutex);
> +	return ret;

_put() methods should return 1 if the value changed to generate
events - if you use the mixer-test selftest it'll spot this and
other issues for you.

Otherwise this looks fine.

--wlRMvD60qIyTikCQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPKhTsACgkQJNaLcl1U
h9AQ4Af8De8E5PJEpMZ8aXgoqJ5oNtOF6fOh2uOEQ0Sl+8/7usPM9y8GqpAlyIxy
09ITOezWYsh9XvhCuHefFVr/Tr7KVbz34OoXwo1XNmzmkWXcezr6PrS1VAb1DaGT
qdOP6wEG+ei0PqHg6CX+oaRLnsqSVi1ojAbbN9GHAqNDRlXAzJfal0hIZuCUw9cp
JA9r1B+7/G83PP5UWFXYOydws1OqGg9fsny9D1FfEt1uuVWu/uXfGMAYCg0XeqOD
0y0yD4PaCUsv4g6Qp+eevMbsTHERfGb2YzjsZf73kE2YacIY4wATPBrt8SnFSYew
hVXpJFtOdhIyKL+8p1tHnJ0AtZDDYw==
=nMiM
-----END PGP SIGNATURE-----

--wlRMvD60qIyTikCQ--
