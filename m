Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 139F764EBA2
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 13:54:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A35221734;
	Fri, 16 Dec 2022 13:53:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A35221734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671195248;
	bh=HXicrpVGSs45QjFCn3qWCjtAq4jw9KOqWgvsOhJgeOA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jVe7pUdSNhVZUGPphVePSGKkbn2jqe4vTy1cQr2t0d8jgFP/7OvvkrcR9d1tG5PNz
	 upsynDvt/f8Ub4+14f1xw4x1+luhxhmNgMdB3KeqIt8v5YWtmXdOrLcQR4TwB5YLLY
	 8hwNNdphlIgMiiDwEuTXRcwB5M2wY/tUefmbvxMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A099F804E7;
	Fri, 16 Dec 2022 13:53:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA4D7F804E2; Fri, 16 Dec 2022 13:53:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 31265F804D7
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 13:53:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31265F804D7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 112861042;
 Fri, 16 Dec 2022 04:53:43 -0800 (PST)
Received: from [10.57.88.234] (unknown [10.57.88.234])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44FBC3F5A1;
 Fri, 16 Dec 2022 04:53:01 -0800 (PST)
Message-ID: <f77a41bd-9df7-87c0-9b3c-e9e1a5deaa63@arm.com>
Date: Fri, 16 Dec 2022 12:52:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [6.2][regression] after commit
 ffcb754584603adf7039d7972564fbf6febdc542 all sound devices disappeared (due
 BUG at mm/page_alloc.c:3592!)
Content-Language: en-GB
To: Christoph Hellwig <hch@lst.de>
References: <CABXGCsPnpu0TGHnvXM1we7q1t3tJAOYW2rA=AMvf7ZahcYvpRQ@mail.gmail.com>
 <20221216064645.GA24446@lst.de>
 <a76cb262-a24f-e113-5680-2025aa143ee6@arm.com> <20221216121519.GA5710@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20221216121519.GA5710@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 iommu@lists.linux.dev, Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 m.szyprowski@samsung.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2022-12-16 12:15, Christoph Hellwig wrote:
> On Fri, Dec 16, 2022 at 11:40:57AM +0000, Robin Murphy wrote:
>> On 2022-12-16 06:46, Christoph Hellwig wrote:
>>> Ok, it seems like the sound noncontig alloc code that I already
>>> commented on as potentially bogus GFP_GOMP mapping trips this.  I think
>>> for now the right thing would be to revert the hunk in dma-iommu.c
>>> (see patch below).  The other thing to try would be to remove both
>>> uses GFP_COMP in sound/core/memalloc.c, which should have the same
>>> effect.
>>
>> Or we explicitly strip the flag in dma_alloc_noncontiguous() (and maybe
>> dma_alloc_pages() as well) for consistency with dma_alloc_attrs(). That
>> seems like it might be the most robust option.
> 
> In the long run warning there and returning an error seems like the
> right thing to do, yes. I'm just a little worried doing this right now
> after the merge window.

Fair point, I guess nobody else actually implements 
dma_alloc_noncontiguous(), and dma_alloc_pages() seems a bit of a grey 
area since it is more of an explicit page allocator. So yeah, just 
restoring iommu-dma (perhaps with a mild VM_WARN_ON?) seems like a 
sufficiently safe and sensible fix for the short term. You can have my 
pre-emptive ack for that.

Cheers,
Robin.
