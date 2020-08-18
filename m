Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C012481F7
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 11:33:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 029851745;
	Tue, 18 Aug 2020 11:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 029851745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597743239;
	bh=TPicDVXGdIYQw7A0sJriNO7kefWFMltGe2Y4Q8hw//Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xx4nr6MNeiD/YhyPepJrjL/VkD9szZXNV/ocdHlJ+QGlt/+b795bfpAnycJJ1ovBf
	 bjNEOI9Bjb94c5S106lIaROVKUiLxqseNiI3sdN00QtpG3BLwcFbibCwCcP4S1ak6d
	 vwa/bgn09ruJ9nR9PYermg/lmwFkYHZl4IACu8uo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BE48F800D3;
	Tue, 18 Aug 2020 11:32:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B224EF8023F; Tue, 18 Aug 2020 11:32:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDF10F800D3
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 11:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDF10F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oiYao3LS"
Received: by mail-ot1-x341.google.com with SMTP id 93so15774693otx.2
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 02:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CukyYxKQagzxSnoAUerbnhafgFTcDCc+vCHDuzHrDm0=;
 b=oiYao3LSY05RtHiCa7E8GRzIrl9VRRJYDZjBtQ/ubmceLYQblalUYWs7OwMluhpnUV
 1OD/4u8SmwCBI4jQy+CFzB9DiOBMSi80AOG36VcptLnhf6mlFt3cEPpf08XASzer3N1U
 8ju50bDwgsm8cIKentn09KT7dEn43UVXAcfqk+qtmEK0ijNDJx9xsmN1YdHBtsSuJmgX
 XysM+f14J1mp0IjxEpAjmlNUmnhz1n1EVGQKFm+eyUG+fLys9+zxOsW+/DEZwSjDm1AD
 eZY+FJmAR1IxLWdli8IGiG0WHu1UOvpZRaDlGQ0XHmg+jBupgMHOuue6LE6XSsPUVN5S
 P/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CukyYxKQagzxSnoAUerbnhafgFTcDCc+vCHDuzHrDm0=;
 b=Ik+KIgRV8pltfAu4+BBckBleUlF55kyssCbsq2l3QuKmkWgpUnV87HOc8WPGqK11NV
 HKKRCM/6pSGj9QQjZu/wZEEMWJJnVTsa+vu2byU+D3bxa/qcK4grbCifgkKp3sFSdkAd
 VFvkEhL2ENQ9S4soORMAL0uj1GrnKkNU4y12P33exRVrjF+zxPFWo5+4IWLo7SqUM4xT
 OFC2kfiXR/J3BYcnVSR+qWy41LRVMGPt1OaFmrtqWhZnKwz5UaJau7NvKOUsGhPtzNER
 L31lbjy/mvpoHmvbB5ma9Dms74SoT0zEYmly690Smq0YYA4iIbfoVjcRHCtco/SBEyr7
 /DIA==
X-Gm-Message-State: AOAM533L0sCoANp7vo8TduxLp3O887yTO7JbK8KzHTZjnOsvVJfS+cm9
 y59ZkY8dDT9gW26AFwROaaarOS8kIF++wCNlaDw=
X-Google-Smtp-Source: ABdhPJxWr9qkdSOHISPy+oYHPAYjGVOTOnZt44b3JJOq1hBBUFKJuivSXPClh61XAr/SYq05DdwSLWmaagZHOPuDyto=
X-Received: by 2002:a9d:128c:: with SMTP id g12mr13892805otg.242.1597743128285; 
 Tue, 18 Aug 2020 02:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
 <s5hpn7pprl1.wl-tiwai@suse.de>
 <CAEogwTAGHOfBe4ztkx9To0gQGwHwFWzCBxn8nzWJP=wRJUJ56A@mail.gmail.com>
 <s5hk0xxppz6.wl-tiwai@suse.de>
In-Reply-To: <s5hk0xxppz6.wl-tiwai@suse.de>
From: Allen <allen.lkml@gmail.com>
Date: Tue, 18 Aug 2020 15:01:56 +0530
Message-ID: <CAOMdWSLJmiAxH5bvwh9b8O_MLdttU3Fsb4B_Y2tA08_P1b0BXQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] sound: convert tasklets to use new tasklet_setup()
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Kees Cook <keescook@chromium.org>,
 timur@kernel.org, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org,
 clemens@ladisch.de, tiwai@suse.com, nicoleotsuka@gmail.com,
 Allen Pais <allen.cryptic@gmail.com>, linuxppc-dev@lists.ozlabs.org
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

>
> Well, then at the next time, please mention it explicitly in the cover
> letter.  Usually this kind of API conversion isn't done during rc.  Or
> it's done systematically via script or such.  So unless mentioned,
> it's not expected to be carried to 5.9.

 Sorry for having missed the detail. Will take care of it in the future.

>
> In anyway, if the final purpose is to drop the old tasklet API and
> that's the plan for 5.9, all tree-wide changes have to be done in
> 5.9 beforehand.  Was that the decision?

 The idea was to land the tree-wide changes as part of 5.9

>
> > > I have a patch set to drop the whole tasklet usage in sound/*
> > > (destined for 5.10, to be submitted soon), so if that's for 5.10,
> > > it'll be likely superfluous.
> >
> >  I have picked patches from your tree to adapt to this new API.
> > Those can be picked in 5.10 I suppose.
>
> Adapting the changes are trivial, don't worry.  It was just a question
> of how to organize changes.

Sure, Thank you.

- Allen
