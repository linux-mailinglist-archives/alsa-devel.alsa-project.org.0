Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2CC82F147
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 16:19:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE62774C;
	Tue, 16 Jan 2024 16:19:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE62774C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705418377;
	bh=yvaIcbADBkBm+VIT85jjaNg4CTpealOivhzVPVpxfr0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rhrAAsICEe8/kshThHnBA83u6jHq3maFnYyNuD4sN3zoYFya9aK04hH0KgBi2x3D8
	 6R6hAJW1QWQ+bQyd+Ooc26Jg3HWy8186MBSqlKgPtLcGynaiUV6FZZI2XaU/M7gSiQ
	 bBCz3cUzUAd05BGrDQVM0rDeYNvusuGuue/giDO8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9093F8057A; Tue, 16 Jan 2024 16:19:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DA8CF8057E;
	Tue, 16 Jan 2024 16:19:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68149F801F5; Tue, 16 Jan 2024 16:19:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E76D4F80074
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 16:18:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E76D4F80074
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rPlD3-0000to-Uy; Tue, 16 Jan 2024 16:18:37 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rPlD0-000Gxq-M0; Tue, 16 Jan 2024 16:18:34 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rPlD0-000D8R-1w;
	Tue, 16 Jan 2024 16:18:34 +0100
Message-ID: <800d202864c1730622a19998728c5a8b576d1931.camel@pengutronix.de>
Subject: Re: [PATCH v3 5/5] i2c: muxes: pca954x: Allow sharing reset GPIO
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Peter Rosin <peda@axentia.se>, Jaroslav Kysela <perex@perex.cz>,  Takashi
 Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org,  linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, Bartosz Golaszewski
	 <brgl@bgdev.pl>, Sean Anderson <sean.anderson@seco.com>
Date: Tue, 16 Jan 2024 16:18:34 +0100
In-Reply-To: <20240112163608.528453-6-krzysztof.kozlowski@linaro.org>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
	 <20240112163608.528453-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 4AS2OPIUDRUII6QQXVHBNX7ZS3TOQO2F
X-Message-ID-Hash: 4AS2OPIUDRUII6QQXVHBNX7ZS3TOQO2F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4AS2OPIUDRUII6QQXVHBNX7ZS3TOQO2F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fr, 2024-01-12 at 17:36 +0100, Krzysztof Kozlowski wrote:
> From: Chris Packham <chris.packham@alliedtelesis.co.nz>
>=20
> Some hardware designs with multiple PCA954x devices use a reset GPIO
> connected to all the muxes. Support this configuration by making use of
> the reset controller framework which can deal with the shared reset
> GPIOs. Fall back to the old GPIO descriptor method if the reset
> controller framework is not enabled.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Acked-by: Peter Rosin <peda@axentia.se>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Link: https://lore.kernel.org/r/20240108041913.7078-1-chris.packham@allie=
dtelesis.co.nz
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> If previous patches are fine, then this commit is independent and could
> be taken via I2C.
>=20
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Sean Anderson <sean.anderson@seco.com>
> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 46 ++++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-=
mux-pca954x.c
> index 2219062104fb..1702e8d49b91 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -49,6 +49,7 @@
>  #include <linux/pm.h>
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <dt-bindings/mux/mux.h>
> @@ -102,6 +103,9 @@ struct pca954x {
>  	unsigned int irq_mask;
>  	raw_spinlock_t lock;
>  	struct regulator *supply;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct reset_control *reset_cont;
>  };
> =20
>  /* Provide specs for the MAX735x, PCA954x and PCA984x types we know abou=
t */
> @@ -477,6 +481,35 @@ static int pca954x_init(struct i2c_client *client, s=
truct pca954x *data)
>  	return ret;
>  }
> =20
> +static int pca954x_get_reset(struct device *dev, struct pca954x *data)
> +{
> +	data->reset_cont =3D devm_reset_control_get_optional_shared(dev, NULL);
> +	if (IS_ERR(data->reset_cont))
> +		return dev_err_probe(dev, PTR_ERR(data->reset_cont),
> +				     "Failed to get reset\n");
> +	else if (data->reset_cont)
> +		return 0;
> +
> +	/*
> +	 * fallback to legacy reset-gpios
> +	 */

devm_reset_control_get_optional_shared() won't return NULL if the
"reset-gpios" property is found in the device tree, so the GPIO
fallback is dead code.

> +	data->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HI=
GH);
> +	if (IS_ERR(data->reset_gpio)) {
> +		return dev_err_probe(dev, PTR_ERR(data->reset_gpio),
> +				     "Failed to get reset gpio");
> +	}
> +
> +	return 0;
> +}
> +

regards
Philipp
