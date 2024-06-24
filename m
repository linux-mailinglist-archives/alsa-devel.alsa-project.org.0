Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8399142EE
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 08:43:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DA16741;
	Mon, 24 Jun 2024 08:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DA16741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719211399;
	bh=8qQNy0cFi+vB5Mfp2npnGPe64P5YepXPolFgKOS6juw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nbaQOAQoKGTuAJt/MFwv9N1kkofoFTkgcGRSz8jpwB1aFMjCWvsDg3wT9MzxWfRW2
	 EqQyGjEuIZP1/Ww7eSaulfaXHmJTdr2PYZrVlWHDZJbSermA5l0x6sTDD4tMLEMD4b
	 aqYKNnbpv1Pt4R2n5AsyL/1azIs8DTwsdGB6bsvM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D511EF80578; Mon, 24 Jun 2024 08:42:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAB2AF805AF;
	Mon, 24 Jun 2024 08:42:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43816F80495; Mon, 24 Jun 2024 08:40:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90FF1F800ED
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 08:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90FF1F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y2dSdUb7
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1221C0006;
	Mon, 24 Jun 2024 06:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719211148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8qQNy0cFi+vB5Mfp2npnGPe64P5YepXPolFgKOS6juw=;
	b=Y2dSdUb7L45w0zOH/hMoZ0jqJMRt2RztXSF8cdHFJOQrvsC2d2TrOTWPfcBntkFhwN7H6/
	hRjUcA+3RSAJ94uif8HqhAvbCWQJYiR+SVkX6EFFrYPEr/FW5wId9XKqYNzTH1dx6WDGG0
	EpHqQyHHRgNy3VsxGvF0BTOq9xL4A+TxAGxtKMeEP3applLc9/8N0v4h797ONHvRbmXNoB
	xidj39GDhF0L9I2O/NKLPWLoLxYKqnfunm/ZzhUtmDxgyWbMCW+SkvuckBwxpEg80TiaAu
	EQMC92N1cUsplO1EO00oEc1qOUwmVwAOuZV611xRbhs1I+WiDGN7XvJsNyxmEw==
Date: Mon, 24 Jun 2024 08:39:00 +0200
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
Message-ID: <20240624083900.14e38d82@xps-13>
In-Reply-To: 
 <CAG+cZ06GSxPsTzRLXSk23qWXMkp-qxYq7Z9av5-2cPHSJmVAHg@mail.gmail.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
	<20240620175657.358273-9-piotr.wojtaszczyk@timesys.com>
	<20240621103019.783271f4@xps-13>
	<CAG+cZ06GSxPsTzRLXSk23qWXMkp-qxYq7Z9av5-2cPHSJmVAHg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: 2IHUEIQCYDAQZZP64KFKVILIJXEJIHQV
X-Message-ID-Hash: 2IHUEIQCYDAQZZP64KFKVILIJXEJIHQV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IHUEIQCYDAQZZP64KFKVILIJXEJIHQV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Piotr,

piotr.wojtaszczyk@timesys.com wrote on Fri, 21 Jun 2024 14:44:21 +0200:

> On Fri, Jun 21, 2024 at 10:30=E2=80=AFAM Miquel Raynal
> <miquel.raynal@bootlin.com> wrote:
> >
> > Hi Piotr,
> >
> > piotr.wojtaszczyk@timesys.com wrote on Thu, 20 Jun 2024 19:56:39 +0200:
> > =20
> > > Move away from pl08x platform data towards device tree.
> > >
> > > Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com> =20
> >
> > I don't see any change regarding the NAND controller node in the device
> > tree, is there any dependency with other patches from the same patchset
> > or may I apply this directly to nand/next?
> >
> > Thanks,
> > Miqu=C3=A8l =20
>=20
> Yes, this patch depends on "[v4,04/10] ARM: dts: lpc32xx: Add missing
> dma and i2s properties"
> which will be splitted into two or more separate patches per request
> in the comments.
> I'd like to keep driver changes and corresponding changes in DTS in
> the same patch
> but I've made a separate patch for DTS per request from v2 of the patch s=
et.

These changes won't be applied to the same tries so they must be split.

So I will not take this patch for the next merge window and instead
will take it for the one after, if the DT patches have been applied.
Please ping me at -rc1 again if the DT patches have gone through.

Thanks,
Miqu=C3=A8l
