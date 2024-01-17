Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D21D830483
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jan 2024 12:27:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06DF77F4;
	Wed, 17 Jan 2024 12:27:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06DF77F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705490866;
	bh=jBx3eKRjN7Z9dDzc9bnlFlDn2eT7AJ7HfCKi7xPOw+c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LjA+5vh6sJbmYkDaEg/fAH6nSTDfOPxJo5qUhgUxQZ/fO8bvMlUtDwx0IAsteTwHF
	 9xGxXCPbm22VnuhRgLsSFXVsps3hGMhveWJC1e6s0Ozx0I64/bGa4fj9Q5TpVMluA9
	 +EpzyRq0iw6zte2G6ByvSWPc9ApG/QiM5YGnjNRc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15CEEF8014B; Wed, 17 Jan 2024 12:27:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08730F8014B;
	Wed, 17 Jan 2024 12:27:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDB49F801F5; Wed, 17 Jan 2024 12:27:08 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 13A6AF8003A
	for <alsa-devel@alsa-project.org>; Wed, 17 Jan 2024 12:27:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13A6AF8003A
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rQ44L-00031s-OS; Wed, 17 Jan 2024 12:26:53 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rQ44I-000S37-Tf; Wed, 17 Jan 2024 12:26:50 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rQ44I-00054q-2g;
	Wed, 17 Jan 2024 12:26:50 +0100
Message-ID: <5ad7badb85bdece735901a0f6317183b1d628a68.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/5] reset: Instantiate reset GPIO controller for
 shared reset-gpios
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Sean Anderson <sean.anderson@seco.com>
Date: Wed, 17 Jan 2024 12:26:50 +0100
In-Reply-To: <20240112163608.528453-3-krzysztof.kozlowski@linaro.org>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
	 <20240112163608.528453-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: TZLY3CVCJESFUBRA5JIAO6DJ2H5M7LCO
X-Message-ID-Hash: TZLY3CVCJESFUBRA5JIAO6DJ2H5M7LCO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZLY3CVCJESFUBRA5JIAO6DJ2H5M7LCO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fr, 2024-01-12 at 17:36 +0100, Krzysztof Kozlowski wrote:
[...]
>  struct reset_control *
>  __of_reset_control_get(struct device_node *node, const char *id, int ind=
ex,
>  		       bool shared, bool optional, bool acquired)
>  {
> +	struct of_phandle_args args =3D {0};
> +	bool gpio_fallback =3D false;
>  	struct reset_control *rstc;
> -	struct reset_controller_dev *r, *rcdev;
> -	struct of_phandle_args args;
> +	struct reset_controller_dev *rcdev;
>  	int rstc_id;
>  	int ret;
> =20
> @@ -839,39 +1028,49 @@ __of_reset_control_get(struct device_node *node, c=
onst char *id, int index,
>  					 index, &args);
>  	if (ret =3D=3D -EINVAL)
>  		return ERR_PTR(ret);
> -	if (ret)
> -		return optional ? NULL : ERR_PTR(ret);
> +	if (ret) {

I think this should continue to return optional ? NULL : ERR_PTR(ret)
if !IS_ENABLED(CONFIG_RESET_GPIO), for example by just skipping the
of_parse_phandle_with_args(). That should allow the GPIO fallback in
patch 5 to work as expected.

> +		/*
> +		 * There can be only one reset-gpio for regular devices, so
> +		 * don't bother with GPIO index.
> +		 */
> +		ret =3D of_parse_phandle_with_args(node, "reset-gpios", "#gpio-cells",
> +						 0, &args);
> +		if (ret)
> +			return optional ? NULL : ERR_PTR(ret);
> =20
> -	mutex_lock(&reset_list_mutex);
> -	rcdev =3D NULL;
> -	list_for_each_entry(r, &reset_controller_list, list) {
> -		if (args.np =3D=3D r->of_node) {
> -			rcdev =3D r;
> -			break;
> +		gpio_fallback =3D true;
> +
> +		ret =3D __reset_add_reset_gpio_device(&args);
> +		if (ret) {
> +			rstc =3D ERR_PTR(ret);
> +			goto out_put;
>  		}
>  	}

regards
Philipp
