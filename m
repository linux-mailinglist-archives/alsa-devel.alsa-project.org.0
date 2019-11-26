Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4E710A1FD
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 17:25:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9382B1769;
	Tue, 26 Nov 2019 17:24:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9382B1769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574785517;
	bh=vi2VQj61tYKVdovXrN053QZJY3QCQAT68unO4jfbstA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YggCjVyocln35VQoVyh3oMdJ8tzqGkd9V2Mi+G0wjJUOfm+rZCQngOjrKeqX78nJo
	 UAfeoQP7aBLLzn87tS+DK8ZnZuAAsgZvL4i1SkxhP135m27I2XVmF/e71FwZWjAgn/
	 J7xWAh8KxmTLM+xgiAy5sr2tQQO0Aev6VNECDbSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94BBDF801F4;
	Tue, 26 Nov 2019 17:23:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FF75F80159; Tue, 26 Nov 2019 17:23:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C08E6F80109;
 Tue, 26 Nov 2019 17:23:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C08E6F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qER4WWZh"
Received: by mail-wm1-x342.google.com with SMTP id f129so4052106wmf.2;
 Tue, 26 Nov 2019 08:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HQByKALkBWDdFlY0kM5gbjhCBnCIXuIBkedse9OcOXk=;
 b=qER4WWZhQwapUz1UKnmmwaiQtYMvH0CwrcahEQ6Yuv3KwqFOdWNZcEQVtBfjXppDvm
 fLwL4B53xhNYFEnohVTAHDa0V5odlsCMZ/lYNZ0qKMA4Spaju+Oarrk8CSa4au+Ehcry
 eUQFSOdMAhK6Ob9bGca/0ANxcVcmCeNtYH6nce4XVFNRhlnmYNLJ1Xwji6hxfFqH/emc
 aQVSn8JM7jqWilMPBJjqIRM1yKhkozDUOUJWi4zCCNlSqoeuaFk1p9NJou5PWOz8fbKl
 NASA1MZd6QJEOliCXfklv7CmiWXDyu9lYDidy6Tc7SHqTfFOuxdAVcAYbJsU9FrcUuYp
 qv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HQByKALkBWDdFlY0kM5gbjhCBnCIXuIBkedse9OcOXk=;
 b=CJd0tvF5kUegAiv0PFDLpQTaptaDTBMl5fu/SKD3IiOpTU1W5BhNvxXwZlWV1RFs6j
 xtOOfph5xRnMjowbP43ams4Su/MZwmOeyS4EGXnLdXpzyPUqK+D1yjCR1sU0argJHb5Y
 E3EiJ8tIDXWvxvt2NRfM2XdsQDaO5GB6T5vjHpatTBc5zSo3cecrDePIaDO+y7fxxkJ+
 Uk7mzL6PYB5sDSLvyXEZt+UY/vWiqJA9iVAE1vHTYWM1n8d4z51ekJUaGsi8nUpQbYF8
 QMJOTPrRCkwXzKSsKc1UYGewtLPNJ6kPQWTUxE4bzu0slfQr6OK34hTjo/X2Nz2MV9pN
 5vuw==
X-Gm-Message-State: APjAAAWeLh9I3rQ8nL9sCnIQGBjSsOeUxMe3AtGWWcBLT2CJQ97uEBBf
 42FxrXSQ6YeVO+Sd+8e8Ts+UG6SJlJr6gMmsdM4=
X-Google-Smtp-Source: APXvYqw/G4MpKnoctIPwXm8zgOutU8VbCA13YpfIH1u2WV/Xin4PWzRjR0GfhUYEPfmhxyyPW2X4tdIQNka0t9ixPkk=
X-Received: by 2002:a1c:2745:: with SMTP id n66mr5036801wmn.171.1574785407739; 
 Tue, 26 Nov 2019 08:23:27 -0800 (PST)
MIME-Version: 1.0
References: <CAEnQRZBsmz17JGdxT_bB_tDHsmWskdXCW47R5wf5dhEw=Jpu-g@mail.gmail.com>
 <6a508a6f957b13a2ccb71c1c91316a272fb38b3a.camel@linux.intel.com>
In-Reply-To: <6a508a6f957b13a2ccb71c1c91316a272fb38b3a.camel@linux.intel.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 26 Nov 2019 18:23:16 +0200
Message-ID: <CAEnQRZA6F_V7L1EZvG4_Wce2J+aPVF1Qam_+zhkOP0o3V8cbuw@mail.gmail.com>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>, sof@nxp.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
Subject: Re: [alsa-devel] Converting a non BE to BE inside soc_check_tplg_fes
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

Thanks Liam for your answer! Some comments inside:

On Tue, Nov 26, 2019 at 5:32 PM Liam Girdwood
<liam.r.girdwood@linux.intel.com> wrote:
>
> On Mon, 2019-11-25 at 18:45 +0200, Daniel Baluta wrote:
> > Hi all,
> >
> > I am trying how a non-BE link is converted to a BE link
> > inside soc_check_tplg_fes.
> >
> > soc_check_tplg_fes
> > => for all components that have ignore_machine setup to card name
> >      => dai_link->platforms->name = component->name;
> >      => dai_link->no_pcm = 1;
> >
> > But the thing is that the link is a true non-DPCM link, than fields
> > like dpcm_playback/dpcm_capture are not set and playback/record
> > substreams are no created.
>
> These fields should be being populated by topology since they are
> runtime configuration on a non DPCM PCM device.

Well looking at topology code (soc-topology.c) it looks like only newly
created links (and only FE links) get dpcm_playback/dpcm_capture set.

soc_tplg_fe_link_create
=> link->dynamic = 1;
=> link->dpcm_playback = le32_to_cpu(pcm->playback);

So, for an existing BE link, dpcm_playback/dpcm_capture are not touched.

>
> >
> > The question is: is this supposed to be working with non-DPCM links?

>
> Yes, it "should do" and did when I last tested - there were some non
> DPCM Intel machine drivers that needed to work (grep -L no_pcm
> sound/soc/intel/boards/*.c), but I am not as up to date as other on the
> SOF driver core now. So if it's not working, it could be a regression
> (as these non DPCM boards are not used now IIRC).

Oh, I see. Thanks for confirming that this works. I will dig through the history
to see what happen. Because I do think it is a regression.

thanks,
Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
