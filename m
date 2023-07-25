Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB979761D1F
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 17:16:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD3F87F4;
	Tue, 25 Jul 2023 17:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD3F87F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690298163;
	bh=FTx+qssLzMG049h8sxtXK9Dspo0+WZdbrUZdjlHbyKw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C9HrNiqYfvZxSatWH9Vi81y5bOYaoOgA6bnTa00y//i1Vb1LliUWGWY6c1TBrf+Cp
	 Z9hHOJD/n5RxaZIv0hCEazprDRBO3oU13igxPISZmJVe8/v4f48KhYKjb3YvU8lvNU
	 jTvqgO0UOBvE0Fcf/Z1BzSK6HzskLFHPnkEm7NSg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04CFDF80535; Tue, 25 Jul 2023 17:15:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8257FF80163;
	Tue, 25 Jul 2023 17:15:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A572F8019B; Tue, 25 Jul 2023 17:15:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BA2DF80153
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 17:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BA2DF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z0QafXBY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=mYmfoCdflZ9uHA5txqbILukt8Ar2VVGNn6p5XL0M74c=; b=Z0QafXBY9g7/F8RhSqaEe5YZJH
	VwZdQaj/KqdXcx4sTag58JbhWnT09v8dwx1+7N816ztPp4sVJISvCg1ZxCvXwmUhSginMUOmuCZMS
	GY6lVyPtJYpRb9BPB+xhggWXjYetlOshGlx8DbNqHEjChWsq1LFY83hSGZXJ1U/IB9Ev8X6nXEHz0
	CHAG2uRdHea8Zxbs9SgTk56p9eaDV5E+/NnZyGKc1aaV59zbV40ky/EhuXXM3BPvQpRDwOWMhOE8Y
	2lO1jGhdlKyumMevKErHr9G73KY/LsqECnQwPb7Oo3VmqUT7zCHa9tlMvf9XNp+te9kf4x21+rERw
	WWN7NQBw==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qOJjv-007taN-1z;
	Tue, 25 Jul 2023 15:14:19 +0000
Message-ID: <6cc4f622-0e83-cd49-73d7-06ad90a3f5d8@infradead.org>
Date: Tue, 25 Jul 2023 08:14:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V2 4/4] ASoC: codecs: aw88261 chip register file, Kconfig
 and Makefile
Content-Language: en-US
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.com,
 shumingf@realtek.com, povik+lin@cutebit.org, 13916275206@139.com,
 herve.codina@bootlin.com, ryans.lee@analog.com,
 ckeepax@opensource.cirrus.com, ajye_huang@compal.corp-partner.google.com,
 sebastian.reichel@collabora.com, yijiangtao@awinic.com, trix@redhat.com,
 colin.i.king@gmail.com, liweilei@awinic.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: zhangjianming@awinic.com
References: <20230725115649.67560-1-wangweidong.a@awinic.com>
 <20230725115649.67560-5-wangweidong.a@awinic.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230725115649.67560-5-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6Y4H6VUNR3L4XQZG4SE477Y4EWRZIQ4C
X-Message-ID-Hash: 6Y4H6VUNR3L4XQZG4SE477Y4EWRZIQ4C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6Y4H6VUNR3L4XQZG4SE477Y4EWRZIQ4C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/25/23 04:56, wangweidong.a@awinic.com wrote:
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index c2de4ee72183..ab21ad20978f 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -55,6 +55,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_ALC5632
>  	imply SND_SOC_AW8738
>  	imply SND_SOC_AW88395
> +	imply SND_SOC_AW88261
>  	imply SND_SOC_BT_SCO
>  	imply SND_SOC_BD28623
>  	imply SND_SOC_CHV3_CODEC
> @@ -640,6 +641,18 @@ config SND_SOC_AW88395
>  	  digital Smart K audio amplifier with an integrated 10V
>  	  smart boost convert.
>  
> +config SND_SOC_AW88261
> +	tristate "Soc Audio for awinic aw88261"
> +	depends on I2C
> +	select CRC8
> +	select REGMAP_I2C
> +	select GPIOLIB
> +	select SND_SOC_AW88395_LIB
> +	help
> +	  this option enables support for aw88261 Smart PA.

	  This

> +	  The awinic AW88261 is an I2S/TDM input, high efficiency
> +	  digital Smart K audio amplifier.

-- 
~Randy
