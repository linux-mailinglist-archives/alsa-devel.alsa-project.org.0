Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74050325D61
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 07:07:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F8331655;
	Fri, 26 Feb 2021 07:06:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F8331655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614319640;
	bh=OeWV8v6mFdogDFg/U4ZTUDwoXzMmHhcQLTAiJZFeMp8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bRI+0ZdrzNXOeLLGh7WXl9Uxr11AGFnXj/l2XTUMEDWq4omcmAYPtPW09v+bdUmRF
	 4rsKZ4xuZsMPW5rmzh3VYyzQ13lHMQlMCjwO7rgdbA5vTpl03mM6tqmYwEXw58+OuD
	 3dahyC10j/+JcwKAClmyoA8/RSlWTePFWJDNXhD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D681F80154;
	Fri, 26 Feb 2021 07:05:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C035F8016C; Fri, 26 Feb 2021 07:05:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8E9CF80159
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 07:05:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8E9CF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aNulaLbS"
Received: by mail-qv1-xf2b.google.com with SMTP id k5so4050858qvu.2
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 22:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MYg4eVbwr39lKc3uuAMvjqg+Cg+k46HPoKOqEhnc4M0=;
 b=aNulaLbShHGrrGAIOIVnoMFS7GA1WPvqdgqQWloxZ36+5m+1dacki93PSG1AybZLsT
 ONqHjxDClQv34l5qUYtzQQIePQtqXkxIyzQ2bYGl2D0awkbMppG7O1ZbQsn8Od4ccqaC
 ZNWdw12Ns86zd7C15kdUIx3qfU+b8X3paOYscBqusL0VLnVxZglfkVmEnjFwOFcdoZYB
 zu5pAsNEoPp51XmSMrSk+n5pt7oz1OuuHPr1e/NOYu+6pOY2v6Zdn6hD1zhuFMakK49+
 ZHQos4snnW6qEFGykFFv9mTwodUaPzTp0Ur9iYGt3v0yl9IexGdV0QzWilaGHdudNxBG
 +u7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MYg4eVbwr39lKc3uuAMvjqg+Cg+k46HPoKOqEhnc4M0=;
 b=pNQDRMhqTnOpkDM0qWHJMTGvNk56QiKQwmc7kDV9FAHSisJSFEDorubCRGtQXq5Dk7
 WMpuVZXgR+yBNkKWz6k1bv+K/kHX1MzgHlF8eCUMBBYkv5y4Emf+iwtdLtIjzTohnql5
 IaSWFM8+Y7sAURdw9jc0hj/XXUKx9rup0qHfbbWYs8q1EKAS5OMHGJQ6CO1+Sw34j6U8
 NrX+NYszZ8uRx5PQ8k4iuPA1NoJlWGNNnbCxnzx4xNinxa863LZi5x3Oo3UBcn1PKp3e
 +PMFHZIP5Okd71Dfb63WHUa1gu5SJeHyaC6SW+DZjCGcSj6MhdeoFkgZHifdAN+F+TI8
 9Pww==
X-Gm-Message-State: AOAM531uaxKThxKfsQRFUZQItozXiD2rvPH1FaoZB9Y5HoT+b7Oy4mOs
 LLTX72TXJ40zbO9Imfcdbf03dSEYr4vsUULIRxk=
X-Google-Smtp-Source: ABdhPJz4IcW1QTMR8Q4qK11JcPLmCFKX5157oQa7Xb1qX1ne3DNkUuMc4+jGF09j4yAL3FUz6v/GMdGq8OyTTO5CPno=
X-Received: by 2002:a05:6214:76f:: with SMTP id
 f15mr1129944qvz.56.1614319540471; 
 Thu, 25 Feb 2021 22:05:40 -0800 (PST)
MIME-Version: 1.0
References: <1614254912-15746-1-git-send-email-shengjiu.wang@nxp.com>
 <20210225131533.GA5332@sirena.org.uk>
In-Reply-To: <20210225131533.GA5332@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 26 Feb 2021 14:05:29 +0800
Message-ID: <CAA+D8AO8_ESHSyODXhx4Wf1Z5MbtxWRUa-k2d6wKSeA0yzD5uA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: simple-card: Add dummy dai support simple sound card
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, stephan@gerhold.net,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On Thu, Feb 25, 2021 at 9:17 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Feb 25, 2021 at 08:08:32PM +0800, Shengjiu Wang wrote:
>
> > If sound card doesn't need specific codec device, just
> > dummy codec is enough, then we can link the dummy component
> > directly.
>
> This is a big red flag - what circumstances are these?  If it's a simple
> CODEC with no control then the general approach is to provide a driver
> which announces the capabilities of the CODEC and can be bound to as
> normal, the dummy component should never actively be used.

For the DMIC, SPDIF, HDMI ARC device or other
similar device that there is no codec connected,  then dummy codec is
just used for registering the sound card.

best regards
wang shengjiu
