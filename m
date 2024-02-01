Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8BD84B1E0
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 11:02:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B9EFF53;
	Tue,  6 Feb 2024 11:02:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B9EFF53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707213752;
	bh=ONdXqAS27cKeOgWX4XGTKCxg4rE0mzWElHVnnYMMb0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fVcectb/tZpjH1c71XH20MBMI3JBHxs5mPtxeUt6TeNcE8wuO/z52BdQmNqpklScX
	 yOb5RWgPg8kKVZwZwnuchvi5h/H/5lXRzxsNYQ3StD++bdsaAD+982OYulir8mkc/V
	 pzVrGlKhJb1hb+COY/6bYlD4NtNdnNBUg3sWQSsI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FCC2F80630; Tue,  6 Feb 2024 11:00:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32B68F8061E;
	Tue,  6 Feb 2024 11:00:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8607F8055C; Thu,  1 Feb 2024 22:47:49 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 18557F80548
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 22:47:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18557F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KYhAJw//
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88A646218F;
	Thu,  1 Feb 2024 21:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEB5C433C7;
	Thu,  1 Feb 2024 21:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706824052;
	bh=ONdXqAS27cKeOgWX4XGTKCxg4rE0mzWElHVnnYMMb0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYhAJw//yARcM3TA6pVCkI4LUiBLE5XWbQdyIJ2IOE9XeeW9PXuRT0u1fpPxxrkwp
	 Hurjt/dBf8xwi23T1FksMdv9e36XHyjvhrDNFhBSr1xRnTYLMYbJE3ILCL/Xokm/MD
	 5zQO0eFXQidwjXeacacwmmo5pMdGivYcXVl5OsSlyzb4uDD6zF3QHkW/ipNCSyCrkX
	 ruFySuh4tDJV4Rf4YFiYpBgTsdWdhvZKAcl5M+3wneiWVFJ2zo1QtBfWDecyRoxa73
	 fETXEmGDyXWVSu/j1Xloaznpi7OcrAoyx70CgInqn+hTw2H52XDK3rA5SorsXzUwVT
	 KByKrTZWMbAOA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Feb 2024 23:47:13 +0200
Message-Id: <CYU2MG4IOJ0Q.2UJOTK999FCCC@suppilovahvero>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Mark Brown" <broonie@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 <kernel@pengutronix.de>, "Moritz Fischer" <mdf@kernel.org>, "Wu Hao"
 <hao.wu@intel.com>, "Xu Yilun" <yilun.xu@intel.com>, "Tom Rix"
 <trix@redhat.com>, <linux-fpga@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Alexander Aring" <alex.aring@gmail.com>,
 "Stefan Schmidt" <stefan@datenfreihafen.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, <linux-wpan@vger.kernel.org>,
 <netdev@vger.kernel.org>, "Lars-Peter Clausen" <lars@metafoo.de>, "Michael
 Hennerich" <Michael.Hennerich@analog.com>, "Jonathan Cameron"
 <jic23@kernel.org>, <linux-iio@vger.kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Rayyan Ansari" <rayyan@ansari.sh>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Martin Tuma"
 <martin.tuma@digiteqautomotive.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, <linux-media@vger.kernel.org>, "Sergey Kozlov"
 <serjk@netup.ru>, "Arnd Bergmann" <arnd@arndb.de>, "Yang Yingliang"
 <yangyingliang@huawei.com>, <linux-mmc@vger.kernel.org>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob
 Herring" <robh@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Michal
 Simek" <michal.simek@amd.com>, "Amit Kumar Mahapatra via Alsa-devel"
 <alsa-devel@alsa-project.org>, <linux-mtd@lists.infradead.org>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 "Simon Horman" <horms@kernel.org>, "Ronald Wahl" <ronald.wahl@raritan.com>,
 "Benson Leung" <bleung@chromium.org>, "Tzung-Bi Shih" <tzungbi@kernel.org>,
 "Guenter Roeck" <groeck@chromium.org>, <chrome-platform@lists.linux.dev>,
 "Max Filippov" <jcmvbkbc@gmail.com>, <linux-spi@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>,
 <linux-mediatek@lists.infradead.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "Javier Martinez Canillas" <javierm@redhat.com>,
 "Amit Kumar Mahapatra" <amit.kumar-mahapatra@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, "Viresh Kumar" <vireshk@kernel.org>, "Rui
 Miguel Silva" <rmfrfs@gmail.com>, "Johan Hovold" <johan@kernel.org>, "Alex
 Elder" <elder@kernel.org>, <greybus-dev@lists.linaro.org>, "Peter Huewe"
 <peterhuewe@gmx.de>, "Jason Gunthorpe" <jgg@ziepe.ca>,
 <linux-integrity@vger.kernel.org>, "Herve Codina"
 <herve.codina@bootlin.com>, "Alan Stern" <stern@rowland.harvard.edu>, "Aaro
 Koskinen" <aaro.koskinen@iki.fi>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, <linux-usb@vger.kernel.org>, "Helge
 Deller" <deller@gmx.de>, "Dario Binacchi"
 <dario.binacchi@amarulasolutions.com>, "Kalle Valo" <kvalo@kernel.org>,
 "Dmitry Antipov" <dmantipov@yandex.ru>, <libertas-dev@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "James Clark" <james.clark@arm.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 00/33] spi: get rid of some legacy macros
X-Mailer: aerc 0.15.2
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
 <2024012417-prissy-sworn-bc55@gregkh>
 <c1e38a30-5075-4d01-af24-ac684e77cf29@sirena.org.uk>
In-Reply-To: <c1e38a30-5075-4d01-af24-ac684e77cf29@sirena.org.uk>
X-MailFrom: jarkko@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WO5BOLBBIKEKR5L5M6EKVL2VLWVQBZ3Y
X-Message-ID-Hash: WO5BOLBBIKEKR5L5M6EKVL2VLWVQBZ3Y
X-Mailman-Approved-At: Tue, 06 Feb 2024 10:00:22 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WO5BOLBBIKEKR5L5M6EKVL2VLWVQBZ3Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed Jan 24, 2024 at 7:22 PM EET, Mark Brown wrote:
> On Wed, Jan 24, 2024 at 09:13:49AM -0800, Greg Kroah-Hartman wrote:
> > On Mon, Jan 22, 2024 at 07:06:55PM +0100, Uwe Kleine-K=C3=B6nig wrote:
>
> > > Note that Jonathan Cameron has already applied patch 3 to his tree, i=
t
> > > didn't appear in a public tree though yet. I still included it here t=
o
> > > make the kernel build bots happy.
>
> > Are we supposed to take the individual changes in our different
> > subsystem trees, or do you want them all to go through the spi tree?
>
> Given that the final patch removes the legacy interfaces I'm expecting
> to take them via SPI.

+1

least fuss approach

BR, Jarkko
