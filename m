Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCAC6BAC4C
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 10:40:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5107512BC;
	Wed, 15 Mar 2023 10:39:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5107512BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678873214;
	bh=wL+PNG2V4rZYJyKxvK3zy6PvSaH0yYQw4kOby9GPO1Y=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=mFU3sBr9MJFRoyfD1LlI0JwXa6v4KFGTJs/+bg3/1LGO9QQ5xbASHZ+MaDdITCH5Z
	 AP137ETyTCPCHdMd0NYiL05GhzVWrOm7Mnsiof6kyWHMPrTjYeoW4tHYclpQft4s8S
	 DzScItKzjSJGYZcLYNHEevz5znHd3fSFYCPaGeFk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2851F8032D;
	Wed, 15 Mar 2023 10:39:23 +0100 (CET)
Date: Wed, 15 Mar 2023 10:39:01 +0100
Subject: Re: [PATCH 2/6] ASoC: atmel: remove unnecessary dai_link->platform
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	<broonie@kernel.org>
References: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
 <875yb2jz2p.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875yb2jz2p.wl-kuninori.morimoto.gx@renesas.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YWHAG7G6BD2RVBCWHZ7ZY2ZW6JHSHE6D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167887316264.26.9439280345189500159@mailman-core.alsa-project.org>
From: Nicolas Ferre via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCE1EF80423; Wed, 15 Mar 2023 10:39:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D651F80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 10:39:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D651F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=I3wNcqtB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678873152; x=1710409152;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=b6RerQBIdvt5mTsOY6d3cEg5RypcqLBpFYRfW/hp3SE=;
  b=I3wNcqtBc4/rFq0oxy1Vvv2xxF5HlBJYvLFl8Oc6qqModCYedtyHRl6D
   /Y42ztwFCdQWYlC8Sw1+rCYOao4IkTDUjjM60Dj5P/pS1+MyOWEkySwmh
   KFvSsdNrbEnZc8quQmucuOwLt0XFg+Hj8Fs18AIebJ+GAdLaUW5c9GzUd
   eNnWTNbtUudfP9pc7/i0CRNnH97J4jotz8fxr3AnX6Xr6YKvd8pO/7lV2
   j+KyYupEF6z64g2Kx/f5Y8ymO+yDzj4A7YAu4rwzlbeJOA7i+ZNvA/If6
   Ltrlh1KiJ52ft5EoBZt3Kk+OqFagfdA6mLUrnip/V1Ld9OiAkzJoFwqKX
   A==;
X-IronPort-AV: E=Sophos;i="5.98,262,1673938800";
   d="scan'208";a="201730663"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Mar 2023 02:39:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 02:39:03 -0700
Received: from [10.12.72.20] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 15 Mar 2023 02:39:02 -0700
Message-ID: <1b866f77-8b74-9015-395f-c2f43d0f3388@microchip.com>
Date: Wed, 15 Mar 2023 10:39:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/6] ASoC: atmel: remove unnecessary dai_link->platform
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	<broonie@kernel.org>
References: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
 <875yb2jz2p.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <875yb2jz2p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YWHAG7G6BD2RVBCWHZ7ZY2ZW6JHSHE6D
X-Message-ID-Hash: YWHAG7G6BD2RVBCWHZ7ZY2ZW6JHSHE6D
X-MailFrom: Nicolas.Ferre@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YWHAG7G6BD2RVBCWHZ7ZY2ZW6JHSHE6D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15/03/2023 at 07:41, Kuninori Morimoto wrote:
> dai_link->platform is no longer needed if CPU and Platform are
> same Component. This patch removes unnecessary dai_link->platform.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

It looks good to me:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Kuninori for having taken care of these drivers. Best regards,
   Nicolas

> ---
>   sound/soc/atmel/atmel-classd.c | 5 +----
>   sound/soc/atmel/atmel-pdmic.c  | 5 +----
>   2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
> index 9883e6867fd1..007ab746973d 100644
> --- a/sound/soc/atmel/atmel-classd.c
> +++ b/sound/soc/atmel/atmel-classd.c
> @@ -473,24 +473,21 @@ static int atmel_classd_asoc_card_init(struct device *dev,
>          if (!dai_link)
>                  return -ENOMEM;
> 
> -       comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
> +       comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
>          if (!comp)
>                  return -ENOMEM;
> 
>          dai_link->cpus          = &comp[0];
>          dai_link->codecs        = &comp[1];
> -       dai_link->platforms     = &comp[2];
> 
>          dai_link->num_cpus      = 1;
>          dai_link->num_codecs    = 1;
> -       dai_link->num_platforms = 1;
> 
>          dai_link->name                  = "CLASSD";
>          dai_link->stream_name           = "CLASSD PCM";
>          dai_link->codecs->dai_name      = "snd-soc-dummy-dai";
>          dai_link->cpus->dai_name        = dev_name(dev);
>          dai_link->codecs->name          = "snd-soc-dummy";
> -       dai_link->platforms->name       = dev_name(dev);
> 
>          card->dai_link  = dai_link;
>          card->num_links = 1;
> diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
> index 12cd40b15644..00c7b3a34ef5 100644
> --- a/sound/soc/atmel/atmel-pdmic.c
> +++ b/sound/soc/atmel/atmel-pdmic.c
> @@ -496,24 +496,21 @@ static int atmel_pdmic_asoc_card_init(struct device *dev,
>          if (!dai_link)
>                  return -ENOMEM;
> 
> -       comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
> +       comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
>          if (!comp)
>                  return -ENOMEM;
> 
>          dai_link->cpus          = &comp[0];
>          dai_link->codecs        = &comp[1];
> -       dai_link->platforms     = &comp[2];
> 
>          dai_link->num_cpus      = 1;
>          dai_link->num_codecs    = 1;
> -       dai_link->num_platforms = 1;
> 
>          dai_link->name                  = "PDMIC";
>          dai_link->stream_name           = "PDMIC PCM";
>          dai_link->codecs->dai_name      = "snd-soc-dummy-dai";
>          dai_link->cpus->dai_name        = dev_name(dev);
>          dai_link->codecs->name          = "snd-soc-dummy";
> -       dai_link->platforms->name       = dev_name(dev);
> 
>          card->dai_link  = dai_link;
>          card->num_links = 1;
> --
> 2.25.1
> 

-- 
Nicolas Ferre

