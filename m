Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7860BD59E9
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 05:23:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E091A1615;
	Mon, 14 Oct 2019 05:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E091A1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571023405;
	bh=mXfDOiNfvxiHKmXjFw8cWKgygrwk12YB/We7SxkZ+FM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SS/sehtU2NEN77TSkQpOvROQ2pZ57ivFxY8/TMupxGlT9s3nrLRue2SdsvJvNfBTk
	 txsdeKGVzzaiu7aIDm+5sse0RCuWzr5QLfhICspkKUipMeU5QAF0sFmoTkPJOea+Po
	 bgtpm+L/p5ld6TlJT043SFROs+DxQQaZ1WFgPSh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23AAEF80362;
	Mon, 14 Oct 2019 05:21:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FE35F80362; Mon, 14 Oct 2019 05:21:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C160F80138
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 05:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C160F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="KEcztLNr"
Received: by mail-vs1-xe41.google.com with SMTP id v10so9908908vsc.7
 for <alsa-devel@alsa-project.org>; Sun, 13 Oct 2019 20:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MoAndGD7+xOBQmFjHRilIe31g5IJG3QAYI2h3oVAfaM=;
 b=KEcztLNrUdPKcWuyh2hGeyPVaQfBg/U/7j5i0RNpWCAbI0jKHQPdLtQOyKZlKFk+io
 gQEboJhqjPtjsmxFmgam36eyS7/VqKYyG6aUXo9s3DFRKrICszdqtvoQabD702grmQ5F
 3a9GW6ba/v4r/6DpR1Y28TAVgEcW+/0ZbvEnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MoAndGD7+xOBQmFjHRilIe31g5IJG3QAYI2h3oVAfaM=;
 b=R5GQD8AxwXn+RDBixJCPoh+CL51HEOjwPMAIAt4lToQoJqhrOZLUdQ+PJtSH/k3NPY
 hsAtEEKhYiFQP2RS8FUnlCBl9nGORqysNNEnlLkHI/yThOqWSNoGM7UK4stj6PdgX8T5
 dlVIYQ9MtZ8orukWpnLA80EvqCQ7x4fC9iRXevNXp7XepDkrK/9TZWoYbfQvQ89qMvtm
 qWDp7aFApanS44G3YAIj8dXu+yACEqi9YiiV1fh2iWhKRqDHzNXYmsBvMAHFxM7cOUUy
 FUVGdfG9fIlLhLQ7TaO/KTB3lkKRdPaMSCgLg1iMOrOTqLUUsqAJLLXDZd9OdjUFmPtH
 0qfw==
X-Gm-Message-State: APjAAAWUmFy+BIau9mEyFjql03ABTUq7MjltBsXBf6tSD8FbEFSwdaMG
 jD048/pyu0pWoESog94bCC+giJdNbFpyCzI6YIUW7Q==
X-Google-Smtp-Source: APXvYqzUpeUtM7it5vJ7Px2l0C655iX038UrctA+47NpKao+0z1PEHHeav8gnfqe5HbF8piW70zXNvnZHj+qZJIPC8k=
X-Received: by 2002:a05:6102:227c:: with SMTP id
 v28mr16725837vsd.119.1571023290929; 
 Sun, 13 Oct 2019 20:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191007071610.65714-1-cychiang@chromium.org>
 <CA+Px+wWkr1xmSpgEkSaGS7UZu8TKUYvSnbjimBRH29=kDtcHKA@mail.gmail.com>
 <ebf9bc3f-a531-6c5b-a146-d80fe6c5d772@roeck-us.net>
 <CAFv8NwLuYKHJoG9YR3WvofwiMnXCgYv-Sk7t5jCvTZbST+Ctjw@mail.gmail.com>
 <5d9b5b3e.1c69fb81.7203c.1215@mx.google.com>
 <CAFv8Nw+x6V-995ijyws1Q36W1MpaP=kNJeiVtNakH-uC3Vgg9Q@mail.gmail.com>
 <5d9ca7e4.1c69fb81.7f8fa.3f7d@mx.google.com>
 <e968e478-bb48-5b05-b6c4-ae1bf77f714f@linaro.org>
In-Reply-To: <e968e478-bb48-5b05-b6c4-ae1bf77f714f@linaro.org>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Mon, 14 Oct 2019 11:21:04 +0800
Message-ID: <CAFv8NwKH5rX2cdfbK1XJxUJFU3uo0K4UowUM3Z7447Qoz_y8bA@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Hung-Te Lin <hungte@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Dylan Reid <dgreid@chromium.org>,
 Guenter Roeck <linux@roeck-us.net>
Subject: Re: [alsa-devel] [PATCH] firmware: vpd: Add an interface to read
	VPD value
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

On Wed, Oct 9, 2019 at 10:05 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 08/10/2019 16:14, Stephen Boyd wrote:
> >> 3) As my use case does not use device tree, it is hard for ASoC
> >> machine to access nvmem device. I am wondering if I can use
> >> nvm_cell_lookup so machine driver can find the nvmem device using a
> >> con_id. But currently the cell lookup API requires a matched device,
> >> which does not fit my usage because there will be different machine
> >> drivers requesting the value.
> >> I think I can still workaround this by adding the lookup table in
> >> machine driver. This would seem to be a bit weird because I found that
> >> most lookup table is added in provider side, not consumer side. Not
> >> sure if this is logically correct.
> > Maybe Srini has some input here. It looks like your main concern is
> > consumer to provider mapping?
> >
>
> In non-DT setup, there are various ways to lookup nvmem provider.
>
> 1> nvmem_device_get()/put() using provider devid/name. I think you
> should be able to use this in your case.
> 2> nvmem_register_notifier() which notifies when nvmem provider is added
> to system.
> 3> nvmem_device_find() with own match function this will be merged in
> next window (https://lkml.org/lkml/2019/10/3/215)
>
>
> If none of these are of any help, could explain what exactly are you
> looking for w.r.t nvmem to be able to move to what Stephen Boyd suggested?
>
> --srini
>

Hi Stephen, Mark and Srinivas,
Thank you all for the suggestions.
In my non-DT setup, I have been working on coreboot changes to prepare
data in _DSD following suggestion in
https://patchwork.kernel.org/patch/11179237
The basic idea is that codec driver should just get data it needs from
device property.
The coreboot approach works in my local setup, but I have not sent the
change to coreboot upstream yet.
If that path work, then the change needed in kernel will be much simpler.

In the future, there might be DT setup use case, and I think it should
be doable for VPD to register a nvmem device, and let codec driver
gets the property.
But I would drop this path for now.
Thanks!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
