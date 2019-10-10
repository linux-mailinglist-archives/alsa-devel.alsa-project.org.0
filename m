Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BEFD2CCE
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 16:48:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ED17168B;
	Thu, 10 Oct 2019 16:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ED17168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570718927;
	bh=qBVGf8jRRFeB8M2rG7grVAGfzJLTKz8j5j0WsZAEW8k=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ngYz9AYKutWSzodSYBeZH4lpL5wxypPNKaaZ8nZVPvNwPZ8+rTAamLqbXjJiyYACe
	 dzc00jZpcTAR5yVaEi3oiHVR+oHIhhzMpXOEU9sEH7IgW/jjJNiRva2XdcMCcfMRwC
	 sCXcdfHCqToPUiie381QZNc8LYV+KXgeDqj525so=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EDFEF8045E;
	Thu, 10 Oct 2019 16:47:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D43BF8038F; Thu, 10 Oct 2019 16:46:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B57ABF802BC
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 16:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B57ABF802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lOtDnKLV"
Received: by mail-wm1-x32d.google.com with SMTP id i16so7255175wmd.3
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 07:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0DOn6FoEIhT5LOKZpVpYubkPKQUfmKQ9OfQOm+AVQy4=;
 b=lOtDnKLVR5ERmLy/caH1vGMux/NhWG0G8XjVRz37LNA61bd2+jEI48deCw0MD+Wc5O
 VGIWXsF9u7SRrE9mqCEZfPxAifRdSPOKa6Zvpq5NbyW4H7pmvh3+ywmne13l0BuX7a4c
 2lPzX3H7+zkmEkTe2thYRNHUFu7SPImSZ3q2MR4ifymac0ImSluLk0N6jTuhJXpvDh9O
 gRv0OQRK3Zx1EPaMucWnZTeLw7YzqP2eYUe2CaHURUdB6wOMXQwkC/r2z241ImqhnZHb
 jnEqII1Q+QgWZDqX2MVEMW2Cspw0kMLgy2r/90GFHr6OYO6yHS5UnQYUpW+tDNCKuPrx
 8Iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0DOn6FoEIhT5LOKZpVpYubkPKQUfmKQ9OfQOm+AVQy4=;
 b=VOPGxgP0Dzg61iFxgIDA7zpaR66VybdHyHoIJX1Ips9bTGjdUAgfItQDaBOwPjQrUa
 YRqSimK8zLejUQ/fK7yvDtGraSG0rCxUBu+8VS2CY/Mxxj2zQ6mIv5QHRu1vivmYZIbH
 rnxx0psL4z6ya0NbCa8aC7+WNf4k2vWo4OauHXihc3l3GEUgYt2yjyCHwJPZheKN780M
 pdt1BUsS8dITjh9nOdOpPGpxSt67Um21BrCoEcQP43PnD9R3YHO8wyktTIo4DSlnC+jG
 ho1/n3DGEDUgdYpjWo82wOmihP0ZWQNEfx1rn8BJkzBi/8oxpN3xwOBnxkD7NTJnUM7h
 8+Ew==
X-Gm-Message-State: APjAAAWBlT+gnLaPzTvi+xEOz/TNJHDXA5ihyXVnVApTsSWOGWtUgqPH
 K4eGpTMUiMGStvS4NVVcyeZOtZMclwE9D5cJleo=
X-Google-Smtp-Source: APXvYqws5nmJJMQnmWAh3xKoXAYdzWTrn3As4IdE8xi/v8/bIA4g+Oo4KItZiumuerjV4aNmdN1ZbbJ3JyHScm3QDLk=
X-Received: by 2002:a1c:e48a:: with SMTP id b132mr8283170wmh.13.1570718815675; 
 Thu, 10 Oct 2019 07:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAEnQRZDhhZHOyqC8QSmgy+CY5eYSktPUiL6tVF9z_5ACegCsQw@mail.gmail.com>
 <CAEnQRZABxV+s3bF1yRr2TF0EJhZ-u+ZXxuvvz5so8AfyHVm8wA@mail.gmail.com>
 <87zhiaixfj.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZAYmFKnnCYPFQPsrDY1ToUPbqj=U1dG7T8NY9E4QXRNTw@mail.gmail.com>
 <87r23l7ang.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r23l7ang.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 10 Oct 2019 17:46:44 +0300
Message-ID: <CAEnQRZDp=hqFtuBz2T6j0_e+AnqeO-39sHqMKTWLur-Uk+u=tQ@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jerome Laclavere <jerome.laclavere@nxp.com>,
 Guido Roncarolo <guido.roncarolo@nxp.com>
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

Thanks for your answer. See my comments inline

On Thu, Oct 10, 2019 at 2:37 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Daniel
>
> > > Do you mean CPU-dummy + dummy-Codec ?
> > > But anyway, simple-card/audio-graph DPCM support is very limited.
> > > Unfortunately it doesn't have flexibility...
> >
> > Yes, exactly. I need 1 DAI link with 1 FE + 1 BE for DSP / SOF  usecase.
>
> simple-card support it
> if it needs convert-rate or convert-channels.

Yes, but this is needed for ASRC-like components. I don't think I can abuse
this usage for my usecase.

> Please check below
>
>         static simple_for_each_link(xxx)
>         {
>                 ...
>                 for_each_child_of_node(node, np) {
>                         /*
>                          * It is DPCM
>                          * if it has many CPUs,
>                          * or has convert-xxx property
>                          */
> (1)                     if (dpcm_selectable &&
> (2)                         (num > 2 ||
> (3)                          adata.convert_rate || adata.convert_channels))
>                                 ret = func_dpcm(priv, np, codec, li, is_top);
>                         ...
>
> (1) : using simple-scu-audio-card
> (2) : 2 nodes or more
> (3) : has convert-xxx property
>

In fact I just need 1 BE DAI link. My use case is with SOF where the
FE will be added by topology.

I think I can modify simple-card to do this. Just let me know if you
see something obviously wrong
on making the simple-card / simple-scu-card handling this case with
creating just 1 BE DAI link.

Maybe add a property like "dpcm".
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
