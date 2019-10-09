Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD178D09F2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 10:33:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50B061654;
	Wed,  9 Oct 2019 10:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50B061654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570609993;
	bh=PyBJ8zNBGtEUxRUPf/d7zK9vJQZSIJpUi+GzgaDGIc8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c4GzkXt6Y6SZnRFRZexLqzrtDvkma02j9wPLsr+IioVY8xvUul8yNG2UutWQ8xVwx
	 VfLD4CoDMuoiHZXo/bqmYctVD0u/diGWyGtj1x2JgQAKwFSTGXHH1jUYTngFI1HSD+
	 tz/iokbNp1236Kxp7cUWE+R+cDfrb0/4v8JrVP9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9953BF80113;
	Wed,  9 Oct 2019 10:31:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B85A8F802BE; Wed,  9 Oct 2019 10:31:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA659F800AE
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 10:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA659F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="POaqZd0B"
Received: by mail-wr1-x42e.google.com with SMTP id q9so1674270wrm.8
 for <alsa-devel@alsa-project.org>; Wed, 09 Oct 2019 01:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=64oOlVo1pTWv5NmCI+jzkhBClb6FS0RcWOSet5TWat4=;
 b=POaqZd0BLheQA68VDKMMSVJntm5rMQHePnxwJk1oV2B70ksRkhaDARt3X4q8awxoKn
 kcTm+Qx0x8u4Ogc1g9wBVUAq1aV/pV+LZ3PeRGLMAU7+tS0+AVrMoRwxXWH9Jfxti7Dm
 Zq4UZVyPw1UlBq5jEqqtyDbISRNUh9ucl/mKOSGoiu3+FvsYCxkCe2Pzbk5UDf0WEkm3
 XtSsrxbl73QIH93KODcuL/Vsv3JcUQeKf9sSXz3N4874E0PjgevIQeo9flI2VsXSEH76
 SylvvuE+7fJyA2HRCXrOjF7fsxpEALNzPFm4PxbkvcX43nxumWzuoigd3NFfAB07J9Jg
 beMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=64oOlVo1pTWv5NmCI+jzkhBClb6FS0RcWOSet5TWat4=;
 b=Azai2rAdi9eMVFLG9KBDPln3dvASYlopNiV4swC7pgmUaMP33Lql87BSNyT8XhOj1w
 EMxqydRFh+DwfaWrD1PlKdddWfzcNF57cJDlCnuwvH/k9JNkcZoOUTLWnP3Up/z4R4mz
 i6hY6ZnssC3vqnpA3T4JhR3F4pX/O2ln7ytoPaI2n+H4Q3nugGUrIKrOy215gC47cX3g
 cqjPa4ivnFCHIGic/0O4PBXcHtVpGvORIhqAE97OUfPK1OeLVCBZP58msao/aotkCTEu
 jRbj53Y1IP5r+Bi/mGTRGweoZGr5krmhouOGrwsHbaHoE9x0/8AhDO7GBlGW0owonmuU
 78BA==
X-Gm-Message-State: APjAAAU15pjEH4/x/hvS9/D9yXqgxXycYTM5QgMJLXgyiK6KL6I88M6E
 DVL+mG0NTDDVqfiJiVVZd55P6kOtuIcK5G2t5wA=
X-Google-Smtp-Source: APXvYqydHUlr6dSHW4sB48HP9hkul1esEwLQOda11tFFGwY1H1WcZXndz30oz3bk/f5FZysP3pCz03Mw2vQ1NSBDevY=
X-Received: by 2002:adf:a141:: with SMTP id r1mr1884905wrr.122.1570609882639; 
 Wed, 09 Oct 2019 01:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAEnQRZDhhZHOyqC8QSmgy+CY5eYSktPUiL6tVF9z_5ACegCsQw@mail.gmail.com>
 <CAEnQRZABxV+s3bF1yRr2TF0EJhZ-u+ZXxuvvz5so8AfyHVm8wA@mail.gmail.com>
 <87zhiaixfj.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zhiaixfj.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 9 Oct 2019 11:31:11 +0300
Message-ID: <CAEnQRZAYmFKnnCYPFQPsrDY1ToUPbqj=U1dG7T8NY9E4QXRNTw@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Counting links in simple-card
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

On Wed, Oct 9, 2019 at 3:18 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Daniel
>
> > >      * ex1)
> > >      * CPU0 --- Codec0
> > >      * CPU1 --- Codec1
> > >      * CPU2 -----/
> > >      * CPU3 --- Codec2
> > >      *
> > >      *    => 5 links = 2xCPU-Codec + 2xCPU-dummy + 1xdummy-Codec
> > >      *    => 7 DAIs  = 4xCPU + 3xCodec
> > >      *    => 1 ccnf  = 1xdummy-Codec
> > >
> > >
> > > So, I don't understand exactly how did you get the formula for links. AFAICT
> > > there should be 3 x CPU-Codec + 1 x CPU-dummy.
>
> CPU1/CPU2 and Codec1 are using DPCM.
> Thus, it is...
>
>  2xCPU-Codec:
>         CPU0 - Codec0
>         CPU3 - Codec2
>
>  2xCPU-dummy:
>         CPU1 - dummy
>         CPU2 - dummy
>
>  1xdummy-Codec:
>         dummy - Codec1
>
>
> > Also, I wonder how can i use simple-card to create just a backend link
> > CPU-dummy + Codec :).
> >
> > Is this supported?
>
> Do you mean CPU-dummy + dummy-Codec ?
> But anyway, simple-card/audio-graph DPCM support is very limited.
> Unfortunately it doesn't have flexibility...


Yes, exactly. I need 1 DAI link with 1 FE + 1 BE for DSP / SOF  usecase.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
