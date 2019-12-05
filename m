Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3691F113DAB
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 10:20:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D16BB1663;
	Thu,  5 Dec 2019 10:19:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D16BB1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575537603;
	bh=oIscbgpURcZj9FEmL0sbOSLEhqR/mUgU91Gt9HlDlZ4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=joJSNmtPtwRXyraWm5mkCg4I3gbG/uVmzalYD2/M/y0XMwCTmCQofBYu3+dDRHTnn
	 FDR7a3TkhgdUTJA8nSxHhrvovoBEAZUOwPtUhMas9EmPqxFv/kd6YPusa2t6wJxCTA
	 oQwxSbnDylI8Uy0nN19Ja5Gnaz+l0Kv2JjuUA+Zs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9849F8015A;
	Thu,  5 Dec 2019 10:18:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A2F3F80227; Thu,  5 Dec 2019 10:18:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2218EF8015A
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 10:18:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2218EF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="apWsFOaY"
Received: by mail-wr1-x441.google.com with SMTP id q10so2521548wrm.11
 for <alsa-devel@alsa-project.org>; Thu, 05 Dec 2019 01:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7eqArs22c9d5V0kudwDe/vJo1J0LOw5HZJLmQ+GRMlY=;
 b=apWsFOaYx2/LRv6H1kjakHWNqgZnBqe0eRo+BvInhlLVplGHmn8e4I2JkeVelsFthJ
 3pIz0Jr9VZ91ebSm0/7+FUUIqGE1UGMHxKlRMd1nJEx8U9Kt4nNQFX2V0ly+e7n0ce+h
 SZPwY1cf8t+10GB0ydsoUxDkQwwpFFwIaLeee40Z87ARYrcLyJFDV4WOhhV+UJmepU5A
 uzmB3E9/puNEEhRritoGxiAb06wgEgZQPrffPcIeBeSGOt3MZgAXxOy4gSt4L/dgHRmZ
 1ZpiGiu+TxrXSv23qoCYlEY7ALPVOQUCfXe9MKdEob63CjeuIC+crELEZ3JYDEbYmNcX
 pskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7eqArs22c9d5V0kudwDe/vJo1J0LOw5HZJLmQ+GRMlY=;
 b=Rh0qCgi0vTuCFaSJvZsE427KpCm7dZ5MPyusRZXsLDMoYKXlK2Ci1c5AWRrF19LLXS
 bcOgF8mkuVBhVJfGZgoGvfFfm0BcB4o3rET8ZOUcKb5QLFfG8FbNyJjF02XdNARaZ5A4
 D6SNsT9tlZEwuV626Y7HO3r6y2xc/olTumsyMd6YO7IO4ncp84xGCM/AZw74aYOU++JF
 kjl/GmvXly5/I/uyygoFDf50vSEDXFMt1tjEljNQ9BSUsih+/IX1NPuvRn+ukZuQKS5B
 kHMN86PVKNSqNXIPz0nYVy6gpDczUOPtXd+QPN58sw3OsemmdkD9dGhSIvjx9kouo5Us
 Z47Q==
X-Gm-Message-State: APjAAAUR+Lgco0qIB04gsEsLG3cObKavj0loYB4wC0RIOIKLeNIN3L/8
 0NtlqJ8wUx5hm5UROv2uy5Y5Yt8zKpq0lxczdDI=
X-Google-Smtp-Source: APXvYqxIsng5JiXRsisnkQljkSc7ex9Uew97ul2dSVYXh/pFNfuJ80yJq0We9UFX3FZ2awdxjGnvDlqsi99Yo0rGgx0=
X-Received: by 2002:a5d:4b4e:: with SMTP id w14mr8662439wrs.187.1575537492732; 
 Thu, 05 Dec 2019 01:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20191204151333.26625-1-daniel.baluta@nxp.com>
 <CAFQqKeXG3ihj67L+KgKZW=Cp6ipJC18wUVci3hGTMutBv4boZw@mail.gmail.com>
 <82095ea8-fa9a-5c67-e0e6-1a886dfc4b0e@linux.intel.com>
In-Reply-To: <82095ea8-fa9a-5c67-e0e6-1a886dfc4b0e@linux.intel.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 5 Dec 2019 11:18:01 +0200
Message-ID: <CAEnQRZCL-VPNbLozd2PnySmfNXYdJYWC-wx6PaznHqjO0OUZ0A@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-louis Bossart <pierre-louis.bossart@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-core: Set dpcm_playback /
	dpcm_capture
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

On Thu, Dec 5, 2019 at 6:11 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 12/4/19 5:29 PM, Sridharan, Ranjani wrote:
> > On Wed, Dec 4, 2019 at 7:16 AM Daniel Baluta <daniel.baluta@nxp.com> wrote:
> >
> >> When converting a normal link to a DPCM link we need
> >> to set dpcm_playback / dpcm_capture otherwise playback/capture
> >> streams will not be created resulting in errors like this:
> >>
> >> [   36.039111]  sai1-wm8960-hifi: ASoC: no backend playback stream
> >>
> >> Fixes: a655de808cbde ("ASoC: core: Allow topology to override machine
> >> driver FE DAI link config")
> >> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> >> ---
> >>   sound/soc/soc-core.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> >> index 977a7bfad519..f89cf9d0860c 100644
> >> --- a/sound/soc/soc-core.c
> >> +++ b/sound/soc/soc-core.c
> >> @@ -1872,6 +1872,8 @@ static void soc_check_tplg_fes(struct snd_soc_card
> >> *card)
> >>
> >>                          /* convert non BE into BE */
> >>                          dai_link->no_pcm = 1;
> >> +                       dai_link->dpcm_playback = 1;
> >> +                       dai_link->dpcm_capture = 1;
> >>
> > Hi Daniel,
> >
> > Typically, for Intel platforms, this information comes from the machine
> > driver and there are some DAI links that have either playback or capture
> > set. But this change would set both for all DAI links.
> > Not sure if this is the right thing to do.
>
> I am with Ranjani, I don't get why we'd set the full-duplex mode by
> default. but to be honest I never quite understood what this code is
> supposed to do...

Indeed I need to figure out when exactly to enable playback/capture. I
was hoping
Liam will chime in, as this was in the original patch he sent months ago.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
