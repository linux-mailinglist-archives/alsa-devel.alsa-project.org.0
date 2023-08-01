Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ED276B1DF
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 12:33:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F5E9823;
	Tue,  1 Aug 2023 12:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F5E9823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690885984;
	bh=scf+PKFAbn0AaWvvUlWuWxZWNZDx+slysWmszaaIKOY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BANOdn61LzeJFfC+bmximlrgwgO8BtJHTF06WliaXcTIubd5NiMD8w+Mb8BHi4dwU
	 I9vPTY9iegZJltxPbPkBY2oz+t092gvWD3DbHMbFd+o0XvpVnmLiIFE7zoYWfaE55h
	 ArdSCQLjx/O0mUjihM7mtZY2zY7p9LXGtN9amCqc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B2DBF801D5; Tue,  1 Aug 2023 12:32:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFF63F8016D;
	Tue,  1 Aug 2023 12:32:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB7EDF801D5; Tue,  1 Aug 2023 12:32:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 022BEF8015B
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 12:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 022BEF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JxxdURr/
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C9FB6000B;
	Tue,  1 Aug 2023 10:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690885926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=crWIDh8u3C6yGMtEBsqKiRUmuQ9xvfip/08OZw3qp2U=;
	b=JxxdURr/SHVVPuDRogfmx5lRXOm41IU5riBIedWEmVuiVqPdUjUgVOzQRcA4n+Mqpm/GKZ
	GxbliO3UUvoreyeNdm3JK8O2QQpHimTInkkjgmimmlJ5XUlMcKE2QY7/fL046n/EPFesxk
	Kpe+Prgr/5Xj8CWh34jTJwxFnzFBu44/qi/zNcAmbKxZu2nWFo2xPnbTvu5AwwTRU6O5kB
	0TIZ5eSZQJiWTjXJfJyuPmvtn+0vzD9VjRdGVGbjfioxvgXogblhab9rMnoKZ0f2NI5/el
	ZJX7GFdpLoLgqvN1aIyOK7N0mehJJpv5Wh4/sjbs5BeuriC3SCdryRdKPIgyXA==
Date: Tue, 1 Aug 2023 12:32:01 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 20/28] net: wan: Add framer framework support
Message-ID: <20230801123201.25dee219@bootlin.com>
In-Reply-To: <84d6431f-bb55-4224-a4a5-45d7036f1e38@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-21-herve.codina@bootlin.com>
	<84d6431f-bb55-4224-a4a5-45d7036f1e38@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: HUPAAWYHTFMMQ6Y4FE6RRVKI7IPMMT3U
X-Message-ID-Hash: HUPAAWYHTFMMQ6Y4FE6RRVKI7IPMMT3U
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HUPAAWYHTFMMQ6Y4FE6RRVKI7IPMMT3U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 1 Aug 2023 11:56:12 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +int framer_pm_runtime_get(struct framer *framer)
> > +{
> > +	int ret;
> > +
> > +	if (!framer)
> > +		return 0;  
> 
> Can framer be a NULL pointer? This sort of test often covers up
> bugs. So either let it dereference the NULL pointer and opps, or
> return -EINVAL.
> 

Well, in the current usage, it cannot be a NULL pointer.
I will simply remove the check (every where it is present) and
dereference the pointer instead of returning -EINVAL.

Regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
