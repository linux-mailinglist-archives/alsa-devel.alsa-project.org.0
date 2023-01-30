Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE96803CD
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 03:23:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 153FA850;
	Mon, 30 Jan 2023 03:22:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 153FA850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675045398;
	bh=+EVqGEjrVwllwAS9VYbU7+o3GlVlVhgJNUmZGyLKeic=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sZjt9p226/d2SaSUhq+zl2COD0pP9Ckq+tEjSDIrzi8j4UsfedRDjJgiS7nNwimKj
	 zHG4HzqEIFpgz40P+A/ymLmwATFelDXfb4TacuNI1VcweGDSeKJuFNkaZQZSUKmhAr
	 xcsfw14blsrBYk+TnwjlXZ0dPEDj6D6tciNLyevM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A088F80155;
	Mon, 30 Jan 2023 03:22:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31052F804B2; Mon, 30 Jan 2023 03:22:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=NICE_REPLY_A, RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2FC1F80155
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 03:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2FC1F80155
Received: from dggpemm100007.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4P4sMs30m2znVPh;
 Mon, 30 Jan 2023 10:20:09 +0800 (CST)
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm100007.china.huawei.com (7.185.36.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 30 Jan 2023 10:22:08 +0800
Subject: Re: [PATCH -next] ASoC: ti: davinci-evm: simplify the code with
 module_platform_driver
To: Mark Brown <broonie@kernel.org>
References: <20230112135457.1490360-1-yangyingliang@huawei.com>
 <Y8lTuGHpKI/dlkDi@sirena.org.uk>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <4a2aba94-4044-55c2-b18f-a218d4dbf9f4@huawei.com>
Date: Mon, 30 Jan 2023 10:22:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y8lTuGHpKI/dlkDi@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100007.china.huawei.com (7.185.36.116)
X-CFilter-Loop: Reflected
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 yangyingliang@huawei.com, peter.ujfalusi@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 2023/1/19 22:29, Mark Brown wrote:
> On Thu, Jan 12, 2023 at 09:54:57PM +0800, Yang Yingliang wrote:
>> The init/exit() of driver only calls platform_driver_register/unregister,
>> it can be simpilfied with module_platform_driver.
> This doesn't apply against current code, please check and resend.
Because commit efe81e9a9273 ("ASoC: remove unused davinci support") is 
not merged yet,
I will resend it after it's merged.

Thanks,
Yang
