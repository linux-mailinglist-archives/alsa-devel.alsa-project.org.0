Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AC987CE2C
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 14:37:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A08B2233F;
	Fri, 15 Mar 2024 14:37:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A08B2233F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710509861;
	bh=mnKx/USIAWKFowB3UECi37soYZOTeSdjE7YC6dui0gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WOuyp+W+j0wdJNnYAjIf2QtAqQS6MLI4767lATnZFzOh6dyIpjGwxNjdHhFMzNKZt
	 l2rfca+j78P7ro6OjIXT/P8uPoIW+gq6FooN0eC38qjh6LixAEDZMQ7IfcumaPLIp+
	 SSigiqrm1bHAZy/jYnFQoa+6cj6GBrvjCN+Lxqss=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E580AF8057B; Fri, 15 Mar 2024 14:37:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A394F805A1;
	Fri, 15 Mar 2024 14:37:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 282C7F8028D; Fri, 15 Mar 2024 14:37:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DBF0F8014B
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 14:37:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DBF0F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WBikQgWF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4BC8ECE1D8A;
	Fri, 15 Mar 2024 13:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B990C433F1;
	Fri, 15 Mar 2024 13:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710509815;
	bh=mnKx/USIAWKFowB3UECi37soYZOTeSdjE7YC6dui0gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WBikQgWFYtKFSQn7AJHJtgle7tDUdFM0GNQ/6JqxAf0lxH6kRfm2hxTIXdG5E6Egy
	 YAzTuwY1PjSj0ojy2bfIUYwcULJe3/38mYLHr+20Nw39reMae5OEJudFQOAYqJS1cG
	 mjHGzUI/L69hkyZrBEUsb8oCQhOHCT3JZQ44vfSkw/OskPHgcBcH2rCpWA6LWBCF5E
	 diWwtCdzYwAdPO346YhitMreYA0mq7RAR0VnKsuUT5V6yoGUgrZLjFm21Xpp4uFg52
	 3KzbWdPKyTbVDmpXxzm5MDzWsiHQEt7QAGwNh5hjZUGzrkEU44uZ9fAbLix7zN5tme
	 8jjsI9jEx/Dhw==
Date: Fri, 15 Mar 2024 13:36:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	kernel@salutedevices.com
Subject: Re: [PATCH 12/25] ASoC: meson: t9015: add support for A1 SoC family
Message-ID: <5f8e8cd2-f9c4-4961-a85d-a0f3217294e6@sirena.org.uk>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-13-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4AHceM7kGoMGggFJ"
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-13-jan.dakinevich@salutedevices.com>
X-Cookie: A well-known friend is a treasure.
Message-ID-Hash: V5OZ6QX573VHZDSA4HH5VGPQ3PRRZ75M
X-Message-ID-Hash: V5OZ6QX573VHZDSA4HH5VGPQ3PRRZ75M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V5OZ6QX573VHZDSA4HH5VGPQ3PRRZ75M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--4AHceM7kGoMGggFJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 15, 2024 at 02:21:48AM +0300, Jan Dakinevich wrote:

> +static const char * const a1_adc_mic_bias_level_txt[] = { "2.0V", "2.1V",
> +	"2.3V", "2.5V", "2.8V" };
> +static const unsigned int a1_adc_mic_bias_level_values[] = { 0, 1, 2, 3, 7 };

Why would this be varied at runtime rather than being something fixed
when the system is designed?

> +static const char * const a1_adc_pga_txt[] = { "None", "Differential",
> +	"Positive", "Negative" };
> +static const unsigned int a1_adc_pga_right_values[] = { 0, PGAR_DIFF,
> +	PGAR_POSITIVE, PGAR_NEGATIVE };
> +static const unsigned int a1_adc_pga_left_values[] = { 0, PGAL_DIFF,
> +	PGAL_POSITIVE, PGAL_NEGATIVE };

Similarly here.

> +	SOC_SINGLE("ADC Mic Bias Switch", LINEIN_CFG, MICBIAS_EN, 1, 0),
> +	SOC_ENUM("ADC Mic Bias Level", a1_adc_mic_bias_level),

Why would micbias be user controlled rather than a DAPM widget as
normal?

--4AHceM7kGoMGggFJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX0Tu8ACgkQJNaLcl1U
h9B7RQf/eYxVKAjAigpYP4vgwBWRE/HosjdaaB5ogMo8PMSiXfacGnLx0ZtIpWa9
i6saOA5iW9E/n7Et4JpmJ0J/fYdN7d5TkSlgYGwYP/ojBAChias0hOS7f+fHKvdM
qH8C+20ovZC5RpNOZUjLmiwJ1WMJQrXgjYVTLpBHn23XPsf8fV3i+B5JEQzBJtXI
px2DiSaV2iQ+nBmrZQEQo7KnJsQiLahPLQgr81xq5322lUfLN0+kRHrNGnqMU/Aw
BW++2BV+mf6HXT8WKXrn2DeQByMpBN+jc7eeRDI7xIiB4iAWwpDL9Cn5HsSuYYvI
ZdU3lU/s6CaDa3e5AyxYVatZ42Rx4Q==
=sm4b
-----END PGP SIGNATURE-----

--4AHceM7kGoMGggFJ--
