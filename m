Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BD6DF023
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 16:42:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE539166C;
	Mon, 21 Oct 2019 16:41:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE539166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571668928;
	bh=TqDhy3w8ejINvI0xKKHbG57IWtE4LvX/ni8RFvGx0JY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LxNpvYFYBzRc4JwN52Kdrl8l84MARAmHNzgEnddoeBMHNhr/YS3841JHNeOdvAvWW
	 jM5xSzWGdK6vOEyO3Xf39l4z7yPS1mpzofXmPkVmYsPoBE3fSVxbnmmUkOdH6mluTM
	 qwTaEOK8eijb6vCpLY72vsKLU3ILDxc7pYvjhjXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47B05F801EB;
	Mon, 21 Oct 2019 16:40:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20B0DF80368; Mon, 21 Oct 2019 16:40:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 504F1F801EB
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 16:40:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 504F1F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="r6QYaJd9"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="FeN0JGfG"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B7FE654A;
 Mon, 21 Oct 2019 10:40:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 21 Oct 2019 10:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=UfVmvk/I5XyrBHQTUFyuqjkubQ9
 +hhYCZ378we1yqXw=; b=r6QYaJd9KO4mZNG82bftCeli8nhgfU85/SM/DCOfNud
 wfdMgGzrV/7cTHp9gz4LRtqYl9LpvltiI2JodV1Gyv2B7/CzXRvnXxlzEJc1fNQm
 JMnRvV8DsJX7mpg+PXOfgkmuowE6RZx1r2arZGMkT1GQc4fWsNbQWXY/2oCg/35T
 qXWp2Pgzjk2ZaVLG+ALCbcCECiGEo3m97QqzCmqm3BpGgSNZunc09k//iC1rp8t4
 l1oxzYOSGBqmP3OyM8NnFYf98E+W2ky2+xOon7afSrzZE4WenV1WiJx0bozfdTO4
 IT2KQcoViBANvb0wXYS7+BUMMDpbaqsQbX15NBF3VrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UfVmvk
 /I5XyrBHQTUFyuqjkubQ9+hhYCZ378we1yqXw=; b=FeN0JGfGgHxmOKbaKef7cT
 7+auwgjpqC+XaFCwu3Q/HvZeiVP7vh7x/lVs1cngq9GkR1HRDKuLOrrxux7qHOvh
 4VPoAZeKKdEKnRzclqByWWFKyAS7v4hUEQyYArg6hr9ZevbYsCwiqx3myTNPmICW
 WMsisl73udTlsM9hYHHYKkbiANL3zGUeXjonj35PYevb/bdftLqs5G8DDDq0M/9D
 T7jAh/MlQeQT/UlNesnx2BKTHa33ySJdE9i7nQQ3lP9qyz/v1D3nxO4M8Xb44Zaj
 U+ldnHfsTnO4iQsf9t9WONaviBYHMbNxTNdEgN0tTJudnDzdQsB+T/LFNy3IcFNw
 ==
X-ME-Sender: <xms:S8OtXfP3ANELVFn1b81sueoYm9RUbZwYcyk9ZETB__vouk8UGVoKvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkeehgdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucffohhmrghinheptggrlhhlsggrtghkrdhstgenucfkphepudegrdefrdejhedr
 udekudenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmh
 hotggthhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:S8OtXePZVsvgphIPN4iZB34O-1Mxbv1cLWCaNYSlTNZv7cDcrExHiA>
 <xmx:S8OtXZSkqxQYDqfP1erPwh1UgI44gpk3PB_-n5LXLBvmtxrhw9tVEw>
 <xmx:S8OtXYAUYSIQwdwHe6E7Pu3TsvFUNol0twsj7VZA0DuB-raMmfOzHg>
 <xmx:TMOtXfBTuRvWQIBh61gx0EM-9xtduI2v7h7rI2h_b3gVxxZ9ThSu9w>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 47EFFD60068;
 Mon, 21 Oct 2019 10:40:10 -0400 (EDT)
Date: Mon, 21 Oct 2019 23:40:07 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de
Message-ID: <20191021144006.GA5560@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20191018061911.24909-1-o-takashi@sakamocchi.jp>
 <s5hsgnpfbdj.wl-tiwai@suse.de> <20191020083718.GA23146@workstation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191020083718.GA23146@workstation>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 0/6] ALSA: firewire: handle several IR/IT
 context in callback of the IT context
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Sun, Oct 20, 2019 at 05:37:19PM +0900, Takashi Sakamoto wrote:
> On Sat, Oct 19, 2019 at 09:22:16AM +0200, Takashi Iwai wrote:
> > Although the preempt handling in AMDTP looks a bit suspicious, it
> > should be OK as long as the code has been tested, so I took as is.
> 
> I can understand your concern but it works well as long as I tested.
> In this time I use preemption-disable during processing queued packet in
> process context but before I had used irq-disable instead.
> 
> I depict a call graph to process isoc packet in process context below:
> 
> On pcm.ack() or pcm.pointer() callbacks:
> fw_iso_context_flush_completions()
> ->struct fw_card_driver.flush_iso_completions()
> = ohci_flush_iso_completions()
>   ->tasklet_disable()
>   ->context_tasklet()
>     (read registers on 1394 OHCI controller to get info for queued packet)
>   ->flush_iso_completions()
>     ->struct fw_iso_context.callback.sc()
>     = amdtp_master_callback()
>       ->out_stream_callback() (for irq-target)
>       ->fw_iso_context_flush_completions()
>         ->...
>           ->out_stream_callback() or in_stream_callback() (for non irq-target)
>   ->tasklet_enable()
> 
> The tasklet of IT context for irq-target AMDTP stream is temporarily
> disabled when flushing isoc packets queued for the context. The tasklet
> doesn't run even if it's queued in hw IRQ context. In a point to
> processing queued packet for several isoc contexts in the same domain,
> I have no concern without any irq-flag handling for local cpu.
> 
> 1394 OHCI controller still continue isoc cycle during the above call
> graph (= 125 usec interval according to 24.576 MHz clock). Actually the
> number of queued packets for non-irq-target AMDTP stream can be slightly
> different from the number for irq-target AMDTP stream by one or two
> packets without any interruption. In a case that any interruption occurs
> after processing queued packets for the irq-target stream, it's likely to
> process largely different number of queued packets for the rest of AMDTP
> streams in the same domain after resumed. It's desirable not to make such
> count gap between streams in the same domain and I leave it for my future
> work.
> 
> In this time the count gap is allowed. I use kernel preemption to avoid
> the interruption but to catch hw IRQ from 1394 OHCI controller (and the
> other hardware).
> 
> 
> In another point, there's a race condition against flushing queued packet
> in runtime between several PCM substreams for AMDTP streams in the same
> domain. ALSA PCM core executes pcm.pointer and pcm.ack callback under spin
> lock of runtime of PCM substream, thus the race is controlled for operations
> to single PCM substream. However some PCM substreams are associated to the
> same domain via AMDTP streams. At present I never add any solution for this
> race.

I realize that this race is managed as well, by a call of
test_and_set_bit_lock(). When operations for several PCM substream call
pcm.pointer or pcm.ack simultaneously, one of them can flush queued
packets. I refine the above call graph:

On pcm.ack() or pcm.pointer() callbacks:
fw_iso_context_flush_completions()
->struct fw_card_driver.flush_iso_completions()
= ohci_flush_iso_completions()
  ->tasklet_disable()
  if (!test_and_set_bit_lock())
    ->context_tasklet()
      (read registers on 1394 OHCI controller to get info for queued packet)
    ->flush_iso_completions()
      ->struct fw_iso_context.callback.sc()
      = amdtp_master_callback()
        ->out_stream_callback() (for irq-target)
        ->fw_iso_context_flush_completions()
          ->...
            ->out_stream_callback() or in_stream_callback() (for non irq-target)
    ->clear_bit_unlock()
  ->tasklet_enable()


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
