Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E5A750755
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:59:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E24284C;
	Wed, 12 Jul 2023 13:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E24284C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689163156;
	bh=BPwn7ycrAHdiOF8yVt+5jZUIynmY0GSHF1SaS+Uh9HI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DAFR5wpTJNHw+UQd/3X0xSS+QIjIVzOFd0cRiFOk4MefbLUGzUKVUrrbFEEJr24mc
	 5CpvBiTC7uTxzTqN+IEH5qfFHagsXibPyYmuyJTYmdGux414UF7M8aIgiifJahR3T+
	 8BvP8EQRQ7WKjbaDSDONlUaz7m4kEVcYI1h9pgE4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E46B0F8047D; Wed, 12 Jul 2023 13:58:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 185FEF80236;
	Wed, 12 Jul 2023 13:58:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3110BF80249; Wed, 12 Jul 2023 13:58:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B273DF80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B273DF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=twit5vP4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7FB6461794;
	Wed, 12 Jul 2023 11:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46615C433C8;
	Wed, 12 Jul 2023 11:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689163090;
	bh=BPwn7ycrAHdiOF8yVt+5jZUIynmY0GSHF1SaS+Uh9HI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=twit5vP4HZmDg1OUtV3zp39IIdA3GcgdIFUcCwXcZ2MQqpD9wlLeMZZZT44WlJmOW
	 Czhz2zQdWB0zYX2prS7nSsn71GE67kUDe7EBCOr6eBfGS59iCkVGyA2/V9xb9A7jSy
	 SJ/HO+uAwR7KEAKnOdLanjQeovqKN3YJZnT5XuzawSoKw5QRqIBRP2C2ev6fc14wbM
	 I8Bmm1iKe1Gtqgw2o8KyiUC/0fSlfCzl/1WiYvXa9t1GCgHlvaalRrQgpJjG7AJOny
	 bG66eHoqx+0ae76mvknhjvW0Oc4zqvhSIQ3JutlwQoHgms7Asaj9vjku8leLQyTR77
	 kbfOiGwmNZEeQ==
Date: Wed, 12 Jul 2023 12:58:04 +0100
From: Lee Jones <lee@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] regmap: REGMAP_SLIMBUS should select REGMAP
Message-ID: <20230712115804.GC10768@google.com>
References: <cover.1688643442.git.geert@linux-m68k.org>
 <7519324a34015e1c046227269409fef688889f4f.1688643442.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <7519324a34015e1c046227269409fef688889f4f.1688643442.git.geert@linux-m68k.org>
Message-ID-Hash: EBHFCR5DPZJSS6K5MS6MNQRVBMK37BEJ
X-Message-ID-Hash: EBHFCR5DPZJSS6K5MS6MNQRVBMK37BEJ
X-MailFrom: lee@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBHFCR5DPZJSS6K5MS6MNQRVBMK37BEJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Jul 2023, Geert Uytterhoeven wrote:

> If CONFIG_SND_SOC_WCD934X=y, CONFIG_COMPILE_TEST=y,
> CONFIG_MFD_WCD934X=n, CONFIG_REGMAP=n:
> 
>     sound/soc/codecs/wcd934x.c:518:38: error: array type has incomplete element type ‘struct regmap_range_cfg’
>       518 | static const struct regmap_range_cfg wcd934x_ifc_ranges[] = {
> 	  |                                      ^~~~~~~~~~~~~~~~~~
> 
> Fix this by making REGMAP_SLIMBUS select REGMAP.
> 
> Drop the selection of REGMAP by MFD_WCD934X, as this is not needed
> (now both REGMAP_SLIMBUS and REGMAP_IRQ select REGMAP).
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/base/regmap/Kconfig | 1 +
>  drivers/mfd/Kconfig         | 1 -

Acked-by: Lee Jones <lee@kernel.org>

>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
> index e25cc619c75de3d9..c3a260ed4e864959 100644
> --- a/drivers/base/regmap/Kconfig
> +++ b/drivers/base/regmap/Kconfig
> @@ -34,6 +34,7 @@ config REGMAP_I2C
>  config REGMAP_SLIMBUS
>  	tristate
>  	depends on SLIMBUS
> +	select REGMAP
>  
>  config REGMAP_SPI
>  	tristate
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 0b6af476f554a191..5857dad2c64828fa 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2121,7 +2121,6 @@ config MFD_STMFX
>  config MFD_WCD934X
>  	tristate "Support for WCD9340/WCD9341 Codec"
>  	depends on SLIMBUS
> -	select REGMAP
>  	select REGMAP_SLIMBUS
>  	select REGMAP_IRQ
>  	select MFD_CORE
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]
