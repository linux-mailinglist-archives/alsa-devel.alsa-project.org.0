Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6DC177C82
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 17:56:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE9DB826;
	Tue,  3 Mar 2020 17:55:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE9DB826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583254605;
	bh=4Iu72ZqZPGr/AjqOSDI7Zng1ndHkGYdIqZnvpMUgZ64=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hn3KEfUZE4L0alUlmWGwbdw1KJrD5XOi+WIX2s3wLcRcG+JKjJc4shSlLZrRSFtrF
	 IwXqLqv/pArVRzL903DdYyYlfbITSWrsk/HKb2UOti4YoqzmLIxOhaKht6kkKYNfOB
	 JX+kLuSE8Z7XVckAoL88RcUcBPXTdew5+lskkkn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0273CF80266;
	Tue,  3 Mar 2020 17:55:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8C09F8012D; Tue,  3 Mar 2020 17:55:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE4F8F8012D
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 17:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE4F8F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="o4b8Fvsz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=0h9eZXUbT/+wZn18IzVeTxSKw0VaeM+576oP9khRe6o=; b=o4b8FvszcUQVJsc7FTwT0eGsg2
 8IGAsPOmZEt3I7SeQ1YmMBj/ZGYGdXT9eTMWdDnusCnGWhT7wWB7fwX5ygtZL/FKfGUU70EidZkIZ
 7HQywX5V/rCqHkxjrPXBYVJ4jmZ7/XKBvA/SfBcJW7m68jJk9MqVg8rGu9VJqLKcYjTv7G2OWc/cQ
 ono48DKQUjNB59qUvXs3PDRsi1sCWSLPNy3Nr+Agttxw3T8gc5PV3R9vYg6Vi1WlqdapXMz2flidi
 HlTiTw6+5t6dO8uQIx5IwhrlLwVN1B84IkJeEihitV7XkAm5UMP8rwAWyNWFZNWZwuR+ntBNTb/S8
 r0NMFSOg==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9AoX-0004ah-2t; Tue, 03 Mar 2020 16:54:37 +0000
Subject: Re: [PATCH] ASoC: amd: AMD RV RT5682 should depends on CROS_EC
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20200303110514.3267126-1-enric.balletbo@collabora.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3e34a902-2a7c-c13c-d569-9d6479a65627@infradead.org>
Date: Tue, 3 Mar 2020 08:54:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303110514.3267126-1-enric.balletbo@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>
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

On 3/3/20 3:05 AM, Enric Balletbo i Serra wrote:
> If SND_SOC_AMD_RV_RT5682_MACH=y, below kconfig and build errors can be seen:
> 
>  WARNING: unmet direct dependencies detected for SND_SOC_CROS_EC_CODEC
>  WARNING: unmet direct dependencies detected for I2C_CROS_EC_TUNNEL
> 
>  ld: drivers/i2c/busses/i2c-cros-ec-tunnel.o: in function `ec_i2c_xfer':
>  i2c-cros-ec-tunnel.c:(.text+0x2fc): undefined reference to `cros_ec_cmd_xfer_status'
>  ld: sound/soc/codecs/cros_ec_codec.o: in function `wov_host_event':
>  cros_ec_codec.c:(.text+0x4fb): undefined reference to `cros_ec_get_host_event'
>  ld: sound/soc/codecs/cros_ec_codec.o: in function `send_ec_host_command':
>  cros_ec_codec.c:(.text+0x831): undefined reference to `cros_ec_cmd_xfer_status'
> 
> This is because it will select SND_SOC_CROS_EC_CODEC and I2c_CROS_EC_TUNNEL but
> both depends on CROS_EC.
> 
> Fixes: 6b8e4e7db3cd ("ASoC: amd: Add machine driver for Raven based platform")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
> 
>  sound/soc/amd/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
> index b29ef1373946..bce4cee5cb54 100644
> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -33,6 +33,6 @@ config SND_SOC_AMD_RV_RT5682_MACH
>  	select SND_SOC_MAX98357A
>  	select SND_SOC_CROS_EC_CODEC
>  	select I2C_CROS_EC_TUNNEL
> -	depends on SND_SOC_AMD_ACP3x && I2C
> +	depends on SND_SOC_AMD_ACP3x && I2C && CROS_EC
>  	help
>  	 This option enables machine driver for RT5682 and MAX9835.
> 


-- 
~Randy

