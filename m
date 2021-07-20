Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7C03CFCBD
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 16:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3793E1669;
	Tue, 20 Jul 2021 16:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3793E1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626792958;
	bh=4WLrK+sEtcJBms08Nfb5472LiT4e1BrKvLirosAcSGY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HRHiEToUlrwBKlexkWMuywwx8zLtqq34v70SL8Miwy5ADpY/eBociWd/ThT/OIkxa
	 kTsj+4dQgIbxPu2brDFfvrQuMDsMJkV08L09aK4sjAZgou/WfoEwvicXutlsj+S9Sl
	 SP1ZKgIsY740uMdaXcRulaHuNYFto2GJo/UJs/h0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34BF5F80227;
	Tue, 20 Jul 2021 16:54:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3551F80218; Tue, 20 Jul 2021 16:54:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FD23F80169
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 16:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FD23F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sq2GfwkW"
Received: by mail-wr1-x433.google.com with SMTP id c12so8310804wrt.3
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eNycMokbRMwikeyoAHQCESJsyNbzXAEXdH5RzfLsN2g=;
 b=sq2GfwkWgtJq/voM2yYyIl7B/T50wwQz6OkFIUVoW7ectnZBqU5cN2ZcHwAz+Q8DGg
 Bqj9MCkHHHDcuj9KvjhrYo8zMX5ojzQ+CEU84XO3QVgYnuoPDbPWoP9U21nAfRAjKxg4
 h23La1DzhffCKKGrhWgI91rYjBDrPd3W8Eu5jS7P2GcIZWvmLsYzU5g6B9MgT8aQg8hF
 Ce/Ebju8OXMaHnlYM4EIRMun8RPfBgifdOayq2CJiF1Bz5TJQ91cgDl/edzf6V3jGZwP
 3hDbXX/9MFDyOvSe/F5TvkinRowcv22n3fvinaduJfTVLds/gVpU4iexOExmiWAJPmmD
 ugyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eNycMokbRMwikeyoAHQCESJsyNbzXAEXdH5RzfLsN2g=;
 b=HqgMk1inZC4Ns5N9byFGwPDOLMZf9Yw0k4sKF1AHb1aDxaGSkNe2dbKsao0Qf/J8Wa
 2PH40PKzHhCOryLguBi8KXGP37HXiSI1EnKvQegTSYhjQCXahi5uDYPRzG/u66NkLUPI
 /gI2YuF0usZto3agXQf2X7cf735hl3Tn6xGdMk24Xxlm+yEn7vpXOcolo8MTHM+zzfLH
 NYlvt4GrKgB0EJ8OnSPAr/az3kNZv9bxqSGbYXflLik6glD/Ule8KiXdZ9DQvKxuetQa
 LZlZRF3o5MhXsiF7zOqH2YznfUnDRhxotQGEfIZDJn6A5mVVb8dcOgu5o6crtn5C/wPS
 kU4A==
X-Gm-Message-State: AOAM532+OcUPcacYHn67ruFJj1q9LPuRvovBdStXL7AUugkzN+AfteZC
 EtDBF2eEiPobZyPSMXdI3luIuk4CxfjlLvs1M2I=
X-Google-Smtp-Source: ABdhPJxUiK8/9zrhS7PhJr1vPsN8q52xT9V3GHC5gkdRzBXAs0Hlk0laq2XNR2wQYxS7ypkuk0cvkTtEGHp3+4IUY2c=
X-Received: by 2002:adf:ed0f:: with SMTP id a15mr1877095wro.78.1626792863772; 
 Tue, 20 Jul 2021 07:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210715141802.880911-1-daniel.baluta@oss.nxp.com>
 <20210715141802.880911-2-daniel.baluta@oss.nxp.com>
 <20210715143906.GD4590@sirena.org.uk>
 <CAEnQRZCdSLoaLVZ7-jtufgZCG6QshMwdfyJy_4oE6cXRbA5H8A@mail.gmail.com>
In-Reply-To: <CAEnQRZCdSLoaLVZ7-jtufgZCG6QshMwdfyJy_4oE6cXRbA5H8A@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 20 Jul 2021 17:54:11 +0300
Message-ID: <CAEnQRZCiC5aGK6AsD0TN5fzN6AxFn6=f8hCrd2B9fhCYfCFOSg@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: SOF: Parse fw/tplg filename from DT
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

Hi Pierre, Liam, Mark,

On Fri, Jul 16, 2021 at 5:31 PM Daniel Baluta <daniel.baluta@gmail.com> wrote:
>
> On Thu, Jul 15, 2021 at 5:39 PM Mark Brown <broonie@kernel.org> wrote:
> >
> > On Thu, Jul 15, 2021 at 05:18:00PM +0300, Daniel Baluta wrote:
> >
> > > Introduce two DT properties in dsp node:
> > >       * fw-filename, optional property giving the firmware filename
> > >       (if this is missing fw filename is read from board description)
> > >       * tplg-filename, mandatory giving the topology filename.
> >
> > These sound entirely like operating system configuration which I'd
> > expect to be inferred from the machine identification.  What happens if
> > a system has multiple options for firmware files, or if the OS ships the
> > topology and firmware bundled up in a single image to avoid them getting
> > out of sync?  What's the benefit of putting them in the DT?

Can you help me with this, specifically for selecting topology name.

I think I'm fine selecting a default value for SOF firmware name. It
looks like even
for Intel platforms there is no way of changing the firmware name.

But how about selecting topology name? We have lots of audio scenarios
that can run on the exact same hardware:
- e.g
   - Audio PCM playback + Post Processing
   - Audio Compress playback
   - Keyword detection


So, we need to use different topologies to select the scenario we want
to demonstrate.

Would it be acceptable to add tplg_name as a module parameter?

thanks,
Daniel.
