Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 229974E218F
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 08:48:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9980516D4;
	Mon, 21 Mar 2022 08:47:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9980516D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647848905;
	bh=hE46fXwO5LIlT2wOIccXFBKWLT6OdjVGt8q3eXVFAlU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OIFpcFh3w0Q9NuYzMtRZ+JwylQNGbaL6RdQvP0fCxQ74sa/sQboNGyrPbhUFItTkN
	 CRsLRqdcr4RLNC6mtUd4NPStXgJrA3A82wOAelY9OjML28MALZwUewF7e+B58Pkwdr
	 TTKUpG9mDThE0FeJma4sqV4UC+4ULOfC5gaJ3hZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0322DF80238;
	Mon, 21 Mar 2022 08:47:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1206F80227; Mon, 21 Mar 2022 08:47:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC75FF800FD
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 08:47:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC75FF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="CAszEkHa"
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D37A13F1FC
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647848820;
 bh=hE46fXwO5LIlT2wOIccXFBKWLT6OdjVGt8q3eXVFAlU=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=CAszEkHa04rSMetYmf5M2x0ieSNBOfkPm55O/+1tA/TIN8bWWCRUZSJl/9lN4+1bJ
 WATkSLhLa0yfu6yAN6u03m62mXdl5vpLlioAM9RynxWRxtk2/T9DjEWyyiZDVAfG/G
 HdnFZsox9RX4gcwOz9zQUpyh+aHYcKuW+1i/AHDKqXctBCq+QIA8a4f56noUjqaVQG
 TCOOS8a/pZ1urQmCe2o7n8gnLHzPaCFGq+O+ELAgadOYai5D/E93b7kcZwwZBs2IN8
 8lKnq2lJlCjAfjkrGsBCcCVt5mbbdjD0LfDyJPkLwkPcZFLHhXdI16ZGBRQpaSBMLh
 GvhOLZ9mSHoJQ==
Received: by mail-oo1-f69.google.com with SMTP id
 e202-20020a4a55d3000000b00320d9789237so9204592oob.16
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 00:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hE46fXwO5LIlT2wOIccXFBKWLT6OdjVGt8q3eXVFAlU=;
 b=Y6N6LRBxZOlzEyU5ElJZFS3t04lSHlYxMtIJywyiz2FNHG1/iDX5Us+FeKTv3JSdOu
 kQBv8R/fn7eCQx5G08s8Y1qUNNUBVkZdrKo1OJLejKSoV6f9acfTj5313lQfP64ZAp+c
 VxAuyvgqCIA9R/U2ny1oi4c1gTZl50kKRVtP3XqYzmO62V3XJKRe4q6NHDk653e+//yV
 8xtfShQO8SXEKQVqfQ6LXCFEOxc3/ruRogSW9WbpVWyYp7xEbX3FvKFIAoWEj44qv8dC
 B71O7d5/jfKVm5KXizcFGnIOqViZN0IaADvYY8rWyXh/psEohyWixH0Sb/b6uEQ1TIYW
 wmPw==
X-Gm-Message-State: AOAM530TNJWmfkrilC6+kPQ+PNTat9wNasiaIwIYwZnTJAgH8EAPbISl
 vNkjkGb1DHp3xrbq/IfjlPZtEqZVlGL0nzvfnfuDQ6ZLpot0v2hc3Ek3vh6ZBvD340JCZczs3Gl
 GhY6ZkEMtSQhsnO/12frbLFdt0/opeEvn3Qgl5GMyD23sA5IYsNU5Sn97
X-Received: by 2002:a05:6808:3012:b0:2ef:79c7:1342 with SMTP id
 ay18-20020a056808301200b002ef79c71342mr4132oib.0.1647848819454; 
 Mon, 21 Mar 2022 00:46:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNw2oa86WnfvCAmgfO2ITM7xMIXoAkd6X77Q5Vvz8OywnQP1upsmm4U9u9/5EKa5AxbhNHL9S2RWuJfMrN7t8=
X-Received: by 2002:a05:6808:3012:b0:2ef:79c7:1342 with SMTP id
 ay18-20020a056808301200b002ef79c71342mr4129oib.0.1647848819115; Mon, 21 Mar
 2022 00:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <fbfbdedd-21b5-5b6f-c03c-80027acbe2f5@leemhuis.info>
 <420bd395-10e7-b5de-97da-56d90fb82654@leemhuis.info>
In-Reply-To: <420bd395-10e7-b5de-97da-56d90fb82654@leemhuis.info>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Mon, 21 Mar 2022 15:46:47 +0800
Message-ID: <CAAd53p4qmoRV1TjTG00vEmQmuiYWxQMjN9SER5i=1c_cB41d_A@mail.gmail.com>
Subject: Re: [regression] Headphone output gets unproperly powered down - Mi
 Notebook Pro 2020 (ALC256) (fwd of b.k.o bug #215484; starting with 5.14.14)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, itsbytebites@tutanota.com,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Takashi Iwai <tiwai@suse.com>, kailang@realtek.com
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

Hi Thorten,

On Mon, Mar 21, 2022 at 2:48 PM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi, this is your Linux kernel regression tracker. Top-posting for once,
> to make this easily accessible to everyone.
>
> Could anybody please finally look into this bisected regression from
> 5.14.13 to 5.14.14 (f8d3c17e1c37 ("ALSA: hda/realtek - ALC236 headset
> MIC recording issue")) that according to a recent bugzilla comment from
> reporter is still present in recent 5.16 kernels?

I just asked the affected user to test my patch. Once it's tested I'll
send it out.

Kai-Heng

>
> Ciao, Thorsten
>
> On 12.01.22 08:15, Thorsten Leemhuis wrote:
> >
> > Hi, this is your Linux kernel regression tracker speaking.
> >
> > I'm forwarding a regression reported in bugzilla.kernel.org to the list,
> > to make sure all parties interested in this are aware of it. The
> > reporter is CCed. Not CCing the stable list in this case, as 5.14 is EOL
> > already.
> >
> > https://bugzilla.kernel.org/show_bug.cgi?id=215484
> >
> >> With headphones (or an auxiliary jack) plugged in, the audio output
> >> is fine when anything is playing, but when that's stopped a loud pop
> >> can be heard after some seconds and if the jack is connected to an
> >> external amplifier it gets really noisy. Everything gets back to
> >> normal whenever audio playback is resumed, although with another loud
> >> pop at the start.
> >>
> >> This has been happening since kernel 5.14.14, whereas 5.14.13 is
> >> fine. I suspect it has to do with the ALC256 mute logic implemented
> >> in that version
> >> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/diff/sound/pci/hda/patch_realtek.c?id=v5.14.14&id2=v5.14.13)
> >>
> >> OS: Fedora Linux 35 Kernel: 5.16.0-60 Vanilla Hardware: Xiaomi Mi
> >> Notebook Pro Enhanced 2020 (i7 10510U, ALC256)
> >
> > Ciao, Thorsten
> >
> > #regzbot introduced v5.14.13..v5.14.14
> > #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215484
> > #regzbot from: Emanuele Melzi <itsbytebites@tutanota.com>
