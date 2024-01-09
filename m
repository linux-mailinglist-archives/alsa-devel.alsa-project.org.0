Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3E88285A8
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 12:59:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73603DF8;
	Tue,  9 Jan 2024 12:59:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73603DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704801575;
	bh=s350W6yoYv7bR2LjJtkvpjGsgm27BGtJDoZ1UbzfKGQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HPasOl5cuEBRCTDVfKG2Y/zZReXdkYb3G1nugkMG5ZcPjs9AJAZSl47++N/D6r/+p
	 oPRyGlDNGAQ/6dnuJNQc3vIX+vTpQ3+Xd+FobRLxGLzfvM0uzc3gqa2rn8GL6BVoWN
	 NI6oOuL3eiaqJzIczVe3rCruG0idQOB/EucQB3Pw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7622F80564; Tue,  9 Jan 2024 12:59:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36FA9F80580;
	Tue,  9 Jan 2024 12:59:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5295F80254; Tue,  9 Jan 2024 12:58:58 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ACEE0F80086
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 12:58:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACEE0F80086
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rNAkd-0000oy-VG; Tue, 09 Jan 2024 12:58:35 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rNAkc-001Ssr-Oq; Tue, 09 Jan 2024 12:58:34 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rNAkc-0007Bl-2E;
	Tue, 09 Jan 2024 12:58:34 +0100
Message-ID: <fda63ae95d050e46dcb2446f0d841e01354a8643.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/4] reset: Instantiate reset GPIO controller for
 shared reset-gpios
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@quicinc.com>,  Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>,  alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org,  linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Sean Anderson
 <sean.anderson@seco.com>
Date: Tue, 09 Jan 2024 12:58:34 +0100
In-Reply-To: <767645a7-835d-4ac8-ac70-a701cea6df30@linaro.org>
References: <20240105155918.279657-1-krzysztof.kozlowski@linaro.org>
	 <20240105155918.279657-3-krzysztof.kozlowski@linaro.org>
	 <c2abc08d1b442fdcba7c41e2e1cc1617516441b2.camel@pengutronix.de>
	 <767645a7-835d-4ac8-ac70-a701cea6df30@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: LY6HD4YGHE42UKD3QOIQUCA47DP5JGAJ
X-Message-ID-Hash: LY6HD4YGHE42UKD3QOIQUCA47DP5JGAJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LY6HD4YGHE42UKD3QOIQUCA47DP5JGAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Di, 2024-01-09 at 11:59 +0100, Krzysztof Kozlowski wrote:
> On 08/01/2024 13:17, Philipp Zabel wrote:
> > On Fr, 2024-01-05 at 16:59 +0100, Krzysztof Kozlowski wrote:
> > Is that true?=20
>=20
> It should be true and my tests confirmed it.
>=20
> The code below looks like overwrites of_phandle_args so
> > that only one reset-gpio device is spawned for each gpio node.
>=20
> The code will iterate over list of of_node and of_phandle_args and
> compare them with __reset_gpios_args_match(). If all match: do not
> create new platform device.
>=20
> If they do not match, e.g. ACTIVE_LOW -> ACTIVE_HIGH, create new
> platform device. This will be the second device for the same GPIO.
> Probing of that device in reset-gpio driver will fail:
>
> [   19.198775] reset-gpio reset-gpio.2.auto: error -EBUSY: Could not get
> reset gpios
>=20
> because GPIO is used by reset-gpio.1.auto already.

Thank you for the clarification.
I only understood later in the mail and didn't update this properly.

> > > +	/* Not freed in normal path, persisent subsyst data */
> > > +	rgpio_dev =3D kzalloc(sizeof(*rgpio_dev), GFP_KERNEL);
> >=20
> > Since this is persistent, instead of letting the reset-gpio driver call
> > of_parse_phandle_with_args() again, this could be passed in via
> > platform data. Is there a reason not to do that instead?
>=20
> We can pass it as read only platform data, but we cannot pass the
> ownership. This is associated with registered platform device, not with
> bound one device->driver.
>=20
> Imagine case:
> 1. modprobe reset-gpio,
> 2. Driver is bound to the device,
> 3. unbind  (echo > unbind)
> 4. rmmod
> 5. goto 1

Keeping ownership on the list is fine, the reset-gpio driver makes its
own copy of of_phandle_args anyway. I was just wondering whether it
could make this copy from platform data instead of from the
of_parse_phandle_with_args() return value.

[...]
> >=20
> > > @@ -839,21 +960,50 @@ __of_reset_control_get(struct device_node *node=
, const char *id, int index,
> > >  					 index, &args);
> > >  	if (ret =3D=3D -EINVAL)
> > >  		return ERR_PTR(ret);
> > > -	if (ret)
> > > -		return optional ? NULL : ERR_PTR(ret);
> > > +	if (ret) {
> > > +		/*
> > > +		 * There can be only one reset-gpio for regular devices, so
> > > +		 * don't bother with GPIO index.
> > > +		 */
> >=20
> > I don't understand this comment. The GPIO index should be checked as
> > part of __reset_gpios_args_match(), or should it not?
>=20
> This and earlier comment are result of a bit hacky approach to the
> problem: how to find reset controllers for that GPIO?
>=20
> The point is that our reset gpio controller has only 1 reset, thus
> of_reset_n_cells=3D1. However args_count from of_parse_handle is >0, whic=
h
> later is compared in reset core:
>=20
> https://elixir.bootlin.com/linux/latest/source/drivers/reset/core.c#L859
>=20
> That part we need to match.
>=20
> I could make the reset-gpio driver to have of_reset_n_cells=3D2, but what
> would be the point? The rest of the cells are not really relevant,
> because you cannot refer to this reset gpio controller with any other
> arguments.
>=20
> To remind: my solution spawns one reset-gpio controller for one GPIO.

Thank you. I think we could also just make that check

	if (WARN_ON(!rcdev->of_args && ...))

instead and skip the of_xlate call in that case (or implement of_xlate
in the reset-gpio driver to make this more explicit).

> >=20
> > > +		ret =3D of_parse_phandle_with_args(node, "reset-gpios", "#gpio-cel=
ls",
> > > +						 0, &args);
> > > +		if (ret)
> > > +			return optional ? NULL : ERR_PTR(ret);
> > > =20
> > > -	mutex_lock(&reset_list_mutex);
> > > -	rcdev =3D NULL;
> > > -	list_for_each_entry(r, &reset_controller_list, list) {
> > > -		if (args.np =3D=3D r->of_node) {
> > > -			rcdev =3D r;
> > > -			break;
> > > -		}
> > > +		gpio_fallback =3D true;
> >=20
> > Is there a reason not just call __reset_add_reset_gpio_device() here?
> > With that, there should be no need to call __reset_find_rcdev() twice.
>=20
> Hm, could be, although not sure if code would be simpler.
>=20
> This entire function handles two cases:
> 1. Get normal reset controller ("resets" OF property),
> 2. If above fails, get reset-gpio controller ("reset-gpios" OF property)
>=20
> Therefore the entire solution is following approach:
> 1. of_parse_phandle(resets)
> 1b. error? Then of_parse_phandle(reset-gpios)
> 2. Find reset-controller based on any of above phandles.
> 3. error? Check if we created reset-gpios platform device. If not:
> create new reset-gpios platform device/
> 3b. Platform device could probe, so lookup again for reset controller or
> defer probe.
>=20
> What type of flow do you propose?

I propose to reorder after parsing the phandles: check/create the gpio
platform device right after parsing the gpio handle. Only then lock
reset_list_mutex look for the rcdev.

1. of_parse_phandle(resets)
1b. error? Then of_parse_phandle(reset-gpios)
2b. gpio? Then check if we created reset-gpios platform device. If not:
create new reset-gpios platform device/, defer if probe failed
3. Lock reset_list_mutex, find reset-controller based on any of above
phandles.

>=20
> >=20
> > >  	}
> > > =20
> > > +	mutex_lock(&reset_list_mutex);
> > > +	rcdev =3D __reset_find_rcdev(&args, gpio_fallback, NULL);
> >=20
> > This gets called with args as parsed. If there is a match, this will=
=20
> > overwrite args (in the gpio_fallback case) and return NULL.
>=20
> Overwrite not complete. It will only overwrite args_count and return a
> valid rcdev.
> I do not see overwriting in case of returning NULL.

Sorry, I meant to write

"This gets called with args as parsed. If there is a match, this will=20
 overwrite args (in the gpio_fallback case) _or_ return NULL."

at least at the end, when I understood the following.

> >=20
> > > +
> > >  	if (!rcdev) {

So in this non-NULL branch there was no overwriting.

> > > -		rstc =3D ERR_PTR(-EPROBE_DEFER);
> > > -		goto out;
> > > +		if (gpio_fallback) {
> > > +			/*
> > > +			 * Registering reset-gpio device might cause immediate
> > > +			 * bind, thus taking reset_list_mutex lock via
> > > +			 * reset_controller_register().
> > > +			 */
> > > +			mutex_unlock(&reset_list_mutex);
> > > +			ret =3D __reset_add_reset_gpio_device(node, &args);
> >=20
> > So this will also be called with args as parsed.
> >=20
> > > +			mutex_lock(&reset_list_mutex);
> > > +			if (ret) {
> > > +				rstc =3D ERR_PTR(ret);
> > > +				goto out;
> > > +			}
> > > +			/*
> > > +			 * Success: reset-gpio could probe immediately, so
> > > +			 * re-check the lookup.
> > > +			 */
> > > +			rcdev =3D __reset_find_rcdev(&args, gpio_fallback, NULL);
> >=20
> > And this will again be called with args as parsed and overwrite args
> > again.>
> > > +			if (!rcdev) {
> > > +				rstc =3D ERR_PTR(-EPROBE_DEFER);
> > > +				goto out;
> > > +			}
> > > +			/* Success, rcdev is valid thus do not bail out */
> > > +		} else {
> > > +			rstc =3D ERR_PTR(-EPROBE_DEFER);
> > > +			goto out;
> > > +		}
> > >  	}
> >=20
> > So at this point args is overwritten in the gpio_fallback case. I would
> > find it much clearer to just overwrite args here and make the first
> > parameter to __reset_find_rcdev() const.
>=20
> I think I get your point. Overwriting happens after we store the
> original of_args, but the code is indeed not intuitive. I think I can
> move it further, as you suggested.

Now I think we can skip the overwriting altogether and just adapt the
following of_reset_n_cells check ad of_xlate call as mentioned above.

regards
Philipp
