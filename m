Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0987BF5EB
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 10:31:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 436E5FCE;
	Tue, 10 Oct 2023 10:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 436E5FCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696926669;
	bh=p+T1Q0rqoGClJy+72BMBs9BUZqEcavRypdOwHINOMe4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G8P+oiSKO6T6tJ83pQlmy7IJqU0P6y0/+XqJW03D5I1kazxmHi3C36W5rg0KpAe1m
	 +kxLGzyoklFq5NrXCFNagjVD69uGriPe4CWP/GWqbNb0JPgi5bstNY+dOE9fDMlrlC
	 lzKdbtGktnfdXcAHQ6R9s2v69KZfrfLcUySw5+PY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADA41F80536; Tue, 10 Oct 2023 10:30:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE00EF8019B;
	Tue, 10 Oct 2023 10:30:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE380F80130; Tue, 10 Oct 2023 10:30:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61577F80166
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 10:30:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61577F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d2/GYvHB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 182D9E0008;
	Tue, 10 Oct 2023 08:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696926600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NaOw8PSc0VULjmhxAa6nnKNT5QXhrjoUDdxFuVyTpCM=;
	b=d2/GYvHBSkcMRXi9pmcOlLcCOzYlqnrIh22gZ99/gFbL/M7ys56o4fhkMnDPId8GrsjWCC
	5ouyZmnYSGtztbw5b3KORr9N47KIDYuaBQUiGc3Xf/ZDdUH8+/jT/SFGq05ljDkT54hN13
	hx19s0wFiBqyB6uDlurPSlGYgMd3j25Og2nZrBv+EZ8JoEtmpYOsJTJFZCGD6qgRxTFCDK
	FZ/Gn35OaUtNi/MGYMXczmwjExd6qASdYRlrPa0Xtf0BY5UrQHKeqALrbgvp/3zYz4JUyV
	QEMOADOF32CCiQH10GW8t3f+hFHXxsyHOaUNrGK7QRLSZ6PLjrkZyGoU9RNvDQ==
Date: Tue, 10 Oct 2023 10:29:45 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, Simon
 Horman <horms@kernel.org>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v7 26/30] net: wan: framer: Add support for the Lantiq
 PEF2256 framer
Message-ID: <20231010102945.39c27b1d@bootlin.com>
In-Reply-To: <20231006150252.6d45be95@kernel.org>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
	<20230928070652.330429-27-herve.codina@bootlin.com>
	<20231006150252.6d45be95@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: BUZENCHFHLMX7SFG7Q7GG2VMGZSYGNQQ
X-Message-ID-Hash: BUZENCHFHLMX7SFG7Q7GG2VMGZSYGNQQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BUZENCHFHLMX7SFG7Q7GG2VMGZSYGNQQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jakub,

On Fri, 6 Oct 2023 15:02:52 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 28 Sep 2023 09:06:44 +0200 Herve Codina wrote:
> > +	for (i = 0; i < count; i++) {
> > +		(audio_devs + i)->name = "framer-codec";
> > +		(audio_devs + i)->of_compatible = compatible;
> > +		(audio_devs + i)->id = i;  
> 
> Why not array notation?

Will be change in the next iteration.

> 
> > +	}
> > +
> > +	ret = mfd_add_devices(pef2256->dev, 0, audio_devs, count, NULL, 0, NULL);  
> 
> Should Lee be CCed for the MFD part?

Will be added to the CC list.

Best regards,
Hervé
