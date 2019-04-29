Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F292DBAC
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 07:52:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE892853;
	Mon, 29 Apr 2019 07:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE892853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556517162;
	bh=rKPDwSjiGGQqbugXHxOfVP8iaL86a6R5eQZK8KNTApg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KLRZD27PkiDXMT/LEWCPYkXvK+FDxXBjQc0DjNBBQSCBLxkYcB7TrcwOJpKwgj++4
	 NfcnigDV7KCRRCbpXfaGAArSYZSBsP2nRpuD9d1b0oJQP7M9LKphCrTuTj4uV/D5UL
	 tb6U6F2tZDUMgs6SQMzWP5BPLO5DHiKXJdWbxCrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A2B1F8962A;
	Mon, 29 Apr 2019 07:50:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B913BF80CAB; Mon, 29 Apr 2019 07:50:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mta-p4.oit.umn.edu (mta-p4.oit.umn.edu [134.84.196.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DF02F806E7
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 07:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DF02F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu
 header.b="DOaYspoq"
Received: from localhost (localhost [127.0.0.1])
 by mta-p4.oit.umn.edu (Postfix) with ESMTP id 00F5C60E
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 05:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umn.edu; h=
 content-type:content-type:subject:subject:message-id:date:date
 :from:from:in-reply-to:references:mime-version:received:received
 :received; s=20160920; t=1556517047; x=1558331448; bh=rAiXQROA0q
 qkRb+JUBU+22E2nMTl//fAAwh/KSgRBlQ=; b=DOaYspoqHpg/fB0F79E6QZb0ou
 8JvlW3lMcopiX78UyPCu+Jaw4pWGW0lV2VDwnNoKSAbjymPS1zA7WrwxXWOaafNp
 gtDlKQ24zi1fPrXcKP1EfUUmS5kiEvtmA7ZpX6xuwc4K1Mww9mBI3CGByxSvCWcx
 cSs90+lepkVTDWjokkgjU6JayC3HetHurHwNzGuODviwl/p9jE6vQGD1I0XvAMT5
 0o4ylMM8GEhO1B74ohqoddklShXbeSD6T0HMFXgC+NVkQkvFy3CsqcxyAg2XgGpy
 3SlFSxAydAoLFcT5JC7EjLkE7kRq7K59op9kelJncPgUUEEFVhWPXhr5FGOw==
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p4.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p4.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3w1kU05FsDwd for <alsa-devel@alsa-project.org>;
 Mon, 29 Apr 2019 00:50:47 -0500 (CDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: wang6495)
 by mta-p4.oit.umn.edu (Postfix) with ESMTPSA id B94A55F5
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 00:50:47 -0500 (CDT)
Received: by mail-io1-f46.google.com with SMTP id m188so7900438ioa.9
 for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2019 22:50:47 -0700 (PDT)
X-Gm-Message-State: APjAAAU+fhnzTvYMvWscQN5eBB8v1d6ZAcj1dFQZwcBSyOuKrVYzXzlu
 6d3sALcRYp8TyBWX+NYOjEIGMB3HhY3crHYy/9g=
X-Google-Smtp-Source: APXvYqyGbeX3BfGfzYsg21H9PDy1g9Qv2pUeTPCGSDB5UiuPmgC3SmOBbda0HPNa+qP9I+TOhA+jcfhIY+b0A+J6ugI=
X-Received: by 2002:a6b:720b:: with SMTP id n11mr8328414ioc.281.1556517047489; 
 Sun, 28 Apr 2019 22:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <1556433754-3291-1-git-send-email-wang6495@umn.edu>
 <s5hd0l6mwbz.wl-tiwai@suse.de> <s5ha7g9l6ea.wl-tiwai@suse.de>
In-Reply-To: <s5ha7g9l6ea.wl-tiwai@suse.de>
From: Wenwen Wang <wang6495@umn.edu>
Date: Mon, 29 Apr 2019 00:50:11 -0500
X-Gmail-Original-Message-ID: <CAAa=b7f7MMJ=2PBxz8yYM6u2SX7T2-YnC37gbapc1f9HOPQdeA@mail.gmail.com>
Message-ID: <CAAa=b7f7MMJ=2PBxz8yYM6u2SX7T2-YnC37gbapc1f9HOPQdeA@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kees Cook <keescook@chromium.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: usx2y: fix a memory leak bug
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

On Mon, Apr 29, 2019 at 12:36 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sun, 28 Apr 2019 09:18:40 +0200,
> Takashi Iwai wrote:
> >
> > On Sun, 28 Apr 2019 08:42:32 +0200,
> > Wenwen Wang wrote:
> > >
> > > In usX2Y_In04_init(), a new urb is firstly created through usb_alloc_urb()
> > > and saved to 'usX2Y->In04urb'. Then, a buffer is allocated through
> > > kmalloc() and saved to 'usX2Y->In04Buf'. After the urb is initialized, a
> > > sanity check is performed for the endpoint in the urb by invoking
> > > usb_urb_ep_type_check(). If the check fails, the error code EINVAL will be
> > > returned. In that case, however, the created urb and the allocated buffer
> > > are not freed, leading to memory leaks.
> > >
> > > To fix the above issue, free the urb and the buffer if the check fails.
> > >
> > > Signed-off-by: Wenwen Wang <wang6495@umn.edu>
> >
> > Applied now, thanks.
>
> ... and looking at the code again, this patch turned out to be wrong.
> The in04 urb and transfer buffer are freed at card->private_free
> callback (snd_usX2Y_card_private_free()) later, so this patch would
> lead to double-free.

Thanks for your comment! Does that mean we should remove
usb_free_urb() in the if statement of allocating 'usX2Y->In04Buf',
because it may also lead to double free?

Wenwen
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
