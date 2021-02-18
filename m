Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A7031E727
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 08:59:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17DAD165D;
	Thu, 18 Feb 2021 08:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17DAD165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613635145;
	bh=6z10zuYkqxgVXAyuLGNoCQeIojygLUlng6bZ5QhjCZ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A1h+szpzzRKfqSAACqnItdOAL/sY5lY933wOxNyDUZ1N4L+HoTzzN9QTGN+pJxAIk
	 TSo7c2/RTqysW5kyi+MuBGIAYPzONUSVuKgBZf0FlUH0BqX4eOZAB03BHeROMRHpx+
	 eRFeM1PvOzXV3HvMiW6qKjF61Hxvn9n0k2RZmg+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 547C2F800E9;
	Thu, 18 Feb 2021 08:57:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56EF1F8015A; Thu, 18 Feb 2021 08:57:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98213F800E5
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 08:57:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98213F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TKJDEV3Z"
Received: by mail-qt1-x832.google.com with SMTP id e15so774771qte.9
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 23:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bg6ZSnruXgfVD4jOeLrAxIfhO0SIr3QdWxHbt31ZHm0=;
 b=TKJDEV3ZCzXyQLPo4690LhuK/JxxBLbOYIkTDeL9v/WmrZ48dcpJnUb1Ovx1uQE0hy
 LPtmgBNuzWw9zeoKLHom34zDiNUYZKD0RVU4j3HYBlkCv3gLyhSlLwfvEKT1P8uoOwcy
 ig25aPPybc0vdT1XjIiLbIxPrSC+43ktVqvC9ZzUJoRSCQ7cqUJ/RolVrhAJ+bkg3R9R
 6koZyw9QHe/TPDGAZzI+tUgkwylUpm2MJNW0oAoWnrLitCxvwFx0S1H0nfXE8lmI80ti
 0JhtKKrErv6pK1MZnit70/fgA8ULuIfSQamLqFHQ5Zx/lfn/GRQrc0xQdpcyGnTsHANh
 hDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bg6ZSnruXgfVD4jOeLrAxIfhO0SIr3QdWxHbt31ZHm0=;
 b=LTGgWQzPaQtHM1czrUzfZQf5+J+rqMhEpki056JtD5wbMIf+r/sH4ZRbJfgLsOWYt3
 YqmrbZpHg1r0WEKOqOmFeZle9QUy4L2lNxxttf5q9uclXZpCGKuNQj84Ba44Jp5zdpwm
 NMRFAZCQQNW71ubOhlGIDQGEBvQMBEwoG4kXkHhbReCfU1Zr98ngioeObxnZXu3eHtle
 QS9JByxHHQAkJA/rwEpclhrP9yios/ywA7tpoNwgDADP+jSH2iW3DV/1RA+80qR0FenR
 Ox412++B0AawkeNmU/bqsFuraF/cZjK6WdnHfOPyuQFOl97NnHnz6IVRg1TeEwsppSR6
 Xlfg==
X-Gm-Message-State: AOAM530kngkyc71wyW5jyRAaUdUd8BGeyB2MzQLfJyKknWJiUjQC7YWG
 At0PuMJwJOsIwABDpvRiJgn0d6xnkgMgYMsVQMI=
X-Google-Smtp-Source: ABdhPJwKbxgkU1n6Xn85QkkRx6zEyLGBxhFrkTp3vrGLKMttYXJc3yhMLn21PwynsFE8wZfmeCgV0p192sI9a5vlXCE=
X-Received: by 2002:ac8:7c98:: with SMTP id y24mr3007479qtv.292.1613635043036; 
 Wed, 17 Feb 2021 23:57:23 -0800 (PST)
MIME-Version: 1.0
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-3-git-send-email-shengjiu.wang@nxp.com>
 <20210208115112.GD8645@sirena.org.uk>
 <CAA+D8AMRGRRk6FzdiqaHAP1=dPJngNgmdGmU59vrroXA9BMyXw@mail.gmail.com>
 <20210209222953.GF4916@sirena.org.uk>
 <CAA+D8AN=SDMLhuNbstzHL_H2p_L6cr+oCXbauNB0gGs2BW5tmA@mail.gmail.com>
 <20210210153808.GB4748@sirena.org.uk>
In-Reply-To: <20210210153808.GB4748@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 18 Feb 2021 15:57:11 +0800
Message-ID: <CAA+D8ANdqd2W6xvwFuuk=YqUGCfuXCFzwO7tkhuGwzPRgA_A4g@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ASoC: fsl_rpmsg: Add CPU DAI driver for audio base
 on rpmsg
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

On Wed, Feb 10, 2021 at 11:39 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Feb 10, 2021 at 02:35:29PM +0800, Shengjiu Wang wrote:
> > On Wed, Feb 10, 2021 at 6:30 AM Mark Brown <broonie@kernel.org> wrote:
>
> > > Like I say I'd actually recommend moving this control to DAPM.
>
> > I may understand your point, you suggest to use the .set_bias_level
> > interface. But in my case I need to enable the clock in earlier stage
> > and keep the clock on when system go to suspend.
>
> The device can be kept alive over system suspend if that's needed, or
> possibly it sounds like runtime PM is a better fit?  There's callbacks
> in the core to keep the device runtime PM enabled while it's open which
> is probably about the time range you're looking for.

Before enabling the clock, I need to reparent the clock according to
the sample rate,  Maybe the hw_params is the right place to do
these things.

Can I add a flag:
"rpmsg->mclk_streams & BIT(substream->stream)"
for avoiding multiple calls of hw_params function before enabling
clock?
