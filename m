Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F07C67171D1
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 01:40:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C14EA206;
	Wed, 31 May 2023 01:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C14EA206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685490010;
	bh=wMbSULp1qXoUAUR+MhIroVMheFEsFiuS0aP/2wVWc5Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hXsyKfsa963QDmyuJZ43GuMhFngIRM9WBAtLL8/Pqftw5CsILZiXzE7O/UQ1jWZat
	 C/tejLAG0Fokbe9aFR7UoOfu0GMIz/iwhRgn8NH3OJ32FvPH32kTacgiXdQLMrdaJC
	 CBJL7helK+feAYaXzRrHVwaAovA2eAJwHuGu1K+0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25437F80542; Wed, 31 May 2023 01:39:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C482CF8026A;
	Wed, 31 May 2023 01:39:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 911CCF8042F; Wed, 31 May 2023 01:39:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F63DF800DF
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 01:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F63DF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fvcRwGGO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=1Dw3EGfLZhFfy3+wVtWlL1NBwMICEGnt2pRJcPI4ppc=; b=fvcRwGGOaprOoxX4TJWrFse6e1
	eoOnh5Rd2CCbsl8XoPZzPp99q95sd/oH8XyWBxgUoaZw3ca/YmpXf7A4NUCAsICkiVq9d8DWNElHw
	hfGh5noP4xw7VhxbYtmPCZCjj58qK5PmbmS5Yn2EZoM3VUcFqYrA+gKrMMIby6G7m88gnAG3zIw+h
	LyI/ybyTq2BuQM1VqaRDT6YXKE2oDGvtVjWZhmJzdbXkBha6mcRJm2V3P/zf9SYtT/vIWmbUcE6tF
	ebHpJ+B+eGhOVyonYQBokmQZd/ABlFNyG2DlzrYTUTFR9FPOk1hCeaA2eldGt1RQOm9S8aycKQlel
	6aIUMNog==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q48vX-00FUrv-08;
	Tue, 30 May 2023 23:38:55 +0000
Message-ID: <71922379-ee3d-9d6d-33dd-edcf8ef7508e@infradead.org>
Date: Tue, 30 May 2023 16:38:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 RESEND] ASoC: fsl MPC52xx drivers require PPC_BESTCOMM
Content-Language: en-US
To: linux-kernel@vger.kernel.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230521225702.1608-1-rdunlap@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230521225702.1608-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XSR63NX4G36DKCOS7RUJDVJOQUYN5RUD
X-Message-ID-Hash: XSR63NX4G36DKCOS7RUJDVJOQUYN5RUD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XSR63NX4G36DKCOS7RUJDVJOQUYN5RUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello maintainers,

I am still seeing these build errors on linux-next-20230530.

Is there a problem with the patch?
Thanks.

On 5/21/23 15:57, Randy Dunlap wrote:
> Both SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA select
> SND_SOC_MPC5200_AC97. The latter symbol depends on PPC_BESTCOMM,
> so the 2 former symbols should also depend on PPC_BESTCOMM since
> "select" does not follow any dependency chains.
> 
> This prevents a kconfig warning and build errors:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
>   Depends on [n]: SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
>   Selected by [m]:
>   - SND_MPC52xx_SOC_PCM030 [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC5200_SIMPLE [=y]
>   - SND_MPC52xx_SOC_EFIKA [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_EFIKA [=y]
> 
> ERROR: modpost: "mpc5200_audio_dma_destroy" [sound/soc/fsl/mpc5200_psc_ac97.ko] undefined!
> ERROR: modpost: "mpc5200_audio_dma_create" [sound/soc/fsl/mpc5200_psc_ac97.ko] undefined!
> 
> Fixes: 40d9ec14e7e1 ("ASoC: remove BROKEN from Efika and pcm030 fabric drivers")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Xiubo Li <Xiubo.Lee@gmail.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> ---
> v2: use correct email address for Mark Brown.
> 
>  sound/soc/fsl/Kconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff -- a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
> --- a/sound/soc/fsl/Kconfig
> +++ b/sound/soc/fsl/Kconfig
> @@ -243,7 +243,7 @@ config SND_SOC_MPC5200_AC97
>  
>  config SND_MPC52xx_SOC_PCM030
>  	tristate "SoC AC97 Audio support for Phytec pcm030 and WM9712"
> -	depends on PPC_MPC5200_SIMPLE
> +	depends on PPC_MPC5200_SIMPLE && PPC_BESTCOMM
>  	select SND_SOC_MPC5200_AC97
>  	select SND_SOC_WM9712
>  	help
> @@ -252,7 +252,7 @@ config SND_MPC52xx_SOC_PCM030
>  
>  config SND_MPC52xx_SOC_EFIKA
>  	tristate "SoC AC97 Audio support for bbplan Efika and STAC9766"
> -	depends on PPC_EFIKA
> +	depends on PPC_EFIKA && PPC_BESTCOMM
>  	select SND_SOC_MPC5200_AC97
>  	select SND_SOC_STAC9766
>  	help

-- 
~Randy
