Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE75172B0
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 09:38:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52EE01862;
	Wed,  8 May 2019 09:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52EE01862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557301105;
	bh=M1NttvA6d5BlKPNKwvly4eNsRPL9YsA2WW9AsM1SFhM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NUR0BHFjUehjgLqZ/7G3pTAzEpOGPLDF0stHslpkotjXmhNfpb2uuOznVuj+3N+lN
	 V0hxgP96yULYwi44nf17bCtyBjK6Tzc7mzOnihYe7BGpCfSN3fW2kXf3SSbr2883dX
	 VCMwugHagjjcIcHeJkMDcw9ZQVNm+xb5dFOGZfrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD3E8F896FD;
	Wed,  8 May 2019 09:36:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 828EAF896F0; Wed,  8 May 2019 09:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57B19F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 09:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57B19F8075E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qJ9VCp/5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZiWcasPm1r2b4sKHBSWaozu7gf20hyaggoSjXvuAE+U=; b=qJ9VCp/5kZD21xj4QImVIAvXv
 lpZLQVpEmQJAaamUzpK+VydJ4Hvq5xBaXO1rEb2DImuedAjlOtI+kExyKOJe+IJcQVuhx80hbOx26
 WqrG8lv/pETTIfxydUIqZFXZHG49UxHsyJa4iEPDLMaq996kjpiS5bW/shQ6lwHG1YiXo=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOH7t-0007Kv-2E; Wed, 08 May 2019 07:36:32 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 1C2D7440035; Wed,  8 May 2019 08:36:23 +0100 (BST)
Date: Wed, 8 May 2019 16:36:23 +0900
From: Mark Brown <broonie@kernel.org>
To: Fletcher Woodruff <fletcherw@chromium.org>
Message-ID: <20190508073623.GT14916@sirena.org.uk>
References: <20190507220115.90395-1-fletcherw@chromium.org>
 <20190507220115.90395-2-fletcherw@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20190507220115.90395-2-fletcherw@chromium.org>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [PATCH v5 1/3] ASoC: rt5677: allow multiple
	interrupt sources
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
Content-Type: multipart/mixed; boundary="===============7106852758198141212=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7106852758198141212==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lfL9iWt62hyVv4Jn"
Content-Disposition: inline


--lfL9iWt62hyVv4Jn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2019 at 04:01:13PM -0600, Fletcher Woodruff wrote:

> This patch does not add polarity flipping support within regmap-irq
> because there is extra work that must be done within the irq handler
> to support hotword detection. On the Chromebook Pixel, the firmware will
> disconnect GPIO1 from the jack detection irq when a hotword is detected
> and trigger the interrupt handler. Inside the handler, we will need to
> detect this, report the hotword event, and re-connect GPIO1 to the jack
> detection irq.

Please have a conversation with your firmware team about the concept of
abstraction - this is clearly a problematic thing to do as it's causing
the state of the system to change for devices that are mostly managed
=66rom the operating system.  It's not clear to me that this shouldn't be
split off somehow so that it doesn't impact other systems using this
hardware.

I'm actually not entirely clear what the code that does the "reconnect
GPIO1 to the jack detection IRQ" bit is, I couldn't find anything
outside of the initial probe.

> -	if (rt5677->irq_data) {
> -		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1, 0x8000,
> -			0x8000);
> -		regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC, 0x0018,
> -			0x0008);
> -
> -		if (rt5677->pdata.jd1_gpio)
> -			regmap_update_bits(rt5677->regmap, RT5677_JD_CTRL1,
> -				RT5677_SEL_GPIO_JD1_MASK,
> -				rt5677->pdata.jd1_gpio <<
> -				RT5677_SEL_GPIO_JD1_SFT);
> -
> -		if (rt5677->pdata.jd2_gpio)
> -			regmap_update_bits(rt5677->regmap, RT5677_JD_CTRL1,
> -				RT5677_SEL_GPIO_JD2_MASK,
> -				rt5677->pdata.jd2_gpio <<
> -				RT5677_SEL_GPIO_JD2_SFT);
> -
> -		if (rt5677->pdata.jd3_gpio)
> -			regmap_update_bits(rt5677->regmap, RT5677_JD_CTRL1,
> -				RT5677_SEL_GPIO_JD3_MASK,
> -				rt5677->pdata.jd3_gpio <<
> -				RT5677_SEL_GPIO_JD3_SFT);
> -	}
> -

There's a lot of refactoring in the patch here which makes it very hard
to follow what the actual change is.

> +		}
> +	}
> +exit:
> +	mutex_unlock(&rt5677->irq_lock);
> +	return IRQ_HANDLED;
> +}

We uncondtionally report the interrupt as handled?

> +static void rt5677_irq_work(struct work_struct *work)
>  {
> -	int ret;
> -	struct rt5677_priv *rt5677 =3D i2c_get_clientdata(i2c);
> +	struct rt5677_priv *rt5677 =3D
> +		container_of(work, struct rt5677_priv, irq_work.work);
> =20
> -	if (!rt5677->pdata.jd1_gpio &&
> -		!rt5677->pdata.jd2_gpio &&
> -		!rt5677->pdata.jd3_gpio)
> -		return 0;
> +	rt5677_irq(0, rt5677);
> +}

I couldn't find anything that schedules this.  What is it doing, why is
it here (and this is an example of a really complex to review bit of the
change due to refactoring BTW, the diff is really unhelpful)?

> +static void rt5677_irq_bus_sync_unlock(struct irq_data *data)
> +{
> +	struct rt5677_priv *rt5677 =3D irq_data_get_irq_chip_data(data);
> +
> +	regmap_update_bits(rt5677->regmap, RT5677_IRQ_CTRL1,
> +			RT5677_EN_IRQ_GPIO_JD1 | RT5677_EN_IRQ_GPIO_JD2 |
> +			RT5677_EN_IRQ_GPIO_JD3, rt5677->irq_en);
> +	mutex_unlock(&rt5677->irq_lock);
> +}

Is this the bit that reenables the interrupt?  Isn't this just a quirk
to rewrite the masks frequently, that'd seem easier than doing so much
open coding?

> +	/* Select and enable jack detection sources per platform data */
> +	if (rt5677->pdata.jd1_gpio) {
> +		jd_mask	|=3D RT5677_SEL_GPIO_JD1_MASK;
> +		jd_val	|=3D rt5677->pdata.jd1_gpio << RT5677_SEL_GPIO_JD1_SFT;
> +	}
> +	if (rt5677->pdata.jd2_gpio) {
> +		jd_mask	|=3D RT5677_SEL_GPIO_JD2_MASK;
> +		jd_val	|=3D rt5677->pdata.jd2_gpio << RT5677_SEL_GPIO_JD2_SFT;
> +	}
> +	if (rt5677->pdata.jd3_gpio) {
> +		jd_mask	|=3D RT5677_SEL_GPIO_JD3_MASK;
> +		jd_val	|=3D rt5677->pdata.jd3_gpio << RT5677_SEL_GPIO_JD3_SFT;
> +	}
> +	regmap_update_bits(rt5677->regmap, RT5677_JD_CTRL1, jd_mask, jd_val);
> +
> +	/* Set GPIO1 pin to be IRQ output */
> +	regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
> +			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);

Are other GPIO outputs supported by the chip?  How does this interact
with the jdN_gpio settings above?

--lfL9iWt62hyVv4Jn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzShvYACgkQJNaLcl1U
h9Akegf9EmRVQ8cOM0I85C0Md26UevTf1xeVygJTSaK3D7zYEY7AZikGu56Bifnb
3hSo0k2ReKPTd3OvIvBB7EEO4qtxpTtC6sSgehRJCyMTRcZwVjHFVyyIoVANr7Df
sEu5tpreRSUaOMbpXCxervtk0o0TrwPVZGcrSAGPrElU5ZqF4A+9okT2w1okMF/f
jfNc8amvzxrPb7PNMs3Wa514eKoFftmaKWKD5mLQA6/GDEhAK9O8eWaaIItmC7Qv
iXnJ8msdv52xvDaaQ0eyMcJPLy/HwVMtswVuIef1FP8SpboBC/2ZP6kpStf4oeph
hbbnKPTlo3ir7D3JnFqqYWoeZcvVnQ==
=QWkD
-----END PGP SIGNATURE-----

--lfL9iWt62hyVv4Jn--

--===============7106852758198141212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7106852758198141212==--
