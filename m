Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E37811CA0
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Dec 2023 19:34:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ADF3DED;
	Wed, 13 Dec 2023 19:34:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ADF3DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702492470;
	bh=ifQ03YNqYLUrOhvZyIXd73qLNP7qCnbov3Va+e518Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BTzcjDRrIGzzWxGv2vg49POrXs3z57z/eZrZw9B1pcbrTptexBz8XtKvEX6Uuun8e
	 HKuUM6HnwChZXSDJRX7XCyfgLG7JHiKtLdfegOL8VrZ8MbWuYUmUx5fiqPECT1DEph
	 yOH6D+kVISSGV260aJ9inCczvHPclqwqUUt84O88=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EE43F805A9; Wed, 13 Dec 2023 19:33:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62C22F800D2;
	Wed, 13 Dec 2023 19:33:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99AE0F8016A; Wed, 13 Dec 2023 19:32:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF56DF800D2
	for <alsa-devel@alsa-project.org>; Wed, 13 Dec 2023 19:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF56DF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MgVCGTze
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 674F4B81A2F;
	Wed, 13 Dec 2023 18:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5208EC433C8;
	Wed, 13 Dec 2023 18:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702492322;
	bh=ifQ03YNqYLUrOhvZyIXd73qLNP7qCnbov3Va+e518Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MgVCGTzeIdBMbEKxhlAH2d++VdjHo78ZMiiPDx89AZE26DvEHAa+0kabaVbgRA9VC
	 PAFguBz/4f7xs7dsPQAFGxu0a3rerda3MHmDLH2tnji1wKDy+BokXNwBsQx+9ntfO6
	 0auOrpzOKqXl4jol5rR6QgjWPvBSM+WS9TNeSYdyBJG/4Q+gCzp5O6WyJww3qyKEzK
	 +ALpLjY6sF6bwVa9XEfqBAGhGieSz7QsOi+2qyifQld92BluqUjMXisf7CXiupo9o8
	 xp3Z5bRkWzPr5+Mnx/UEhsDSKx61RNsfIipWJeUWK8FtSVeOfCR33rah743hdkGXA4
	 kLSbhezI46CjA==
Date: Wed, 13 Dec 2023 18:31:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] ASoC: codecs: Add WCD939x Soundwire devices driver
Message-ID: <e8b5099c-ceb2-4605-94bc-efd09ad55cb7@sirena.org.uk>
References: 
 <20231207-topic-sm8650-upstream-wcd939x-codec-v3-0-6df9585ec7c8@linaro.org>
 <20231207-topic-sm8650-upstream-wcd939x-codec-v3-4-6df9585ec7c8@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sQ2KlFK10iJSaHjV"
Content-Disposition: inline
In-Reply-To: 
 <20231207-topic-sm8650-upstream-wcd939x-codec-v3-4-6df9585ec7c8@linaro.org>
X-Cookie: One size fits all.
Message-ID-Hash: NORKVQKKQO45J26FYC4VMBFN7XK72UPB
X-Message-ID-Hash: NORKVQKKQO45J26FYC4VMBFN7XK72UPB
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NORKVQKKQO45J26FYC4VMBFN7XK72UPB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--sQ2KlFK10iJSaHjV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 11:28:07AM +0100, Neil Armstrong wrote:
> Add Soundwire Slave driver for the WCD9390/WCD9395 Audio Codec.
>=20
> The WCD9390/WCD9395 Soundwire devices will be used by the
> main WCD9390/WCD9395 Audio Codec driver to access registers
> and configure Soundwire RX and TX ports.

> +static const struct reg_default wcd939x_defaults[] =3D {

> +	{ WCD939X_DIGITAL_MODE_STATUS_0, 0x00 },
> +	{ WCD939X_DIGITAL_MODE_STATUS_1, 0x00 },

There's a bunch of registers like this which look like they should be
volatile and are actually volatile which makes supplying defaults rather
strange - in general volatile registers shouldn't have defaults.

> +	{ WCD939X_DIGITAL_EFUSE_REG_0, 0x00 },
> +	{ WCD939X_DIGITAL_EFUSE_REG_1, 0xff },
> +	{ WCD939X_DIGITAL_EFUSE_REG_2, 0xff },

With the fuse registers even though I'd expect them to be cachable the
whole point is usually that these are programmable per device and
therefore I'd not expect defaults, I'd expect them to be cached on first
use.

> +static bool wcd939x_readonly_register(struct device *dev, unsigned int r=
eg)
> +{

> +	case WCD939X_DIGITAL_CHIP_ID0:
> +	case WCD939X_DIGITAL_CHIP_ID1:
> +	case WCD939X_DIGITAL_CHIP_ID2:
> +	case WCD939X_DIGITAL_CHIP_ID3:

> +	case WCD939X_DIGITAL_EFUSE_REG_0:
> +	case WCD939X_DIGITAL_EFUSE_REG_1:
> +	case WCD939X_DIGITAL_EFUSE_REG_2:

> +	/* Consider all readonly registers as volatile */
> +	.volatile_reg =3D wcd939x_readonly_register,

There's a bunch of the readonly registers that I'd expect to be cachable
at runtime - I *hope* the chip ID doesn't change at runtime!  OTOH it
likely doesn't matter so perhaps it's fine but the comment could use
some improvement.

> +static int wcd939x_sdw_component_bind(struct device *dev, struct device =
*master,
> +				      void *data)
> +{
> +	/* Bind is required by component framework */
> +	return 0;
> +}
> +
> +static void wcd939x_sdw_component_unbind(struct device *dev,
> +					 struct device *master, void *data)
> +{
> +	/* Unbind is required by component framework */
> +}
> +
> +static const struct component_ops wcd939x_sdw_component_ops =3D {
> +	.bind =3D wcd939x_sdw_component_bind,
> +	.unbind =3D wcd939x_sdw_component_unbind,
> +};

So what exactly is the component framework *doing* here then?  It really
would be better to get this fixed in the component framework if this is
a sensible usage.

> +static int __maybe_unused wcd939x_sdw_runtime_resume(struct device *dev)
> +{
> +	struct wcd939x_sdw_priv *wcd =3D dev_get_drvdata(dev);
> +
> +	if (wcd->regmap) {
> +		regcache_cache_only(wcd->regmap, false);
> +		regcache_sync(wcd->regmap);
> +	}
> +
> +	pm_runtime_mark_last_busy(dev);

The pm_runtime_mark_last_busy() in the resume function is a bit of a
weird pattern - usually this is something that the user updates and more
normally when releasing a runtime PM reference.

--sQ2KlFK10iJSaHjV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV5+JsACgkQJNaLcl1U
h9AZHAf/dqGYnJAhnxL3jXejmEUS2P90Yl/AEr2sT51NqeW+UrCpMcHO7imgWxuG
/rNZuT74e37+elaS9qe6ybzxZAeppNq7yLWrTdthgB23ZzjcqpZFzU95o53tMJro
FNgbayZlwo5mlvAs4MikKn7uVRfWJZGicIP28T8HOD3wHYLOISYW0DpWXpL96RKa
RTUhnGe8HzQKvtywHmFyWKbv48TFpVh1ePMVaOQCkqFFkuHi1IrIUN9ERheQyBRW
66Fl7rtna52zcf2rTVkkFeMtha68z9m/c4wDiTbezbhEwh2pDAozKcMkz/SJKJex
/xuJzzlnSEYeJsJ5fig3Gq+5FhG9qA==
=+f9g
-----END PGP SIGNATURE-----

--sQ2KlFK10iJSaHjV--
