Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 621EA62EC69
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 04:43:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67B8D16BE;
	Fri, 18 Nov 2022 04:42:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67B8D16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668743002;
	bh=7PBcqk2ClhQYoKBS8Ds44tRRYAvQ1MqcJdEyoMYD760=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kft2FGlP+FFzx/4Y8LNCQyEsqDfhRuA9f1KtoE5ZO51Yg7ciiBsWbdW8IUFCbDY9R
	 40ZLLRE8xyXyDLGDXtQkjtAn8ge2Ts1QcVFWsVKXHPxa/+3CyF4uBVQ15cMtgaQVGy
	 NbN/AlII+USIL+1vIobGYrfnS3OHoYnn6mT+J4/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBD58F800B5;
	Fri, 18 Nov 2022 04:42:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF544F801D8; Fri, 18 Nov 2022 04:42:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D90B5F800B8
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 04:42:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D90B5F800B8
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ND2Zg0NrSzJnjl;
 Fri, 18 Nov 2022 11:39:07 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 11:42:17 +0800
Subject: Re: [PATCH] ASoC: amd: acp: Fix possible UAF in acp_dma_open
To: Mark Brown <broonie@kernel.org>
References: <20221117061248.3018292-1-cuigaosheng1@huawei.com>
 <Y3YX/LsLzSU+jQ7A@sirena.org.uk>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <2e8cfa9c-ed53-a218-69cb-b45c8c156de4@huawei.com>
Date: Fri, 18 Nov 2022 11:42:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <Y3YX/LsLzSU+jQ7A@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 error27@gmail.com, AjitKumar.Pandey@amd.com, venkataprasad.potturu@amd.com,
 tiwai@suse.com, lgirdwood@gmail.com, nathan@kernel.org,
 Vijendar.Mukunda@amd.com, Vsujithkumar.Reddy@amd.com
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

> Is it not better to only add the newly allocated stream to the
> list once it's fully initialised?  Otherwise something could be
> using a partially initialised item from the list.

Thanks for taking time to review this patch.

I have made a patch v2 and submit it, fix it by adding the newly allocated stream to the
list once it's fully initialised.

On 2022/11/17 19:16, Mark Brown wrote:
> On Thu, Nov 17, 2022 at 02:12:48PM +0800, Gaosheng Cui wrote:
>> Smatch report warning as follows:
>>
>> sound/soc/amd/acp/acp-platform.c:199 acp_dma_open() warn:
>>    '&stream->list' not removed from list
>>
>> If snd_pcm_hw_constraint_integer() fails in acp_dma_open(),
>> stream will be freed, but stream->list will not be removed from
>> adata->stream_list, then list traversal may cause UAF.
> Is it not better to only add the newly allocated stream to the
> list once it's fully initialised?  Otherwise something could be
> using a partially initialised item from the list.
