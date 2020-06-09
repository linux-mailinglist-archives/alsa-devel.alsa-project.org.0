Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EA21F324D
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 04:33:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B84D51674;
	Tue,  9 Jun 2020 04:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B84D51674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591670020;
	bh=2W97XFZB39VVqLJ3pyX2xwBURLvb0LpT1NtUBfUCAes=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tOqvGSsmuGtpaKJFSsRRNgoBjuxUPjCohXWtZiHeD1NXuRli1hB0sV8Iwowmutoac
	 z4u9pXrg6X5GEphYuvfl5rzOO+C3l1KkKDD8aTi6SgxeWvQFEQEsqOeaNg0Aq3odAn
	 WH9EQatq1dPWQQUQv4r1aY92G5GPDS/uzOPURI9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8531F8028D;
	Tue,  9 Jun 2020 04:31:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A62EF8028C; Tue,  9 Jun 2020 04:31:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9319BF80088
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 04:31:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9319BF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="nbplERD3"
Received: by mail-pl1-x642.google.com with SMTP id y17so7421031plb.8
 for <alsa-devel@alsa-project.org>; Mon, 08 Jun 2020 19:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Uf7YxA2IP95xtQMwprvHZh/+brkgKT+D9GOzcVjR1js=;
 b=nbplERD3lm2DyeLKL2MPAt3tYmAKmi4rs6mqX1hQnIbHOCvx4okJf/YogwePZaBS5O
 mv1ZZ1XwUzjhnCNuRrgohfhCEu516KvH0pOC0shDmW6urtRwZjrAq6tBgbqWEBK2Hdte
 IY0BXEJIPS+/Iabps7k/cmr5qsZ12eLTtv9F2kMRWYRqyuZIvrzi639LlUq26G1r28f0
 7HiiGDy98/bv2znYier20wDPrURl6WqO8J3i2AEIshYdH9eCkGcMqfHVXgK908ddr2qE
 5pkVdDEnzKmOUqKL+J4XERZ9Da4oX4rRtDudgf2iwsCPy0zrnKmpyW5460FhXk8V/dZS
 QEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Uf7YxA2IP95xtQMwprvHZh/+brkgKT+D9GOzcVjR1js=;
 b=DmjshJ9eKl+DVAC2QLCPHQbGZnDejg0zdwcHWz4GKUgnzW+PCmjpNKPCvx2hz+tyWY
 tm8r7nkjJL1JN/h1Xy/2x5KbdBxyKFBYkqsu227dm6pNwJTpaAQgp8xp1Zy863p77wAZ
 keR97SlBDgM0OlIUntxUHIed3fDkfXCxDBu63FRqaefdLn8p5HVLq8I+ZxhtZeV8X0LL
 h9mMqZhOZZ9HYNfCyBxlajauSMD6+CU/i02CRfAINcpbWOQU7vqETmPAShbw8aa/52R1
 0ZsL6SXq1WjgzcvMXr/Evm0zaQxICXuswtByEVZ15fEVFSQATyxf9L9pa/v6mfBYjAk6
 N3gg==
X-Gm-Message-State: AOAM530rccbhj9UHcbgwwOm0c+RZ2/DzX490ZX36F+/jK0Byox2iDtn+
 cia96waln3ZuAcBstP8DpUxu4g==
X-Google-Smtp-Source: ABdhPJyPmc6nD146PWpr/frnGgN6NECuEUJLdwlEejutFdIY225WMaQ8w6UrY80doaVyy1+g6urU+w==
X-Received: by 2002:a17:90a:9484:: with SMTP id
 s4mr2312969pjo.30.1591669908883; 
 Mon, 08 Jun 2020 19:31:48 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id x2sm8301376pfj.142.2020.06.08.19.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 19:31:47 -0700 (PDT)
Date: Mon, 8 Jun 2020 19:31:47 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: next-0519 on thinkpad x60: sound related? window manager crash
In-Reply-To: <1591624340.z01ejtod28.none@localhost>
Message-ID: <alpine.DEB.2.22.394.2006081928070.148886@chino.kir.corp.google.com>
References: <20200520111136.GA3802@amd> <1591545088.74ii116nf2.none@localhost>
 <20200608061950.GA17476@lst.de> <1591624340.z01ejtod28.none@localhost>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, x86@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, hch@infradead.org, mingo@redhat.com,
 bp@alien8.de, Pavel Machek <pavel@ucw.cz>, hpa@zytor.com, tglx@linutronix.de,
 Christoph Hellwig <hch@lst.de>
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

On Mon, 8 Jun 2020, Alex Xu (Hello71) wrote:

> Excerpts from Christoph Hellwig's message of June 8, 2020 2:19 am:
> > Can you do a listing using gdb where this happens?
> > 
> > gdb vmlinux
> > 
> > l *(snd_pcm_hw_params+0x3f3)
> > 
> > ?
> > 
> 
> (gdb) l *(snd_pcm_hw_params+0x3f3)
> 0xffffffff817efc85 is in snd_pcm_hw_params (.../linux/sound/core/pcm_native.c:749).
> 744             while (runtime->boundary * 2 <= LONG_MAX - runtime->buffer_size)
> 745                     runtime->boundary *= 2;
> 746
> 747             /* clear the buffer for avoiding possible kernel info leaks */
> 748             if (runtime->dma_area && !substream->ops->copy_user)
> 749                     memset(runtime->dma_area, 0, runtime->dma_bytes);
> 750
> 751             snd_pcm_timer_resolution_change(substream);
> 752             snd_pcm_set_state(substream, SNDRV_PCM_STATE_SETUP);
> 753
> 

Working theory is that CONFIG_DMA_NONCOHERENT_MMAP getting set is causing 
the error_code in the page fault path.  Debugging with Alex off-thread we 
found that dma_{alloc,free}_from_pool() are not getting called from the 
new code in dma_direct_{alloc,free}_pages() and he has not enabled 
mem_encrypt.

So the issue is related to setting CONFIG_DMA_COHERENT_POOL, and not 
anything else related to AMD SME.  He has a patch to try out, but I wanted 
to update the thread in case there are other ideas to try other than 
selecting CONFIG_DMA_NONCOHERENT_MMAP only when CONFIG_DMA_REMAP is set 
(and not CONFIG_DMA_COHERENT_POOL).
