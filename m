Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7858C1AD9E8
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 11:30:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E0471686;
	Fri, 17 Apr 2020 11:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E0471686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587115810;
	bh=PCnXCdaH14OqsPrtKwwoKYCJd1+eW3kLIu93vUWUCzE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D7zcVHnIIu8a3DpVLtlDHjO+X/ZVlkwLEatqp9uNOqc8JyC2/YJjO3vpYQxZBAJLj
	 xkKFetNudR9q5NUusVS0utibnxxjva3Sg6PYrkmtF3W9DpM72pjzjeFoRGpAUSR8AD
	 0d4eDsELn0CDoG5BufDhS9qg53kRnHl6N8oqCpvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 736D5F8028C;
	Fri, 17 Apr 2020 11:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22616F8028B; Fri, 17 Apr 2020 11:23:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33F5BF80264
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 11:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33F5BF80264
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0F167F3F89FD44370F11;
 Fri, 17 Apr 2020 17:23:18 +0800 (CST)
Received: from [127.0.0.1] (10.166.213.7) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 17:23:07 +0800
Subject: Re: [PATCH] ALSA: au88x0: remove some dead code
To: Takashi Iwai <tiwai@suse.de>
References: <20200417092232.13371-1-yanaijie@huawei.com>
 <s5ho8rqbhz1.wl-tiwai@suse.de>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <3caeb0e2-0f4a-3f98-07e9-dd8f78a33dc3@huawei.com>
Date: Fri, 17 Apr 2020 17:23:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <s5ho8rqbhz1.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.166.213.7]
X-CFilter-Loop: Reflected
Cc: hariprasad.kelam@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, Hulk Robot <hulkci@huawei.com>
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



在 2020/4/17 17:05, Takashi Iwai 写道:
> On Fri, 17 Apr 2020 11:22:32 +0200,
> Jason Yan wrote:
>>
>> Fix the following gcc warning:
>>
>> sound/pci/au88x0/au88x0_a3ddata.c:62:25: warning: ‘A3dHrirDImpulse’
>> defined but not used [-Wunused-const-variable=]
>>   static const a3d_Hrtf_t A3dHrirDImpulse = {
>>                           ^~~~~~~~~~~~~~~
>> sound/pci/au88x0/au88x0_a3ddata.c:50:25: warning: ‘A3dHrirSatTest’
>> defined but not used [-Wunused-const-variable=]
>>   static const a3d_Hrtf_t A3dHrirSatTest = {
>>                           ^~~~~~~~~~~~~~
>> sound/pci/au88x0/au88x0_a3ddata.c:33:25: warning: ‘A3dHrirOnes’ defined
>> but not used [-Wunused-const-variable=]
>>   static const a3d_Hrtf_t A3dHrirOnes = {
>>                           ^~~~~~~~~~~
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> 
> I'd rather keep them but disable with #if 0, if it's only about the
> minor compiler warnings.
> 
> The whole code is a result of reverse engineering and those dead code
> are simply there just because of lack of testing.  Removing makes it
> impossible for retesting (if any).
> 

Actually you can easily recover the code from git history.

Anyway, it's all your choice.

Thanks,

Jason

> 
> thanks,
> 
> Takashi
> 
>> ---
>>   sound/pci/au88x0/au88x0_a3d.c     | 23 -------------------
>>   sound/pci/au88x0/au88x0_a3ddata.c | 38 -------------------------------
>>   2 files changed, 61 deletions(-)
>>
>> diff --git a/sound/pci/au88x0/au88x0_a3d.c b/sound/pci/au88x0/au88x0_a3d.c
>> index 2db183f8826a..4d3b79a34c69 100644
>> --- a/sound/pci/au88x0/au88x0_a3d.c
>> +++ b/sound/pci/au88x0/au88x0_a3d.c
>> @@ -512,31 +512,8 @@ static void a3dsrc_ProgramPipe(a3dsrc_t * a)
>>   	/* Single spike leads to identity transfer function. */
>>   	a3dsrc_SetHrtfCurrent(a, A3dHrirImpulse, A3dHrirImpulse);
>>   	a3dsrc_SetHrtfTarget(a, A3dHrirImpulse, A3dHrirImpulse);
>> -
>> -	/* Test: Sounds saturated. */
>> -	//a3dsrc_SetHrtfCurrent(a, A3dHrirSatTest, A3dHrirSatTest);
>> -	//a3dsrc_SetHrtfTarget(a, A3dHrirSatTest, A3dHrirSatTest);
>>   }
>>   
>> -/* VDB = Vortex audio Dataflow Bus */
>> -#if 0
>> -static void a3dsrc_ClearVDBData(a3dsrc_t * a, unsigned long aa)
>> -{
>> -	vortex_t *vortex = (vortex_t *) (a->vortex);
>> -
>> -	// ((aa >> 2) << 8) - (aa >> 2)
>> -	hwwrite(vortex->mmio,
>> -		a3d_addrS(a->slice, A3D_SLICE_VDBDest) + (a->source << 2), 0);
>> -	hwwrite(vortex->mmio,
>> -		a3d_addrS(a->slice,
>> -			  A3D_SLICE_VDBDest + 4) + (a->source << 2), 0);
>> -	/*
>> -	   hwwrite(vortex->mmio, 0x19c00 + (((aa>>2)*255*4)+aa)*8, 0);
>> -	   hwwrite(vortex->mmio, 0x19c04 + (((aa>>2)*255*4)+aa)*8, 0);
>> -	 */
>> -}
>> -#endif
>> -
>>   /* A3D HwSource stuff. */
>>   
>>   static void vortex_A3dSourceHw_Initialize(vortex_t * v, int source, int slice)
>> diff --git a/sound/pci/au88x0/au88x0_a3ddata.c b/sound/pci/au88x0/au88x0_a3ddata.c
>> index 18623cb6bc52..cc41ea67a6d3 100644
>> --- a/sound/pci/au88x0/au88x0_a3ddata.c
>> +++ b/sound/pci/au88x0/au88x0_a3ddata.c
>> @@ -30,44 +30,6 @@ static const a3d_Hrtf_t A3dHrirImpulse = {
>>   	0, 0, 0
>>   };
>>   
>> -static const a3d_Hrtf_t A3dHrirOnes = {
>> -	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff,
>> -	0x7fff,
>> -	0x7fff,
>> -	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff,
>> -	0x7fff,
>> -	0x7fff,
>> -	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff,
>> -	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff,
>> -	0x7fff,
>> -	0x7fff,
>> -	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff,
>> -	0x7fff,
>> -	0x7fff,
>> -	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff
>> -};
>> -
>> -static const a3d_Hrtf_t A3dHrirSatTest = {
>> -	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff,
>> -	0x7fff,
>> -	0x7fff,
>> -	0x8001, 0x8001, 0x8001, 0x8001, 0x8001, 0x8001, 0x8001, 0x8001,
>> -	0x8001,
>> -	0x8001,
>> -	0x7fff, 0x0000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>> -	0, 0, 0,
>> -	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
>> -};
>> -
>> -static const a3d_Hrtf_t A3dHrirDImpulse = {
>> -	0, 0x7fff, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>> -	0, 0, 0,
>> -	0, 0, 0, 0,
>> -	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>> -	0, 0, 0,
>> -	0, 0, 0
>> -};
>> -
>>   static const a3d_ItdDline_t A3dItdDlineZeros = {
>>   	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>>   	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
>> -- 
>> 2.21.1
>>
> 
> .
> 

