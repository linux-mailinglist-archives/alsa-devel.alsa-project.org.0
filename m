Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A729332
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 10:35:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DEDC16B4;
	Fri, 24 May 2019 10:34:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DEDC16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558686910;
	bh=ZUd7ZI0uA34Iw7rdR4nCmgfvOW/llR+UxPTMOoXgOAs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XEtm001Ez1JzPAcihcgzJ71J7FAj9w2lb1tyRWgXeL9LNiaH5GuZPKTRjZ6jJ0iWv
	 3H4Ui0Fl5wlmqnzq2XOO8WLn1hK0sRGcTXOEoNhHAFU8PC3dH1Nf1jO08jfpBmzB/E
	 b8aWJiiXLGyTqBP5rO8E4AHvqtcDj9eGy1XBUFgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6BB5F89625;
	Fri, 24 May 2019 10:33:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69F28F89630; Fri, 24 May 2019 10:33:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled
 version=3.4.0
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93EFFF89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 10:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93EFFF89625
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="axT/Z4Pe"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ce7ac4d0001>; Fri, 24 May 2019 01:33:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 24 May 2019 01:33:17 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 24 May 2019 01:33:17 -0700
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 May
 2019 08:33:15 +0000
To: Gen Zhang <blackgod016574@gmail.com>, <lgirdwood@gmail.com>,
 <perex@perex.cz>
References: <20190524005014.GA2289@zhanggen-UX430UQ>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b2d43dfe-17e5-a975-435b-49f2aa2ad550@nvidia.com>
Date: Fri, 24 May 2019 09:33:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524005014.GA2289@zhanggen-UX430UQ>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1558686797; bh=vkCEueUAPlP/apgkFiyHjF374bXH/u7KlllgHip5zNw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=axT/Z4PeCAsNFCG1WqGLPh67ItaiJrqmcFul0qH19p84KXDA55OvlN4ub0AM0L0J1
 teyY8/SXfwb1dxPxEpSaeXje2VopUqvGzYWk6+mU1CtAGG1BbTQiUKDfDOPhexo7mc
 sJEqJMze0K4TiJKqMopCFG6TfZXtJJB3DI/bIMsQbEwfnEbyjSINU0WE9lzfTnv5mY
 Qaagp1ceWr+Q/+ct/YMtiaxD8m+09fWb5geSwovhV7gscDHq2fl6l7Xefn60virDA1
 A+SzHmxXgCnuhmFukoFr72M7KJCZUt7LN/30gwE3Wv/YePiHE6xi849yvhFBzI6nhq
 c27aizYhUb+2w==
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] tegra_wm9712: Fix a memory leaking bug in
 tegra_wm9712_driver_probe()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 24/05/2019 01:50, Gen Zhang wrote:
> In tegra_wm9712_driver_probe(), 'machine->codec' is allocated by
> platform_device_alloc(). When it is NULL, function returns ENOMEM.
> However, 'machine' is allocated by devm_kzalloc() before this site.
> Thus we should free 'machine' before function ends to prevent memory
> leaking.

Memory allocated by devm_xxx() is automatically freed on failure so this
is not correct.

> Further, we should free 'machine->util_data', 'machine->codec' and
> 'machine' before this function normally ends to prevent memory leaking.

This is also incorrect. Why would we free all resources after
successfully initialising the driver?

> Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
> ---
> diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c
> index 864a334..295c41d 100644
> --- a/sound/soc/tegra/tegra_wm9712.c
> +++ b/sound/soc/tegra/tegra_wm9712.c
> @@ -86,7 +86,8 @@ static int tegra_wm9712_driver_probe(struct platform_device *pdev)
>  	machine->codec = platform_device_alloc("wm9712-codec", -1);
>  	if (!machine->codec) {
>  		dev_err(&pdev->dev, "Can't allocate wm9712 platform device\n");
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto codec_free;
>  	}
>  
>  	ret = platform_device_add(machine->codec);
> @@ -127,6 +128,10 @@ static int tegra_wm9712_driver_probe(struct platform_device *pdev)
>  		goto asoc_utils_fini;
>  	}
>  
> +	tegra_asoc_utils_fini(&machine->util_data);
> +	platform_device_del(machine->codec);
> +	platform_device_put(machine->codec);
> +	devm_kfree(&pdev->dev, machine);
>  	return 0;

As stated above, this is incorrect.

Did you actually test this? I think you would find this would break the
driver.

Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
