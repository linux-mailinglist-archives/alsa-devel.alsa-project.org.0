Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EDC294AC
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 11:32:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A540016D0;
	Fri, 24 May 2019 11:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A540016D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558690324;
	bh=h3Me0rkDrL2/IxSlhbvuRGe9Est7GcoBAakwMZjvgaA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IcUbOC4fDjKBmjGxiPg7hFSStgKTh/hQ4YvUi++WGy8jZRvGaIy/UqTcb7Cu+QmC2
	 +4fWV8Gc5W0xtu/7VuhD/lnsLISifG3cZ7BxhenqkZUu7HnA6Fq5zQBn9i8/uwv60W
	 4szMR46uSiHP6iRohHkAabtMGzZD0b1AO7jN5kR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE43AF8962F;
	Fri, 24 May 2019 11:30:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BCA0F89630; Fri, 24 May 2019 11:30:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled
 version=3.4.0
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C20FAF89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 11:30:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C20FAF89625
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="GDQKpbEI"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ce7b9a40000>; Fri, 24 May 2019 02:30:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 24 May 2019 02:30:12 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 24 May 2019 02:30:12 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 May
 2019 09:30:10 +0000
To: Gen Zhang <blackgod016574@gmail.com>, <broonie@kernel.org>,
 <tiwai@suse.com>
References: <20190524021221.GA4753@zhanggen-UX430UQ>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <0fb5b294-99ba-bb73-a972-e1886dc6b792@nvidia.com>
Date: Fri, 24 May 2019 10:30:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524021221.GA4753@zhanggen-UX430UQ>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1558690212; bh=w7pLj2lJsq63RcVDdYEsNgQk2low9PPUZap3YYWNh/g=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=GDQKpbEIpRwC1xcUjvHajuI7CDlbwtFrYQzarWn9yc/JoVLo6g2ETuoiNWO34Cmqt
 aEQ7HHNL3f0qR5fnmTuEHuoDCnV7yzQcB4KedjBSUHjTfcJfFTAIhi80hv3KHuLgHI
 hp+ViKhAU9nAGaPaEbxkg111HDy4eXAo8O/XHqJx4qSCB94TzJwcCaYR+4ZMDWromQ
 tHoe1FpAmaZC+htMSX6vpXsxbhLVRo2NcnUXe3+zox/U1zCTEjEvEBHyuHU/RgjfCc
 K2iS+kIDya/HiZ80DR1rtTWIA76hF0146gtKPQMarw8y6PN521/E1XCg9rlD1A+vKO
 /cjAIXeJRRMKw==
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] pcm030-audio-fabric: Fix a memory leaking
 bug in pcm030_fabric_probe()
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


On 24/05/2019 03:12, Gen Zhang wrote:
> In pcm030_fabric_probe(), 'pdata->codec_device' is allocated by
> platform_device_alloc(). When this allocation fails, ENOMEM is returned.
> However, 'pdata' is allocated by devm_kzalloc() before this site. We
> should free 'pdata' before function ends to prevent memory leaking.
> 
> Similarly, we should free 'pdata' when 'pdata->codec_device' is NULL.
> And we should free 'pdata->codec_device' and 'pdata' when 'ret' is error
> to prevent memory leaking.
> 
> Signed-off-by: Gen Zhang <blackgod016574@gmail.com>

I have seen several of these patches now, and this is not correct. I
think you need to understand how devm_kzalloc() works.

Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
