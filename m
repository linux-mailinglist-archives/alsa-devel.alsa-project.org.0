Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B412E2988
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Dec 2020 04:08:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B8581833;
	Fri, 25 Dec 2020 04:07:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B8581833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608865725;
	bh=M6adCtYhbGnWPcRU2doYx7+Xl+oLwRDpUCzZx7hjHRI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F19tOKFbRVNgH5MaoQUPnc8aJOwG4PW8141bhUm3OVlONAnkLpio9O/yiOqB0mG6S
	 g7/RNCk8oi7Kz4UrdWIk1Adg8WebLzUF6N70byB2Su+ZoNqNErKFsSHyQk4sp6OZBB
	 yOIB+4wAb/koe3Y/NcDBzWOcnKhtdHGPumXW5DEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 892D3F801D5;
	Fri, 25 Dec 2020 04:07:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C30D1F800AB; Fri, 25 Dec 2020 04:07:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F207F800AB
 for <alsa-devel@alsa-project.org>; Fri, 25 Dec 2020 04:07:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F207F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bertschiettecatte-com.20150623.gappssmtp.com
 header.i=@bertschiettecatte-com.20150623.gappssmtp.com header.b="AHjzKli9"
Received: by mail-yb1-xb2d.google.com with SMTP id d37so3497363ybi.4
 for <alsa-devel@alsa-project.org>; Thu, 24 Dec 2020 19:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bertschiettecatte-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=JKBw71jc/0dtlGE4PuPnmrNyxywbwe3DBfSvSWOSpQs=;
 b=AHjzKli9+Q9hFZWcLz/nvSVzSMEkCiI0KprWZmBa8RwI3VW7X7DpCiAjNJFXs4QoQV
 xREQZr9YkwTcM8IlBqhUTMvakHtDfGufLxd5bjjdCSfQxv5zAFozS6jgmeUJ4/YB/GhZ
 e1BEcJhQVZRa5UhL3nKmu0zgG9tnX7Jl7taxBeeRF9LPCwO7eiFCI2Q2xTsrxMkw4xM7
 90Mnf48BK5xMio2htayh9QURGvpmWqdvYt106lXMaoSTNfygLRHqep0bB9DuITzwWOyP
 lga19Vc5rFQWKqecl/qLyf/Z4QuGGbK9JLT+VW2zncbEbB/Gf2do8sWh+1NJvt2a+Ki9
 puXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=JKBw71jc/0dtlGE4PuPnmrNyxywbwe3DBfSvSWOSpQs=;
 b=GSp8/LIGmKnaQRcg6aKv8HEZ+ZX1ZzPnEQhwFYbxqbt0z7f/4lWoYCbu254g8TUksr
 ZoAgajAnzozmbWQ+ojbGJXa3A4MGldrBbBXJGc5tbNVZhjeXH7JL2gk0cugilx05vkmf
 8onP3vmN52yHVCkv5AdrMg0uQ4dhByLmdpMGImhzQYCK50WEy0C6sKyS4/pJ3IHpeoWM
 bSCe4W+jhmsisRckH2DvRwU85Ba8ePyJhSPuagr0C9zSKfvtqP7CYFafqfOQVtuN+40H
 vKL4v2W+0w7KaTHMcqL4PYoYZcdt616B/TBiiLsMVpkDpA+rONB5n12DcCJAd8BHh8CL
 jiNg==
X-Gm-Message-State: AOAM531TMHIUrQcY3PembHxdiKZu77zSY7b9uu76SbYdb3iaqYWIGuAm
 QyhbKvXzm6TNpnTrzQspU/K+meysYD/33N01IKGN2w==
X-Google-Smtp-Source: ABdhPJydC2NKObIvU5+ioQOjVdWUPnTqWk1cVlQWe4rtbrnDGLk8NzpntZfhbZuh3N//9C3xHifTUmbvi3vSktD00cU=
X-Received: by 2002:a5b:2cf:: with SMTP id h15mr46865415ybp.475.1608865619639; 
 Thu, 24 Dec 2020 19:06:59 -0800 (PST)
MIME-Version: 1.0
References: <CALd3UbSrAqYFe5Z-S6NMKGaVMvOZx7C4zV5O7CwtTKPmV+UeVQ@mail.gmail.com>
 <CALd3UbS6MtKQEdhXQXH2GmU1EvZgS52XcTPihZ5wjb=4FaiYXA@mail.gmail.com>
 <CALd3UbQuDU6asvTkQTP48ct4hT9euUGUoenD5TW2ZD7gbuHPag@mail.gmail.com>
 <8fc2a9ae-c87a-03cd-4349-81d0ea3380d3@metafoo.de>
 <CALd3UbQEJBqUqwx2ua9Sx1P3xr3uf221AVJUV7erp6MF0JegRg@mail.gmail.com>
 <20201225005953.GA162573@workstation>
In-Reply-To: <20201225005953.GA162573@workstation>
From: Bert Schiettecatte <bert@bertschiettecatte.com>
Date: Thu, 24 Dec 2020 19:06:48 -0800
Message-ID: <CALd3UbSc=h_bYT4koBH79mmKhy4NxZX2EXNJ-oOpt+GJTtk+Yw@mail.gmail.com>
Subject: Re: question about alsa tracepoints and alsa debugging
To: Bert Schiettecatte <bert@bertschiettecatte.com>,
 Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Takashi-san

On Thu, Dec 24, 2020 at 5:00 PM Takashi Sakamoto
<o-takashi@sakamocchi.jp> wrote:
> With records of tracepoints events for capture PCM substream
> which Bert's SDIO driver handles as well as for the playback PCM
> substream which speaker-test starts, we can get more details of
> runtimes.

Thanks so much for your detailed explanation. I tried capturing a new
trace for both speaker-test and arecord by running perf from a
different console and keeping an eye on /var/log/messages and it's
clear there is a deadlock, please see below. In my code I can see that
spin_lock_irqsave() is being called in the dw_mci_interrupt() which
then calls some other code which again calls spin_lock_irqsave() so I
guess that is what the problem is, and I have to restructure my code
to avoid that. What I don't understand, is why it says speaker-test is
trying to acquire the lock, while it's arecord that is using the
capture device to record (which uses my sdio driver). I guess it
doesn't matter because playback and capture are a single device (?).

Thanks!
Bert

[  187.653313]
[  187.656519] ============================================
[  187.663958] WARNING: possible recursive locking detected
[  187.671392] 5.9.12-00015-g3d36682d8cdf-dirty #74 Not tainted
[  187.679214] --------------------------------------------
[  187.686613] speaker-test/193 is trying to acquire lock:
[  187.693886] ed337cbc (&host->irq_lock#2){-...}-{2:2}, at:
dw_mci_set_drto+0xa0/0xf8
[  187.703898]
[  187.703898] but task is already holding lock:
[  187.713189] ed337cbc (&host->irq_lock#2){-...}-{2:2}, at:
dw_mci_interrupt+0x468/0x4e4
[  187.723463]
[  187.723463] other info that might help us debug this:
[  187.733531]  Possible unsafe locking scenario:
[  187.733531]
[  187.742727]        CPU0
[  187.746692]        ----
[  187.750624]   lock(&host->irq_lock#2);
[  187.755998]   lock(&host->irq_lock#2);
[  187.761326]
[  187.761326]  *** DEADLOCK ***
[  187.761326]
[  187.771203]  May be due to missing lock nesting notation
[  187.771203]
[  187.780964] 1 lock held by speaker-test/193:
[  187.786799]  #0: ed337cbc (&host->irq_lock#2){-...}-{2:2}, at:
dw_mci_interrupt+0x468/0x4e4
[  187.797239]
[  187.797239] stack backtrace:
[  187.804121] CPU: 0 PID: 193 Comm: speaker-test Not tainted
5.9.12-00015-g3d36682d8cdf-dirty #74
[  187.814905] Hardware name: Rockchip (Device Tree)
[  187.821204] [<c0311930>] (unwind_backtrace) from [<c030c200>]
(show_stack+0x10/0x14)
[  187.830964] [<c030c200>] (show_stack) from [<c0f4b9b0>]
(dump_stack+0xd0/0xf0)
[  187.840147] [<c0f4b9b0>] (dump_stack) from [<c03adc34>]
(__lock_acquire+0xff0/0x3394)
[  187.850018] [<c03adc34>] (__lock_acquire) from [<c03b0c74>]
(lock_acquire+0x134/0x56c)
[  187.859997] [<c03b0c74>] (lock_acquire) from [<c0f62900>]
(_raw_spin_lock_irqsave+0x4c/0x94)
[  187.870578] [<c0f62900>] (_raw_spin_lock_irqsave) from [<c0d0fca8>]
(dw_mci_set_drto+0xa0/0xf8)
[  187.881474] [<c0d0fca8>] (dw_mci_set_drto) from [<c0d10208>]
(dw_mci_interrupt+0x484/0x4e4)
[  187.891976] [<c0d10208>] (dw_mci_interrupt) from [<c03bf90c>]
(__handle_irq_event_percpu+0x70/0x484)
[  187.903363] [<c03bf90c>] (__handle_irq_event_percpu) from
[<c03bfd50>] (handle_irq_event_percpu+0x30/0x8c)
[  187.915376] [<c03bfd50>] (handle_irq_event_percpu) from
[<c03bfde4>] (handle_irq_event+0x38/0x5c)
[  187.926515] [<c03bfde4>] (handle_irq_event) from [<c03c46fc>]
(handle_fasteoi_irq+0xcc/0x124)
[  187.937255] [<c03c46fc>] (handle_fasteoi_irq) from [<c03be990>]
(generic_handle_irq+0x34/0x44)
[  187.948107] [<c03be990>] (generic_handle_irq) from [<c03befe4>]
(__handle_domain_irq+0x7c/0xe8)
[  187.959073] [<c03befe4>] (__handle_domain_irq) from [<c07a1340>]
(gic_handle_irq+0x58/0x9c)
[  187.969677] [<c07a1340>] (gic_handle_irq) from [<c0300f74>]
(__irq_usr+0x54/0x80)
[  187.979345] Exception stack(0xec40ffb0 to 0xec40fff8)
[  187.986316] ffa0:                                     bff0a126
b6ef7ef0 00000044 b6ef7670
[  187.996843] ffc0: 00000000 00000000 b6bfea54 b6bfb008 00000003
b6bfb008 000252a0 00025140
[  188.007419] ffe0: 000250b0 beb2484c 00012f44 b6ebc26c 60030010 ffffffff
