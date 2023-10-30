Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D39D7DC1FA
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 22:33:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 100531DA;
	Mon, 30 Oct 2023 22:32:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 100531DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698701616;
	bh=3c+Ng71WVMssVVmhpNCGjEvoNbhVLKCdsWrjlOc9YOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pZvijGDMv+mjt2wlz38QJYIReOeeln5DSd9IUkGh1o2NJrQT51Ll+rbADwiVcJdl9
	 wDG74ODs3+Rsjskm19G6unafLT14Ysn685i8gsDopb+Gi4K1CFov8oswhW38idhrOy
	 n64sFA1ZhTKbccBlHHRrAM3dUDnWDTBHc81uKsGY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 910EDF8020D; Mon, 30 Oct 2023 22:32:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9CD3F80166;
	Mon, 30 Oct 2023 22:32:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA10EF8016D; Mon, 30 Oct 2023 22:32:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AA07F8014B
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 22:31:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AA07F8014B
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3b40d5ea323so3087115b6e.0
        for <alsa-devel@alsa-project.org>;
 Mon, 30 Oct 2023 14:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698701508; x=1699306308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuBaURUuWJkEQpbZhWeSxspKPPb+Lr69ekE2ADTt8Wc=;
        b=ABkSGxSD6ekDZaa9RkGWUaG8/JfAOHCZKv3gQoCGi0Oz+CzDUiWdGXHIPCqfMyXgPk
         iVJkJw4VnAQ2SUNv9rBnTPIJDylQTn6WDwA0jDrjNypkP7oRIQ2hMxJqoc40pEyd+MLs
         4IA0/bNzfYjXg7WAkb2XaIgdnHowA2dzXI+xon2hPt2D7AzobaOAkTN4VH+ahuwnv7mn
         7kDJPktw9UjbdwANTNIOBpfsaUSE/+nVxl9S6F4FaiEBQZdoWk6eQkaCvT0I+hUHt3u1
         f5ObtufjQKsfNtMUL+MEYL4R3+RcPWqemkM/uAxegfmsvcjflUY0/t5SbF0VUjSlgpO4
         5XqA==
X-Gm-Message-State: AOJu0YzUo7hPK+FxOPXN80/WXXBlqmzjYOd6wgwMMS+vKm9yZujly7JD
	iW8W1ZKl8+t6PkNqSrVlIQ==
X-Google-Smtp-Source: 
 AGHT+IGKuby//PdBhTBpw28HsYfEui30ghahooRRo1gU9DZgJ7OM+SQsCkxRsIdIYwyzeeSbhBnk8w==
X-Received: by 2002:a05:6808:1789:b0:3ae:554b:9c97 with SMTP id
 bg9-20020a056808178900b003ae554b9c97mr14084990oib.37.1698701508322;
        Mon, 30 Oct 2023 14:31:48 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 e22-20020a05680809b600b003afc33bf048sm1518710oig.2.2023.10.30.14.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 14:31:47 -0700 (PDT)
Received: (nullmailer pid 2495794 invoked by uid 1000);
	Mon, 30 Oct 2023 21:31:46 -0000
Date: Mon, 30 Oct 2023 16:31:46 -0500
From: Rob Herring <robh@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Li Yang <leoyang.li@nxp.com>, Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
 Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org, Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 00/30] Add support for QMC HDLC, framer infrastructure
 and PEF2256 framer
Message-ID: <20231030213146.GA2490536-robh@kernel.org>
References: <20231011061437.64213-1-herve.codina@bootlin.com>
 <20231013164647.7855f09a@kernel.org>
 <20231025170051.27dc83ea@bootlin.com>
 <20231025123215.5caca7d4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025123215.5caca7d4@kernel.org>
Message-ID-Hash: KY5XVSWYZMWXU2UHNH34327P6UQTLXBS
X-Message-ID-Hash: KY5XVSWYZMWXU2UHNH34327P6UQTLXBS
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KY5XVSWYZMWXU2UHNH34327P6UQTLXBS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 25, 2023 at 12:32:15PM -0700, Jakub Kicinski wrote:
> On Wed, 25 Oct 2023 17:00:51 +0200 Herve Codina wrote:
> > > Which way will those patches go? Via some FSL SoC tree?  
> > 
> > This series seems mature now.
> > What is the plan next in order to have it applied ?
> > 
> > Don't hesitate to tell me if you prefer split series.
> 
> FWIW we are happy to take the drivers/net/ parts if there is no hard
> dependency. But there's no point taking that unless the SoC bits
> also go in for 6.7.
> 
> Li Yang, what are your expectations WRT merging this series?

I think it is too late for SoC stuff for 6.7. 

I picked up binding patches 6, 7, and 8 because 6 and 7 are the same as 
an additionalProperties fix I have in my tree. As 8 depends on them, I 
just picked it up too.

Rob
