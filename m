Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D35F0C36
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 03:47:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55E7C16E7;
	Wed,  6 Nov 2019 03:46:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55E7C16E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573008463;
	bh=/HQUUUoFF00BSAQXHshk8QjI7ivRFt8yqKkxDWulYcg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oA8Dkkg7WxTDAD27bKF1aoU7D1Zw6ZqeJxUzpunWXYzQ7lZ8wLDXxOCYA5AyH9Xpo
	 hZBBqVCZSlPhwctu3XOakFQ1RoZM6knxoiNBzVCN5iYY9w9w5XFuvyIwzVI4x8jlhS
	 GFuYe0vBQdRgQsOwqI2pt0g0GQZ1mkQSajQbu3lY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5312F80321;
	Wed,  6 Nov 2019 03:45:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4173CF803D0; Wed,  6 Nov 2019 03:45:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 357E3F80291
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 03:45:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 357E3F80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="OqODg55s"
Received: by mail-io1-xd42.google.com with SMTP id p6so25279112iod.7
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 18:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dt+Ebp8PISSZ6NFI34hFJYqOSw/iBFdPQy5o45IXj14=;
 b=OqODg55sZ19lMaSO3Q4E66EQ0ATJ6qZVlrjdhfeOS7O7l29KgjanB2lkrnyNrXOZ8N
 7lZ2AaIyrc/1R8irykmh0KWoAqxJ/WoNvGvPItnKRW1M2WGpsMMrIsruNlCCXo3knepW
 350ma9FZ5+iQZLl+3agUI+iAGC4HrsFO97oT68mJ24C3yc5/T28q124b8N9UXRAQpxLY
 mVMo+ivC9pT8Q7sLdouLih+u48v366oDjw1CZySNRR8B9Pr5Lk4G0CLhAZB5uQtXpvws
 8kLdFkMMQF0Rmjmv1WumPbxsBB1q/lSSt72BbS+qmV0OeawUeq4Ob1FlgRrpy0CwSBE1
 d93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dt+Ebp8PISSZ6NFI34hFJYqOSw/iBFdPQy5o45IXj14=;
 b=eHUi2b+0IKkv/2fcl3jiHSzMZdSxeDH23lCuKgHaNupE7zArZwIIwIrOSTW2Ncy9RD
 xcdsLglA3h1g5/qrkig+Pa9o+YYXtg7U/XtqpuRqd9/+CbmA00DI3mRytKbEKJUXh5W7
 T7dbhK493bk9sCxmx3p/SXOmvfy2JBtCDAw+Aq2FfvVb/lv1OeiEibu1ETKCdXHdxvYk
 hbVq0/JRLWPusVVkZTltpnJZ3R/F3v/ll2BJFoNM3FOws6JFinLT6yrxOpfOU5spn56Y
 ztqgp4Tie0oizGVWVCTGRg/c4RL+iGMtxeikAGzAYWT7CRsEhDSBJTDSiW6iwdaCO/rM
 qNtw==
X-Gm-Message-State: APjAAAWi76OzhIFaIaNMew03hx+MBEKSpXU77ePPvOvPDTl04oX5nsCg
 9EZIpFTAFXkbhiJq1hQbPZBZ6KjEEKukhgN3DhrvIg==
X-Google-Smtp-Source: APXvYqyQAiXTPlFASPu06kCzjDEt1UCUpfroWVQwJGiSXEm5q5B+IsAY5H9Jfjm68Pa2vcTE4Zy5EveSWnwjxje5ALw=
X-Received: by 2002:a6b:a0c:: with SMTP id z12mr29063886ioi.142.1573008352328; 
 Tue, 05 Nov 2019 18:45:52 -0800 (PST)
MIME-Version: 1.0
References: <87wocdhkz6.wl-kuninori.morimoto.gx@renesas.com>
 <87k18dhkw2.wl-kuninori.morimoto.gx@renesas.com>
 <CAFQqKeW9ZuUcGFkjw30q-CuBfWtnDoBB_UsmjFCdBPPS78nZrg@mail.gmail.com>
 <87ftj1hgly.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ftj1hgly.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Tue, 5 Nov 2019 18:45:46 -0800
Message-ID: <CAFQqKeXx9rXj3b0monvJ6CrBj9B0YCzwcAUc2SH7ya9yb9mjnA@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 9/9] ASoC: soc-core: call
 snd_soc_dapm_shutdown() at soc_cleanup_card_resources()
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

On Tue, Nov 5, 2019 at 6:40 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

>
> Hi Ranjani
>
> Thank you for your review
>
> >     It is easy to read code if it is cleanly using paired
> function/naming,
> >     like start <-> stop, register <-> unregister, etc, etc.
> >     But, current ALSA SoC code is very random, unbalance, not paired,
> etc.
> >     It is easy to create bug at the such code, and it will be difficult
> to
> >     debug.
> >
> >     snd_soc_bind_card() is calling snd_soc_dapm_init() for both
> >     card and component.
> >     Let's call paired snd_soc_dapm_shutdown() at paired
> >     soc_cleanup_card_resources().
> >
> >     Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >     ---
> (snip)
> > You removed snd_soc_bind_card in one of the patches but then leaving
> snd_soc_unbind_card() will be unbalanced isnt it?
> >
> > Why not just have instantiate_card() and cleanup_card_resources()?
>
> Do you mean [7/9] patch ?
> It merges snd_soc_instantiate_card() and snd_soc_bind_card().
> Thus, snd_soc_bind_card() is still exist.
> Or am I misunderstanding ?
>
Oh yes, sorry I misread that. So why not remove cleanup_card_resources and
move everything to snd_soc_unbind_card()?

Thanks,
Ranjani

>
> Thank you for your help !!
> Best regards
> ---
> Kuninori Morimoto
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
