Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 370A9733DF3
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Jun 2023 06:14:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1437E851;
	Sat, 17 Jun 2023 06:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1437E851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686975255;
	bh=9ayLLNnUjPXJo9KDMvQl4XyRmozaXifbDdEjrDF513w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LWo4uZwiuArCEaIxkuNvF4YD5Zfe/8c7EY7qUhqUebDETgtto+/ifip22uQWdkR8x
	 yV0u/sKtR2qcjL7WTxFrU1cgfXjJ+0li4BPp8P3VQBrbGLu2O67yRk3YTfREzEfhyL
	 sQujzTznIKIwT73um/fqYbbDBnDvsbJkAp1754iQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2AFFF8055A; Sat, 17 Jun 2023 06:12:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94361F8055A;
	Sat, 17 Jun 2023 06:12:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A71D4F80149; Sat, 17 Jun 2023 06:10:55 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 34715F800ED
	for <alsa-devel@alsa-project.org>; Sat, 17 Jun 2023 06:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34715F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a21tWsBF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=aBPG/1s8UFTtWCYq3+C+Ner90XZt71tgP7YOAinQcyc=; b=a21tWsBFH4ruU+tZeR4vNB2qsc
	tb/ZKwVhElnZNLbSy6/24ht28PpmIP4HvsKHRaA9cThGZB9+j7Ni6jHEeqRQ64wuRtYHCWsF0WJt2
	KazNfCtw0ExX46AWS85Vwo3DS9l2ojI/2bFlOxBogXl4K2rIuqVHWki/lDoMhdenDi3FSQy2scu9z
	gaR2BdJY9JA41hSD6lvRr6aKoPsvsKg0i5TcfFjWhkjBTNtTlPWb5X3wOY5XhemlBK0Hgjo7Q3EF1
	d1rIVhj3nXGFNtf9HuHroCKIY1W9iOCI8+h9uP73CN6D8SOOuxu+gXGRuQCVj/iCAgu8eWX+XiDte
	dIOD/LIg==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qANGi-002fPF-1b;
	Sat, 17 Jun 2023 04:10:32 +0000
Message-ID: <44b75227-adbe-831c-1955-8e4ae4a03c9f@infradead.org>
Date: Fri, 16 Jun 2023 21:10:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/4] ASoC: max98388: fix unused function warnings
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ryan Lee <ryans.lee@analog.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20230616090156.2347850-1-arnd@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230616090156.2347850-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KWTPXQ7CDLGXAJHQVBBCCPATCNGMXH6Q
X-Message-ID-Hash: KWTPXQ7CDLGXAJHQVBBCCPATCNGMXH6Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KWTPXQ7CDLGXAJHQVBBCCPATCNGMXH6Q/>
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
> The PM functions are never referenced when CONFIG_PM_SLEEP is
> disabled:
> 
> sound/soc/codecs/max98388.c:854:12: error: unused function 'max98388_suspend' [-Werror,-Wunused-function]
> static int max98388_suspend(struct device *dev)
>            ^
> sound/soc/codecs/max98388.c:864:12: error: unused function 'max98388_resume' [-Werror,-Wunused-function]
> static int max98388_resume(struct device *dev)
> 
> Fix this by using the modern SYSTEM_SLEEP_PM_OPS() macro in place of
> the deprecated SET_SYSTEM_SLEEP_PM_OPS() version, and use pm_sleep_ptr()
> to hide the entire structure as well.
> 
> On a related note, the of_match_ptr() and ACPI_PTR() macros have the same
> problem and would cause the device id table to be unused when the driver
> is built-in and the respective subsystems are disabled. This does not
> cause warnings unless -Wunused-const-variable is passed to the compiler,
> but it's better to just not use the macros at all here.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  sound/soc/codecs/max98388.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/max98388.c b/sound/soc/codecs/max98388.c
> index 8062a71150074..3d03c4bac6c55 100644
> --- a/sound/soc/codecs/max98388.c
> +++ b/sound/soc/codecs/max98388.c
> @@ -873,7 +873,7 @@ static int max98388_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops max98388_pm = {
> -	SET_SYSTEM_SLEEP_PM_OPS(max98388_suspend, max98388_resume)
> +	SYSTEM_SLEEP_PM_OPS(max98388_suspend, max98388_resume)
>  };
>  
>  static const struct regmap_config max98388_regmap = {
> @@ -998,9 +998,9 @@ MODULE_DEVICE_TABLE(acpi, max98388_acpi_match);
>  static struct i2c_driver max98388_i2c_driver = {
>  	.driver = {
>  		.name = "max98388",
> -		.of_match_table = of_match_ptr(max98388_of_match),
> -		.acpi_match_table = ACPI_PTR(max98388_acpi_match),
> -		.pm = &max98388_pm,
> +		.of_match_table = max98388_of_match,
> +		.acpi_match_table = max98388_acpi_match,
> +		.pm = pm_sleep_ptr(&max98388_pm),
>  	},
>  	.probe = max98388_i2c_probe,
>  	.id_table = max98388_i2c_id,

-- 
~Randy
