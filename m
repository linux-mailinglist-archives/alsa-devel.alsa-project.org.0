Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2A81FBF5F
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 21:47:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EED49167B;
	Tue, 16 Jun 2020 21:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EED49167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592336879;
	bh=pMqjLlVOizE0h5zjPZ/YAZqRz30NRq+JGtfVzkto9r8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MpSLVxisCc1TzqND56OajWyonJhzCYfBur3PBBIiQrQkAyoGzyBRT6UoeQSM0rmVu
	 C82LryFQ4c8OzUVgOF+1fCfgWpnle8chHYyPnm+eZsKC0gil4CiL9TWt04d9MOxt+j
	 bN1tMtmqf4AGLfWp+Vhvdbs+sVY4fQcZ5bEnelnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31A5CF80101;
	Tue, 16 Jun 2020 21:46:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02086F8022B; Tue, 16 Jun 2020 21:46:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from denise.shiny.it (denise.shiny.it [185.206.84.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18B7DF80101
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 21:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18B7DF80101
Received: from wc1 (localhost [127.0.0.1])
 by denise.shiny.it (8.15.2/8.15.2) with ESMTP id 05GJk4k8024115;
 Tue, 16 Jun 2020 21:46:05 +0200
Date: Tue, 16 Jun 2020 21:46:10 +0200
From: Giuliano Pochini <pochini@shiny.it>
To: Mark Hills <mark@xwax.org>
Subject: Re: [PATCH 3/3] echoaudio: Address bugs in the interrupt handling
Message-ID: <20200616214603.71cfe49b@wc1>
In-Reply-To: <20200616131743.4793-3-mark@xwax.org>
References: <2006161409060.30751@stax.localdomain>
 <20200616131743.4793-3-mark@xwax.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On Tue, 16 Jun 2020 14:17:43 +0100
Mark Hills <mark@xwax.org> wrote:

> Distorted audio appears occasionally, affecting either playback
> or capture and requiring the affected substream to be closed by
> all applications and re-opened.

Yes, it also happens here very rarely (one time every some months) and I failed to reproduce the problem.


> The best way I have found to reproduce the bug is to use dmix in
> combination with Chromium, which opens the audio device multiple
> times in threads. Anecdotally, the problems appear to have increased
> with faster CPUs.
> 
> Since applying this patch I have not had problems, where previously
> they would occur several times a day.
> 
> This patch addresses the following issues:
> 
> * Check for progress using the counter from the hardware, not after
>   it has been truncated to the buffer.
> 
>   There appears to be a possible bug if a whole ringbuffer advances
>   between interrupts, it goes unnoticed.

In that case the stream must be restarted anyway due to xrun.


> * Remove chip->last_period:
> 
>   It's trivial to derive from pipe->last_counter, and inside pipe
>   is where it more logically belongs. This has less scope for bugs
>   as it is not wrapped to the buffer length.

Ok.


> * Remove the accessing of pipe->dma_counter twice in the interrupt
>   handler:

Why twice?


> +static int snd_echo_poll_substream(struct snd_pcm_substream *substream)
> [...]
>  static irqreturn_t snd_echo_interrupt(int irq, void *dev_id)
> [...]

Looks fine to me.


-- 
Giuliano.
