Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB2594ABA
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2019 18:47:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AAAD167B;
	Mon, 19 Aug 2019 18:46:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AAAD167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566233229;
	bh=6gTLlg8YvC+HVdOc2qKqothqpEjGHZrrtuYFBbmyaAU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZHoZiCpIN8CsYf7IwCVm+miNEMpHbO1jLiIePQVGhj13krqw1hJxpYESJ2nu5HvSh
	 /oa4278LkezCpbkFj3dWq0c17kxNrts0fzJhzjFWVsjrp2NMj9u5x603Q5+xYWUrjr
	 8Xjm88+ymV2GBh1i1v8pd/bU4cKoLXHTpB+iyJXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3F31F8011F;
	Mon, 19 Aug 2019 18:45:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAA0CF802E0; Mon, 19 Aug 2019 18:40:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 879A6F800BF
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 18:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 879A6F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="l9R4l7Pj"
Received: by mail-ed1-x52c.google.com with SMTP id a21so2274517edt.11
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 09:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M+f3d5AAWKx5g4W6rQiMM94nVKPdWhkHfUZRqTVNykk=;
 b=l9R4l7PjvEdzAJHOks4Ig1eMybvs1Diiw31vj9JMdnXawDqPNNDGPorwEGJ8U+7/Ue
 Y3aMYa9XlO2XNG6RGsFxaFDbyt73gQF/MII29VlnsDESDsRBLI/cIr5fp2ejV4T4204R
 X5LeNR7MWuJWQPoNeyon/alQ4UlEUpdGwrXmnPJ2607Qt4V397RZVjYAu+Is9rqG9NMi
 5kI8tvbMVN/DfxjiOnISWH19//CMhGuWvOH69D3jt7ayUlcmlVoEdnnxVYzrxzqR5w1/
 h3IN0crvOj0VMBppaHbwti5sUhW7IFzhTrGJPBxEeoUoINgLmAwETdOYur759QLPdqLB
 YuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M+f3d5AAWKx5g4W6rQiMM94nVKPdWhkHfUZRqTVNykk=;
 b=CAvYBbxWZfTeFHOcQqCoiFCHJd+yv3GCFVvwxUcxv97Gk9z/AVDW0a23ObAICxyMbM
 teLx0poeXVuo0hucD8iFbTC3xUdqOokYEYWQgHiqgoC5fIS7+OjpQgkFDd6tXYJnCZFP
 DJ+J9GAQoM/1gfNxsBIsHokbj3bpeKXv7nEbZ7OdyXgHbT6QGGM60iFxkCyaXXdVFfvi
 O89VJFKpBWj68ArGriWevzNXo9Uw3dgNKQvtu8yABwUs0pdQmU2sIME48JC7uUS5wQh7
 WZumfei6ZpC/eFnqxNc7ll44vRHL59W7IjgB4iXiWb0BqQ7pxLDrsskBNInK3O9ODpMQ
 M2vw==
X-Gm-Message-State: APjAAAWhfh3bNB2Y5jn1lPih5x3YDMinDSnN525muzz0rS7jz90v4Eyb
 kIhI5B0nITwnDa2SXkikIhmCMFJHv0NJ/wNa9u1DcMrW
X-Google-Smtp-Source: APXvYqxXTx3IZmORGudMP1IcoKaSp8sQAiBoeYi6tzwmII7wlbduEeSXkWWT9pQoHZ5+HPkazX56OF7+wiBwwe3RIw0=
X-Received: by 2002:a17:906:7c4d:: with SMTP id
 g13mr21138962ejp.188.1566232789008; 
 Mon, 19 Aug 2019 09:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAKSqxP_po3DRQvhqb-VrwD_NitzSRa0a+28NNA8SajUaZN+qbQ@mail.gmail.com>
 <s5hwofqmui6.wl-tiwai@suse.de>
In-Reply-To: <s5hwofqmui6.wl-tiwai@suse.de>
From: Paul Pawlowski <mrarmdev@gmail.com>
Date: Mon, 19 Aug 2019 18:39:37 +0200
Message-ID: <CAKSqxP95DEsO_qdffUmA6_yn1FGwgkeYmo8Z65k0v9kheOtjqg@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] What to do when a device clears the buffer in the
 start trigger?
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

Hello,
I have implemented that today, and it seems that it takes 30ms to
memcpy() the data from the buffer to the host memory. Other than this
is works well. Source available at:
https://github.com/MCMrARM/mbp2018-bridge-drv/blob/65a09949c2d7343a073d92e4d4c24c5effa420c5/audio/pcm.c#L148

Do you think this is acceptable? Is there a better way to handle this?

Thank you,
Paul Pawlowski


On Tue, Aug 6, 2019 at 12:57 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 31 Jul 2019 19:48:13 +0200,
> Paul Pawlowski wrote:
> >
> > Hello,
> > I have a device which clears the DMA buffer when I command it to start the
> > playback. How can this be workarounded?
>
> So it clears the DMA buffer at start, then you need to put the data on
> the DMA buffer again on the running stream?  What a weird chip.
>
> > I found the SNDRV_PCM_INFO_DOUBLE flag, but it doesn't seem that it changes
> > alsa/alsa-lib behaviour. I wasn't able to find any drivers which shared
> > this quirk.
> > I'd like to avoid double buffering if possible, as once the stream is
> > actually started it's not required.
>
> The PCM_INFO_DOUBLE flag has no effect for anything like that.  It's
> merely a information bit exposed to the user-space as a hint.
>
> In such a case, you need to implement some ugly workaround in the
> driver side.  Since the double-buffer is needed only at start, you can
> save the whole content (up to appl_ptr) and write back after starting
> the stream.
>
>
> Takashi
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
