Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26806836F5E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 19:14:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5687B83E;
	Mon, 22 Jan 2024 19:14:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5687B83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705947253;
	bh=DUzlzYhwpqdukSU52axAImuuJwvD9YUD7+kH8ySYwR4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gBIq1g77ELiMtG2KSiIuhwAvkM9uFfCi7XxYgnXs73estkZVwJ/+P+O9aEnCNN3SW
	 5tL+aPXOf/vpXYuECbNY9cY+gba9oobicV1S/2TZ0Rxj3lecAIcRZbxgFnjoETuMpa
	 FdiSaswhK54RRcQcu0nMf0x0c8S6GO9lTMQuN6sw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A467F80567; Mon, 22 Jan 2024 19:13:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66EF2F80580;
	Mon, 22 Jan 2024 19:13:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B770DF8025F; Mon, 22 Jan 2024 19:13:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91989F80149
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 19:13:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91989F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TS4VJcDT
Received: by mail.gandi.net (Postfix) with ESMTPSA id E911020003;
	Mon, 22 Jan 2024 18:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705947213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DUzlzYhwpqdukSU52axAImuuJwvD9YUD7+kH8ySYwR4=;
	b=TS4VJcDTXuYNmsNX7murn8lJ6pwDcgMonq+lmQaAc2c2W4Hq3hN28GfkE6Z+Zh8mWzqNib
	+EipYHY1L8+yIdcbNtHUFkG89WnWDL/+9aUmgHXBIGJAIMBww5NEqL8ZKumGOvFJ/vr2y4
	bvbISQD0R993JrEmz1i4ZCnoLrJT+nb/MKLpLj+XwgooA+r+Se/9EFmSftfaolNrtDIxDx
	Wt4xv/AIy2DJ3Bxs/FMylclS2yYvm0FVM8WjEwnXET/7Xr6CqJcbthHhZ+oU2fWEiPDKRT
	VFz8sSb4telxCcJgVOcemJYlwyrn0vGcn8Ke6uM0P1Vguv5A7UUAumMn1DT3Yw==
Date: Mon, 22 Jan 2024 19:13:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, kernel@pengutronix.de, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob
 Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Michal Simek
 <michal.simek@amd.com>, Amit Kumar Mahapatra via Alsa-devel
 <alsa-devel@alsa-project.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 12/33] mtd: dataflash: Follow renaming of SPI
 "master" to "controller"
Message-ID: <20240122191317.5924f087@xps-13>
In-Reply-To: 
 <63d7d1f1e6fe564daf034c66eb3073aa265b7969.1705944943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
	<63d7d1f1e6fe564daf034c66eb3073aa265b7969.1705944943.git.u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: RKF6FD2Q5TOGND3X7HQITM5HXEMAKZTM
X-Message-ID-Hash: RKF6FD2Q5TOGND3X7HQITM5HXEMAKZTM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RKF6FD2Q5TOGND3X7HQITM5HXEMAKZTM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Uwe,

u.kleine-koenig@pengutronix.de wrote on Mon, 22 Jan 2024 19:07:07 +0100:

> In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
> some functions and struct members were renamed. To not break all drivers
> compatibility macros were provided.
>=20
> To be able to remove these compatibility macros push the renaming into
> this driver.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

I think I read in the previous thread that Mark would apply them all
through his tree, I am fine with that so here is my Acked-by. In case I
misunderstood the thread or at the end you/Mark prefer to let the
patches go through the trees they normally belong to, just let me know.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
