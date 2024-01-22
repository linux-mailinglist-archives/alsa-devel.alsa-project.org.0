Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2EF83DE77
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 17:19:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00BC1B6A;
	Fri, 26 Jan 2024 17:19:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00BC1B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706285966;
	bh=MEXKZHQkB/IyiyQVHXrZDxlLURiVSiUhivYGVZLcqn0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hKnUxcEy1MfOW7RL7X9I39XVJ777JiMpNYw7dBUgyLqJkhUAADC/Qr4EalvNLnRYW
	 FRkQ21ejgG3jkhZdyNV9frJnRYITHxJTYoESWCjUiMS338fzCvwlnd+xwMFPLsA+Bc
	 MFYj9+HQ50XLtg0+8Mky0FPBrACNTQ3lZMIDNsWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75512F8061C; Fri, 26 Jan 2024 17:18:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 474F5F8060B;
	Fri, 26 Jan 2024 17:18:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DD47F8025F; Mon, 22 Jan 2024 20:24:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72EADF8020D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 20:24:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72EADF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Om7TXwRG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7EAD7CE2C65;
	Mon, 22 Jan 2024 19:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FBDEC433C7;
	Mon, 22 Jan 2024 19:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705951455;
	bh=MEXKZHQkB/IyiyQVHXrZDxlLURiVSiUhivYGVZLcqn0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Om7TXwRG+RLb91NjkMlGtbBbQYrAGinHi8YBBuORygdejt7BZ+vQd9Bqs0sBl/BxP
	 VCw1yjmez+FHyuigs8WrRG3xG5dxGPTpaOT2qYeFl6QHLeQijLl0kkOlguh3EaCef5
	 +AkOU52pnihuLtq9XxoisJbYHmdBJ7MWGdIGbaT+Hqd1d3bAs/JdGsBZD+YdEjOqeP
	 eiYtqYfgWpXt9iSL4haLcS9baDm6slcDBeeq4Pri4phWer/ACYdMdlNEE7R3pgjieo
	 tFpdEkRwqJLtm9GAX85YeLj+l6gbxcnR7JUDJE+8uHr22Geysx+TUOYD6M7QtotXaK
	 eSyrD1CGdOh3w==
Date: Mon, 22 Jan 2024 19:23:43 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>, Wu Hao
 <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>, Tom Rix
 <trix@redhat.com>, linux-fpga@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, linux-wpan@vger.kernel.org,
 netdev@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, Ulf
 Hansson <ulf.hansson@linaro.org>, Rayyan Ansari <rayyan@ansari.sh>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Martin Tuma
 <martin.tuma@digiteqautomotive.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-media@vger.kernel.org, Sergey Kozlov
 <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Yang Yingliang <yangyingliang@huawei.com>,
 linux-mmc@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, Amit Kumar
 Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 linux-mtd@lists.infradead.org, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Simon Horman <horms@kernel.org>, Ronald Wahl <ronald.wahl@raritan.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Max
 Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Amit
 Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>, Rui
 Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>, Alex
 Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, Peter Huewe
 <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, Herve Codina
 <herve.codina@bootlin.com>, Alan Stern <stern@rowland.harvard.edu>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org, Helge Deller
 <deller@gmx.de>, Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>,
 libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, James Clark <james.clark@arm.com>, Bjorn Helgaas
 <bhelgaas@google.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 00/33] spi: get rid of some legacy macros
Message-ID: <20240122192343.148a0b6d@jic23-huawei>
In-Reply-To: <e62cdf7f-ce58-4f46-a0a0-25ce9fb271b1@sirena.org.uk>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
	<e62cdf7f-ce58-4f46-a0a0-25ce9fb271b1@sirena.org.uk>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.40; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: jic23@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: XOVYBB6ZDDNZI52D3ZCB6EBTYIXWU2RF
X-Message-ID-Hash: XOVYBB6ZDDNZI52D3ZCB6EBTYIXWU2RF
X-Mailman-Approved-At: Fri, 26 Jan 2024 16:17:53 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XOVYBB6ZDDNZI52D3ZCB6EBTYIXWU2RF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 22 Jan 2024 18:18:22 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Mon, Jan 22, 2024 at 07:06:55PM +0100, Uwe Kleine-K=C3=B6nig wrote:
>=20
> > Note that Jonathan Cameron has already applied patch 3 to his tree, it
> > didn't appear in a public tree though yet. I still included it here to
> > make the kernel build bots happy. =20
>=20
> It's also going to be needed for buildability of the end of the series.

Ah.  I thought intent was to split this across all the different trees
then do the final patch only after they were all gone?

I'm fine with it going all in one go if people prefer that.

My tree will be out in a few mins. Was just waiting to rebase on rc1
which I've just done.

Jonathan
