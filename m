Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 024A662C217
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 16:16:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E3EE857;
	Wed, 16 Nov 2022 16:15:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E3EE857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668611802;
	bh=2nKTTHuBo0yWmtjHrwmSld8aC2u4XN4DUqawQl4HluQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ReWUjy4zh6nTmApYxMBZs+D0u9bn1b+TwxFhSYYZ3A+uZYciOxZTl+dcsKnB5UGCz
	 6/eyvrNmPTdIwV7Hq/4X6oxm/AzYNe9T73lnsmb26/HR5A/lqLXeVWiUpG4y5tPJyo
	 Vo4DRdlv6kj9dRR8dum0BVQfdLujnKP0mgn4qYzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F1A4F80238;
	Wed, 16 Nov 2022 16:15:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2961F800B5; Wed, 16 Nov 2022 16:15:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D6759F800B5
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 16:15:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6759F800B5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDFAE150C;
 Wed, 16 Nov 2022 07:15:36 -0800 (PST)
Received: from [10.57.70.190] (unknown [10.57.70.190])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3E913F587;
 Wed, 16 Nov 2022 07:15:26 -0800 (PST)
Message-ID: <be8ca3f9-b7f7-5402-0cfc-47b9985e007b@arm.com>
Date: Wed, 16 Nov 2022 15:15:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/7] RDMA/hfi1: don't pass bogus GFP_ flags to
 dma_alloc_coherent
Content-Language: en-GB
To: Dean Luick <dean.luick@cornelisnetworks.com>,
 Christoph Hellwig <hch@lst.de>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexandra Winter <wintera@linux.ibm.com>, Wenjia Zhang
 <wenjia@linux.ibm.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Russell King <linux@armlinux.org.uk>
References: <20221113163535.884299-1-hch@lst.de>
 <20221113163535.884299-3-hch@lst.de>
 <c7c6eb30-4b54-01f7-9651-07deac3662bf@cornelisnetworks.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <c7c6eb30-4b54-01f7-9651-07deac3662bf@cornelisnetworks.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-s390@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

On 2022-11-16 14:40, Dean Luick wrote:
> On 11/13/2022 10:35 AM, Christoph Hellwig wrote:
>> dma_alloc_coherent is an opaque allocator that only uses the GFP_ flags
>> for allocation context control.  Don't pass GFP_USER which doesn't make
>> sense for a kernel DMA allocation or __GFP_COMP which makes no sense
>> for an allocation that can't in any way be converted to a page pointer.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>   drivers/infiniband/hw/hfi1/init.c | 21 +++------------------
>>   1 file changed, 3 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/infiniband/hw/hfi1/init.c b/drivers/infiniband/hw/hfi1/init.c
>> index 436372b314312..24c0f0d257fc9 100644
>> --- a/drivers/infiniband/hw/hfi1/init.c
>> +++ b/drivers/infiniband/hw/hfi1/init.c
>> @@ -1761,17 +1761,11 @@ int hfi1_create_rcvhdrq(struct hfi1_devdata *dd, struct hfi1_ctxtdata *rcd)
>>        unsigned amt;
>>
>>        if (!rcd->rcvhdrq) {
>> -             gfp_t gfp_flags;
>> -
>>                amt = rcvhdrq_size(rcd);
>>
>> -             if (rcd->ctxt < dd->first_dyn_alloc_ctxt || rcd->is_vnic)
>> -                     gfp_flags = GFP_KERNEL;
>> -             else
>> -                     gfp_flags = GFP_USER;
>>                rcd->rcvhdrq = dma_alloc_coherent(&dd->pcidev->dev, amt,
>>                                                  &rcd->rcvhdrq_dma,
>> -                                               gfp_flags | __GFP_COMP);
>> +                                               GFP_KERNEL);
> 
> A user context receive header queue may be mapped into user space.  Is that not the use case for GFP_USER?  The above conditional is what decides.
> 
> Why do you think GFP_USER should be removed here?

Coherent DMA buffers are allocated by a kernel driver or subsystem for 
the use of a device managed by that driver or subsystem, and thus they 
fundamentally belong to the kernel as proxy for the device. Any coherent 
DMA buffer may be mapped to userspace with the dma_mmap_*() interfaces, 
but they're never a "userspace allocation" in that sense.

Thanks,
Robin.
