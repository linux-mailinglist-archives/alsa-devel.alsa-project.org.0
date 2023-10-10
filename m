Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E537BF52E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 10:01:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D14B8F9A;
	Tue, 10 Oct 2023 10:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D14B8F9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696924877;
	bh=AN7ELeTSudhhQMwXqFObqw5NBfIIZyn8BBnr1/0eo2Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ijHm1mFCsf4b31CD2LnfAgK3tDky+7fJ2USBhdO2QonnUnlBiMCn/bqEPdrZmpQ95
	 2Ogq/mxfkofXneT5sHZumkQG+OBegCjjfG1wTllDpyTUQ5h5g3Trch5OUaOEXxieGA
	 Y98NRlFCs1fFTh5rc9AI/BGplVbveEhd/X+r0Hns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9ADDCF80553; Tue, 10 Oct 2023 10:00:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B109F8027B;
	Tue, 10 Oct 2023 10:00:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E369F802BE; Tue, 10 Oct 2023 09:57:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2BC8F80166
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 09:57:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2BC8F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UAlqB76M
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7D45C0017;
	Tue, 10 Oct 2023 07:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696924659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8HGCDW6dA/uAJ0GZAXHKMPSuwZNEP4AsO/ZK/lFHFUk=;
	b=UAlqB76MFympUYcFakSns2mIOgF13pHihMAEYgL1b92u9tsMq8XEVIkpDSc2USgjXn29Dj
	teMJY1lY51yixmRurzbAu6X/It5Prspi6Id1Wa32QHK/EHhiboyV1E/GwksW+XgJBr/BD+
	gMzW3HEboeZULdc0q/po4tOFO145hK5LVo9/hA9YMl3NC5d4IgxP0MpIywwHIVhWpcYl7C
	742U/PmD0Bnm2nlDzGfyngXvb5P5pZawz1yZlpNRIWYKL94NO72XcNjZfdd26znmNKgahB
	ft3/z9/2lF6GWH7GXWiTQEQSVY54kM8V13b7SYnq1pYaTJi9zxGcx8zm4m1HJA==
Date: Tue, 10 Oct 2023 09:57:33 +0200
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
Subject: Re: [PATCH v7 24/30] net: wan: Add framer framework support
Message-ID: <20231010095733.6899abbb@bootlin.com>
In-Reply-To: <20231006150810.09e2c1a9@kernel.org>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
	<20230928070652.330429-25-herve.codina@bootlin.com>
	<20231006150810.09e2c1a9@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: OTH3PY4MW5XWUMQTHAJ5QR5MH4NKUI4K
X-Message-ID-Hash: OTH3PY4MW5XWUMQTHAJ5QR5MH4NKUI4K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OTH3PY4MW5XWUMQTHAJ5QR5MH4NKUI4K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jakub

On Fri, 6 Oct 2023 15:08:10 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 28 Sep 2023 09:06:42 +0200 Herve Codina wrote:
> > +menu "Framer Subsystem"
> > +
> > +config GENERIC_FRAMER
> > +	bool "Framer Core"
> > +	help
> > +	  Generic Framer support.
> > +	  A framer is a component in charge of an E1/T1 line interface.
> > +	  Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
> > +	  frames. It also provides information related to the E1/T1 line.
> > +	  Used with HDLC, the network can be reached through the E1/T1 line.
> > +
> > +	  This framework is designed to provide a generic interface for framer
> > +	  devices present in the kernel. This layer will have the generic
> > +	  API by which framer drivers can create framer using the framer
> > +	  framework and framer users can obtain reference to the framer.
> > +	  All the users of this framework should select this config.  
> 
> maybe make the menu a menuconfig with info about framers but hide 
> the GENERIC_FRAMER symbol? The driver 'select' it anyway, what's
> the point of prompting the user..

Yes, I will change in the next iteration.

> 
> > +	if (WARN_ON(!dev))
> > +		return ERR_PTR(-EINVAL);  
> 
> no defensive programming, let the kernel crash

Will be changed.

> 
> > +	ret = framer_pm_runtime_get_sync(framer);
> > +	if (ret < 0 && ret != -EOPNOTSUPP)
> > +		goto err_pm_sync;
> > +
> > +	ret = 0; /* Override possible ret == -EOPNOTSUPP */  
> 
> This looks pointless given that ret is either overwritten or not used
> later on

Indeed. Will be removed in the next iteration.

> 
> > +	mutex_lock(&framer->mutex);
> > +	if (framer->power_count == 0 && framer->ops->power_on) {
> > +		ret = framer->ops->power_on(framer);
> > +		if (ret < 0) {
> > +			dev_err(&framer->dev, "framer poweron failed --> %d\n", ret);
> > +			goto err_pwr_on;
> > +		}
> > +	}
> > +	++framer->power_count;
> > +	mutex_unlock(&framer->mutex);
> > +	return 0;  

Best regards,
Hervé
