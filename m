Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B374445C0
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 17:17:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC0EC167D;
	Wed,  3 Nov 2021 17:16:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC0EC167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635956234;
	bh=bqBJ56J0CP2TvKKRYSy4DpCbzMwsLYXmeBRNoMcH0NI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=il3gh6Ssp9NjoX3x/5vUnLXaZkA2EiJupZLZFtw2uqnCq9nIdZTYOJxpQ1VaTdGEz
	 UNb9lhGM6acfBsoJ0nnTNfQRTNmHJzS9Ed7h0q1/IkX3JZnetJzvsu1ZFTDeS5sfVP
	 fERLb2PvHXo55SgrLNlsIzbMv5dD5uQRyExfb6TY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26ECBF80279;
	Wed,  3 Nov 2021 17:15:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5584FF8026A; Wed,  3 Nov 2021 17:15:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DABBDF800FA
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 17:15:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DABBDF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="aLUGp44N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=AOsyCgZE6MJ4p0vyz+bhHBA8QhVxzWHGR03f3rBg+1o=; b=aLUGp44NafpCSUm7Qy08z/kw24
 JYbtsX4n3idfMynbyx+Ae0BkGO6EH5tXIvw4qEA1eLFv1p8d1udn77qtqLznUegSLR86nracRJ17X
 kqQ0OKaQSS8t5AZipevuRJmIUSGOVLF1RCJtLPX95u/PJTsK1wcX2cAdW4vnDHscpyk141TsqF/+H
 BEGDQaBiJK2BQXW/NJlBgTMeAPOTisz4FTFVCFSk+EqUek/2nRRaJb5Jq9iSk8Q2tanfzce6//erL
 3KJW3KQ0FTVLYb9h3PsYKZFi1qT0x1FADtVEEo1JKTy99FUlKi/xQIY3jJUJ67aPVCydODa40kpRY
 MXZ4PsFA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miIvM-005hxE-TK; Wed, 03 Nov 2021 16:15:41 +0000
Subject: Re: [PATCH] ASoC: amd: vangogh: add SPI dependency
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20211019191453.3047514-1-arnd@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b2a01d9f-7012-3e7c-5792-2620acce8967@infradead.org>
Date: Wed, 3 Nov 2021 09:15:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019191453.3047514-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

On 10/19/21 12:14 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without CONFIG_SPI, this fails to build:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_CS35L41_SPI
>    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SPI_MASTER [=n]
>    Selected by [m]:
>    - SND_SOC_AMD_VANGOGH_MACH [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_SOC_AMD_ACP5x [=m] && I2C [=y]
> ERROR: modpost: "spi_setup" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!
> ERROR: modpost: "__devm_regmap_init_spi" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!
> 
> Fixes: 96792fdd77cd ("ASoC: amd: enable vangogh platform machine driver build")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   sound/soc/amd/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
> index d91a9399777c..edee2098c82e 100644
> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -68,7 +68,7 @@ config SND_SOC_AMD_VANGOGH_MACH
>   	tristate "AMD Vangogh support for NAU8821 CS35L41"
>   	select SND_SOC_NAU8821
>   	select SND_SOC_CS35L41_SPI
> -	depends on SND_SOC_AMD_ACP5x && I2C
> +	depends on SND_SOC_AMD_ACP5x && I2C && SPI
>   	help
>   	  This option enables machine driver for Vangogh platform
>   	  using NAU8821 and CS35L41 codecs.
> 

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Just had this build error in linux-next-20211103
so this patch is needed there.

Thanks.

-- 
~Randy
