Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2906D911ED0
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2024 10:31:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9318DB65;
	Fri, 21 Jun 2024 10:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9318DB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718958668;
	bh=vSTWYIkS8dZPp1gyV6GgsipcJv/f0Yiu+CBMvpyDKyU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DZoW963YYfY4V/mDaoBdVqlVaPaFdSUhS7bMJSYWPjQ90fuKmoNkF9ylcTgf9hqLg
	 GCGt2J4dIpCgEj+t4Vlg8t+M7x2fgdJ6mnwG0JVznN51J3VO1jciw7mRyaEjpJHgSZ
	 Vc2/IuVg9G86sdXY/8smLSRXCVVQBV8RAf3Xdvm0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C0C0F80588; Fri, 21 Jun 2024 10:30:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BA2EF805B0;
	Fri, 21 Jun 2024 10:30:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7595FF8023A; Fri, 21 Jun 2024 10:30:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4102F8010C
	for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2024 10:30:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4102F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EljBfq25
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A3F020003;
	Fri, 21 Jun 2024 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718958625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vSTWYIkS8dZPp1gyV6GgsipcJv/f0Yiu+CBMvpyDKyU=;
	b=EljBfq25UCP0bJHtLSMj6/zCXY9oAvfd8m3m3+oKaAfE3R3qGzQiLP70Dtf5/E0BjVhlr2
	3kYdj9Zcv07uvUjSc4PGieGFVRuZUnscRqClY9e/dC3+32DNYqrg906mhGNAV5dsydSZgJ
	j7J764uUg9PaG/QdPDX592lZI7xKQ5B2ClV75xzBfXbuB3zLdIpVqHskurQKcAnpdiWewl
	tpt0EvOPrnXwY7VIkoAA1L3G8YNvuSl+O84XjndxPwFS4GJ7mxjNtxLKG6RvpNnEUyw/Ym
	ukwKPd7JhZmPkutWlro7UbvnVkRYcyRd+4x/8l1ml1W5kY1Tk29IDHTpcFDWyA==
Date: Fri, 21 Jun 2024 10:30:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "J.M.B.
 Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Yangtao Li
 <frank.li@vivo.com>, Li Zetao <lizetao1@huawei.com>, Chancel Liu
 <chancel.liu@nxp.com>, Michael Ellerman <mpe@ellerman.id.au>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org, Markus Elfring
 <Markus.Elfring@web.de>
Subject: Re: [Patch v4 08/10] mtd: rawnand: lpx32xx: Request DMA channels
 using DT entries
Message-ID: <20240621103019.783271f4@xps-13>
In-Reply-To: <20240620175657.358273-9-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
	<20240620175657.358273-9-piotr.wojtaszczyk@timesys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: NRJKSK2OUBA6B2WPPOKR3UCOMMTGDRUR
X-Message-ID-Hash: NRJKSK2OUBA6B2WPPOKR3UCOMMTGDRUR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NRJKSK2OUBA6B2WPPOKR3UCOMMTGDRUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Piotr,

piotr.wojtaszczyk@timesys.com wrote on Thu, 20 Jun 2024 19:56:39 +0200:

> Move away from pl08x platform data towards device tree.
>=20
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>

I don't see any change regarding the NAND controller node in the device
tree, is there any dependency with other patches from the same patchset
or may I apply this directly to nand/next?

Thanks,
Miqu=C3=A8l
