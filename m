Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C18B8830461
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jan 2024 12:17:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB9B83E8;
	Wed, 17 Jan 2024 12:16:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB9B83E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705490228;
	bh=5qKlaLziljLZ5noa6CzlpJUbxw1PitV5B5D7RLl7cCY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eQ4/sW+la720RTy0AyKEZbZ6DsjoPiIse4NnpHws616nIa4bmMLg1GISD1eC7rfFw
	 kVM7HRTiD6tAy8uE11jd0BOGWVu3TEKaH2BAWZWtX6/s334sRw0vTOH1CXh9EsHjUC
	 JZw9fpraHa1DfRyvLYdEDbzq2rNlF85urLeC1/xI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBC35F80587; Wed, 17 Jan 2024 12:16:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77EE6F8057C;
	Wed, 17 Jan 2024 12:16:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F392F801F5; Wed, 17 Jan 2024 12:16:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DFBFF8003A
	for <alsa-devel@alsa-project.org>; Wed, 17 Jan 2024 12:16:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DFBFF8003A
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rQ3tx-0002Yp-2t; Wed, 17 Jan 2024 12:16:09 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rQ3tt-000S1i-0W; Wed, 17 Jan 2024 12:16:05 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rQ3ts-0004u3-31;
	Wed, 17 Jan 2024 12:16:04 +0100
Message-ID: <568f2bcb1bea01c36f59650d5cc5a84612197f8b.camel@pengutronix.de>
Subject: Re: [PATCH v3 5/5] i2c: muxes: pca954x: Allow sharing reset GPIO
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,  Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Peter Rosin <peda@axentia.se>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>,  "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Sean Anderson
 <sean.anderson@seco.com>
Date: Wed, 17 Jan 2024 12:16:04 +0100
In-Reply-To: <4c6c5d07-ac53-4da9-93e0-1286ca5eb44b@alliedtelesis.co.nz>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
	 <20240112163608.528453-6-krzysztof.kozlowski@linaro.org>
	 <800d202864c1730622a19998728c5a8b576d1931.camel@pengutronix.de>
	 <4c6c5d07-ac53-4da9-93e0-1286ca5eb44b@alliedtelesis.co.nz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: KAA36A2A3RMCKLMHHYFURKZUF3KXRQEX
X-Message-ID-Hash: KAA36A2A3RMCKLMHHYFURKZUF3KXRQEX
X-MailFrom: p.zabel@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KAA36A2A3RMCKLMHHYFURKZUF3KXRQEX/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Di, 2024-01-16 at 19:58 +0000, Chris Packham wrote:
> On 17/01/24 04:18, Philipp Zabel wrote:
> > On Fr, 2024-01-12 at 17:36 +0100, Krzysztof Kozlowski wrote:
> > > From: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > >=20
> > > Some hardware designs with multiple PCA954x devices use a reset GPIO
> > > connected to all the muxes. Support this configuration by making use =
of
> > > the reset controller framework which can deal with the shared reset
> > > GPIOs. Fall back to the old GPIO descriptor method if the reset
> > > controller framework is not enabled.
> > >=20
> > > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > > Acked-by: Peter Rosin <peda@axentia.se>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Link: https://scanmail.trustwave.com/?c=3D20988&d=3D8p6m5Tfi2yYJWYV9x=
YGcYnz7UYxB6WTGTPkmGu7b8A&u=3Dhttps%3a%2f%2flore%2ekernel%2eorg%2fr%2f20240=
108041913%2e7078-1-chris%2epackham%40alliedtelesis%2eco%2enz
> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > >=20
> > > ---
> > >=20
> > > If previous patches are fine, then this commit is independent and cou=
ld
> > > be taken via I2C.
> > >=20
> > > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> > > Cc: Sean Anderson <sean.anderson@seco.com>
> > > ---
> > >   drivers/i2c/muxes/i2c-mux-pca954x.c | 46 ++++++++++++++++++++++++--=
---
> > >   1 file changed, 38 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/=
i2c-mux-pca954x.c
> > > index 2219062104fb..1702e8d49b91 100644
> > > --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > @@ -49,6 +49,7 @@
> > >   #include <linux/pm.h>
> > >   #include <linux/property.h>
> > >   #include <linux/regulator/consumer.h>
> > > +#include <linux/reset.h>
> > >   #include <linux/slab.h>
> > >   #include <linux/spinlock.h>
> > >   #include <dt-bindings/mux/mux.h>
> > > @@ -102,6 +103,9 @@ struct pca954x {
> > >   	unsigned int irq_mask;
> > >   	raw_spinlock_t lock;
> > >   	struct regulator *supply;
> > > +
> > > +	struct gpio_desc *reset_gpio;
> > > +	struct reset_control *reset_cont;
> > >   };
> > >  =20
> > >   /* Provide specs for the MAX735x, PCA954x and PCA984x types we know=
 about */
> > > @@ -477,6 +481,35 @@ static int pca954x_init(struct i2c_client *clien=
t, struct pca954x *data)
> > >   	return ret;
> > >   }
> > >  =20
> > > +static int pca954x_get_reset(struct device *dev, struct pca954x *dat=
a)
> > > +{
> > > +	data->reset_cont =3D devm_reset_control_get_optional_shared(dev, NU=
LL);
> > > +	if (IS_ERR(data->reset_cont))
> > > +		return dev_err_probe(dev, PTR_ERR(data->reset_cont),
> > > +				     "Failed to get reset\n");
> > > +	else if (data->reset_cont)
> > > +		return 0;
> > > +
> > > +	/*
> > > +	 * fallback to legacy reset-gpios
> > > +	 */
> > devm_reset_control_get_optional_shared() won't return NULL if the
> > "reset-gpios" property is found in the device tree, so the GPIO
> > fallback is dead code.
>=20
> Hmm, I was attempting to handle the case where CONFIG_RESET_GPIO wasn't=
=20
> set [...]
> [...] it looks like we'd get -EPROBE_DEFER. I could change to check
> for that or just remove the GPIO fallback entirely. Any preference?

I hadn't considered this.

If CONFIG_RESET_GPIO=3Dn, devm_reset_control_get_optional_shared()
probably shouldn't return -EPROBE_DEFER. If we change that, the GPIO
fallback here can stay as is.

The alternative would be to drop the fallback and select RESET_GPIO.
Using -EPROBE_DEFER for fallback detection is no good, as there could
be a valid probe deferral if reset-gpio is compiled as a module that
will be loaded later.

regards
Philipp
