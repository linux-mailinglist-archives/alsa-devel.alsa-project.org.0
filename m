Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA546817D20
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 23:11:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4F0BE10;
	Mon, 18 Dec 2023 23:10:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4F0BE10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702937465;
	bh=V67jUA/X4iuuyWPHvIFmIMQeerw4rwp8jEY/OLK5Slg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WJ7sBSzEfjcKpGefYd7eCvONZ2ofiagoIM8khVt6/6uWAABkDIR7gDFH9nmgYE4h9
	 eeJDwi2l8+q0nIoinv5mKyttInWB8eZhlbqXsfGbh3rdmOVVl4hukdxBMqFjdUV7rG
	 rJ4ArjCutewKH0hcRwX71nmiV0qt0BdqwDJpgHvo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C6DAF805A0; Mon, 18 Dec 2023 23:10:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F7DCF80431;
	Mon, 18 Dec 2023 23:10:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CDE0F80425; Mon, 18 Dec 2023 23:10:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C22A6F800BD
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 23:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C22A6F800BD
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E1BDC6343B3B;
	Mon, 18 Dec 2023 23:10:21 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 9keEN92ZV6OF; Mon, 18 Dec 2023 23:10:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6AB616343B3C;
	Mon, 18 Dec 2023 23:10:21 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nR8uZpRh0SkQ; Mon, 18 Dec 2023 23:10:21 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2459D6343B3B;
	Mon, 18 Dec 2023 23:10:21 +0100 (CET)
Date: Mon, 18 Dec 2023 23:10:20 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: Mark Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	pratyush <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	sbinding@opensource.cirrus.com, Lee Jones <lee@kernel.org>,
	james schulman <james.schulman@cirrus.com>,
	david rhodes <david.rhodes@cirrus.com>, rf@opensource.cirrus.com,
	Jaroslav Kysela <perex@perex.cz>, tiwai@suse.com,
	linux-spi <linux-spi@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	michal simek <michal.simek@amd.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	alsa-devel <alsa-devel@alsa-project.org>,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	git@amd.com, amitrkcian2002@gmail.com
Message-ID: <1953466568.133535.1702937420979.JavaMail.zimbra@nod.at>
In-Reply-To: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v11 00/10] spi: Add support for stacked/parallel
 memories
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97
 (Linux)/8.8.12_GA_3809)
Thread-Topic: Add support for stacked/parallel memories
Thread-Index: Gp+EE7t5zvexUhLdnkyaadGyCIq7oQ==
Message-ID-Hash: ZN6VDFCZD7HLBCBUKAXGOQ7P45PJRSMB
X-Message-ID-Hash: ZN6VDFCZD7HLBCBUKAXGOQ7P45PJRSMB
X-MailFrom: richard@nod.at
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZN6VDFCZD7HLBCBUKAXGOQ7P45PJRSMB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

----- Urspr=C3=BCngliche Mail -----
> Von: "Amit Kumar Mahapatra" <amit.kumar-mahapatra@amd.com>

> This patch series updated the spi-nor, spi core and the AMD-Xilinx GQSPI
> driver to add stacked and parallel memories support.

I wish the series had a real cover letter which explains the big picture
in more detail.

What I didn't really get so far, is it really necessary to support multiple
chip selects within a single mtd?
You changes introduce hard to maintain changes into the spi-nor/mtd core co=
de
which alert me.
Why can't we have one mtd for each cs and, if needed, combine them later?
We have drivers such as mtdconcat for reasons.

Thanks,
//richard
