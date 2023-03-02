Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CFC6A7A86
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 05:34:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E62C01F9;
	Thu,  2 Mar 2023 05:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E62C01F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677731647;
	bh=z7XH4Pck2obKvHWgumzadusXlBkpmVZ9RS92+m5IOSk=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=btc178qfU/gOfiYNjM7SUgcWoJkukqtZ36VICum82WA0/Ej8K/gp1eJnya8J48DV2
	 ekpFbn2Qrhnz3n6scz/A2ROWMD2XO8dHvbLDw+sL530R26z37ztgY0iLtsiu0FlO/8
	 u1EoYXTLRRST70Q0BfabVVE1JQBe62clQ/WnH844=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FCCBF80310;
	Thu,  2 Mar 2023 05:33:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C58ECF8049C; Thu,  2 Mar 2023 05:33:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0A36F80236
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 05:33:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0A36F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=ggbJOziX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677731584; x=1709267584;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=z7XH4Pck2obKvHWgumzadusXlBkpmVZ9RS92+m5IOSk=;
  b=ggbJOziX3HBNW3da5Z3hsRl87kRC0zqfsSJEDYj+KrANJzvVUQQuy1IS
   icQHt/6inb2Via9Us6vS+Ea/k3hgv8vLIqaCqJTeiTwVHmNIiSqo24Fje
   6dT6hhNAx1OYh/87iS4SMg3d5xBROj2KWuw0YsCNR9ZYesT3bqcXV2Xch
   vnx/WNC3kJzDPHnqr+cCdGn8rXhSIh4ysF5wjaE6NmqtrygSUDXQ8oImE
   PMbYXTVfswFntyhbm4sRdfKT5bkoJoIyk9j2qHy8WkRjWvMJxaom1s7r/
   oNa+skkAgA/u3uHN3WiG4GicPH91R02FZqqTtYKGDhIO7sjJwO5vpwoGV
   g==;
X-IronPort-AV: E=Sophos;i="5.98,226,1673938800";
   d="scan'208";a="203185791"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2023 21:32:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Mar 2023 21:32:56 -0700
Received: from [10.40.24.88] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Wed, 1 Mar 2023 21:32:52 -0700
Message-ID: <c379dc5d-46ec-613e-22ec-eba94c399a90@microchip.com>
Date: Thu, 2 Mar 2023 10:02:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 7/8] MAINTAINERS: add myself as maintainer for Microchip
 AT91 sound drivers
To: Claudiu Beznea <claudiu.beznea@microchip.com>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<alexandre.belloni@bootlin.com>
References: <20230301113807.24036-1-claudiu.beznea@microchip.com>
 <20230301113807.24036-8-claudiu.beznea@microchip.com>
Content-Language: en-US
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230301113807.24036-8-claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RVZX47WUTKVWHMR2J2M2E56XSPS2S4BI
X-Message-ID-Hash: RVZX47WUTKVWHMR2J2M2E56XSPS2S4BI
X-MailFrom: Nicolas.Ferre@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVZX47WUTKVWHMR2J2M2E56XSPS2S4BI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 01/03/2023 at 17:08, Claudiu Beznea wrote:
> Codrin is not with Microchip anymore. As I worked lately with Microchip
> AT91 sound drivers add myself as maintainer for these.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Claudiu for taking this responsibility!

Best regards,
   Nicolas

> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e246c16aff6..252cc33f0f5c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13666,7 +13666,7 @@ F:	Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
>   F:	drivers/spi/spi-at91-usart.c
>   
>   MICROCHIP AUDIO ASOC DRIVERS
> -M:	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> +M:	Claudiu Beznea <claudiu.beznea@microchip.com>
>   L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>   S:	Supported
>   F:	sound/soc/atmel
> @@ -13833,7 +13833,7 @@ S:	Supported
>   F:	drivers/spi/spi-atmel.*
>   
>   MICROCHIP SSC DRIVER
> -M:	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> +M:	Claudiu Beznea <claudiu.beznea@microchip.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Supported
>   F:	drivers/misc/atmel-ssc.c

-- 
Nicolas Ferre

