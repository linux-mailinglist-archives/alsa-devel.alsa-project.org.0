Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1AE40655A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Sep 2021 03:43:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6F5916A9;
	Fri, 10 Sep 2021 03:42:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6F5916A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631238222;
	bh=0jBM2DuT9UzGJJxG6CGZF40XhrQ9yF6VayglswENpaE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fd1EFeBugBVq2B3pNNVJaNl4CNz8BcdlR8LarQD/2QqJ/Krncvx2lMl7Dvkzf51Yh
	 qYscR/E6Q6oAGMen2kGLx70e/QSSUyaQIgTBUmEaUkb1H7CnCkKBnG2wObX84OUB2b
	 mq89kda8jRYPWL6y3ozDsnrZRunqf7iDtIWKWPK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FDB6F80217;
	Fri, 10 Sep 2021 03:42:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DD3BF80224; Fri, 10 Sep 2021 03:42:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCC23F80166
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 03:42:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCC23F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="ItvbIjG6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=EEsL2Ua4JKiBuEtvP+hN91RNOSRfb0BEIz1GBTlyL28=; b=ItvbIjG6CBNfdQX20OGwAIjjxx
 RvMBUGZLltEmI5/xFRrZtp02xj9k8eABgFWVpySMvJLzl557ZvX9vzl8mZr2mKY79eAgFZid4q8JK
 7PUkgC0AWTe6edEUtui4BYJ80jx7xwibUVw09I6JPyLQWFLTQo9UifWIGoUy1avaejg628TwCCU0+
 1+s0N4nqu/Oz4H/xJ/58P/UGZKf4RiPF2QbVbszSAz1W44glpt4BWt4c8rty6G8DvEYSXHJMptwwg
 qYQZWG0K6vo/AGO+Yh8rYBlPZPVTILTEp+zcs9cUbgODlj6s2tuFW63NTB/k+FiX6AwKzNWBpSXJW
 p2zNcDRw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOVYL-00BXZP-9T; Fri, 10 Sep 2021 01:42:05 +0000
Subject: Re: [PATCH] ASoC: mediatek: add required config dependency
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 matthias.bgg@gmail.com
References: <20210909065533.2114-1-trevor.wu@mediatek.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <46bf2061-7a00-c6f0-d2e9-5605b13f1c3f@infradead.org>
Date: Thu, 9 Sep 2021 18:42:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210909065533.2114-1-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, bicycle.tsai@mediatek.com,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 geert@linux-m68k.org, wenst@chromium.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 9/8/21 11:55 PM, Trevor Wu wrote:
> Because SND_SOC_MT8195 depends on COMPILE_TEST, it's possible to build
> MT8195 driver in many different config combinations.
> Add all dependent config for SND_SOC_MT8195 in case some errors happen
> when COMPILE_TEST is enabled.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.


> ---
>   sound/soc/mediatek/Kconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 5a2f4667d50b..81ad2dcee9eb 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -1,6 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config SND_SOC_MEDIATEK
>   	tristate
> +	select REGMAP_MMIO
>   
>   config SND_SOC_MT2701
>   	tristate "ASoC support for Mediatek MT2701 chip"
> @@ -188,7 +189,9 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
>   config SND_SOC_MT8195
>   	tristate "ASoC support for Mediatek MT8195 chip"
>   	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on COMMON_CLK
>   	select SND_SOC_MEDIATEK
> +	select MFD_SYSCON if SND_SOC_MT6359
>   	help
>   	  This adds ASoC platform driver support for Mediatek MT8195 chip
>   	  that can be used with other codecs.
> 


-- 
~Randy

