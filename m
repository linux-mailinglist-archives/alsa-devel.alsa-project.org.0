Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 780E26BB8AF
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:55:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3102151E;
	Wed, 15 Mar 2023 16:55:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3102151E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895755;
	bh=OkVq19itkiZ5IKgC+W9LSNBxq0a37uBfwKKhTgIfpik=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=kdIm5pkHKWUHvWt20oN4b2l00vet2bvpqEiv0Z7XxVldzYrPVhOP6VitnbTaoRytX
	 ZDfhvWhRtB3zXEYx3c2jgVZ/U3bvCf5V/C+SUKyvEV5BpiimY9GwReIKmlehQgAejc
	 slpUu20uHvfpi1pDwhk5yBYXgEQjmJljxXo6lOK8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A94BF8057B;
	Wed, 15 Mar 2023 16:49:54 +0100 (CET)
Date: Wed, 15 Mar 2023 16:49:37 +0100
Subject: Re: [PATCH 000/173] ALSA/ASoC: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "V sujith
 kumar Reddy" <Vsujithkumar.Reddy@amd.com>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik
	<robert.jarzmik@free.fr>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>, Thierry Reding
	<thierry.reding@gmail.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVFBO35TRVSVMHFKSQKU2MH5NJCIJZ5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167889539328.26.17410622248242166205@mailman-core.alsa-project.org>
From: Nicolas Ferre via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: alsa-devel@alsa-project.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1E03F8057C; Wed, 15 Mar 2023 16:49:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4942F80571
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:49:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4942F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=EiLTLAoP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678895386; x=1710431386;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=94Ppq6glVFWTSx4HQAWy+jpx5DxhImXZl0FloQYodAA=;
  b=EiLTLAoP9Njy997k2kECAPIr9lFBkKG7kLLHQJhaIkrJse3e8RV8RbLr
   LrdCuWC7MTf+CrWnlMfxHdwQzow3dPsX8GCVA5M0JiQlNcMcc1IqFTnyk
   4s2yVyowztneiRlYhaACAs19OEJKdflMO/++pJAuvy3jyOcGEEd9nFnlY
   XECxn4FqRusTZCseeM6fuo7rBztOLg/Df7GC5ZQ8U78es1ZZnXwQZsewb
   EMtKr701W7+PRB/fdoJc0TI1oYsa+sQ9VUKJn3OBOsGWoSJIYZ1TmrlWA
   tSfrQ7iWUhuFXWZ0SFWIGf45c+gu1dDvNh1YaYsXygn6ijyHGGHrvBmhK
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,262,1673938800";
   d="scan'208";a="204909044"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Mar 2023 08:49:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 08:49:40 -0700
Received: from [10.12.72.20] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 15 Mar 2023 08:49:38 -0700
Message-ID: <08f36874-1ac9-bc48-869a-720400085557@microchip.com>
Date: Wed, 15 Mar 2023 16:49:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 000/173] ALSA/ASoC: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "V sujith
 kumar Reddy" <Vsujithkumar.Reddy@amd.com>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik
	<robert.jarzmik@free.fr>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>, Thierry Reding
	<thierry.reding@gmail.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HVFBO35TRVSVMHFKSQKU2MH5NJCIJZ5L
X-Message-ID-Hash: HVFBO35TRVSVMHFKSQKU2MH5NJCIJZ5L
X-MailFrom: Nicolas.Ferre@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVFBO35TRVSVMHFKSQKU2MH5NJCIJZ5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

(with reduced sending list)

On 15/03/2023 at 16:04, Uwe Kleine-König wrote:
> Hello,
> 
> this series adapts the platform drivers below sound/ to use the .remove_new()
> callback. Compared to the traditional .remove() callback .remove_new() returns
> no value. This is a good thing because the driver core doesn't (and cannot)
> cope for errors during remove. The only effect of a non-zero return value in
> .remove() is that the driver core emits a warning. The device is removed anyhow
> and an early return from .remove() usually yields a resource leak.
> 
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
> 
> The first two patches simplify a driver each to return zero unconditionally,
> and then all drivers are trivially converted to .remove_new().
> 
> There are nearly no interdependencies in this patch set---only 1 <- 11 and
> 2 <- 16. So even if some individual problems are found (I don't expect that),
> the other patches can (and from my POV should) still be applied.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (173):

[..]
>    ALSA: atmel: ac97: Convert to platform remove callback returning void
[..]
>    ASoC: atmel: atmel-i2s: Convert to platform remove callback returning
>      void
>    ASoC: atmel: atmel_wm8904: Convert to platform remove callback
>      returning void
>    ASoC: atmel: mchp-i2s-mcc: Convert to platform remove callback
>      returning void
>    ASoC: atmel: mchp-pdmc: Convert to platform remove callback returning
>      void
>    ASoC: atmel: mchp-spdifrx: Convert to platform remove callback
>      returning void
>    ASoC: atmel: mchp-spdiftx: Convert to platform remove callback
>      returning void
>    ASoC: atmel: mikroe-proto: Convert to platform remove callback
>      returning void
>    ASoC: atmel: sam9g20_wm8731: Convert to platform remove callback
>      returning void
>    ASoC: atmel: sam9x5_wm8731: Convert to platform remove callback
>      returning void
>    ASoC: atmel: tse850-pcm5142: Convert to platform remove callback
>      returning void

For all "atmel" related changes:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Uwe!

[..]

>   171 files changed, 345 insertions(+), 654 deletions(-)
> 
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
> --
> 2.39.2
> 

Regards,
-- 
Nicolas Ferre

