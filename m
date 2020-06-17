Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 137E21FCC05
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 13:16:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CDC31678;
	Wed, 17 Jun 2020 13:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CDC31678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592392597;
	bh=yf6CV3iTkZ2elOs6Twa4uaUJGuojXlchqjlRDsRBEds=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GserEZLDtqerZez0xDTSSmOH7ZNnf9X/7AwvDy0TBgKNXS74tzLU8lOFcixk9pY+S
	 JNd3PpSyiLa6lxNXpSx2Q7erPuTDLNkUjN7QWHByv8iUJGJda3k3s9NhIacFUzx1FU
	 a+Qr6efAP6C1tp+RTKPjgyufOav7kD25ACxkaKEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EA35F80162;
	Wed, 17 Jun 2020 13:14:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44CC4F80171; Wed, 17 Jun 2020 13:14:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A315EF800EF
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 13:14:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A315EF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="BekBRW3k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:
 cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t5lqVt3N36d6pfrzJqsXRE3+k56qfwVEAYlxPrcEGRc=; b=BekBRW3kHFgq5jhYo4T72vm7Ot
 tjn4wfbDe9MiepJqTxDoNpv+/W9THV4uc1THkTUFAqcWe5A1ZblM3nJw58dMNfHW6DEaY+CvZYY4a
 49s5bCvHgL3N6kXZO/+e9YRVWFJ6LVlG1aLO8xljLDkH1miSeA7tgMnmnR7Zkar8uysYKwUxIvSfm
 zc7QyWFJNY5kAU7e+1PosTzCXttfrhmHDv7qUNxAoNz+xsPBKz4Vjl0MVqb0rn/bbgslm7nriYSb+
 zWmWSstlraxDm4SY+jsFwXOU/7/xiDSXcbSyPLMTBFA2pBBz6QmByu8iai7hTSOf8SBI+drMWvdkY
 Ftd0S9/g==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jlW1i-000P6c-IO; Wed, 17 Jun 2020 12:14:42 +0100
Received: from mark (helo=localhost)
 by stax.localdomain with local-esmtp (Exim 4.84)
 (envelope-from <mark@xwax.org>)
 id 1jlW1i-0003Oq-7j; Wed, 17 Jun 2020 12:14:42 +0100
Date: Wed, 17 Jun 2020 12:14:42 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Giuliano Pochini <pochini@shiny.it>
Subject: Re: [PATCH 3/3] echoaudio: Address bugs in the interrupt handling
In-Reply-To: <20200617000134.60c5e2b5@wc1>
Message-ID: <2006171158070.2561@stax.localdomain>
References: <2006161409060.30751@stax.localdomain>
 <20200616131743.4793-3-mark@xwax.org> <20200617000134.60c5e2b5@wc1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 17 Jun 2020, Giuliano Pochini wrote:

> On Tue, 16 Jun 2020 14:17:43 +0100
> Mark Hills <mark@xwax.org> wrote:
> 
> > +	counter = le32_to_cpu(*pipe->dma_counter);
> > +
> > +	period = bytes_to_frames(runtime, counter)
> > +		/ runtime->period_size;
> > +	last_period = bytes_to_frames(runtime, pipe->last_counter)
> > +		/ runtime->period_size;
> > +
> > +	if (period == last_period)
> > +		return 0;  /* don't do any work yet */
> > +
> > +	step = counter - pipe->last_counter;
> 
> Uhmm.. no, when the dma_counter wraps around the comparison gives wrong 
> result, unless 4G is divisible by the buffer size.

Agree.

> Please consider this patch (to apply after yours). It computes the new 
> period using pipe->position before and after adding the amount of bytes 
> tranferred since the previous period. Briefly tested - It seems ok.
> 
> 
> Signed-off-by: Giuliano Pochini <pochini@shiny.it>
> 
> --- sound/pci/echoaudio/echoaudio.c__orig	2020-06-16 23:36:02.818601055 +0200
> +++ sound/pci/echoaudio/echoaudio.c	2020-06-16 23:52:46.593325066 +0200
> @@ -1781,7 +1781,7 @@
>  {
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct audiopipe *pipe = runtime->private_data;
> -	unsigned counter, step, period, last_period;
> +	u32 counter, step, period, last_period, pipe_position;
>  	size_t buffer_bytes;
>  
>  	if (pipe->state != PIPE_STATE_STARTED)
> @@ -1789,24 +1789,22 @@
>  
>  	counter = le32_to_cpu(*pipe->dma_counter);
>  
> -	period = bytes_to_frames(runtime, counter)
> +	step = counter - pipe->last_counter;
> +	pipe_position = pipe->position + step;	/* bytes */
> +	buffer_bytes = frames_to_bytes(runtime, runtime->buffer_size);
> +	while (pipe_position >= buffer_bytes)
> +		pipe_position -= buffer_bytes;
> +
> +	period = bytes_to_frames(runtime, pipe_position)
>  		/ runtime->period_size;
> -	last_period = bytes_to_frames(runtime, pipe->last_counter)
> +	last_period = bytes_to_frames(runtime, pipe->position)
>  		/ runtime->period_size;
>  
>  	if (period == last_period)
>  		return 0;  /* don't do any work yet */
>  
> -	step = counter - pipe->last_counter;
> +	pipe->position = pipe_position;
>  	pipe->last_counter = counter;
> -
> -	pipe->position += step;  /* bytes */
> -
> -	buffer_bytes = frames_to_bytes(runtime, runtime->buffer_size);
> -
> -	while (pipe->position >= buffer_bytes)
> -		pipe->position -= buffer_bytes;
> -
>  	return 1;

I think this risks returning to a case where it concludes nothing advances 
if the counter advances by a whole buffer?

You might be able to do the comparison before wrapping pipe_position, but 
hopefully you'll consider my patch in reply to Takashi has more clarity.

-- 
Mark
