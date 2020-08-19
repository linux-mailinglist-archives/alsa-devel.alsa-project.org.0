Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F79249B66
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 13:10:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D0F41773;
	Wed, 19 Aug 2020 13:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D0F41773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597835441;
	bh=/DM5Jqiaboabq6XTl/xqwBlaAL8/o1eb9lVjGoLsnKQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ARIElF6kR+EM+oaGiH6SgQcpbQ26UQzhORpZRanB6HL6X+x7cyyfuzccdF+BjXO/o
	 wAPpL3s3vSaykMg7CBBuqRH69csQr4MubvhIf1BWFEVRV1FpWuZnXBWtin3SP1ASnr
	 PUD1sHKS3DfBE5pF3jSDNRHzuopjxSxDln4BOYHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AB3CF80218;
	Wed, 19 Aug 2020 13:09:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3C13F80218; Wed, 19 Aug 2020 13:08:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33A69F80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 13:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33A69F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="V9m5ZcC+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=Yizu0B+kldphRZQIsd5F3k8rBmn/SxqZl5tpjkKKWuU=; b=V9m5ZcC+q6oJS018Hh+tssQ+Vg
 ZvJc6AT32vijPRa8TOeZ5l1EEeGNXvnp2gcM2kiKaf+/GKuCPcSzAdD8UiHZQb0J9J9mnZSsh5naR
 CyfJOIqVcbanGG5qBTTJQghzBVsHA9/yiWDivmVsjq/2hSK7QGtgsjVyd6qtQgvaWkSbydYT25p7o
 e9I5uZx4NIQR+WppTKQJzq9tR2vUFvFMQKG5cTJOBarH5oBA3MiGykeh9YiUXGYO7+jGTgSepyche
 YUE6jKt/4qsj6KbMUlJTEZBmxMjGGkWsG9oPMfVlzIjJDK6GAs5ZYleLgXs6K+Ln4tfLu6/rKRvrP
 qGVNvJ5g==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1k8LxG-0007cU-PW; Wed, 19 Aug 2020 13:08:31 +0200
Received: from [2001:a61:25dc:8101:9e5c:8eff:fe01:8578]
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1k8LxG-0009JP-HA; Wed, 19 Aug 2020 13:08:30 +0200
Subject: Re: pcm|dmaengine|imx-sdma race condition on i.MX6
To: Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>,
 Robin Gong <yibin.gong@nxp.com>
References: <20200813112258.GA327172@pcleri>
 <VE1PR04MB6638EE5BDBE2C65FF50B7DB889400@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <61498763c60e488a825e8dd270732b62@skidata.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <16942794-1e03-6da0-b8e5-c82332a217a5@metafoo.de>
Date: Wed, 19 Aug 2020 13:08:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <61498763c60e488a825e8dd270732b62@skidata.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/25904/Mon Aug 17 15:02:24 2020)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
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

On 8/17/20 9:28 AM, Benjamin Bara - SKIDATA wrote:
> We think this is not an i.MX6-specific problem, but a problem of the DMAengine usage from the PCM.
> In case of a XRUN, the DMA channel is never closed but first a SNDRV_PCM_TRIGGER_STOP next a
> SNDRV_PCM_TRIGGER_START is triggered.
> The SNDRV_PCM_TRIGGER_STOP simply executes a dmaengine_terminate_async() [1]
> but does not await the termination by calling dmaengine_synchronize(),
> which is required as stated by the docu [2].
> Anyways, we are not able to fix it in the pcm_dmaengine layer either at the end of
> SNDRV_PCM_TRIGGER_STOP (called from the DMA on complete interrupt handler)
> or at the beginning of SNDRV_PCM_TRIGGER_START (called from a PCM ioctl),
> since the dmaengine_synchronize() requires a non-atomic context.

I think this might be an sdma specific problem after all. 
dmaengine_terminate_async() will issue a request to stop the DMA. But it 
is still safe to issue the next transfer, even without calling 
dmaengine_synchronize(). The DMA should start the new transfer at its 
earliest convenience in that case.

dmaegine_synchronize() is so that the consumer has a guarantee that the 
DMA is finished using the resources (e.g. the memory buffers) associated 
with the DMA transfer so it can safely free them.

>
> Based on my understanding, most of the DMA implementations don't even implement device_synchronize
> and if they do, it might not really be necessary since the terminate_all operation is synchron.
There are a lot of buggy DMAengine drivers :) Pretty much all of them 
need device_synchronize() to get this right.
>
> With the i.MX6, it looks a bit different:
> Since [4], the terminate_all operation really schedules a worker which waits the required ~1ms and
> then does the context freeing.
> Now, the ioctl(SNDRV_PCM_IOCTL_PREPARE) and the following ioctl(SNDRV_PCM_IOCTL_READI_FRAMES),
> which are called from US to handle/recover from a XRUN, are in a race with the terminate_worker.
> If the terminate_worker finishes earlier, everything is fine.
> Otherwise, the sdma_prep_dma_cyclic() is called, sets up everything and
> as soon as it is scheduled out to wait for data, the terminate_worker is scheduled and kills it.
> In this case, we wait in [5] until the timeout is reached and return with -EIO.
>
> Based on our understanding, there exist two different fixing approaches:
> We thought that the pcm_dmaengine should handle this by either synchronizing the DMA on a trigger or
> terminating it synchronously.
> However, as we are in an atomic context, we either have to give up the atomic context of the PCM
> to finish the termination or we have to design a synchronous terminate variant which is callable
> from an atomic context.
>
> For the first option, which is potentially more performant, we have to leave the atomic PCM context
> and we are not sure if we are allowed to.
> For the second option, we would have to divide the dma_device terminate_all into an atomic sync and
> an async one, which would align with the dmaengine API, giving it the option to ensure termination
> in an atomic context.
> Based on my understanding, most of them are synchronous anyways, for the currently async ones we
> would have to implement busy waits.
> However, with this approach, we reach the WARN_ON [6] inside of an atomic context,
> indicating we might not do the right thing.

I don't know how feasible this is to implement in the SDMA dmaengine 
driver. But I think what is should do is to have some flag to indicate 
if a terminate is in progress. If a new transfer is issued while 
terminate is in progress the transfer should go on a list. Once 
terminate finishes it should check the list and start the transfer if 
there are any on the list.

- Lars

