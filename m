Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 804E798BC40
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:38:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F6C4E8E;
	Tue,  1 Oct 2024 14:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F6C4E8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786329;
	bh=mWoPMcI7ji8ZME18L6ZMT3RlitxSf5eGF1zuPbBA8hQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZuRppOA1JS2aJrQcWTVXVjJd9ILihp6CFI6M21VamUkCq6V2VtyGE0DXS+N+Kk9ql
	 XnCztrDEfBfirGXOYSzE6WLhhTQQhbmE3aS+YTet7kgJAdpKxxDwj5UNxXlG6HR2GH
	 Zr/HX6M3+XD5RYa3rdXLyR+7aC9xMyA3YXBksDDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 969D3F807D1; Tue,  1 Oct 2024 14:35:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22AD2F80798;
	Tue,  1 Oct 2024 14:35:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E2BCF802DB; Wed, 25 Sep 2024 15:52:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA510F8010B
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 15:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA510F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=ceJu4ly1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727272319; x=1758808319;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mWoPMcI7ji8ZME18L6ZMT3RlitxSf5eGF1zuPbBA8hQ=;
  b=ceJu4ly1CW1JuObjQfO6+s7fj50gTCJyMZs4PfilRC6sAwNqIB73fzeL
   dIHadUQxDAL4ImulcagtLdHE+OUO20ni2J0itZzQwodKpuIDOAY/eU7qy
   esoM5pzTZnrX5zGPA8yw0iLW6nH4HRUjtrj5tet36ERJh37VYCJBDxcPi
   NLhUxWBKCJw8r7TLD3HyAPeE8lRPtitMjlSmzNVbLrzd5t9Sls9e2dDHr
   u1jjbIRLEahXdXwnGJT0qMvn40D0uFgeyLt5j4Qxa0Q11nHnop1LZM93O
   nYZreBIoeHsMXo7grTGFLkc/h13fratlfS9Sk0AJqxmpSSQw/+P/W6Ca5
   A==;
X-CSE-ConnectionGUID: /Z2CJI2IQbCM1FLnYGXUpw==
X-CSE-MsgGUID: NVKkHTY8TyWYrWAdKupnQg==
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600";
   d="scan'208";a="263245828"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Sep 2024 06:51:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 25 Sep 2024 06:51:26 -0700
Received: from [10.171.248.56] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 25 Sep 2024 06:51:24 -0700
Message-ID: <1f1f22de-692c-4428-a754-0aa625294bbd@microchip.com>
Date: Wed, 25 Sep 2024 15:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: Update maintainer list for MICROCHIP
 ASOC, SSC and MCP16502 drivers
Content-Language: en-US, fr-FR
To: Andrei Simion <andrei.simion@microchip.com>, <claudiu.beznea@tuxon.dev>
CC: <linux-kernel@vger.kernel.org>, <cristian.birsan@microchip.com>, "Mark
 Brown" <broonie@kernel.org>, alsa-devel <alsa-devel@alsa-project.org>
References: <20240925130711.122950-1-andrei.simion@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20240925130711.122950-1-andrei.simion@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: prvs=99191a9c0=Nicolas.Ferre@microchip.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: I65WTMQESEARY2UGW5RJVIDYG6TBBHX5
X-Message-ID-Hash: I65WTMQESEARY2UGW5RJVIDYG6TBBHX5
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:35:34 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I65WTMQESEARY2UGW5RJVIDYG6TBBHX5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

(adding Mark and alsa-devel to the thread)

On 25/09/2024 at 15:07, Andrei Simion wrote:
> To help Claudiu and offload the work, add myself to the maintainer list for
> those drivers.
> 
> Acked-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks a lot to both of you to continue this work.

Best regards,
   Nicolas

> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> ---
> v1 -> v2:
> - add acked-by tag
> - adjust commit title
> - update maintainer list for MICROCHIP SSC DRIVER
> ---
>   MAINTAINERS | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 09d0f09c36cc..12e6777bb6b4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15088,6 +15088,7 @@ F:	drivers/spi/spi-at91-usart.c
>   
>   MICROCHIP AUDIO ASOC DRIVERS
>   M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
> +M:	Andrei Simion <andrei.simion@microchip.com>
>   L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>   S:	Supported
>   F:	Documentation/devicetree/bindings/sound/atmel*
> @@ -15196,6 +15197,7 @@ F:	include/video/atmel_lcdc.h
>   
>   MICROCHIP MCP16502 PMIC DRIVER
>   M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
> +M:	Andrei Simion <andrei.simion@microchip.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Supported
>   F:	Documentation/devicetree/bindings/regulator/microchip,mcp16502.yaml
> @@ -15327,6 +15329,7 @@ F:	drivers/spi/spi-atmel.*
>   
>   MICROCHIP SSC DRIVER
>   M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
> +M:	Andrei Simion <andrei.simion@microchip.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Supported
>   F:	Documentation/devicetree/bindings/misc/atmel-ssc.txt
> 
> base-commit: 2b7275670032a98cba266bd1b8905f755b3e650f

