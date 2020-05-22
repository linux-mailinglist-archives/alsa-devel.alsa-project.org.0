Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2701DE86A
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 15:59:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 241611894;
	Fri, 22 May 2020 15:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 241611894
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590155966;
	bh=txGPXongqYOy9ZuqFERZb+XtTFVRKZ8ON1i+Qk9c19I=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jJC1blmOldOssVUnMPZwLTLjt79dOz0nThO3wcwQjaIsjB1/4LnlV+gfYkeKuvwEm
	 7MmHJeruazKoLv3uGiJLbjbIX9BMc+EH6GXy2RLivM2+9Cy6Ew+3eOlphfgvxIBytG
	 NVN9oBG3a7L/BWDa0FSQQ4FoUkOsK8i22NjtFoV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30328F80213;
	Fri, 22 May 2020 15:57:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A239F801F9; Fri, 22 May 2020 15:57:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89DF5F80140
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 15:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89DF5F80140
Received: from [123.114.63.221] (helo=[192.168.2.109])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1jc8Au-0002A2-1g; Fri, 22 May 2020 13:57:24 +0000
Subject: Re: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
From: Hui Wang <hui.wang@canonical.com>
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
 Mark Brown <broonie@kernel.org>
References: <20200522081738.11636-1-hui.wang@canonical.com>
 <20200522110811.GB5801@sirena.org.uk>
 <DM6PR12MB2633D541378EB715AC18531C97B40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <20200522112228.GD5801@sirena.org.uk>
 <DM6PR12MB26337FD48A99D14814EB32F097B40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <2285006c-388c-810f-c1ac-ef76ab2319bb@canonical.com>
Message-ID: <0acc99c4-6fe0-b613-4af2-5439ecd8981b@canonical.com>
Date: Fri, 22 May 2020 21:57:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2285006c-388c-810f-c1ac-ef76ab2319bb@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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


On 2020/5/22 下午8:59, Hui Wang wrote:
>
> On 2020/5/22 下午7:28, Mukunda, Vijendar wrote:
>>
>>> -----Original Message-----
>>> From: Mark Brown <broonie@kernel.org>
>>> Sent: Friday, May 22, 2020 4:52 PM
>>> To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
>>> Cc: Hui Wang <hui.wang@canonical.com>; alsa-devel@alsa-project.org
>>> Subject: Re: [PATCH v2] ASoC: amd: put off registering mach 
>>> platform_dev to
>>> avoid -517 err
>>>
>>> On Fri, May 22, 2020 at 11:13:43AM +0000, Mukunda, Vijendar wrote:
>>>
>>>> Does sound card registration failure at boot time due to modules 
>>>> loading
>>> order can be considered as bug ?
>>>
>>> No, this is totally normal.  If it failed to bind ever then that'd be a
>>> problem but this is just deferring.
>> In that case, we don't need this work around I guess.
>> At maximum during boot time, we may see few sound card registration 
>> failure logs,
>> Which is normal.
>>
>> With this change, our concept of ACP parent device which will create 
>> platform devices
>> for DMA driver, Generic DMIC driver and Machine driver will be changed.
>> We implemented same design for Raven I2S driver as well which got 
>> productized.
>>
> OK, got it.  It doesn't affect the sound function anyway.

BTW, so far, I have not seen the -517 error from ubuntu kernel dmesg on 
PC or laptop. Maybe this is the 1st driver to print this error in the 
dmesg on PC or laptop, so I guess it probably confuses the users or our QA.


