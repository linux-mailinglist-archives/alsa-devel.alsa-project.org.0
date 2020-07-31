Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 282AF2341B3
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 10:59:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF27716A4;
	Fri, 31 Jul 2020 10:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF27716A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596185951;
	bh=uKHultmexfuWBdCK9WRDRk/vbhZ+37y2O3wAMlcu988=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UawAFZ9VARbTYBgHPexEplI/DnH3wVsGI6E3R/Jpn1BYeonPdmEtGDMK9nkf2pigy
	 vW+UnEcqz4q/YTrlIPxaZCy18vge5TdKx2xPqLefkszQvT29ead2w5lLzRM5yF5KJr
	 geZEcxrz/kAAQc6qx4B/nr9WUr6Iecscu14yJUv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1184F802DF;
	Fri, 31 Jul 2020 10:56:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97A08F802E2; Fri, 31 Jul 2020 10:56:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7885DF802DF
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 10:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7885DF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="aE1OHoox"
Received: by mail-wr1-x442.google.com with SMTP id r12so27217125wrj.13
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 01:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uKHultmexfuWBdCK9WRDRk/vbhZ+37y2O3wAMlcu988=;
 b=aE1OHooxwN4CtoTfKoukXZmAijnt7lUt7g2YEmORS3cT7AcMzMNPBMqe8jdLYclZBm
 eOHaWEarxXuFCjto12aNCFolbMakz+DiEVyPF5mrDDnb4gRfoCRQPp7jBy5l2R7n/un1
 nBoT11Vhvh4xhvgqwcqKCnGpBSQmKQyJHI6yE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uKHultmexfuWBdCK9WRDRk/vbhZ+37y2O3wAMlcu988=;
 b=h44Z88Hx5N5Z/YdmP9onFnhGBrc7hTSvqLTDG1KKG/3EXWOEqu48gfgwsu2G4yiW0q
 Oz0nXNDbcwwIE1EK2KH5lrGuVjHTNRpCa7K+SzTsg6nIWEqJaqeVVNhwb/sctYN3wXkq
 ebJxUM261EN9sL+9j+E4HqfqHtHl82Qan+TDCJKmpCrZHiQkeDT70vIs3JWcsAz7kIqc
 Vp2OLJAGjZAah9nYS0vx1Tf6NWqmxGbihsOImJ2L9SH/QTI/4MtmSOibU6lSXhAHjjJB
 Q2yjgp6CpDA8NB2ev7poYG970YZe9Pqv28C+rR/GpNOIlrl0QuuY2NOsSarDOiwcP/Qz
 XFWQ==
X-Gm-Message-State: AOAM530EedZ6gGC6h2erTTUz7oZVU94pq35cgPhAaO0lKeuXBEFpp9Cj
 KbWSv1VWIbJmdzBsBLcFnaB3u6277Y+x/f5IzhyGDQ==
X-Google-Smtp-Source: ABdhPJzWn3jZhPtcamUMQKgiq4Q2WoIJL296BZio2qPps8qapt7QAgo3rn4E433qso7peWw9XBVW+myXjp0sLi36trw=
X-Received: by 2002:adf:e486:: with SMTP id i6mr2505317wrm.258.1596185775852; 
 Fri, 31 Jul 2020 01:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200721104422.369368-1-cychiang@chromium.org>
 <20200721104422.369368-3-cychiang@chromium.org>
 <ce029818-5082-643b-ff63-25aafea3de6c@linaro.org>
 <20200723184432.GA321518@gerhold.net>
In-Reply-To: <20200723184432.GA321518@gerhold.net>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 31 Jul 2020 16:55:49 +0800
Message-ID: <CAFv8Nw+Y7S2EWZMUYEeFeTmt+TdzBQUTBzgHDa7reWT9CiOA1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To: Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dylan Reid <dgreid@chromium.org>, Ajit Pandey <ajitp@codeaurora.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On Fri, Jul 24, 2020 at 2:45 AM Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Wed, Jul 22, 2020 at 10:25:14AM +0100, Srinivas Kandagatla wrote:
> > > +static int sc7180_parse_of(struct snd_soc_card *card)
> > > +{
> >
> > This code is getting duplicated in various places like apq8016_sbc_parse_of,
> > it will be nice to common this up, if possible!
> >
>
> FYI, I started work on making apq8016_sbc use qcom_snd_parse_of()
> a while ago already, but didn't find the time to finish it up.
> I have now sent it, this should make it possible to use the common
> qcom_snd_parse_of() function in this driver as well.
>
> See: https://lore.kernel.org/alsa-devel/20200723183904.321040-1-stephan@gerhold.net/
>
> Stephan
>
Hi Stephan, thanks a lot for jumping on this to help.
It indeed makes this new driver much cleaner.
I have tested with your patches and it works great.
