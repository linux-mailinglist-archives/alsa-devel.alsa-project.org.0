Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC9E1E0531
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 05:34:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 471DF1705;
	Mon, 25 May 2020 05:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 471DF1705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590377659;
	bh=voq7l85ltvwz163CaGWILMb0SbGbbFxiD0ldfBTP6oc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pSVTqbDH1R8WpNBl1or5wVz6z7YyKPcrXkBl/Xvj/5c3Vo/gDk23hJUgOg7anNSlL
	 SM+4dNxu4udFeJ9dEGKzzNCfNHSXslPhDOuSEAqmORrLRf9LX6gHIEMK4GAH9Hr8aY
	 iwJ05Z16glMirbCt60SUIphMbZkppaZ3ZQQY0NpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63123F8021E;
	Mon, 25 May 2020 05:32:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6419BF80100; Mon, 25 May 2020 05:32:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C233AF80149
 for <alsa-devel@alsa-project.org>; Mon, 25 May 2020 05:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C233AF80149
Received: from [123.114.63.221] (helo=[192.168.2.109])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1jd3qW-00031l-4j; Mon, 25 May 2020 03:32:12 +0000
Subject: Re: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
 Mark Brown <broonie@kernel.org>
References: <20200522081738.11636-1-hui.wang@canonical.com>
 <20200522110811.GB5801@sirena.org.uk>
 <DM6PR12MB2633D541378EB715AC18531C97B40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <20200522112228.GD5801@sirena.org.uk>
 <DM6PR12MB26337FD48A99D14814EB32F097B40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <2285006c-388c-810f-c1ac-ef76ab2319bb@canonical.com>
 <0acc99c4-6fe0-b613-4af2-5439ecd8981b@canonical.com>
 <DM6PR12MB26335DA69D595C332A20779697B40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <DM6PR12MB2633FECD2F752EFE8DD4A6AA97B40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <20200522153225.GM5801@sirena.org.uk>
 <DM6PR12MB263317584234E31A4937199197B50@DM6PR12MB2633.namprd12.prod.outlook.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <46586061-79a3-4d86-11f3-0b484849320c@canonical.com>
Date: Mon, 25 May 2020 11:32:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB263317584234E31A4937199197B50@DM6PR12MB2633.namprd12.prod.outlook.com>
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


On 2020/5/23 上午8:11, Mukunda, Vijendar wrote:
>
>> -----Original Message-----
>> From: Mark Brown <broonie@kernel.org>
>> Sent: Friday, May 22, 2020 9:02 PM
>> To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
>> Cc: Hui Wang <hui.wang@canonical.com>; alsa-devel@alsa-project.org
>> Subject: Re: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
>> avoid -517 err
>>
>> On Fri, May 22, 2020 at 03:14:21PM +0000, Mukunda, Vijendar wrote:
>>
>>> I have seen sample implementation of deferred probe in one of the machine
>>> driver code using late_initcall() API.
>>> Not sure how this api really works which will resolve the modules loading
>> sequence
>>> issue.
>> What deferred probe does is keep a list of devices that failed to bind
>> with a deferred probe error code then every time a device does manage to
>> bind it retries all those failed devices in case the new device provides
>> whatever was missing from one of the others.  It's a bit brute force and
>> ignorance but it does sort things out in the end if all the drivers are
>> actually there and just loaded in the wrong order.
> We see one more problem with this patch.
> We are going to add support for I2S endpoint on another
> platform based on Renoir.
>
> Platform device creation logic going to be expanded in ACP PCI
> driver probe call.
> Because ACP Is Parent device , Ideally platform devices creation logic
> should be handled in ACP PCI driver.
>
> Based on Audio configuration, During ACP PCI driver probe call,
> platform devices will be created.
>
> In case of I2S endpoint support,  machine driver gets probed via acpi dev id match.
> If we go ahead with this patch, We have to expand the work around logic
> by adding extra check in PDM DMA driver  which doesn't seems to be good.
>
> Currently I observed only two times sound card registration failure in dmesg
> during boot time.
> For the sake of avoiding  few card registration failure logs observed in dmesg,
> I don't think at this stage, we really need to go ahead with this patch.

OK, got it, thanks.


>
>
>
>
>
>
>
