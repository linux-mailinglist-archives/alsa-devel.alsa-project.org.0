Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F717D7046
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 17:02:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3013E1EC;
	Wed, 25 Oct 2023 17:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3013E1EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698246121;
	bh=Qtwkz76zJyKLsJ2oQlA+GKI3dyrrC7Ysr9jlHHmSzt8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jOOEjLVbz8rGgdNKvCkp/zYEUgui7tNAQjMVwWsJHl7dFMRNXhHWss0YmGP8U96rN
	 mlD+56l85Epl9u84oSYzWnsTuKNA+DVGCiBxtoArsGJG3FvUULfIw/XO1e/XepkSOu
	 JLfOfprsSaLVfRO/gNXGuVpOSWR23+OkwGaCdvwM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FA8BF8024E; Wed, 25 Oct 2023 17:01:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DFCFF80152;
	Wed, 25 Oct 2023 17:01:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55CE2F80165; Wed, 25 Oct 2023 17:01:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCB36F8010B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 17:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCB36F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q3kFInjh
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8F43C000F;
	Wed, 25 Oct 2023 15:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698246054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yH7ih/sENBHheaY4sC23vjZWR5QPhO2FB5uDgGmBUEE=;
	b=Q3kFInjh7UIlv2i9yjPV+QU4V85L5o5uVFoPjbdjL//6+E7uHPH6qKo6VtFDApky9mvBZR
	DLu9NkXUD5OxfTo6itNQvOGypacNFCTLN9WVTaPz0FqcOhRwPMyGfxtOcSfDuL7/skp8vX
	Xi0TkyJYpNrsUrKOLGJVtQuYOi+gWoYdjSS/UVjEa2e22L9HGWc4DrymLHD7I/JWSwkFqm
	89zhexE6c2ltXbqig51XVG6K1DOiQZZDzAVHFzwstX5/KXfaw66BE90pcuR8wCZ76roTNp
	RW+shC4dBtvTe/L6r6lvIDt4EzZod8+c2krxeBAs7QIBUwZpDZyN+x2UlhjNHw==
Date: Wed, 25 Oct 2023 17:00:51 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
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
 alsa-devel@alsa-project.org, Simon Horman <horms@kernel.org>, Christophe
 JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 00/30] Add support for QMC HDLC, framer
 infrastructure and PEF2256 framer
Message-ID: <20231025170051.27dc83ea@bootlin.com>
In-Reply-To: <20231013164647.7855f09a@kernel.org>
References: <20231011061437.64213-1-herve.codina@bootlin.com>
	<20231013164647.7855f09a@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: RKNTCXOK2UTD6JFWZIVK7KVZEDVXT6XK
X-Message-ID-Hash: RKNTCXOK2UTD6JFWZIVK7KVZEDVXT6XK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RKNTCXOK2UTD6JFWZIVK7KVZEDVXT6XK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi All, Maintainers

On Fri, 13 Oct 2023 16:46:47 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Wed, 11 Oct 2023 08:14:04 +0200 Herve Codina wrote:
> > Compare to the previous iteration
> >   https://lore.kernel.org/linux-kernel/20230928070652.330429-1-herve.codina@bootlin.com/
> > This v8 series:
> >  - Fixes a race condition
> >  - Uses menuconfig instead of menu and hides CONFIG_GENERIC_FRAMER
> >  - Performs minor changes  
> 
> Which way will those patches go? Via some FSL SoC tree?

This series seems mature now.
What is the plan next in order to have it applied ?

Don't hesitate to tell me if you prefer split series.

Best regards,
Hervé
