Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD672F81A9
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 18:09:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3046D1831;
	Fri, 15 Jan 2021 18:09:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3046D1831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610730594;
	bh=TTxGRW3tiG7LwSjTKZStrgp68+J+/ZsXQqui4SyalIY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J5/EdqU41aawxX5Rvb7QtS9wCqOJclwuMAlcW2GwXs71c2XHY4DROtTKCF4QZTS0K
	 Ncqsl7SXr9XGFggZBWi/xI221uJwBldVaPxWA3Jqa/WEHqJkYoRtQ12/JzGufFVMyJ
	 ZYHp2o1tRU5JRGAQxAUoRvtBzDVBm8MNvwM5NC2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D43AF8016D;
	Fri, 15 Jan 2021 18:08:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8011F801ED; Fri, 15 Jan 2021 18:08:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D11CFF80132
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 18:08:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D11CFF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gj5MA1Qh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69460222B3;
 Fri, 15 Jan 2021 17:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610730491;
 bh=TTxGRW3tiG7LwSjTKZStrgp68+J+/ZsXQqui4SyalIY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gj5MA1QhIl6mv38/JorSQaBuTdgK7JhRQ8W4zqkwTY2LHofctJYuQC/F7ATNbm3q7
 J4z7W/PZKj4xzlJ7DnKO8070MiSiVtC6o/vJbUPNn42rfa3iEJq5ZhcIum2t5RiRqG
 WZ0J28wSu6CQtFLrZnKxueolRqXU0WBQYtqzXc/wDVQuftGXwKsQlG2bttiSIik1UV
 DoKyndUiOV9u7prRSzT6D/ahQ3wRtTTkFaQutL1lc/URgSVKjkkm3AKdgsKON3GzpS
 uf2xyFYGeD06X3z0195kB3GOim7nUK8uRoXRyHLuJRGVVT7cCWcG+GtEI1YnYd6Anr
 GZfk7L3DWyYGg==
Date: Fri, 15 Jan 2021 17:07:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Argus Lin <argus.lin@mediatek.com>
Subject: Re: [PATCH 2/2] ASoC: mediatek: mt6359: add MT6359 accdet driver
Message-ID: <20210115170737.GE4384@sirena.org.uk>
References: <1609935546-11722-1-git-send-email-argus.lin@mediatek.com>
 <1609935546-11722-3-git-send-email-argus.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n+lFg1Zro7sl44OB"
Content-Disposition: inline
In-Reply-To: <1609935546-11722-3-git-send-email-argus.lin@mediatek.com>
X-Cookie: Debug is human, de-fix divine.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Arnd Bergmann <arnd@arndb.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Chipeng Chang <chipeng.chang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Dan Murphy <dmurphy@ti.com>,
 Shuming Fan <shumingf@realtek.com>, linux-arm-kernel@lists.infradead.org,
 Jack Yu <jack.yu@realtek.com>, "Shane.Chien" <shane.chien@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
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


--n+lFg1Zro7sl44OB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 06, 2021 at 08:19:06PM +0800, Argus Lin wrote:
> MT6359 audio codec support accessory detect features, adds MT6359
> accdet driver to support plug detection and key detection.

> ---
>  sound/soc/codecs/Kconfig         |    7 +
>  sound/soc/codecs/Makefile        |    2 +
>  sound/soc/codecs/mt6359-accdet.c | 1951 ++++++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/mt6359-accdet.h |  136 +++
>  sound/soc/codecs/mt6359.h        | 1863 +++++++++++++++++++++++++++++++++---

This driver is *huge*.  Looking through the code it feels like there's a
lot of things that are written with mostly duplicated code that differs
only in data so you could shrink things down a lot by refactoring things
to have one copy of the code and pass different data into it.

>  	  Enable support for the platform which uses MT6359 as
>  	  external codec device.
> +config SND_SOC_MT6359_ACCDET

Missing blank line here.

> +++ b/sound/soc/codecs/mt6359-accdet.c
> @@ -0,0 +1,1951 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 MediaTek Inc.

Please make the entire comment a C++ one so things look more
intentional.

> +#include "mt6359-accdet.h"
> +#include "mt6359.h"
> +/* grobal variable definitions */

Spelling mistake and you need more blank lines here.

> +#define REGISTER_VAL(x)	((x) - 1)
> +#define HAS_CAP(_c, _x)	\
> +	({typeof(_c)c = (_c); \
> +	typeof(_x)x = (_x); \
> +	(((c) & (x)) == (x)); })

These need namepsacing.

> +static struct mt63xx_accdet_data *accdet;
> +
> +static struct head_dts_data accdet_dts;
> +struct pwm_deb_settings *cust_pwm_deb;

You'd need a *very* good reason to be using global data rather than
storing anything in the device's driver data like most drivers.  There's
extensive use of global data here, and lots of raw pr_ prints rather
than dev_ prints as well - this doesn't look like how a Linux driver is
supposed to be written.

> +
> +const struct of_device_id mt6359_accdet_of_match[] = {
> +	{
> +		.compatible = "mediatek,mt6359-accdet",
> +		.data = &mt6359_accdet,

Given that this is specific to a particular PMIC why does this need a
compatible string?

> +/* global function declaration */
> +
> +static u64 mt6359_accdet_get_current_time(void)
> +{
> +	return sched_clock();
> +}

It is probably best to remove this wrapper.

> +static bool mt6359_accdet_timeout_ns(u64 start_time_ns, u64 timeout_time_ns)
> +{
> +	u64 cur_time = 0;
> +	u64 elapse_time = 0;
> +
> +	/* get current tick, ns */
> +	cur_time = mt6359_accdet_get_current_time();
> +	if (cur_time < start_time_ns) {
> +		start_time_ns = cur_time;
> +		/* 400us */
> +		timeout_time_ns = 400 * 1000;
> +	}
> +	elapse_time = cur_time - start_time_ns;
> +
> +	/* check if timeout */
> +	if (timeout_time_ns <= elapse_time)
> +		return false;
> +
> +	return true;
> +}

There must be a generic implementation of this already surely?

> +static unsigned int check_key(unsigned int v)
> +{

This looks a lot like open coding of the functionality of the extcon
adc_jack functionality.

> +static void send_key_event(unsigned int keycode, unsigned int flag)
> +{
> +	int report = 0;
> +
> +	switch (keycode) {
> +	case DW_KEY:
> +		if (flag != 0)
> +			report = SND_JACK_BTN_1;

What does flag mean?  At the very least it needs renaming.

> +static void send_status_event(unsigned int cable_type, unsigned int status)
> +{
> +	int report = 0;

This is one of those places that looks like it could be code with
different data passed in.

> +
> +	switch (cable_type) {
> +	case HEADSET_NO_MIC:
> +		if (status)
> +			report = SND_JACK_HEADPHONE;
> +		else
> +			report = 0;
> +		snd_soc_jack_report(&accdet->jack, report, SND_JACK_HEADPHONE);
> +		/* when plug 4-pole out, if both AB=3 AB=0 happen,3-pole plug
> +		 * in will be incorrectly reported, then 3-pole plug-out is
> +		 * reported,if no mantory 4-pole plug-out, icon would be
> +		 * visible.
> +		 */
> +		if (status == 0) {
> +			report = 0;
> +			snd_soc_jack_report(&accdet->jack, report, SND_JACK_MICROPHONE);
> +		}
> +		pr_info("accdet HEADPHONE(3-pole) %s\n",
> +			status ? "PlugIn" : "PlugOut");

You shouldn't be spamming the logs for normal events like this.

> +	regmap_read(accdet->regmap, ACCDET_IRQ_ADDR, &val);
> +	while (val & ACCDET_IRQ_MASK_SFT &&
> +	       mt6359_accdet_timeout_ns(cur_time, ACCDET_TIME_OUT))
> +		;

This is open coding regmap_read_poll_timeout(), this pattern is repeated
in several places.

> +static inline void clear_accdet_eint(unsigned int eintid)
> +{
> +	if ((eintid & PMIC_EINT0) == PMIC_EINT0) {

The == part is redundant here, and again this is another place where it
feels like there's duplicated code that should be using data.  All this
interrupt handling code is really extremely difficult to follow, there's
*lots* of functions all open coding many individual register bits
sometimes redundantly and it's very hard to follow what it's supposed to
be doing.  I can't help but think that in addition to making things data
driven writing more linear code without these abstraction layers would
help a lot with comprehensibility.

> +static irqreturn_t mtk_accdet_irq_handler_thread(int irq, void *data)
> +{
> +	accdet_irq_handle();
> +
> +	return IRQ_HANDLED;
> +}

Why does this wrapper function exist - AFAICT it's just introducing a
bug given that the called function is able to detect spurious interrupts
but this unconditionally reports IRQ_HANDLED.

> +int mt6359_accdet_init(struct snd_soc_component *component,
> +		       struct snd_soc_card *card)
> +{
> +	int ret = 0;
> +	struct mt63xx_accdet_data *priv =
> +			snd_soc_card_get_drvdata(component->card);

> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(mt6359_accdet_init);

This is a weird interface, what's going on here?

> +int mt6359_accdet_set_drvdata(struct snd_soc_card *card)
> +{
> +	snd_soc_card_set_drvdata(card, accdet);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mt6359_accdet_set_drvdata);

This is setting off *massive* alarm bells in that it seems to try to
claim the card level driver data for this specific driver, again what's
going on here?

> +module_init(mt6359_accdet_soc_init);
> +module_exit(mt6359_accdet_soc_exit);

module_platform_driver()

--n+lFg1Zro7sl44OB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmABy9gACgkQJNaLcl1U
h9DY/gf/fHBtIfQbXuCCr1+QvKa57mk9zIvrlJKMEtVByp+AvZkXaTLoyMIg1JcO
4rAyQrhsqr3HcLdUVrzQqljjDGREnMvwZOUB9EeEnREwj+vtYm/ogs4ccXmpmCES
tIhNW4JpGfVxCVhM0XfUz8s86Y7mo4bv0pDy6aZMop4p2wG4lZvOcdXDdqVFXVyG
YkT3A7fNgJ5Hi7K3BGViNNLEvCjkXt6KmFjNTPpyc4zUXoOJNkqHv5gUn/NhW9Lv
BYOuUVlwjlJC4SANqXz/5WYI0aux1tFpgnkASGWV1K7TyFyjzEJklB1vmGHE/e+6
WDE6B01vYILmCPElPN8uHzwXEYzv6Q==
=azMJ
-----END PGP SIGNATURE-----

--n+lFg1Zro7sl44OB--
