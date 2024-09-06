Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D690F96F8B5
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 17:54:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AFC7E9F;
	Fri,  6 Sep 2024 17:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AFC7E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725638048;
	bh=b0VV0agxdK7kNv2w4D7ckU/4BMjajGPF7X6zVBfpQVM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hDFQmmeMAvbswKuTo/DCJX0DfrK9p7pIL4vX/qZoeLXofvWwrXo8Kx3H4eG0Fn2dt
	 QvDdNerLm/DAmTf4uhCZHetQ84yd3bNPsfxfbIJxuPhDYNWoDBAv3kuOLDcx0uN5c+
	 QAsh/4p0u9pOQPhB76jzAlBBtPegJZHkX3rZbYBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 409F5F805BA; Fri,  6 Sep 2024 17:53:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B474F805B2;
	Fri,  6 Sep 2024 17:53:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A401FF8016C; Fri,  6 Sep 2024 17:53:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from msa.smtpout.orange.fr (out-65.smtpout.orange.fr
 [193.252.22.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A75BEF800E9
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 17:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A75BEF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=AgHDkBtA
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mbH2sLOaOZ40ambH2sBW7E; Fri, 06 Sep 2024 17:53:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725638006;
	bh=ZKNUuo4mgLBUYM3wMqwKTxkByTeR/Fq2vXEUhA0RRME=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=AgHDkBtAbVhpVJXwRd5tzaBY3RmjcWAX74XDlSYoLSqk5jlzBE9BvpqKgS3CIosza
	 nMLKmmcbhyn3w6r00XXEtwKAwQ45DOEJmkEdfoc0KK891ZJ2ZoOqisp+Es1qA8aTo6
	 T5ITQSoFY7Ma77cHksliitBIidLh13p+/NvOo3zdkQzwsqdCzc7xHwQGsbz69Qusa1
	 JLPGrwcY/TgvmHmgA1PJ/GKGdNPZzMWbBioRjdaiKzua5CslJ4af1myJJxS13VvW58
	 O/CcclJWnTjq00GzJ267ahtt5pyQOXHCA0Tuh3yKiIV6t9qgMYHWCu5PcuCfGp7eRo
	 6bu/geQQFiD7Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 06 Sep 2024 17:53:26 +0200
X-ME-IP: 90.11.132.44
Message-ID: <770f7eee-113d-414c-b4c7-91d6b705eb78@wanadoo.fr>
Date: Fri, 6 Sep 2024 17:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: Use devm_clk_get_enabled() helpers
To: ying zuxin <yingzuxin@vivo.com>, Herve Codina <herve.codina@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "moderated list:INFINEON PEB2466 ASoC CODEC" <alsa-devel@alsa-project.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: opensource.kernel@vivo.com, yang.yang@vivo.com,
 ying zuxin <11154159@vivo.com>
References: <20240906084841.19248-1-yingzuxin@vivo.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240906084841.19248-1-yingzuxin@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RYGMMMCEFCQMNXQYZEI4ZGKFHSJGTP7A
X-Message-ID-Hash: RYGMMMCEFCQMNXQYZEI4ZGKFHSJGTP7A
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYGMMMCEFCQMNXQYZEI4ZGKFHSJGTP7A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 06/09/2024 à 10:48, ying zuxin a écrit :
> From: ying zuxin <11154159@vivo.com>
> 
> The devm_clk_get_enabled() helpers:
>      - call devm_clk_get()
>      - call clk_prepare_enable() and register what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids the calls to clk_disable_unprepare().
> 
> Signed-off-by: ying zuxin <11154159@vivo.com>
> ---
>   sound/soc/codecs/peb2466.c | 14 +-------------
>   1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
> index 76ee7e3f4d9b..b67cfad4fc32 100644
> --- a/sound/soc/codecs/peb2466.c
> +++ b/sound/soc/codecs/peb2466.c
> @@ -1975,12 +1975,9 @@ static int peb2466_spi_probe(struct spi_device *spi)
>   	if (IS_ERR(peb2466->reset_gpio))
>   		return PTR_ERR(peb2466->reset_gpio);
>   
> -	peb2466->mclk = devm_clk_get(&peb2466->spi->dev, "mclk");
> +	peb2466->mclk = devm_clk_get_enabled(&peb2466->spi->dev, "mclk");
>   	if (IS_ERR(peb2466->mclk))
>   		return PTR_ERR(peb2466->mclk);
> -	ret = clk_prepare_enable(peb2466->mclk);
> -	if (ret)
> -		return ret;
>   
>   	if (peb2466->reset_gpio) {
>   		gpiod_set_value_cansleep(peb2466->reset_gpio, 1);
> @@ -2031,17 +2028,9 @@ static int peb2466_spi_probe(struct spi_device *spi)
>   	return 0;
>   
>   failed:
> -	clk_disable_unprepare(peb2466->mclk);
>   	return ret;

Hi,

so the 'failed' label is now mostly useless and direct returns could be 
used instead.

CJ

>   }
>   
> -static void peb2466_spi_remove(struct spi_device *spi)
> -{
> -	struct peb2466 *peb2466 = spi_get_drvdata(spi);
> -
> -	clk_disable_unprepare(peb2466->mclk);
> -}
> -
>   static const struct of_device_id peb2466_of_match[] = {
>   	{ .compatible = "infineon,peb2466", },
>   	{ }
> @@ -2061,7 +2050,6 @@ static struct spi_driver peb2466_spi_driver = {
>   	},
>   	.id_table = peb2466_id_table,
>   	.probe  = peb2466_spi_probe,
> -	.remove = peb2466_spi_remove,
>   };
>   
>   module_spi_driver(peb2466_spi_driver);

