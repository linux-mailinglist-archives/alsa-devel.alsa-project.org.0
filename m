Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D76282DE69F
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 16:32:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B23C417BA;
	Fri, 18 Dec 2020 16:32:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B23C417BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608305576;
	bh=yt2suL65+difZTgFjIrDenwCCU36rYUPiAmRnqqE51g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BPyhxsd2BTAJAcOoJ7vZAzYsOSZag9eKO4/hQNFIfouC4WrvA9wA6Gn2jx75WA/ND
	 a10YE/ZxdAV/RowRvS/qkwMxosn7jwrpIxbDy3F8mc9AuknHNbHIjTVKvV4RYLf0cm
	 m4swRNrcbeiWLccjkeoRXRzQncrsQM1r8AW2WDNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E42AAF80264;
	Fri, 18 Dec 2020 16:31:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BD1CF80245; Fri, 18 Dec 2020 16:31:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A36E1F80103
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 16:31:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A36E1F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="m5TiUCLk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=2pANCJfTx5WNBpb9qmLGy0qGfbKN1ks6GOCMBDJr+DM=; b=m5TiUCLknhzxY6RzH1H7VRNbUp
 irEhIeyWjF7qTDa5htsls4K3Qbo/tgJIzeMpJY9JGxmHVXO8Fsw6GbChNY52wUih7IEeG1t2412HK
 jl3/OgcZ1UZsH6ys95hxydUMybyKKcSItoftRO29Aqa3nESy60ZVZrbMfiDE2QUHWQo3n/174kIw4
 2Ebnhyu5v9nBuZJQI9Xm72ng9krDrlZ8HB1NJ0i17hxL5J0alGtF+13t67+HRuIvx9J3u0TI3UOnE
 iGCy8PulzMJuXibZA44fTrpRMbzSy0yHFVjko/XNAZ6kGbJXRsBmXmPVrL3IvvCYlrSdU9pD8lwtp
 11UqTyfg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kqHjE-000D0V-EW; Fri, 18 Dec 2020 16:31:36 +0100
Received: from [62.216.202.54] (helo=[192.168.178.20])
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kqHjE-000Ipi-AD; Fri, 18 Dec 2020 16:31:36 +0100
Subject: Re: [PATCH 1/2] ALSA: memalloc: Align buffer allocations in page size
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20201218145625.2045-1-tiwai@suse.de>
 <20201218145625.2045-2-tiwai@suse.de>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <f39d2841-d5dd-80dd-58d1-90d270dd29e4@metafoo.de>
Date: Fri, 18 Dec 2020 16:31:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201218145625.2045-2-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26021/Fri Dec 18 13:56:31 2020)
Cc: Robin Gong <yibin.gong@nxp.com>
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

On 12/18/20 3:56 PM, Takashi Iwai wrote:
> Currently the standard memory allocator (snd_dma_malloc_pages*())
> passes the byte size to allocate as is.  Most of the backends
> allocates real pages, hence the actual allocations are aligned in page
> size.  However, the genalloc doesn't seem assuring the size alignment,
> hence it may result in the access outside the buffer when the whole
> memory pages are exposed via mmap.
>
> For avoiding such inconsistencies, this patch makes the allocation
> size always to be aligned in page size.
>
> Note that, after this change, snd_dma_buffer.bytes field contains the
> aligned size, not the originally requested size.  This value is also
> used for releasing the pages in return.
>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

FWIW

Reviewed-by: Lars-Peter Clausen <lars@metafoo.de>

> ---
>   sound/core/memalloc.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
> index 0f335162f87c..966bef5acc75 100644
> --- a/sound/core/memalloc.c
> +++ b/sound/core/memalloc.c
> @@ -133,6 +133,7 @@ int snd_dma_alloc_pages(int type, struct device *device, size_t size,
>   	if (WARN_ON(!dmab))
>   		return -ENXIO;
>   
> +	size = PAGE_ALIGN(size);
>   	dmab->dev.type = type;
>   	dmab->dev.dev = device;
>   	dmab->bytes = 0;


