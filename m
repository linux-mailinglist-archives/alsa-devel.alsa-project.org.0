Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4718F6F2ECC
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:42:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 519FA17A7;
	Mon,  1 May 2023 08:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 519FA17A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923337;
	bh=2BGpsyUa46MCiqspXwHox2WxL4j89TQkQhi2GQxlQ9I=;
	h=In-Reply-To:References:Date:From:To:Subject:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ct/RvsjuhqGMGi5XhWWf7cJ1z9MXau01ci6ueEx7faD0UsbZD9BRTK7jAPavQh6Up
	 3zWQh8Ym4edpdLGY+iXZLyNXtGDmKQ3cEc9O8m2jhxDvhsbi5p0/LBTHSGvvCWTCso
	 1CV0kS+X4BOi8c3JfJQA9Jxk2SyicdiW4zrxa9Dk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECBF3F8053D;
	Mon,  1 May 2023 08:40:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE252F80236; Tue, 25 Apr 2023 15:28:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B64E4F80104
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 15:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B64E4F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256
 header.s=fm2 header.b=BDKjZe8V;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Ww7caQ/n
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id CF7262B05E77;
	Tue, 25 Apr 2023 09:27:42 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 25 Apr 2023 09:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1682429262; x=1682436462; bh=sh
	lQTGWa7vUbJrf98fLKqQIz8VMZW6pYwyh6rr26DkQ=; b=BDKjZe8V8E+P7NICJp
	Vq4lbdGZugmlgIu152zKM3zkUh7lbz6/8ZE3O3ghra0opEb0BMclXv6oYWb/IWhh
	pDb8EmpNYEkTrSc4CmFm5Q6KJBCzeZ0mw9D7uKV05tYwVrTdYdIVGGidixbP4MWh
	4r1UoQfDB8lihJtrEmZJCtwFOftU6Wbs0DVtBCjvNiXUuQutk5sKuY69/gJHCG+8
	cZqypV9rXYLPWhewsJZurlaV8YUAP3yaeQBMfNyTLIrxsr1EuJa19aCeC58maNpo
	PbtohZqSbFaMd0Ty7vTTMtEgT74/PhX5jSRWSwLEn10og6S+9jidu3qsOtrzJP2V
	XxnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682429262; x=1682436462; bh=shlQTGWa7vUbJ
	rf98fLKqQIz8VMZW6pYwyh6rr26DkQ=; b=Ww7caQ/n5Bh/og36bBMDdHO3Q9nzz
	24Z798Vdo8uKqG5xOCWM1oyAwqHpcneVXP7NUVjR1hKFAxNWS1drT9CPVw3Aq0Qq
	ZioN3iQ0xUDLc023Ik8zUk4Y88FP/PG9KL50rojHHHmlPww+t6Nf/Ac/WtsUaOZp
	oh3n6YzkFJLTpw9009VQ4Gb8Xn+KcIQsmh7mtOSGpQJlRqj8e7Z9UV5nDe4YcZRV
	ZyQTxmps+Dk8dasaXzAh+fJQ8oR/Fj8Oo0N7OUU6cBrtbjQQ1iXcTV3B3ixJfKXn
	KGqdXmVvj5Q9gpLOLEoSzEd7+MI3wcnYH/FhyHbMpEnV6BPt8byhhWuOw==
X-ME-Sender: <xms:S9VHZPtnbIA9a43-BUkGQTLPcycQPz6VDZsrIBMpV6GNsFVbOjG1cQ>
    <xme:S9VHZAfk7eBnWSRULg_fpQ1pS2hO1vXlDfrK1cPPfGmnGQ70nP8vLJLUF2S_Bn4nO
    AjH3HiagLE1jcX28wU>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeduvddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:S9VHZCy5_L8CMNNMfCSoxcG0Ldgdu7A6DDjI9EX6lgbtNhLXqW2oKA>
    <xmx:S9VHZOPLa-4kTfCSYdR2ozfHjDDtS0CErsrViXmqEyf4B52AABLWwQ>
    <xmx:S9VHZP-Fm2j12c--Vr6NsLBBu0flFv8CRoOYZkbSjW8IGaTp6RuoZQ>
    <xmx:TtVHZG3qm6n0uWAcAkRFbA0jlBkt4yoH8l-8jZeE4qFVqIoQakHOoruLBXY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 91FC6B60086; Tue, 25 Apr 2023 09:27:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-374-g72c94f7a42-fm-20230417.001-g72c94f7a
Mime-Version: 1.0
Message-Id: <c3db2294-4fef-46be-a62a-11fc38884918@app.fastmail.com>
In-Reply-To: <0210316b-9e21-347c-ed15-ce8200aeeb94@linaro.org>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <8101c53e-e682-4dc3-95cc-a332b1822b8b@app.fastmail.com>
 <20230424152933.48b2ede1@kernel.org>
 <0210316b-9e21-347c-ed15-ce8200aeeb94@linaro.org>
Date: Tue, 25 Apr 2023 14:27:26 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Jakub Kicinski" <kuba@kernel.org>
Subject: Re: [PATCH 00/43] ep93xx device tree conversion
Content-Type: text/plain
X-MailFrom: arnd@arndb.de
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: LCU5I7YJRVYDHIDLO7KTY2METM4B5T4T
X-Message-ID-Hash: LCU5I7YJRVYDHIDLO7KTY2METM4B5T4T
X-Mailman-Approved-At: Mon, 01 May 2023 06:39:16 +0000
CC: Nikita Shubin <nikita.shubin@maquefel.me>,
 Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Brian Norris <briannorris@chromium.org>,
 Chuanhong Guo <gch981213@gmail.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Jean Delvare <jdelvare@suse.de>, Joel Stanley <joel@jms.id.au>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Liang Yang <liang.yang@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Lv Ruyi <lv.ruyi@zte.com.cn>, Mark Brown <broonie@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Olof Johansson <olof@lixom.net>,
 Paolo Abeni <pabeni@redhat.com>, Qin Jian <qinjian@cqplus1.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>, Sebastian Reichel <sre@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Stephen Boyd <sboyd@kernel.org>,
 Sumanth Korikkar <sumanthk@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 soc@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LCU5I7YJRVYDHIDLO7KTY2METM4B5T4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 25, 2023, at 10:20, Krzysztof Kozlowski wrote:
> On 25/04/2023 00:29, Jakub Kicinski wrote:
>> On Mon, 24 Apr 2023 13:31:25 +0200 Arnd Bergmann wrote:
>>> Thanks a lot for your continued work. I can't merge any of this at
>>> the moment since the upstream merge window just opened, but I'm
>>> happy to take this all through the soc tree for 6.5, provided we
>>> get the sufficient Acks from the subsystem maintainers. Merging
>>> it through each individual tree would take a lot longer, so I
>>> hope we can avoid that.
>> 
>> Is there a dependency between the patches?
>
> I didn't get entire patchset and cover letter does not mention
> dependencies, but usually there shouldn't be such. Maybe for the next
> versions this should be split per subsystem?

Clearly the last patch that removes the board files depends on
all the previous patches, but I assume that the other ones
are all independent.

We don't do complete conversions from boardfiles to DT that often
any more, but in the past we tended to do this through a cross-
subsystem branch in the soc tree, which helps do it more quickly
and is less work for Nikita. In this case, I would make it a
separate top-level branch in the soc tree.

If anyone strongly feels that the patches should go through
the subsystem trees here, we'll take the longer path and
do the changes separately, with the boardfile removal
coming a release later.

     Arnd
