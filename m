Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E24E2F9
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 14:45:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D82AB1669;
	Mon, 29 Apr 2019 14:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D82AB1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556541926;
	bh=eM9syI/QuxGTo8QS2KYuHnXd+I34Jfh6pLAXYSwYHwo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h9KqDH/5aqs6Ij2zFo3S3bdNOK4GsdLdMNtDn1yxVU+qGd50teMeaeBc4aOXfmqHd
	 MmYem/R9qEIcAKVDirJgMdMbUwC6quw1sNirlQ7kmnE2qeYpdVkvyYVDyOzy3X1C73
	 /cZGFrk/79zMEHcJZVRIh8oAwiLVjmKCg+yrGYro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2912F8962A;
	Mon, 29 Apr 2019 14:43:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10B0BF80CAB; Mon, 29 Apr 2019 14:43:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10B59F80C0D
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 14:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10B59F80C0D
Received: by mail-qt1-f195.google.com with SMTP id y49so5943076qta.7
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 05:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SqNvNUMJEdexVr3hF+SW8m4hwxFpjhomBgbdEJazb7w=;
 b=r3o/b/j/4PDfiu3a6T79Cd9uVd/4XfU1uIoXA15LZwpcF+Ry8JtFTTXHhS0Ozemniv
 ohhHj71IjxmlXdGm4RnDTlHvqndaybTEDlrjb36yNzx4lwmg9Hun2jbJ/jbFUG9Y1pqi
 GdgN0gItnvXKRFz0iLChOrsF6whxFGiIresQB/gTqRzhhQEgnCUKD+H63m9lTWJuaycC
 eviC8S4748pt+FNstEFh8c9qwaH9e9cYhWnYRDl5zelDg3BFuZgDfEv1e6vQYcoY8UZK
 2Lejgw3N/o9QrvYgdpooDqqAxUYfGq2tOT3L7bH5kn4C+SQPtdVcxxIMAr+kkeQ4yy4L
 u6kQ==
X-Gm-Message-State: APjAAAVDxl/L6ablaA6yV5re8YQ8I9kQ1lgF5T6U0jq9ajiDMsOTI/GR
 Y/akicGxGZMowtE1q0dKstr+pTqcdl7tKOE1XpY=
X-Google-Smtp-Source: APXvYqxN+jezyo2Yt09ge37OQJJuo/uOJcb8r6doEQ7wqS9DeRlWthXGnE4ncJ5t7cuNHdEH8H49xZyEeaQ6MnvohQM=
X-Received: by 2002:ac8:29cf:: with SMTP id 15mr8626476qtt.319.1556541815414; 
 Mon, 29 Apr 2019 05:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190416202013.4034148-1-arnd@arndb.de>
 <20190416202839.248216-1-arnd@arndb.de>
 <s5hk1fthx9u.wl-tiwai@suse.de> <s5hv9yxjnp4.wl-tiwai@suse.de>
In-Reply-To: <s5hv9yxjnp4.wl-tiwai@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 29 Apr 2019 14:43:18 +0200
Message-ID: <CAK8P3a1CbQsyTBykXkZv-35M_zQx97aOubtZD2YuzyPV94+4=w@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 y2038 Mailman List <y2038@lists.linaro.org>, linux-um@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 20/26] compat_ioctl: remove translation
	for sound ioctls
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

On Mon, Apr 29, 2019 at 9:05 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 17 Apr 2019 10:05:33 +0200, Takashi Iwai wrote:
> >
> > On Tue, 16 Apr 2019 22:28:05 +0200, Arnd Bergmann wrote:
> > > The compat_ioctl list contains one comment about SNDCTL_DSP_MAPINBUF and
> > > SNDCTL_DSP_MAPOUTBUF, which actually would need a translation handler
> > > if implemented. However, the native implementation just returns -EINVAL,
> > > so we don't care.
> > >
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > This looks like a really nice cleanup.  Thanks!
> >
> > Reviewed-by: Takashi Iwai <tiwai@suse.de>
>
> Is this supposed to be taken via sound git tree, or would you apply
> over yours?  I'm fine in either way.

I was hoping that Al could pick up the entire series to avoid the merge
conflicts, but then we had some more discussion about the earlier
patches in the series and he did another version of those.

Al, what is your current plan for the compat-ioctl removal series?
Are you working on a combined series, or should I resend a
subset of my patches to you?

       Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
