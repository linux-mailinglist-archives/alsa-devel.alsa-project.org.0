Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D59483DE6A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 17:17:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABD7F82C;
	Fri, 26 Jan 2024 17:16:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABD7F82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706285822;
	bh=pi9f5n7aCz4k4GcDtHhDD5lv5OgeZ4ucYdJWw/uz8rU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k3FCPmQkn6bLFk8mpY25WYYVQ0LCfhaJZxbyLOL/oDC1fLfIRcvI27uonxQu3NGh8
	 zsYSyyFnPHapbngArfjEZjvrya0h4xm/F6AwqyI8TyUt3R3jkHaQ4lImDUeMrfcL2e
	 qWEiTjAbckytcC/nQtREjT26QnBOn8sAz+5gHhuw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A432AF8057D; Fri, 26 Jan 2024 17:16:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0204CF80567;
	Fri, 26 Jan 2024 17:16:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E54EDF801F5; Tue, 16 Jan 2024 15:41:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CB3BF800F5
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 15:41:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CB3BF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eoW8PYM2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5BF2FCE19B0;
	Tue, 16 Jan 2024 14:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82385C433F1;
	Tue, 16 Jan 2024 14:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705416062;
	bh=pi9f5n7aCz4k4GcDtHhDD5lv5OgeZ4ucYdJWw/uz8rU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eoW8PYM2MfAuIBhKaoTZlWZwOEH64nrarWgh8smz385NHA2AvWbxhu44TZid6guIO
	 ztdPcokve4KGk/P0r48xP9LXjdlp+nfRggeFVeFp1EKUfQh1HSmalAz393OHzBH8yx
	 HITZr7gQr/eVgLSaMXJ0zK/Hypf/9tgOSbSJiXzjxDaUW1d3OgO9S7G4+/H4mw666+
	 L5PksNx2fvrD/Q9/Cn2uOjt9fv52HRvN58krYPnsggJ/tW1Mam7cV3tInWEBTcjzIV
	 QhTlg/jUO4g8ofnL8rKCTYV2n5vBGWNCAEmw7Luoyo7bgDS5dKI4oEy8rewQcDvB/c
	 CCz+OFltnyGUA==
Date: Tue, 16 Jan 2024 14:40:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-spi@vger.kernel.org,
	kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rayyan Ansari <rayyan@ansari.sh>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Sergey Kozlov <serjk@netup.ru>,
	Arnd Bergmann <arnd@arndb.de>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-mmc@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Rob Herring <robh@kernel.org>, linux-mtd@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Ronald Wahl <ronald.wahl@raritan.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Michal Simek <michal.simek@amd.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, Rui Miguel Silva <rmfrfs@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>,
	libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, James Clark <james.clark@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/33] spi: get rid of some legacy macros
Message-ID: <3404c9af-6c11-45d7-9ba4-a120e21e407e@sirena.org.uk>
References: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c8yli56mmI+gJGEV"
Content-Disposition: inline
In-Reply-To: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
X-Cookie: Programmers do it bit by bit.
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: UEJZR5BL2K5GIKE7ES3TQHVTF3EAAD7J
X-Message-ID-Hash: UEJZR5BL2K5GIKE7ES3TQHVTF3EAAD7J
X-Mailman-Approved-At: Fri, 26 Jan 2024 16:16:23 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEJZR5BL2K5GIKE7ES3TQHVTF3EAAD7J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--c8yli56mmI+gJGEV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 09:12:46PM +0100, Uwe Kleine-K=F6nig wrote:

> In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
> some functions were renamed. Further some compat defines were introduced
> to map the old names to the new ones.

> Patch #18 and #19 touch the same driver, otherwise the patches #1 - #31
> are pairwise independent and could be applied by their respective
> maintainers. The alternative is to let all patches go via the spi tree.
> Mark, what's your preference here?

I don't have a strong preference here, I'm happy to take all the patches
if the maintainers for the other subsystem are OK with that - ideally
I'd apply things at -rc1 but the timeline is a bit tight there.  I think
my plan here unless anyone objects (or I notice something myself) will
be to queue things at -rc3, please shout if that doesn't seem
reasonable.

--c8yli56mmI+gJGEV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWmlVwACgkQJNaLcl1U
h9AImgf/YhrOsj57KBdfXCGkJi2n+rTwU/YN3Vvfy2fP+4gmJoFGfjk1o+luXQwi
q3+RNetq9JicN07DE0eggUdY7EqvLtghmHnQWYraw+gEPT7PwkiFuKZgDEy79tmH
pNpJuEKTeDipvLkXCVMzD0T+NrW2BXshkACyxLpBrh+ewGJpmmgJEH8LEo52dxrk
uLfK3YjSYco5zXw8Dzak8Ea9Hb57dnySjT6aQf8GRXZMjNYAPqMC27Pzd5pWHnD1
am4raQY/1ji5yjiVs38+2RB0EnWlFJyj0VvC9vL5PEhkz0XiW3OTTedLKcxKKoYv
H+d+5ZwIRVx3bl+qcRRzH8EMyJW7pA==
=Umm1
-----END PGP SIGNATURE-----

--c8yli56mmI+gJGEV--
