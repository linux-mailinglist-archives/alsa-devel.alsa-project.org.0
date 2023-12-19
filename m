Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 212B4818330
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 09:18:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80C5C826;
	Tue, 19 Dec 2023 09:18:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80C5C826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702973909;
	bh=JLgvN4ZNXcq5ZrMWW9oBzOnbtgZO3mKJjfEZctSO0Nw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A1v4q+PbQizR38Jv9Ia+cthAOwgFk6IoI8WWKXaGBUwR2yGq+La+f1pdFxCjxZXcU
	 dijTwLZ4bvnh/i+lVhdudxBeIslIVFiIfbbKuqez1o+a8ULzf3jXHTQIt+iIz+5Jm8
	 sRQFj0WDUL00ikZrqrCaL6zwVGQoYnd6a+x1YKFE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A749EF8057C; Tue, 19 Dec 2023 09:18:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C4BF80579;
	Tue, 19 Dec 2023 09:17:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14B33F800D2; Tue, 19 Dec 2023 09:14:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44B64F800D2
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 09:12:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44B64F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RD2CkaEn
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDF98240012;
	Tue, 19 Dec 2023 08:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702973546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQdUFyLeNJUwSBurp25+RwofnZarRLxRivzumNAHgLw=;
	b=RD2CkaEn/GG9QxTYaa0dWcy6UlNPS5YXoBiXAWMwaFltIhdneTFchqmrllZwjquGRNKBVa
	RXLuk1LY9NtnuMY1sO0q+3L2JgQlQ09b5tLMWEt4p+CEtsIfVeVzh2hxDWq3QaW14DcVua
	G3RM5wdEOZp7SLHR8Ii0LoF3LlEFi83qaccyzXfivV8ed0QDu9QeeAEGNjHl6GYFM3EAV4
	/+AjQM0KUdsxQYFB31hCcqXvoJxXbCB8PO2C7Oh5Y9lcaN40/ZoI8EQCTt1zbeaWhkB420
	QyYheZGGYiPCpEW7xplaotEH62ULXemTci1tXDqN5+q+R078QgB5ux51ARZ/0g==
Date: Tue, 19 Dec 2023 09:12:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, pratyush
 <pratyush@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 sbinding@opensource.cirrus.com, Lee Jones <lee@kernel.org>, james schulman
 <james.schulman@cirrus.com>, david rhodes <david.rhodes@cirrus.com>,
 rf@opensource.cirrus.com, Jaroslav Kysela <perex@perex.cz>, tiwai@suse.com,
 linux-spi <linux-spi@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Michael Walle <michael@walle.cc>, linux-mtd
 <linux-mtd@lists.infradead.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 michal simek <michal.simek@amd.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, alsa-devel
 <alsa-devel@alsa-project.org>, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v11 00/10] spi: Add support for stacked/parallel
 memories
Message-ID: <20231219091221.30b1f167@xps-13>
In-Reply-To: <1953466568.133535.1702937420979.JavaMail.zimbra@nod.at>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
	<1953466568.133535.1702937420979.JavaMail.zimbra@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: SYY3GCDYRDSEQVHO4DBBPIUV742K26LS
X-Message-ID-Hash: SYY3GCDYRDSEQVHO4DBBPIUV742K26LS
X-MailFrom: miquel.raynal@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SYY3GCDYRDSEQVHO4DBBPIUV742K26LS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Richard,

richard@nod.at wrote on Mon, 18 Dec 2023 23:10:20 +0100 (CET):

> ----- Urspr=C3=BCngliche Mail -----
> > Von: "Amit Kumar Mahapatra" <amit.kumar-mahapatra@amd.com> =20
>=20
> > This patch series updated the spi-nor, spi core and the AMD-Xilinx GQSPI
> > driver to add stacked and parallel memories support. =20
>=20
> I wish the series had a real cover letter which explains the big picture
> in more detail.
>=20
> What I didn't really get so far, is it really necessary to support multip=
le
> chip selects within a single mtd?
> You changes introduce hard to maintain changes into the spi-nor/mtd core =
code
> which alert me.
> Why can't we have one mtd for each cs and, if needed, combine them later?
> We have drivers such as mtdconcat for reasons.

The Xilinx SPI controller is a bit convoluted, there are two ways to
address the bits in a memory:
* Either your extend the memory range with the second chip "on
  top" of the first (which would typically be a mtd-concat use case)
* Or you use the two chips in parallel and you store the even bits
  in one device (let's say cs0) and the odd bits in the other (cs1).
  Extending mtd-concat for this might be another solution, I don't know
  how feasible it would be.

Maybe these bindings will help understanding the logic:
e2edd1b64f1c ("spi: dt-bindings: Describe stacked/parallel memories modes")
eba5368503b4 ("spi: dt-bindings: Add an example with two stacked flashes")

However I agree the changes will likely be hard to maintain given the
complexity brought with such a different controller.

Thanks,
Miqu=C3=A8l
