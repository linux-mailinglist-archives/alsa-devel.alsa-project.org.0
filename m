Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3094777633F
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 17:02:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39AD4826;
	Wed,  9 Aug 2023 17:01:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39AD4826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691593368;
	bh=Mn7od1dzob1PoqrGCeevnG/kvdiqoKthf3bsDS9qWkc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R9AdA1jLKo7N5QwJaNOrK16q/npXZ/c2I40BpZIMXot33prg3rvcT0Kib6KvCwBdt
	 UZU5VXIme9++jIIHa3GvSbvQ9iu4lQFe96u+etAx3KxRqS2wJGDmLWQxYxOlyy9D0G
	 gC+kODImNpLc0W8WUKD/S3XXpyGCcvfcS6Wnniuw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75B60F801EB; Wed,  9 Aug 2023 17:01:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36F97F80116;
	Wed,  9 Aug 2023 17:01:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AD89F80134; Wed,  9 Aug 2023 17:01:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8D3DF800FB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 17:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D3DF800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iXnta/0e
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08F12E0008;
	Wed,  9 Aug 2023 15:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691593306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g0zvfLvyRJt7hOgvNIifYjQHxyaOMWD1ltEX2pdHMbc=;
	b=iXnta/0eS8D5cHJ76Q4dwhU+XK3qsGA5Twh8/3mjUO44s+pEvR/n0UP3phDRDaRzknJJqg
	U0Po6QG77G0tYGseNfrgZzZ+oWZIReHQUy/j7wwlAqPpgNMdWXCyXkv/pWCbZTB17U0vBq
	09x+R9HSs6PA9O+bm3Z01VLxBArlIT/tenAyyV94zuJu4ABgfwHf1jlpBmT9JL/aTrx54e
	xulDWbuzkyyvyvjDTlEeKHtRrqbNHF9NWfFODttuROxRsjNMQwXq4dUnuY5B9C5WUAcO8L
	rl4cb1owoaMRbW2+7s4uQte7dbC1HrDGo95q3ov+1CrqQAidzdIy5MawOqVkLw==
Date: Wed, 9 Aug 2023 17:01:39 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 21/28] net: wan: Add framer framework support
Message-ID: <20230809170139.2402e4a2@bootlin.com>
In-Reply-To: <cc9417a3-ef86-bb46-9519-cf65b03b5f08@infradead.org>
References: <20230809132757.2470544-1-herve.codina@bootlin.com>
	<20230809132757.2470544-22-herve.codina@bootlin.com>
	<cc9417a3-ef86-bb46-9519-cf65b03b5f08@infradead.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: MYIXFVLKFIENBUQ6C47MC2J2KBJO2OSA
X-Message-ID-Hash: MYIXFVLKFIENBUQ6C47MC2J2KBJO2OSA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MYIXFVLKFIENBUQ6C47MC2J2KBJO2OSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Randy,

On Wed, 9 Aug 2023 07:24:32 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Hi,
> 
> On 8/9/23 06:27, Herve Codina wrote:
> > diff --git a/drivers/net/wan/framer/Kconfig b/drivers/net/wan/framer/Kconfig
> > new file mode 100644
> > index 000000000000..96ef1e7ba8eb
> > --- /dev/null
> > +++ b/drivers/net/wan/framer/Kconfig
> > @@ -0,0 +1,19 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# FRAMER
> > +#
> > +
> > +menu "Framer Subsystem"
> > +
> > +config GENERIC_FRAMER
> > +	bool "Framer Core"  
> 
> Just curious: any reason that this cannot be tristate (i.e., a loadable module)?
> Thanks.

For the same reasons as generic phy cannot be built as module
  b51fbf9fb0c3 phy-core: Don't allow building phy-core as a module

In the framer case, this allows to have the QMC HDLC driver built on systems
without any framers (no providers and no framer core framework).
Also the framer phandle is optional in the device tree QMC HDLC node.

Regards,
Hervé

> 
> > +	help
> > +	  Generic Framer support.
> > +
> > +	  This framework is designed to provide a generic interface for framer
> > +	  devices present in the kernel. This layer will have the generic
> > +	  API by which framer drivers can create framer using the framer
> > +	  framework and framer users can obtain reference to the framer.
> > +	  All the users of this framework should select this config.
> > +
> > +endmenu  
> 



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
