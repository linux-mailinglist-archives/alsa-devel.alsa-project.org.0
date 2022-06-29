Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9003555FE00
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 12:59:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C9971636;
	Wed, 29 Jun 2022 12:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C9971636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656500360;
	bh=eXMXjPQfilPFIwhMFsvO2FusOcPMUkuU5iKTUzRj1Gs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z7qLUSwTGePimpbBSRpByJloJwPQVejfQejsDcIy2BP4Ygs3HNPC80+zhGhVsjJyG
	 2dNm01oJJLOrxBaA5nPD9n7S2Z+TObQqg90rBai6DEViEugqNYgBTWNegX7ejOfeOs
	 TUT29vy7F2qo3ZHdR+bscFytsko/GwP0mJh2R8ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75B91F80245;
	Wed, 29 Jun 2022 12:58:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73A6FF8020D; Wed, 29 Jun 2022 12:58:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07FFDF80115
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 12:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07FFDF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pC5lR2Xq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B680FB81F56;
 Wed, 29 Jun 2022 10:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17563C341C8;
 Wed, 29 Jun 2022 10:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656500290;
 bh=eXMXjPQfilPFIwhMFsvO2FusOcPMUkuU5iKTUzRj1Gs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pC5lR2Xq8G7+eSWtXv114v1+OI+V22onDAF6LMXnLy5l3VLJfxohL89vQrGR6d18r
 c9iZrVl1vHPW0WB/M/xkn4LIL9bv64Ehpkr2Sp+YhYuWLG54ZOH0CFrAiG9aGHHDqf
 j1OLs7lrRng03znvWjGA7YnrtRC00+SXDALKHiUmphI04hh6ZC3QLIbtK0K4N31euq
 qqmHmjVUnlduGgZ9I/ZRCyd8f1quQOnYHHM0Uw6rv9QF98c59XLY84rKur0zypAvSK
 CZtu6rB1VH6KVSYINoS0xKW1HKNK0o5JvKB2vWV8w6C+KM2Q2B9lOZTYBTiG5P3rGd
 Bozvd8HlW49gA==
Date: Wed, 29 Jun 2022 11:58:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/4] ASoC: codecs: wsa883x: add control, dapm widgets and
 map
Message-ID: <YrwwPbm0sL1RGwjO@sirena.org.uk>
References: <20220629090644.67982-1-srinivas.kandagatla@linaro.org>
 <20220629090644.67982-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gcLfZaC9ZTnbhhTf"
Content-Disposition: inline
In-Reply-To: <20220629090644.67982-4-srinivas.kandagatla@linaro.org>
X-Cookie: Booths for two or more.
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--gcLfZaC9ZTnbhhTf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 29, 2022 at 10:06:43AM +0100, Srinivas Kandagatla wrote:

> +static int wsa_dev_mode_put(struct snd_kcontrol *kcontrol,
> +			    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct wsa883x_priv *wsa883x = snd_soc_component_get_drvdata(component);
> +
> +	if (wsa883x->dev_mode == ucontrol->value.enumerated.item[0])
> +		return 0;
> +
> +	wsa883x->dev_mode = ucontrol->value.enumerated.item[0];
> +
> +	return 0;
> +}

This isn't returning 1 when the value changes so will miss generating
events, please test the driver with mixer-test.

> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		if (wsa883x->dev_mode == RECEIVER) {
> +			snd_soc_component_write_field(component, WSA883X_CDC_PATH_MODE,
> +						      WSA883X_RXD_MODE_MASK,
> +						      WSA883X_RXD_MODE_HIFI);
> +			snd_soc_component_write_field(component, WSA883X_SPKR_PWM_CLK_CTL,
> +						      WSA883X_SPKR_PWM_FREQ_SEL_MASK,
> +						      WSA883X_SPKR_PWM_FREQ_F600KHZ);
> +			snd_soc_component_write_field(component, WSA883X_DRE_CTL_0,
> +						       WSA883X_DRE_PROG_DELAY_MASK, 0x0);
> +		} else if (wsa883x->dev_mode == SPEAKER) {

This looks like it'd be better written as a switch statement.

> +static const struct snd_kcontrol_new wsa883x_snd_controls[] = {
> +	SOC_SINGLE_RANGE_TLV("PA Gain", WSA883X_DRE_CTL_1, 1,
> +			     0x0, 0x1f, 1, pa_gain),

Volume controls should end in Volume, mixer-test should also have caught
this.

--gcLfZaC9ZTnbhhTf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK8MD0ACgkQJNaLcl1U
h9BXjwf+MBbQuEiO10aKYLzGCSekPsbbLZ5nbdrQRJrPPHQBz7GZeCm94ocxTqW6
urpKw5bfp4TZu28szf0jv2G/i6/pBDk+1gCbquKS//eps+rQyse3GmQ5Y/lV5lUT
8EumngMnlYMHMrBNK2iHDoYNAtrT7dYnoy3EWuhK8nR8End9AaJtTeBBztRWYU8T
SLvvPyzwBJd0gSSUzxnQG1IIHqfwLuDO/10fu2Y2Cv9DXhBAlNMivycxdy7UvmP0
aiofhOWakZx8fBM7LwQlxZVw0YB5UQHUrMMOWn4injxV6Ko0Xgoafios15wPpAr9
6JJlYCnoKRcGsjs4OAUYgwDMqRXuRg==
=91P7
-----END PGP SIGNATURE-----

--gcLfZaC9ZTnbhhTf--
