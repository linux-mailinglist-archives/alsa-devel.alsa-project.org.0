Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BBBF3D1A
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 01:56:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C8F5167D;
	Fri,  8 Nov 2019 01:55:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C8F5167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573174587;
	bh=jP4IClqNrr25aSXSPGdbgeIk43qJBsN88uiOjFWPk3A=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CoUKlHa6iPu2VIm4dSZyXtdlsNDk2HSYEO51tbap9/NpO/1EL9oqw2UYbddyeKOJr
	 oyWJn816973lpuAuNuYSUmiGIY+lI3hciUj+soBPNM7TZa4f/ziXlL/7lv33Mdpo0a
	 4rfmH6AHkxuVxXGuWbscAypZoYS38/mMIihzrPIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C1E9F8049B;
	Fri,  8 Nov 2019 01:54:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C18D8F8049B; Fri,  8 Nov 2019 01:54:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9EE9F80111
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 01:54:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9EE9F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="DWRvjHwQ"
Received: by mail-qk1-x743.google.com with SMTP id 205so3839462qkk.1
 for <alsa-devel@alsa-project.org>; Thu, 07 Nov 2019 16:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4S65KCsRDpd1VUrQY6v7U1yeGGZgh7rJEAFEIgcEUBI=;
 b=DWRvjHwQ/B1Xq1lzoIIkCLbs0yv9lNpo+WH+BtJWxsNsZrY8/k0jPMCBcGcvnqqkZD
 9EQKs3/xMJ5jCYiYuAnjnVgHFgZp2qfh8lpayah30bVkT8ugFaB5dNkwT725rRW0jedt
 h+Uwru3yZ78MqNKgYBBrz5r8YNKMpPXSVvGm7ZXCJy3XpgkizMvxFGpONi8eo2kL4/Oo
 23AxGkesImIXq++poHpJiTk2zvG79FOUCk63ekOpL8fxdiN8JfwdYg3nDpCKzxuJRyr/
 yV6lGIm3Ihdn1abj2tLp6KOZ6TB9Xi3GWe1Wqd1X5H4a5tU3m01gr9c+Y7egfkjkAguL
 RogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4S65KCsRDpd1VUrQY6v7U1yeGGZgh7rJEAFEIgcEUBI=;
 b=Ftpu1Rv10t4l2cG3ufxySThkexvCCrXXvVHOK/aWFdKyhCIZp/T/sbpqRqDrluz+iU
 lJS4PE1XyDKZMA1nzwvfZiBALjm4QxiJ94pHoYch8gHS0Nm3zmvimSxkRgVm3o0MyThX
 R6FJtDXX71guc7cJwrEgjBORKiLDhvWWKuzby/SZZE5AqqdZhu3ZV1RaNQRiJs+z32Wl
 edHHZ+lRVhTEb6N39P815XZDazUFJkhdW00KrIgoFxKuFBlJ0rgz0Z+INZi4hoUbqPiO
 O5nhj7T+mAWSpAHnJO6FRBphAaw/PWyZCoFfpsXPdiZgV/C0sQtCNv1KJ3mCB7gn0Lkx
 muxw==
X-Gm-Message-State: APjAAAXy9LOvyMqnf+OQ05u+iuKiekHenbI7zOfPY0LUvlpSDesUib3f
 eBvORou+Pw3MorsEgXQXmvkryMbj2Kh0OxBYAiXdvg==
X-Google-Smtp-Source: APXvYqyQ+ry+CfY09o9mwS9OVDZk86YGCCUkkitvlbBJbGbRWYfuuxkhblblHa1HitnM1FA7xxROH1X/o3D45WzMgl8=
X-Received: by 2002:a05:620a:13c2:: with SMTP id
 g2mr5829851qkl.158.1573174474267; 
 Thu, 07 Nov 2019 16:54:34 -0800 (PST)
MIME-Version: 1.0
References: <CAGRrVHz0LZOXWprAqR+_e59k+NQwiax7je4dSHf85yeHepHV+g@mail.gmail.com>
 <c8816679-bbf2-acc1-afa5-57f1436bdaf0@linux.intel.com>
In-Reply-To: <c8816679-bbf2-acc1-afa5-57f1436bdaf0@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 7 Nov 2019 16:54:23 -0800
Message-ID: <CAOReqxiQ8WafgYWsJ+LWYd1e11AqMh68LP+_o5MVUDFHh+6dfA@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jacob Rasmussen <jacobraz@google.com>, Takashi Iwai <tiwai@suse.de>,
 Ross Zwisler <zwisler@google.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Fletcher Woodruff <fletcherw@google.com>,
 Bard Liao <bardliao@realtek.com>
Subject: Re: [alsa-devel] issue with jack detect using rt5645
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

On Thu, Nov 7, 2019 at 3:28 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 11/7/19 4:31 PM, Ross Zwisler wrote:
> > We are trying to get a piece of Google hardware which uses the rt5645
> > driver working correctly with newer kernels (currently one based on
> > the latest v4.14 stable), and noticed that the following commit:
> >
> > commit 6b5da66322c5 ("ASoC: rt5645: read jd1_1 status for jd detection")
> >
> > broke jack support for our device.  Basically with that patch we never
> > correctly see a jack insertion event, and audio is never routed to the
> > headphones.
> >
> > With just that one patch reverted, things work correctly on our
> > system.  The revert applies cleanly to linus/master.
> >
> > Here is the series where that patch was originally upstreamed:
> >
> > https://www.spinics.net/lists/alsa-devel/msg64331.html
> >
> > If we reverted that patch upstream, would it break other devices (the
> > "GDP Win" device?) that use the rt5645 driver?  If so, how would you
> > recommend proceeding?
> >
> > Does anyone have one of the "GDP Win" devices so we can test that and
> > our device and make sure whatever solution we end up coming up with
> > works for everyone?
>
> there are all kinds of DMI quirks in sound/soc/codecs/rt5645.c, 4
> directly applicable to Chromebooks ('buddy', 'strago', 'Google Chrome',
> 'Google Setzer')
>
> Can you check if your device is listed in those quirks? it could be that
> either the settings are wrong or that we never supported it.

We have been playing with the DMI values with little luck. (in this
case it's Buddy.) When we flip the polarity (level_triggered_irq
field) we only receive disconnect events.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
