Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D7A844139
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 15:00:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E57A825;
	Wed, 31 Jan 2024 15:00:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E57A825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706709643;
	bh=kx7++Nl+g8gUP4P8BUkEMWIMMN6PTKxchtxN+CPVmLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iiMetrBK/sYLWOWjfBos1OJhqIYLlDVPo2OeMqHfQml47klQqDf4LIbaQjpmT7LUV
	 G/NIC0/VXZNRq0Vd4XncuL5rloNccrkemkW2vg2wdfZgsZl6Eis5botmel604Ydclc
	 HLfldUvvmoL/LatQ+rlINqGETRqeyyUIDRUqIn00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02B72F80578; Wed, 31 Jan 2024 15:00:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 805B2F8057E;
	Wed, 31 Jan 2024 15:00:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 163FDF8055C; Wed, 31 Jan 2024 14:59:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86417F80149
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 14:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86417F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q6039tBd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B27C6179C;
	Wed, 31 Jan 2024 13:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AE4C433F1;
	Wed, 31 Jan 2024 13:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706709593;
	bh=kx7++Nl+g8gUP4P8BUkEMWIMMN6PTKxchtxN+CPVmLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q6039tBd6g6aaJ08HMT328HRmGQ9/vDdtmfqgRCXxQae1xNri1Php+xPYYolOYXO2
	 jQ4rYZ626C0Eie0xX/22fJCSp75S7+YumvXSITEt2RXClBqXjVqGbPTas2PiIg4cr6
	 dhYqZP3xXnKjvnC+oSdKuzDFhvBEXZxQejtNbN36vChso2CXRwSqEBa9d8xn22ngjo
	 jbgR6foNn4IeIdsd0qqCXgf1X3AwGl3Otrpk2/3ofgUQKye7lym1S66RUqkGx4ZxtM
	 BAndsyZ1MsY12LGTmckU1x67wBdBjxp9YSwuQStPGxEXudQG5P+1UgvkyMU9VP6wR3
	 zEs1DYzSNuIag==
Date: Wed, 31 Jan 2024 13:59:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v6 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
Message-ID: <e693398e-fb18-43c3-83dd-4b517c29fafd@sirena.org.uk>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
 <20240129115216.96479-5-krzysztof.kozlowski@linaro.org>
 <CACRpkdYf4HUaV-Pjr81WjLbzy9zdAnyFWs9gPayPC6-3OjHQwA@mail.gmail.com>
 <CAMRc=Mc1SGLeUOWmKg=fvCdM+RR6FSu2QkFuR17s7L99eRMGug@mail.gmail.com>
 <CACRpkdbaxqTzwL9L02vCpMMdBYsubNP1VkNuJ8mXB_=4E3Kjaw@mail.gmail.com>
 <5ef64082-0b44-4bb2-bd4c-654c96f4a9bb@linaro.org>
 <CACRpkdYa0nj6PK1FecBpQfOfkXhetwRmAyDgWNjJxcf4xgExMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aUBo2xsR6S0y35Fl"
Content-Disposition: inline
In-Reply-To: 
 <CACRpkdYa0nj6PK1FecBpQfOfkXhetwRmAyDgWNjJxcf4xgExMA@mail.gmail.com>
X-Cookie: I will never lie to you.
Message-ID-Hash: IUXYS6SYXJGK35FACHQTSY6UHSKESUVC
X-Message-ID-Hash: IUXYS6SYXJGK35FACHQTSY6UHSKESUVC
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--aUBo2xsR6S0y35Fl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 31, 2024 at 02:42:17PM +0100, Linus Walleij wrote:

> I guess it may be an issue that regulators are not using Device Tree
> exclusively, but also has to deal with a slew of platform_devices:s :/
> IIRC that was one of the reasons why it looks as it does.

Also ACPI, and this is a long standing binding so we can't change the
ABI for DT.  We could potentially use a refcounting mechanism provided
by the GPIO core but we'd need to know when the refcount changes from 0
to 1 and back, we need to take other actions (inserting delays and
generating notifications) when it does so I'm not sure how exciting it
is to factor out the refcount.  I think part of the decision making with
the current design was that there was likely going to need to be some
higher level stuff like that in the users so it wasn't clear that trying
to abstract the reference count away in gpiolib was buying us much.

--aUBo2xsR6S0y35Fl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmW6UlEACgkQJNaLcl1U
h9A+fwf/Uk2jUjqxQFPM7xcqmHsrA9v2ugLGTMHO8Maq0EYtg3qC8iqG/GpGJUfs
fFgiBMZMuFYRWuVZrFqaDVfH2SjrzVuTwRnzdcc248yp4VxcIw+/6zv7MN5I7+Mz
drrk+SOW8LQ1/zFdYFCZJ6nTpNpz3gbw6dfYHSsOsXwKXw1uXrjVpsr883NKtWhR
T7booZIhNa/o4N0KWRG6F3uJtDXp6adazB05Ub4s1FU3bNdajYiU/bXbG2hp01Me
YNMz64ezvnOBwrVEtGF/CzVUjFy3AesEUbq/RASerWiFsB0OatwnMeNG3/Fn/mLU
Qna+Cm3/fdqDG1oWpox48rOY47Hy0A==
=3gvm
-----END PGP SIGNATURE-----

--aUBo2xsR6S0y35Fl--
