Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C10221B8E
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 06:51:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3046D1670;
	Thu, 16 Jul 2020 06:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3046D1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594875070;
	bh=sYAFP2j0wzEXIh6Df2AcaSGES2URO+pUjY+8MTHiKe8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NW79v227Zr98OfF0xpnLo+PGVguyDJ/x8VzI6jgNoLdHoYmtMCuHq81L+axPZ4Mwi
	 V9S1Fyvm6TKTtFRIQOwgEUo3tUJyDXOv3O4lJ4ACDbU1awYjyGo2gqMNChu/XNFcZ0
	 tEpXXE+U7eR+sSzb70t0c3ESQiiChuUTRi/0olVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23019F8014E;
	Thu, 16 Jul 2020 06:49:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5659EF801EC; Thu, 16 Jul 2020 06:49:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B793F8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 06:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B793F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="V6awRv9s"
Received: by mail-qk1-x744.google.com with SMTP id c139so4375282qkg.12
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 21:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xx24gMtqvTtf4HuF/EbOVN4ZFpQ4/y2jI0UB6sU6PdA=;
 b=V6awRv9swXVxyw87nwwxAT0Hl7BJuF1gsHXns0hlPDgJ3zxcCOJNEv4Pqn+R6lLQXe
 v5cO03vJ6JC1b2vLliuE27+n6Bql6ZGiMW9SesX2Jz1bN0yZ6PfBJdcPlMQRFy4f/ze5
 uWOeM/3f3rvOJb+DBzpD4luO2nPdAAwMk/E5r9RbxN8Vt6XazlHeX5ZZekkE9OsXyMOe
 PWplfHi9Ey2rKkAF8AKSBpeFBy+BeoUJKeyjiyzBtkoNYuW3ORijcodKkEOLt3mNtDT8
 hDs8gVdMAHmywX7UIhzUoGD8k+NDUNUrCswey5ACb7UJ9Gpzt2Fo1pKcvTdHAoFmGanJ
 ZHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xx24gMtqvTtf4HuF/EbOVN4ZFpQ4/y2jI0UB6sU6PdA=;
 b=HYubcWB3SI5plr8BjMIpQ6Zq30y0iWoBxnmGXhe+v65sXz84ZbS9mzUK/EL/4389bT
 zL2fXDqUz4uYP1yeTiMcUM983UfeiyCUMUDVLovXut0yBich/kLwMyz8kMcP7VaumHRs
 T9GVRpQhox7mfLcU9ozn11PE9VHNoLbf80IGrzu8mvfn5OY23Gfvcl5EVYYyuc5ddf7Q
 IXD5gFa6iCmCrQKJaog89OsTn1kmlzD/N30vuuWefxE+e/mU9OPwFPpU4GQyIs9H+e+k
 Y8MaO66vAZbdaF9SEOdXuTvhyzYUycO+ZDgPiJ6KAJaTjHTmglyEKhfukWVdvI2j7HEG
 va1Q==
X-Gm-Message-State: AOAM530Fg9kKFDN4P8IendOxKLFQdrCipKzJvCXYE1XyjmDPrkZIb1Ms
 j+Kp3gJgwlgu+JssYXaDaaxNpnzyIOHnMfzPHUY=
X-Google-Smtp-Source: ABdhPJxoXcUYZVT+9qi7K3c3hJEUT9Rario97Q0An5IWeSreYrlbuihMsUlvUArYbBREACQ1PlALrL1JnIJBpxIrZ6w=
X-Received: by 2002:ae9:c010:: with SMTP id u16mr2207177qkk.37.1594874954633; 
 Wed, 15 Jul 2020 21:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <1594871563-30088-1-git-send-email-shengjiu.wang@nxp.com>
 <87sgds2ixs.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sgds2ixs.wl-kuninori.morimoto.gx@renesas.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 16 Jul 2020 12:49:02 +0800
Message-ID: <CAA+D8ANH082mozu+SSsQShAzpfF8=vm_tgyPe0gERb4JsJ-sqw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-component: Add missed return for
 snd_soc_pcm_component_mmap
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, ranjani.sridharan@linux.intel.com
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

On Thu, Jul 16, 2020 at 12:19 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Shengjiu
>
> > Add missed return for snd_soc_pcm_component_mmap, otherwise it always
> > return -EINVAL.
> >
> > Fixes: e2329eeba45f ("ASoC: soc-component: add soc_component_err()")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
>
> Oops, indeed.
> Thank you for the patch.
>
> But it seems these functions are also missing "return"
>         snd_soc_pcm_component_new()
>         snd_soc_pcm_component_sync_stop()
>
> Can you please care these, too ?
Ok, will send v2

best regards
wang shengjiu
