Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB20C380D8B
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 17:44:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27E5A1786;
	Fri, 14 May 2021 17:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27E5A1786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621007071;
	bh=HMTnNGVbuYtWwHejiEeFN0lyv03MECAIfwOVGv+Zhyg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tD4TgQDyB1KoEUb25d6m8zRSN/f7kEMWxrMLEegmuZPSzS8bOIBPUcjttp6V5otsD
	 ItQqqV/5u+HQ1sYvSr4oa06g8ZcK6o2bxQjuSGa/DrCZRIcikauq8KsDAz6dJaBdGI
	 43qChY6/PINc3Mx2f31KBCsHEbT/TViQwKSu+2jE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1B84F804E2;
	Fri, 14 May 2021 17:39:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60C33F80240; Fri, 14 May 2021 13:16:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A01B5F8013A
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 13:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A01B5F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ifstVL82"
Received: by mail-pj1-x102c.google.com with SMTP id q6so1305265pjj.2
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SuwelzwTekMBepy8x0XJ/IwbbsZYlWT91PPUwII5M50=;
 b=ifstVL82ZSKzlZqpNG38Wt+0Y07VjgZxJUsjfbnMeiyr4jDsjnwpo7XLrIJWhyJO4/
 8VvqwjvvdhkLc4cxMtwT+EHWnIDbKrpoy+5xg/tceb8hXqAUnjnZsnyw9Umde6qAh7zO
 TuS6pRljrbYOevJPYBonaK3M++/PotktqORN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SuwelzwTekMBepy8x0XJ/IwbbsZYlWT91PPUwII5M50=;
 b=IBLbDXO76t3JdNT20YlbQEs/yUXqcB/0Wln9HPXFawEPxk2Is6qDLPjJ4WGg3k0VTZ
 mKARc+Wg9Be3QuwiGxEcPZh2YfpJEN8mbpZzwukizhnIk74j52fqVUsFN8hEyBUHRtgt
 5P8Hb7C5AsP6HbmLSffUyN2AveJ4ZurQO4Kx8GfMKdEKMy7YRY9qbzMU/oZ0ogmo/K3T
 a3jbCHl0k9MFq5JWbQtlOW0zxdOtWLj4CEM7lQJBD5tVNGLnonjPEIr+6nEyJGSBtB9d
 sv815BuC7Jl1ak/A9778SY9W0pUvFzTKZ0/wm7ZAyU6EjEMwcxNqL/KMYAPmFMfVfhTp
 eoRA==
X-Gm-Message-State: AOAM533D02sUuIaO8IJpQ59DzmCM8NO18pm5OV3Il8vY3yQCxQEUurbJ
 RB3kliyVmUFWi0jBGjmfA0+6HQ==
X-Google-Smtp-Source: ABdhPJx3oeYxBL00rDSPeMgixcF09Fv2kyqLOigDvsB87zU+JFFy1EdS3oj2DBGvF6XG5fNrXsj72Q==
X-Received: by 2002:a17:902:6a84:b029:ef:1342:20e7 with SMTP id
 n4-20020a1709026a84b02900ef134220e7mr36803896plk.36.1620991011137; 
 Fri, 14 May 2021 04:16:51 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:b4a8:8601:829d:26d5])
 by smtp.gmail.com with ESMTPSA id q2sm4014154pfk.71.2021.05.14.04.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 04:16:50 -0700 (PDT)
Date: Fri, 14 May 2021 20:16:45 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: ALSA: intel8x0: div by zero in snd_intel8x0_update()
Message-ID: <YJ5cHdv6MVmAKD3b@google.com>
References: <YJ4yBmIV6RJCo42U@google.com>
 <s5hk0o18tio.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hk0o18tio.wl-tiwai@suse.de>
X-Mailman-Approved-At: Fri, 14 May 2021 17:39:48 +0200
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>
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

On (21/05/14 13:05), Takashi Iwai wrote:
> >  divide error: 0000 [#1] PREEMPT SMP NOPTI
> >  RIP: 0010:snd_intel8x0_interrupt+0x121/0x279
> >  Code: 42 8b 44 35 34 41 0f af c5 42 03 44 35 38 42 89 44 35 38 48 8b 0c 24 80 b9 60 03 00 00 00 78 0f 49 8d 0c 2e 48 83 c1 38 31 d2 <f7> 71 f4 89 11 42 8b 7c 35 48 44 01 ef 83 e7 1f 42 89 7c 35 48 48
> >  RSP: 0000:ffff9a0a80108eb0 EFLAGS: 00010046
> >  RAX: 0000000000000000 RBX: 0000000000000019 RCX: ffff90d8c5efc198
> >  RDX: 0000000000000000 RSI: ffff9a0a80549016 RDI: ffff9a0a80549024
> >  RBP: ffff90d8c5efc060 R08: 000000000000197a R09: 00000f604ed00191
> >  R10: 00000000000001e0 R11: ffffffff9468e1d8 R12: 0000000000000020
> >  R13: 0000000000000040 R14: 0000000000000100 R15: 0000000000000002
> >  FS:  00007a75c397aff8(0000) GS:ffff90d912d80000(0000) knlGS:0000000000000000                                                               
> >  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >  CR2: 00007a77945d1000 CR3: 000000015bf46002 CR4: 0000000000360ea0
> >  Call Trace:
> >   <IRQ>
> >   __handle_irq_event_percpu+0xa0/0x1c0
> >   handle_irq_event_percpu+0x2d/0x70
> >   handle_irq_event+0x2c/0x48
> >   handle_fasteoi_irq+0xa1/0x161
> >   do_IRQ+0x51/0xd6
> >   common_interrupt+0xf/0xf
> >   </IRQ>
> >  RIP: 0033:0x7a7856462c59
> >  Code: 89 ca 48 2b 57 20 48 83 c2 10 31 c0 48 3b 57 28 48 0f 46 c1 c3 cc cc cc cc cc cc cc cc cc cc cc cc 64 48 8b 0c 25 00 00 00 00 <b8> f8 02 00 00 48 03 41 08 c3 cc cc cc cc cc cc cc cc cc cc cc cc
> >  RSP: 002b:00007a75c39794e8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffffde
> >  RAX: 02fa413b24209c6c RBX: 0000017f19e1cf9e RCX: 00007a75c397aff8
> >  RDX: 00007a7855792472 RSI: 00007a7855790aa0 RDI: 0000000000000005
> >  RBP: 0000000000000005 R08: 0000000000000012 R09: 000000000000000d
> >  R10: 00000000009f86d2 R11: 000000000000197a R12: 0000017f19e40e7d
> >  R13: 000005ee937ae557 R14: 00007a7855790aa0 R15: 00007a7855792472
> >  Modules linked in:
> >  ---[ end trace 2ef6d63d0e3d757c ]---
> >  RIP: 0010:snd_intel8x0_interrupt+0x121/0x279
> >  Code: 42 8b 44 35 34 41 0f af c5 42 03 44 35 38 42 89 44 35 38 48 8b 0c 24 80 b9 60 03 00 00 00 78 0f 49 8d 0c 2e 48 83 c1 38 31 d2 <f7> 71 f4 89 11 42 8b 7c 35 48 44 01 ef 83 e7 1f 42 89 7c 35 48 48
> >  RSP: 0000:ffff9a0a80108eb0 EFLAGS: 00010046
> >  RAX: 0000000000000000 RBX: 0000000000000019 RCX: ffff90d8c5efc198
> >  RDX: 0000000000000000 RSI: ffff9a0a80549016 RDI: ffff9a0a80549024
> >  RBP: ffff90d8c5efc060 R08: 000000000000197a R09: 00000f604ed00191
> >  R10: 00000000000001e0 R11: ffffffff9468e1d8 R12: 0000000000000020
> >  R13: 0000000000000040 R14: 0000000000000100 R15: 0000000000000002
> >  FS:  00007a75c397aff8(0000) GS:ffff90d912d80000(0000) knlGS:0000000000000000                                                               
> >  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >  CR2: 00007a77945d1000 CR3: 000000015bf46002 CR4: 0000000000360ea0
> > 
> > This corresponds to
> > 
> > 	ichdev->position %= ichdev->size;
> > 
> > in snd_intel8x0_update().
> > 
> > A print out of that ichdev looks as follows
> > 
> > snd_intel8x0 0000:00:18.0: lvi_frag = 0, frags = 0, size = 0, period_size = 0x0, period_size1 = 0x0
> 
> This sounds like some spurious IRQ that casually hits during the
> resume.  It's strange that, even if it's a spurious IRQ, it contains
> the proper update bits for the stream.

Yes, I found this to be strange as well. That's why I started dumping
ichdev fields and so on.

> Is that on a real hardware or
> on a VM?

VM.

> In anyway, the patch like below might cover enough.

I'll give it a try.

> --- a/sound/pci/intel8x0.c
> +++ b/sound/pci/intel8x0.c
> @@ -691,6 +691,9 @@ static inline void snd_intel8x0_update(struct intel8x0 *chip, struct ichdev *ich
>  	int status, civ, i, step;
>  	int ack = 0;
>  
> +	if (!ichdev->substream || ichdev->suspended)
> +		return;
> +
>  	spin_lock_irqsave(&chip->reg_lock, flags);
>  	status = igetbyte(chip, port + ichdev->roff_sr);
>  	civ = igetbyte(chip, port + ICH_REG_OFF_CIV);
