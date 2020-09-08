Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B93092607BE
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 02:40:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F8D9177D;
	Tue,  8 Sep 2020 02:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F8D9177D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599525603;
	bh=ctoKTx1LxpELF0DaW7iLAQXVARfAP/iIOI3LcLTMSlQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o7RxwppV9A+GObgncZ8Ek4LPpKr2Y03MAIn1RZqABZjjJfD5eiUarmh1NN4azwuMO
	 Qp2w3HTVmyEXqSwxs8uRJPg38NF5zm7irc5rfRtW7oplNZ/1KReBxbPeeDWOxlL7qn
	 Vdlb2idrTDA/ulXNuXt1nxRzl+/TudcslQGBkOVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5354BF8021C;
	Tue,  8 Sep 2020 02:38:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBAB1F80227; Tue,  8 Sep 2020 02:38:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0925F800B9
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 02:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0925F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="F8CWiqHc"
Received: by mail-io1-xd42.google.com with SMTP id g128so15243507iof.11
 for <alsa-devel@alsa-project.org>; Mon, 07 Sep 2020 17:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YDR6IsWSX2xd81R8pk5pE8RqAtPXHJYLYB8HvcgF40Q=;
 b=F8CWiqHclIEdY8g1HNYHVl1wXcuDgUrP5VqGkVOqMlgxVsnhY/g3zHfKmnNqKfx5rr
 lXjBlca+wJp2qFC+oRwEyKderhMcdUV0i/HGtdc+kmTwSgcLTkHx1gZV650Qtwgr8DSN
 cfbpMV23yjcPd2htmPPRJE+sb8EX9u2sUA0i0hkP47BGaSgO+bEOZhwsIV53SLn+pjEc
 4auekbs2AZ/26MipcOlJbnv0c4YNagTq8IBYIigGIHdxugF7rPGLDzNt/NRCnmEBxZqX
 hHbmHjn91tAT2P+0g2zQy+6XpNSZP+H0QwsX3ytZmPsllFgKw2pVcNFXHbJCDD9pkPK1
 yIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YDR6IsWSX2xd81R8pk5pE8RqAtPXHJYLYB8HvcgF40Q=;
 b=HrTCbpz4H2NJ6T+Aoh1HihqdtqGZrxL1VnhIuocvpumZ7UCsvBl/2wT2zPOZ3o8YkO
 SNaXtLdEID3zaF+kERlfBJM90ebdoyFckqHehcveKZtc3Nbt9wTmnGAOipNqg98iRObm
 K5n0miekUVA40TuiHVt55pQuzKtlRUNWEHQ7leHQOIGQOtfz8DYK1YbUS/AEg7/2WE+J
 RqspETxEJfqcQI+rR16fapu7n6G+3EvLN/x4UbU0ZTDGtMuatNg0VhS7AjYYQLkEZax6
 NNSxFQDndcdqy5D1rRwsRooZwetDgGnk8rpCUA2qR1MEjDRbAr45Wu6ZYea6F+Ap/z9D
 jKtQ==
X-Gm-Message-State: AOAM531wrbLNOa9I4EOo19ZR/AvBeHsgqSCi2K1Sxhob6MdMsy6QSswS
 5N1+tQRa0VD5RqSMacpoY3/1dfmLjQFAkDHgaDc=
X-Google-Smtp-Source: ABdhPJyKNOiTqAZYzxBv2arYN0x03aWPF1RbNx7tn+o1OGJW+GJAeuV1DOsC/QQ8ZOF2/hEVe7ATtCVswkAox0zLEAo=
X-Received: by 2002:a5d:8604:: with SMTP id f4mr254925iol.196.1599525489023;
 Mon, 07 Sep 2020 17:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <1598348388-2518-1-git-send-email-yangtiezhu@loongson.cn>
 <s5hsgcb59gw.wl-tiwai@suse.de>
In-Reply-To: <s5hsgcb59gw.wl-tiwai@suse.de>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Tue, 8 Sep 2020 08:37:56 +0800
Message-ID: <CAAhV-H5V5adhY2OjJLxW7x3zDaHGgBxxy45hjf22+qMSEBQuww@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "ALSA: hda: Add support for Loongson 7A1000
 controller"
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 stable <stable@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Xuefeng Li <lixuefeng@loongson.cn>
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

Hi, all

This patch should be backported to 5.4.

Huacai

On Tue, Aug 25, 2020 at 6:03 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 25 Aug 2020 11:39:48 +0200,
> Tiezhu Yang wrote:
> >
> > This reverts commit 61eee4a7fc40 ("ALSA: hda: Add support for Loongson
> > 7A1000 controller") to fix the following error on the Loongson LS7A
> > platform:
> >
> > rcu: INFO: rcu_preempt self-detected stall on CPU
> > <SNIP>
> > NMI backtrace for cpu 0
> > CPU: 0 PID: 68 Comm: kworker/0:2 Not tainted 5.8.0+ #3
> > Hardware name:  , BIOS
> > Workqueue: events azx_probe_work [snd_hda_intel]
> > <SNIP>
> > Call Trace:
> > [<ffffffff80211a64>] show_stack+0x9c/0x130
> > [<ffffffff8065a740>] dump_stack+0xb0/0xf0
> > [<ffffffff80665774>] nmi_cpu_backtrace+0x134/0x140
> > [<ffffffff80665910>] nmi_trigger_cpumask_backtrace+0x190/0x200
> > [<ffffffff802b1abc>] rcu_dump_cpu_stacks+0x12c/0x190
> > [<ffffffff802b08cc>] rcu_sched_clock_irq+0xa2c/0xfc8
> > [<ffffffff802b91d4>] update_process_times+0x2c/0xb8
> > [<ffffffff802cad80>] tick_sched_timer+0x40/0xb8
> > [<ffffffff802ba5f0>] __hrtimer_run_queues+0x118/0x1d0
> > [<ffffffff802bab74>] hrtimer_interrupt+0x12c/0x2d8
> > [<ffffffff8021547c>] c0_compare_interrupt+0x74/0xa0
> > [<ffffffff80296bd0>] __handle_irq_event_percpu+0xa8/0x198
> > [<ffffffff80296cf0>] handle_irq_event_percpu+0x30/0x90
> > [<ffffffff8029d958>] handle_percpu_irq+0x88/0xb8
> > [<ffffffff80296124>] generic_handle_irq+0x44/0x60
> > [<ffffffff80b3cfd0>] do_IRQ+0x18/0x28
> > [<ffffffff8067ace4>] plat_irq_dispatch+0x64/0x100
> > [<ffffffff80209a20>] handle_int+0x140/0x14c
> > [<ffffffff802402e8>] irq_exit+0xf8/0x100
> >
> > Because AZX_DRIVER_GENERIC can not work well for Loongson LS7A HDA
> > controller, it needs some workarounds which are not merged into the
> > upstream kernel at this time, so it should revert this patch now.
> >
> > Fixes: 61eee4a7fc40 ("ALSA: hda: Add support for Loongson 7A1000 controller")
> > Cc: <stable@vger.kernel.org> # 5.9-rc1+
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > ---
> >
> > v2: update commit message
>
> Applied now.  Thanks.
>
>
> Takashi
