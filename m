Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 022556A7A89
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 05:35:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 506BE20B;
	Thu,  2 Mar 2023 05:34:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 506BE20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677731701;
	bh=yMCGX+ri0QHcTEF3WqiDbtK7r57QxJ5U7JmAuN4zGq8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EVxY9rKOYm1HI+ZZjzUeXSt++xx+dlp+4yNzRZYZisO9gZyPtKTsX6pO1Bn80Lete
	 Y2SGmkxgXb3aFEOYl4RfNqMVNT0MjSuLlltOgRWqNJdo0xLQtG9jcQ0uK6BdyZpS1N
	 kHf9C22B3XZ/4/DVF7MldmQFSVgI7QltqKQozCwo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7165F80310;
	Thu,  2 Mar 2023 05:34:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 844E6F80236; Thu,  2 Mar 2023 05:34:07 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 27638F804B1
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 05:34:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27638F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=DeVIcsvH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677731644; x=1709267644;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yMCGX+ri0QHcTEF3WqiDbtK7r57QxJ5U7JmAuN4zGq8=;
  b=DeVIcsvHLCHOGmZB/yJuXz6q5emls8/y0eqTIIWoTc1s6FBRnuwoQ+WW
   gg6XDytDDhU8bjlZ+9HVgbo2hK1Wl6ngHml6llcG2R33AFhz1F5G8TPLh
   vVftheQdxfRPPn8+anjoCJ41fKb9b5o4yzX1cCQjvMFS3KHE/V2GsTk5d
   qrxM7NFnuWMTQ+jUKFDnjAzjQZcO1TpF4Gq5z2oJi7Z3PfNH9ae38zmxq
   6sVhMgO1dtvsZc6jJXIi/EPKnDV24688jti81e6d+P0Z4jRNAY3ptW+3H
   AjLZrC1Amn9fjeQ0upVWSuA0OQHo6eLEnQZPSJttoj4r+AkE2cLwxc+bd
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,226,1673938800";
   d="scan'208";a="139828306"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2023 21:33:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Mar 2023 21:33:54 -0700
Received: from [10.40.24.88] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Wed, 1 Mar 2023 21:33:51 -0700
Message-ID: <bcadd5ce-d205-7431-51f3-38239fab348c@microchip.com>
Date: Thu, 2 Mar 2023 10:03:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 8/8] MAINTAINERS: update Microchip AT91 sound entries with
 documentation files
Content-Language: en-US
To: Claudiu Beznea <claudiu.beznea@microchip.com>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<alexandre.belloni@bootlin.com>
References: <20230301113807.24036-1-claudiu.beznea@microchip.com>
 <20230301113807.24036-9-claudiu.beznea@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230301113807.24036-9-claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DFD3YDLUCMKRBQTKIUBGXFHPDGKZ7EHF
X-Message-ID-Hash: DFD3YDLUCMKRBQTKIUBGXFHPDGKZ7EHF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DFD3YDLUCMKRBQTKIUBGXFHPDGKZ7EHF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 01/03/2023 at 17:08, Claudiu Beznea wrote:
> Add documentation files to Microchip AT91 sound entries.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   MAINTAINERS | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 252cc33f0f5c..b5a966f84d89 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13669,6 +13669,10 @@ MICROCHIP AUDIO ASOC DRIVERS
>   M:	Claudiu Beznea <claudiu.beznea@microchip.com>
>   L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>   S:	Supported
> +F:	Documentation/devicetree/bindings/sound/atmel*
> +F:	Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.txt
> +F:	Documentation/devicetree/bindings/sound/microchip,sama7g5-*
> +F:	Documentation/devicetree/bindings/sound/mikroe,mikroe-proto.txt
>   F:	sound/soc/atmel
>   
>   MICROCHIP CSI2DC DRIVER
> @@ -13836,6 +13840,7 @@ MICROCHIP SSC DRIVER
>   M:	Claudiu Beznea <claudiu.beznea@microchip.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Supported
> +F:	Documentation/devicetree/bindings/misc/atmel-ssc.txt
>   F:	drivers/misc/atmel-ssc.c
>   F:	include/linux/atmel-ssc.h
>   

-- 
Nicolas Ferre

