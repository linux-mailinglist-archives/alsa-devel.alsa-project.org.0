Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B22F4245BFF
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 07:40:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E92C1673;
	Mon, 17 Aug 2020 07:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E92C1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597642829;
	bh=nC3QtiPkc2ash+7NhCkNY1Q6+j1FJN1xDaKIPykDIQE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hgGB9HOhfFrAAgGQx9ZmbeH0qUfqvjXamouJgKldtwVCVCpDXk++CJmN1GLNWK5BM
	 DXykuV0CV2n9wbXuMRAOjpYgRI720iBfCvMKNHp0dMW3jxM2i/B0UFMe0QH+PdjRkW
	 JUkWXSKshvTmQ+uTJ5WcCSNPgk8OSbgPz7MYAcc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B00EF800EF;
	Mon, 17 Aug 2020 07:38:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D4D1F80218; Mon, 17 Aug 2020 07:38:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CD3AF800D3
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 07:38:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CD3AF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=skidata.com header.i=@skidata.com
 header.b="g3ZQ1WwK"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
 t=1597642720; x=1629178720;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nC3QtiPkc2ash+7NhCkNY1Q6+j1FJN1xDaKIPykDIQE=;
 b=g3ZQ1WwK2LfsTSExisMhJBmH+Lr6NiGFz0I6ikikdbbu5/z/lDRIBcx9
 bv1Hq9hNFPz6vFTQ0MwWlEjRVFIhvadlcqKNxXmT8EVy7+8019b/ALZo4
 7YaNB0XSWAZCY87+bQxpyFhmGfVjzT+4apHiRVyovTctDKbSvSDwIAdM7
 zK2B3pLdoLoWm2XOtkT46urJ1AgI7FfrjyVCHZu09pFGUY2q86TisTWlt
 pooNK7V02WrWDG0RsU6Z3S+pMtDSdwKMMXvI1OtlsIdp0JFvfvm3XChf4
 SSPbI8nVO9RUF3KN4hSk/9bFXISLDOX1WtTz9W2+Xzde1sreDop2z1Vis g==;
IronPort-SDR: Cyb4DgRj+rCeSt/lc6ca/UWAxILZY3BwglmUQTpWJKQHBZEMAjDzPsI/XWGEqNlWzWLVt2G5t0
 ftCvLYazD3V9kXiumE7Dl9j53lr16eEt+XMB1S73ckdJQOEgch5Laa9QH2iMy1OOOEVG94MmRg
 eI1QfaSCRzXL/yYa0rMlnC+FXRsAypoOJKqbBx9YX3zNK5O6JBvu19RU57ttVdjfR64ruRgtyz
 DC2rVUWr89IXhyUIsDZjAO5qfLdU7CDpruLk5D66jwnhCxXbO6t/cAHKtunyJaZMyvRnOESEV4
 fkA=
X-IronPort-AV: E=Sophos;i="5.76,322,1592863200"; d="scan'208";a="26161395"
Date: Mon, 17 Aug 2020 07:38:36 +0200
From: Richard Leitner <richard.leitner@skidata.com>
To: Robin Gong <yibin.gong@nxp.com>
Subject: Re: pcm|dmaengine|imx-sdma race condition on i.MX6
Message-ID: <20200817053836.GC551027@pcleri>
References: <20200813112258.GA327172@pcleri>
 <VE1PR04MB6638EE5BDBE2C65FF50B7DB889400@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <7f98cd6d30404e4d9d621f57f45ae441@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7f98cd6d30404e4d9d621f57f45ae441@skidata.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, linux-kernel@vger.kernel.org,
 nicoleotsuka@gmail.com, vkoul@kernel.org, dl-linux-imx <linux-imx@nxp.com>,
 kernel@pengutronix.de, dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
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

On Fri, Aug 14, 2020 at 11:18:10AM +0200, Robin Gong wrote:
> 
> On 2020/08/13 19:23: Richard Leitner <richard.leitner@skidata.com> wrote:
> > Hi,
> > we've found a race condition with the PCM on the i.MX6 which results 
> > in an -EIO for the SNDRV_PCM_IOCTL_READI_FRAMES ioctl after an -EPIPE (XRUN).
> > 
> > A possible reproduction may look like the following reduced call graph 
> > during a PCM capture:
> > 
> > us -> ioctl(SNDRV_PCM_IOCTL_READI_FRAMES)
> >       - wait_for_avail()
> >         - schedule_timeout()
> >    -> snd_pcm_update_hw_ptr0()
> >       - snd_pcm_update_state: EPIPE (XRUN)
> >       - sdma_disable_channel_async() # get's scheduled away due to sleep us
> > <- ioctl(SNDRV_PCM_IOCTL_READI_FRAMES) returns -EPIPE
> > us -> ioctl(SNDRV_PCM_IOCTL_PREPARE) # as reaction to the EPIPE (XRUN)
> > us -> ioctl(SNDRV_PCM_IOCTL_READI_FRAMES) # next try to capture frames
> >       - sdma_prep_dma_cyclic()
> >         - sdma_load_context() # not loaded as context_loaded is 1
> >       - wait_for_avail()
> >         - schedule_timeout()
> > # now the sdma_channel_terminate_work() comes back and sets # 
> > context_loaded = false and frees in vchan_dma_desc_free_list().
> > us <- ioctl returns -EIO (capture write error (DMA or IRQ trouble?))
>
> Seems the write error caused by context_loaded not set to false before
> next transfer start? If yes, please have a try with the 03/04 of the below
> patch set, anyway, could you post your failure log?
> https://lkml.org/lkml/2020/8/11/111

Thanks for the pointer to those patches. I've tested them on top of the
v5.8 tag during the weekend. It seems those patches are mitigiating
the described EIO issue.

Nonetheless IMHO this patches are not fixing the root cause of the
problem (unsynchronized sdma_disable_channel_async / sdma_prep_dma_cyclic).
Do you (or somebody else) have any suggestions/comments/objections on that?

regards;rl

> 
> > 
> > 
> > What we have found out, based on our understanding:
> > The dmaengine docu states that a dmaengine_terminate_async() must be 
> > followed by a dmaengine_synchronize().
> > However, in the pcm_dmaengine.c, only dmaengine_terminate_async() is 
> > called (for performance reasons and because it might be called from an 
> > interrupt handler).
> > 
> > In our tests, we saw that the user-space immediately calls
> > ioctl(SNDRV_PCM_IOCTL_PREPARE) as a handler for the happened xrun 
> > (previous ioctl(SNDRV_PCM_IOCTL_READI_FRAMES) returns with -EPIPE). In 
> > our case (imx-sdma.c), the terminate really happens asynchronously 
> > with a worker thread which is not awaited/synchronized by the
> > ioctl(SNDRV_PCM_IOCTL_PREPARE) call.
> > 
> > Since the syscall immediately enters an atomic context 
> > (snd_pcm_stream_lock_irq()), we are not able to flush the work of the 
> > termination worker from within the DMA context. This leads to an 
> > unterminated DMA getting re-initialized and then terminated.
> > 
> > On the i.MX6 platform the problem is (if I got it correctly) that the
> > sdma_channel_terminate_work() called after the -EPIPE gets scheduled 
> > away (for the 1-2ms sleep [1]). During that time the userspace already 
> > sends in the
> > ioctl(SNDRV_PCM_IOCTL_PREPARE) and
> > ioctl(SNDRV_PCM_IOCTL_READI_FRAMES).
> > As none of them are anyhow synchronized to the terminate_worker the
> > vchan_dma_desc_free_list() [2] and "sdmac->context_loaded = false;" 
> > [3] are executed during the wait_for_avail() [4] of the 
> > ioctl(SNDRV_PCM_IOCTL_READI_FRAMES).
> > 
> > To make sure we identified the problem correctly we've tested to add a 
> > "dmaengine_synchronize()" before the snd_pcm_prepare() in [5]. This 
> > fixed the race condition in all our tests. (Before we were able to 
> > reproduce it in 100% of the test runs).
> > 
> > Based on our understanding, there are two different points to ensure 
> > the
> > termination:
> > Either ensure that the termination is finished within the previous 
> > SNDRV_PCM_IOCTL_READI_FRAMES call (inside the DMA context) or 
> > finishing it in the SNDRV_PCM_IOCTL_PREPARE call (and all other 
> > applicable ioclts) before entering the atomic context (from the PCM context).
> > 
> > We initially thought about implementing the first approach, basically 
> > splitting up the dma_device terminate_all operation into a sync
> > (busy-wait) and a async one. This would align the operations with the 
> > DMAengine interface and would enable a sync termination variant from 
> > atomic contexts.
> > However, we saw that the dma_free_attrs() function has a WARN_ON on 
> > irqs disabled, which would be the case for the sync variant.
> > Side note: We found this issue on the current v5.4.y LTS branch, but 
> > it also affects v5.8.y.
> > 
> > Any feedback or pointers how we may fix the problem are warmly welcome!
> > If anything is unclear please just ask :-)
> > 
> > regards;
> > Richard Leitner
> > Benjamin Bara
