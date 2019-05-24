Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB5A29A59
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 16:49:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E8EA1709;
	Fri, 24 May 2019 16:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E8EA1709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558709369;
	bh=9cvZ5UvXOKIXTYlNkJCvcylcyWXLwAjozhtdI9mG51Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MQqdzkWflGpEIIlO8WOWXuddl7gialGFJyKEaWIf8JbOCvF+jcIf9ZvCBR9YIbvc3
	 VNulJfZose68XeQpVav/mIGWRS021oL9VW6j5nCMtZbNCwpwSoKi0BCQwrL1L5B7Nf
	 eK9LfPCMADlSz4zX/JngcOdK3PmPCGK000bpjdTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5BB1F8962F;
	Fri, 24 May 2019 16:47:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F643F89630; Fri, 24 May 2019 16:47:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled
 version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4525F89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 16:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4525F89625
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="ba489+Bm"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ce804040000>; Fri, 24 May 2019 07:47:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 24 May 2019 07:47:37 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 24 May 2019 07:47:37 -0700
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 May
 2019 14:47:35 +0000
To: Gen Zhang <blackgod016574@gmail.com>
References: <20190524005014.GA2289@zhanggen-UX430UQ>
 <b2d43dfe-17e5-a975-435b-49f2aa2ad550@nvidia.com>
 <20190524143309.GA8631@zhanggen-UX430UQ>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <e52f4140-a119-a584-40a2-6359d6e1784a@nvidia.com>
Date: Fri, 24 May 2019 15:47:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524143309.GA8631@zhanggen-UX430UQ>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1558709252; bh=0g5JbZfsE+2QT4bUSsZSJoNvEVoG7Gi9MR+1f1C9IVM=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ba489+BmxVdebKbeWlKfxGyqR6t2ZwGV7PlsvNZbWbUx1K+CaP9IxltJ86OrzGMPo
 iJHqm+bM3oBOcb1rMgvDxVk0Qq6YVAygJ/6S/Q+k3XnsuEhA3FfXtQRmykLkeD/an9
 YWKWzgUDJpRiperBC8zWFwHoHro8yw8QV/qV2fPFjDMQrRN7npmMVeaYxtctasNBD+
 mtdY8qYqrcH7B+Czei5YYb30TMbVqqD6VLhuV4y31skw06iGAO9ySNf9b5w9/kIc3C
 FfGyj68uI0ciZj9lEbd/e+lAblFBWqdlTBf6PSJIr0zFXdlfUt0CC9/zrrndbbQaZq
 QmIHjBOq1yaNw==
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
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


On 24/05/2019 15:33, Gen Zhang wrote:
> On Fri, May 24, 2019 at 09:33:13AM +0100, Jon Hunter wrote:
>>
>> On 24/05/2019 01:50, Gen Zhang wrote:
>>> In tegra_wm9712_driver_probe(), 'machine->codec' is allocated by
>>> platform_device_alloc(). When it is NULL, function returns ENOMEM.
>>> However, 'machine' is allocated by devm_kzalloc() before this site.
>>> Thus we should free 'machine' before function ends to prevent memory
>>> leaking.
>>
>> Memory allocated by devm_xxx() is automatically freed on failure so this
>> is not correct.
> Thanks for your comments, Jon. But after I examined the code, I am still
> confused about the usage of devm_kmalloc(). You can kindly refer to 
> hisi_sas_debugfs_init() in drivers/scsi/hisi_sas/hisi_sas_main.c. And
> devm_kfree() is used to free a memory allocated by devm_kmalloc(). And
> I found other situations similar to this in other files.
> 
> So, I hope you can give me some guidance on this. Thanks!

Please refer to the devres documentation [0].

Cheers,
Jon

[0] https://www.kernel.org/doc/Documentation/driver-model/devres.txt

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
