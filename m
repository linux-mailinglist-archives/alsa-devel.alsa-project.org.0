Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3A983DE7D
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 17:20:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB2CAE9A;
	Fri, 26 Jan 2024 17:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB2CAE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706286020;
	bh=J9cWHBzQAtoEqppKJznkEOwXANl/OtQJlMreI+w5+pM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=InWd/21OlMnb3KD84VBv67fgH7mZqzPUktm8fWShINi36N+Ukxs3dUA1b0hHH7nn8
	 fE1Pk8afuUOzjAcf8qv6abhOXnzyAqXWWQu9ftPG2MHqlBTCcXDfDpX40GNjKGWrIu
	 wGOmG+KZZCS8fSY2CQoFSdr13wqzM+dYuO4xu4Mc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69E2EF8057C; Fri, 26 Jan 2024 17:18:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43FF2F80684;
	Fri, 26 Jan 2024 17:18:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCDD2F8028D; Wed, 24 Jan 2024 18:22:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87D2AF8003A
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 18:22:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87D2AF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LzpFWfp6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B592E61DC3;
	Wed, 24 Jan 2024 17:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF93C433C7;
	Wed, 24 Jan 2024 17:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706116940;
	bh=J9cWHBzQAtoEqppKJznkEOwXANl/OtQJlMreI+w5+pM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzpFWfp68rpr4dWHpdN+3IBhvKe1BMer+To6gMN52sFIqJGOHOg2ldSKjRXCcMb5m
	 TFWNLUoV1HFSfX27ssqcTmUNGmLjfsu/z7ab3gxQuXnjvSNFUQXmjhZEIyIhUWWEIT
	 CgAYNmzcDLnvRg+viWfwfm6By4Ffbj0ymjEy26C89CVOqr6JLR32V+zT7k2ef93fpP
	 1Ka1oOBMomGGEuXbLQOuhLohRSeVfalTXlkn0w18Bo0vP0gpL8EpG8vIchAhQdEue3
	 Cd0Kc25AAqNkrZ3Jhe5TUtRkxqZmjaKSQ074XXZPz2CPZUgeNzrq5mcjx4JO7BaCUH
	 nqaKOF7sEH13g==
Date: Wed, 24 Jan 2024 17:22:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	linux-mtd@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Ronald Wahl <ronald.wahl@raritan.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, Max Filippov <jcmvbkbc@gmail.com>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>,
	libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, James Clark <james.clark@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 00/33] spi: get rid of some legacy macros
Message-ID: <c1e38a30-5075-4d01-af24-ac684e77cf29@sirena.org.uk>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
 <2024012417-prissy-sworn-bc55@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FdGjmVpGJ74QDTu1"
Content-Disposition: inline
In-Reply-To: <2024012417-prissy-sworn-bc55@gregkh>
X-Cookie: To err is human, to moo bovine.
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: SOJGNHF5QGGJAI5CBJL5PKMBHPQMXNL4
X-Message-ID-Hash: SOJGNHF5QGGJAI5CBJL5PKMBHPQMXNL4
X-Mailman-Approved-At: Fri, 26 Jan 2024 16:18:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SOJGNHF5QGGJAI5CBJL5PKMBHPQMXNL4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--FdGjmVpGJ74QDTu1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 09:13:49AM -0800, Greg Kroah-Hartman wrote:
> On Mon, Jan 22, 2024 at 07:06:55PM +0100, Uwe Kleine-K=F6nig wrote:

> > Note that Jonathan Cameron has already applied patch 3 to his tree, it
> > didn't appear in a public tree though yet. I still included it here to
> > make the kernel build bots happy.

> Are we supposed to take the individual changes in our different
> subsystem trees, or do you want them all to go through the spi tree?

Given that the final patch removes the legacy interfaces I'm expecting
to take them via SPI.

--FdGjmVpGJ74QDTu1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWxRzcACgkQJNaLcl1U
h9CS5Af+OPZh7Z4aM5AF1TAMNJebJxrwbV+lfEa8zsdVnpHBXYpXokCrVwsSRBtM
yR/bt2+OoZjrVep6c0lufmewH58kEtQF4UazYao7MD2alCnwzn49m697Ubpnc/k9
iSCRd+E5ICMZuRdRrDAmd/To7o3jsg85SeN4qLdeer17NkjU6VS9vR6NlzImV/nS
MXj52eAHL5+EZIpIlwZSBkCxyEEsz/UFaGcFsKMonZ+24Oz5SXXWFhUWfiFCD+fA
DNZKxXJ9Vk2i5pCUsduff5giUUypwRqVP4C01wYMs7o3jkMZ2cQhtuH8iyDtKKMU
FSwO3bpbAgZzLbY2G2cqYZyEpqJ8Ow==
=E3cl
-----END PGP SIGNATURE-----

--FdGjmVpGJ74QDTu1--
