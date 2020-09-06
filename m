Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAF625ED59
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Sep 2020 10:28:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 893B818C6;
	Sun,  6 Sep 2020 10:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 893B818C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599380903;
	bh=YFTWaepUEMGW0Y3BHOL9kIPdCkM64/6ZWc32F4SGPNA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q8tkvheLhNLawGrhE/u3S9BmPDi+5jasC7AAIihpLDeawzGQsTRn8yjwFwoYE3H/3
	 NWV4ljkUU03LkX5FpOnvxrMxhSoCwYOpbAXaKIiFxggtPpdnMlfXN2TQkmpgUAEvGV
	 wjCJf8wtTrRZ46/n67rkDNMXuq4wN1HUHH0OJ89Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3B21F80272;
	Sun,  6 Sep 2020 10:26:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A947EF800B4; Sun,  6 Sep 2020 10:26:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 471B9F800B4
 for <alsa-devel@alsa-project.org>; Sun,  6 Sep 2020 10:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 471B9F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="YcaZaV4/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="DwDn9rj3"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A93C5C00D7;
 Sun,  6 Sep 2020 04:26:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 06 Sep 2020 04:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=QAiKe6CHIQSEn8Mbur/PD3vOSY1
 ycjFuPQahywT0Dj0=; b=YcaZaV4/mqFCPJjQZ9afCUL//P6aSKoocFjeNu+oKjv
 iJeb2gsWCGdvW6B2d+9vw2VbC5XBfmHqZqcdxwp6IrUjlUEGXg4tuMrvLzpGNeJH
 sbeLGu9Mu5bPYlI15O7JC1q3KHIMwCPK/KHalyFx/oljO/1l9Lt7fT2OJi/qVzlK
 M5CMvv+D9bK4aomIjsuFJd8D1mwNx1W2SB2xcK2oY0Ki8kUPdDb+0fm7QqIf2Bm5
 DUiVRUBWSegjDtVieDGAJkUtsFo8YtSOJ7bbhfQwZQ3sqWO65pfjOLFP0n6+6K4/
 GGKmqr9DIxPLvnYL2fATaCJMmWZY7xCUlzC6u+eSuIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QAiKe6
 CHIQSEn8Mbur/PD3vOSY1ycjFuPQahywT0Dj0=; b=DwDn9rj3VwuF6YgOM2Bc+e
 gkYRxqrW2hWTi31jwngiNGNUfiAoTksugWA7qYHfseFwO1tYczaBUfrIh5voGxyj
 L8XnP7QxttmaSfPJyX4C9DQTSyS/wvn6u2ZgjZ8KwO9wNyUvHO7HES/LBzmIztQ8
 lZtw4hwmF6pgolRwR/uwl7b7iOD9jPKtmzFStuOYAISlJT2WyzJTbTJBejPa0a8K
 souHPQIHWzO/chStiEOlt05U5H4U4tfreT5C/aAY6y0elUvXxz0qF96NCI7n/3/e
 CzZdRMhhx2lLtvcOQjDhbDnsVyORAoyxAz1VB2NtFYE6nOSDnkO0c+ET/u5IrEjw
 ==
X-ME-Sender: <xms:N51UX5ufR6v54uBN4hMhLHcwsoBjwig9qyuHgZ7St8l3eAdejj5TaA>
 <xme:N51UXydTvhugG2H2TNuSQVa5A1wzUSizOf8XtiQgKjApEXsaHv1A-gLMS-B3pqcRB
 9eVFE08o3UbjvjIKvE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegjedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucfkphepudektddrvdefhedrfedrheegnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihes
 shgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:N51UX8zJEkCuAEHR6l7_Onm1kET7hITxtFzZzN88xRPciqiMU21rKg>
 <xmx:N51UXwOgQF4jGO69Sjf87lusHLtwXmAr6m33vvxMLiAogZ_REUL0fg>
 <xmx:N51UX5-XTorDVoWMYbFE6BMCIQ9EUh__a1LqsII15TOvFNDuJU9S-w>
 <xmx:OJ1UX2HUivRI0use4hLmvTHiXRsfuKLnNT0CiJRT-ACwwY-hgwmy9Q>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id EF9463064610;
 Sun,  6 Sep 2020 04:26:30 -0400 (EDT)
Date: Sun, 6 Sep 2020 17:26:28 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 10/11] ALSA: firewire: Replace tasklet with work
Message-ID: <20200906082628.GA74660@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Clemens Ladisch <clemens@ladisch.de>
References: <20200903104131.21097-1-tiwai@suse.de>
 <20200903104131.21097-11-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903104131.21097-11-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>
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

Hi,

On Thu, Sep 03, 2020 at 12:41:30PM +0200, Takashi Iwai wrote:
> The tasklet is an old API that should be deprecated, usually can be
> converted to another decent API.  In FireWire driver, a tasklet is
> still used for offloading the AMDTP PCM stream handling.  It can be
> achieved gracefully with a work queued, too.
> 
> This patch replaces the tasklet usage in firewire-lib driver with a
> simple work.  The conversion is fairly straightforward but for the
> in_interrupt() checks that are replaced with the check using the
> current_work().
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/firewire/amdtp-stream-trace.h |  2 +-
>  sound/firewire/amdtp-stream.c       | 25 +++++++++++++------------
>  sound/firewire/amdtp-stream.h       |  2 +-
>  3 files changed, 15 insertions(+), 14 deletions(-)

After testing this patch, I agree with the usage of
'(current_work() == &s->period_work)' as an alternative of 'in_interrupt()'.

However, the usage is not appropriate for tracepoints event in the case.

> diff --git a/sound/firewire/amdtp-stream-trace.h b/sound/firewire/amdtp-stream-trace.h
> index 26e7cb555d3c..5386d548cada 100644
> --- a/sound/firewire/amdtp-stream-trace.h
> +++ b/sound/firewire/amdtp-stream-trace.h
> @@ -49,7 +49,7 @@ TRACE_EVENT(amdtp_packet,
>  		__entry->data_blocks = data_blocks;
>  		__entry->data_block_counter = data_block_counter,
>  		__entry->packet_index = s->packet_index;
> -		__entry->irq = !!in_interrupt();
> +		__entry->irq = (current_work() == &s->period_work);
>  		__entry->index = index;
>  	),
>  	TP_printk(

The tracepoints event is probed in two contexts:
 * softirq for isochronous context to process hardware events of 1394 OHCI.
 * user task of ALSA PCM applications.

However, it's not probed in the workqueue task since the case is already
avoided carefully in below patch:

> @@ -1184,7 +1185,7 @@ unsigned long amdtp_domain_stream_pcm_pointer(struct amdtp_domain *d,
>  
>  	if (irq_target && amdtp_stream_running(irq_target)) {
>  		// This function is called in software IRQ context of
> -		// period_tasklet or process context.
> +		// period_work or process context.
>  		//
>  		// When the software IRQ context was scheduled by software IRQ
>  		// context of IT contexts, queued packets were already handled.
> @@ -1195,9 +1196,9 @@ unsigned long amdtp_domain_stream_pcm_pointer(struct amdtp_domain *d,
>  		// immediately to keep better granularity of PCM pointer.
>  		//
>  		// Later, the process context will sometimes schedules software
> -		// IRQ context of the period_tasklet. Then, no need to flush the
> +		// IRQ context of the period_work. Then, no need to flush the
>  		// queue by the same reason as described in the above
> -		if (!in_interrupt()) {
> +		if (current_work() != &s->period_work) {
>  			// Queued packet should be processed without any kernel
>  			// preemption to keep latency against bus cycle.
>  			preempt_disable();

as long as testing, I can see no logs for the trancepoints event with the 'irq' field is 1.
I would like you to leave 'amdtp-stream-trace.h' as is by dropping the above change since
the irq field should record whether the context is softirq or user task.


Thanks

Takashi Sakamoto
