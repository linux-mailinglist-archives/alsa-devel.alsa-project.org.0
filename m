Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A7A733DF6
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Jun 2023 06:22:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 456EB82B;
	Sat, 17 Jun 2023 06:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 456EB82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686975775;
	bh=6Gew6J2PhhZmRpOX7PxIqEEUlCMJH1ilRK6qqabv550=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iDqJh/tJ9eSgQQNchzVzoOqZw8Nm8V9/PR9utinxRPuFpKDw/jCTYzg3ECf166jLz
	 Q7I406V3GGN6fA1/5DhNPNy0C0Hp5bS3ccHhxfeanOkhIQRFjz9ISjVD8Z3vtQQOqd
	 rTJozMW2UdLFSmxhfx6cxBaRNp8ed4Xtu/eh409w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37532F80132; Sat, 17 Jun 2023 06:21:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AEB6F80132;
	Sat, 17 Jun 2023 06:21:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A6E0F80149; Sat, 17 Jun 2023 06:21:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 753FDF80130
	for <alsa-devel@alsa-project.org>; Sat, 17 Jun 2023 06:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 753FDF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XlCFgO/I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=iVbL06ecvTbKJLIW9R0V3emDT+EiFhX0womXFV5J6Qk=; b=XlCFgO/IgjShb1qecHAHHOAup8
	qDju1SLo3IbvU8gcFhB7gTeTZtAdD4SoNW9BCRjGPBHXlQPqlQpKGlXoxpqwSoW9bxgZbkiGyhgEj
	KVK6jYraANXMzCAzR1oEf1fxbhRpxeQMZIFcj0HzAmNR+DwsRxNR0etR0LXeLkkfZBjZ2GShDPPmk
	yPEC0uXng1E1IpSqYas6+7/Izyo8k9tWXRzvkyRI+fBRJvLV9MimUj1MNPEGdtUXM76WM3PORiPb8
	+qxIcnLa6X7FUsFbdPLT/QNIz/YhEvd6P3Pe+HGNm74XlJRq/JcJQ6+LAP1q05llni8YsdSNNRTfT
	Pp6rIOGA==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qANR7-002gKb-17;
	Sat, 17 Jun 2023 04:21:17 +0000
Message-ID: <87367afc-102e-d6cc-e51e-74170a08b2cc@infradead.org>
Date: Fri, 16 Jun 2023 21:21:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 3/4] ASoC: loongson: add PCI dependency
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yingkun Meng <mengyingkun@loongson.cn>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20230616090156.2347850-1-arnd@kernel.org>
 <20230616090156.2347850-3-arnd@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230616090156.2347850-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SJLQJCTV5QLS7ZBMTXH2PSA2M3GZCLQG
X-Message-ID-Hash: SJLQJCTV5QLS7ZBMTXH2PSA2M3GZCLQG
X-MailFrom: rdunlap@infradead.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SJLQJCTV5QLS7ZBMTXH2PSA2M3GZCLQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/16/23 02:00, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The new driver fails to build when PCI is disabled:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_LOONGSON_I2S_PCI
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (LOONGARCH || COMPILE_TEST [=y]) && PCI [=n]
>   Selected by [y]:
>   - SND_SOC_LOONGSON_CARD [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (LOONGARCH || COMPILE_TEST [=y])
> sound/soc/loongson/loongson_i2s_pci.c:167:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
> module_pci_driver(loongson_i2s_driver);
> 
> Add the appropriate Kconfig dependency.
> 
> Fixes: d24028606e764 ("ASoC: loongson: Add Loongson ASoC Sound Card Support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  sound/soc/loongson/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/loongson/Kconfig b/sound/soc/loongson/Kconfig
> index c175f9de19a85..b8d7e2bade246 100644
> --- a/sound/soc/loongson/Kconfig
> +++ b/sound/soc/loongson/Kconfig
> @@ -16,6 +16,7 @@ config SND_SOC_LOONGSON_I2S_PCI
>  config SND_SOC_LOONGSON_CARD
>  	tristate "Loongson Sound Card Driver"
>  	select SND_SOC_LOONGSON_I2S_PCI
> +	depends on PCI
>  	help
>  	  Say Y or M if you want to add support for SoC audio using
>  	  loongson I2S controller.

-- 
~Randy
