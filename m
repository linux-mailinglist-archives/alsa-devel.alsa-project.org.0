Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 618CE696C90
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 19:15:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40F92AE8;
	Tue, 14 Feb 2023 19:14:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40F92AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676398535;
	bh=e5l31k4He5Wbwe+okLfDpHV2VRfYIpl6dVetofwc8Rs=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A6TpYDCLuQkmBSVV8drr1CrNWXtOk31pTkKJ2z+wVW2ez6A2yFsUNt3TMn7rAu10c
	 VjphkSsdJRqvkgd+Hy3QL3WIptTOSmN/WKhsigXwnKrInR37TMFqlxJaioL77MkbtZ
	 f6Y2tOZkDOJjG3448qHo1ucqBdPO0Kv3yazE37gc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93AD9F800F0;
	Tue, 14 Feb 2023 19:14:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F357F801C0; Tue, 14 Feb 2023 19:14:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A044EF8001E
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 19:14:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A044EF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=metafoo.de header.i=@metafoo.de header.a=rsa-sha256
 header.s=default2002 header.b=C00pkt56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
	s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7UiTt2U5U+keNr7GSs36T48tk7MVL1FoJS8R8CnMXGM=; b=C00pkt563Z3KjI9vz41S1iMCTD
	N4RfsdniXaJeA88YxA2Ww5QMTGddIyPlHXEdYSiQ+LfOXLEQMpQZcy2eV0Id+f0WtPCUiY9qn8FQz
	U8us3U9MiV4b4sljhHsfvy2RWR3kEuFOv9mxg6P/L/XPgloVhYhItjrjSkJ61y0lwxdHUYb277jyi
	szUNEprxBeeQ3/n44i1XSnytn2XV3ZZIOtDiU5P9X1tOhRcm4FuVidJ+XWJ7XBnwFrvOo23/YvZsn
	vUkYSmU2a40597F9G0XYmlaHDKBg9hBtsXuVWV70KN6jqKUBWghCRkhPsNAsvrvvTMlEEhkzCb1MA
	ticvzzig==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lars@metafoo.de>)
	id 1pRzp2-000BdF-7q; Tue, 14 Feb 2023 19:14:32 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b]
	by sslproxy01.your-server.de with esmtpsa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <lars@metafoo.de>)
	id 1pRzp1-000KQi-N8; Tue, 14 Feb 2023 19:14:31 +0100
Message-ID: <b065e2bb-1f11-067a-b085-45d47626927e@metafoo.de>
Date: Tue, 14 Feb 2023 10:14:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] ASoC: soc-generic-dmaengine-pcm: add option to start
 DMA after DAI
Content-Language: en-US
To: Claudiu Beznea <claudiu.beznea@microchip.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 perex@perex.cz, tiwai@suse.com, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com
References: <20230214161435.1088246-1-claudiu.beznea@microchip.com>
 <20230214161435.1088246-2-claudiu.beznea@microchip.com>
From: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <20230214161435.1088246-2-claudiu.beznea@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26812/Tue Feb 14 09:53:27 2023)
Message-ID-Hash: YDBHVB2RW7OXLTCV2GL64OQGJBBNXCK5
X-Message-ID-Hash: YDBHVB2RW7OXLTCV2GL64OQGJBBNXCK5
X-MailFrom: lars@metafoo.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDBHVB2RW7OXLTCV2GL64OQGJBBNXCK5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/14/23 08:14, Claudiu Beznea wrote:
> diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> index 3b99f619e37e..264e87af6b58 100644
> --- a/sound/soc/soc-generic-dmaengine-pcm.c
> +++ b/sound/soc/soc-generic-dmaengine-pcm.c
> @@ -318,7 +318,7 @@ static int dmaengine_copy_user(struct snd_soc_component *component,
>   	return 0;
>   }
>   
> -static const struct snd_soc_component_driver dmaengine_pcm_component = {
> +static struct snd_soc_component_driver dmaengine_pcm_component = {
>   	.name		= SND_DMAENGINE_PCM_DRV_NAME,
>   	.probe_order	= SND_SOC_COMP_ORDER_LATE,
>   	.open		= dmaengine_pcm_open,
> @@ -329,7 +329,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component = {
>   	.pcm_construct	= dmaengine_pcm_new,
>   };
>   
> -static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
> +static struct snd_soc_component_driver dmaengine_pcm_component_process = {
>   	.name		= SND_DMAENGINE_PCM_DRV_NAME,
>   	.probe_order	= SND_SOC_COMP_ORDER_LATE,
>   	.open		= dmaengine_pcm_open,
> @@ -425,7 +425,7 @@ static const struct snd_dmaengine_pcm_config snd_dmaengine_pcm_default_config =
>   int snd_dmaengine_pcm_register(struct device *dev,
>   	const struct snd_dmaengine_pcm_config *config, unsigned int flags)
>   {
> -	const struct snd_soc_component_driver *driver;
> +	struct snd_soc_component_driver *driver;
>   	struct dmaengine_pcm *pcm;
>   	int ret;
>   
> @@ -450,6 +450,8 @@ int snd_dmaengine_pcm_register(struct device *dev,
>   	else
>   		driver = &dmaengine_pcm_component;
>   
> +	driver->start_dma_last = config->start_dma_last;

This will break if you have multiple sound cards in the system. 
dmaengine_pcm_component must stay const.

