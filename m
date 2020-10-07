Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAC0285EBE
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 14:07:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BD2716C7;
	Wed,  7 Oct 2020 14:06:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BD2716C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602072448;
	bh=eLzPSV4xUW6uSKd9wPA2pJIaUydp/LfwhZqmP2Mpjeg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bhNP54pKGWazZAclnvH/GWu2pwccQKZ7uhKWMXlHD/iyHy7q3YdMc06x5m1jNsPKg
	 l5/WugZU+wGU4S7S+zG3aal+lqKlJAtcTzYg0JrXFXQAYHt/Xxrklq3qWqHqd0y3rI
	 LFC8P7eQcbf/N7o8rXF0VGFMLid8Y/9W8PYlOVKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F6A0F8016A;
	Wed,  7 Oct 2020 14:05:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE994F80128; Wed,  7 Oct 2020 14:05:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C015F80090
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 14:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C015F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="POOZLMCa"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 097C5dha011272;
 Wed, 7 Oct 2020 07:05:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602072339;
 bh=98VxpOsUYCaLHzSjHudtgwbcFZvvbzH4YA/ReQeuaIQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=POOZLMCaAdDmhwazJDpq02bJQtFxVorGw2HSgdGM5IGFe99ZfwcQcAL7LJdXNmDbK
 XVxa4QGqVSUq7KhmKaloNaQP0KJe0NniLDBQMYKC35WEVoe//atO8Fey91q+6SmBa+
 d1pLrKIRLnl3FJMbTfha9SLLwcmogP6IQzJYeVzw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 097C5dIe080798
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 7 Oct 2020 07:05:39 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 7 Oct
 2020 07:05:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 7 Oct 2020 07:05:39 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 097C5LsU092391;
 Wed, 7 Oct 2020 07:05:22 -0500
Subject: Re: [PATCH] ASoC: omap-mcbsp: Fix use of uninitialised pointer
To: Alex Dewar <alex.dewar90@gmail.com>
References: <20201004102535.325547-1-alex.dewar90@gmail.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <c2441186-c278-d84d-55c4-294ef01823a6@ti.com>
Date: Wed, 7 Oct 2020 15:05:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201004102535.325547-1-alex.dewar90@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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



On 04/10/2020 13.25, Alex Dewar wrote:
> Commit 9c34d023dc35 ("ASoC: omap-mcbsp: Re-arrange files for core McBSP
> and Sidetone function split"), in rearranging various files, also replaced
> calls to platform_get_resource_by_name() + devm_ioremap_resource() with a
> single call to devm_platform_ioremap_resource_byname(). However, the
> struct resource is needed as we access its members so at present a null
> pointer is dereferenced. Fix by doing things the old way.
> 
> Addresses-Coverity-ID: 1497530 ("Memory - illegal accesses")
> Fixes: 9c34d023dc35 ("ASoC: omap-mcbsp: Re-arrange files for core McBSP and Sidetone function split")

it is fixing:
31e1fc4f11e2e ("ASoC: ti: omap-mcbsp: use
devm_platform_ioremap_resource_byname")

and we should just revert that commit.

> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> ---
>  sound/soc/ti/omap-mcbsp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 186cea91076f..6025b30bbe77 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -620,7 +620,11 @@ static int omap_mcbsp_init(struct platform_device *pdev)
>  	spin_lock_init(&mcbsp->lock);
>  	mcbsp->free = true;
>  
> -	mcbsp->io_base = devm_platform_ioremap_resource_byname(pdev, "mpu");
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpu");
> +	if (!res)
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +	mcbsp->io_base = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(mcbsp->io_base))
>  		return PTR_ERR(mcbsp->io_base);
>  
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
