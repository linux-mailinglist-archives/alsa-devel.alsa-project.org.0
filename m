Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 544211D28CC
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 09:33:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4DCE166A;
	Thu, 14 May 2020 09:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4DCE166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589441636;
	bh=FSYEhCAaIQTHIgUzCW2IVJVJzbXeZL77BPLPtSKazJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZkPUC8NVmf1cCJtFyzZS4m4DMmqsBAtbfaHJ2MJvjQIZFvyFqXb9oWvlWcU7Mp/9O
	 a9dIQaQk0ZIMbWLLN9m8AX5aQzlCJyDOkajOI5uoaO1nNsbppYNtuBcDWqtLS9CBJv
	 JJHhkgwsemmWjALWMXyvM9gg9W9sjRcdrggU+zwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8E1EF800BD;
	Thu, 14 May 2020 09:32:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E864F80158; Thu, 14 May 2020 09:32:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,PRX_BODY_65,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFFA3F80101
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 09:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFFA3F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="nksJk6Gj"
Received: by mail-il1-x141.google.com with SMTP id j3so2273988ilk.11
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 00:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nZ2K4V2ivdKLfbKoVnSYBVoL3RBoX57AcCyNb6p0llo=;
 b=nksJk6GjfmfD/5RT/EYdBZA+tvS6AvDaCsOxEpxh8TCrLXJNioen89tW3J9mSLozUV
 8BRjfBrtVal+MgGkMJT+bNTqitzhK08cT4gM706x/5gbjCqsO0Uzd20uXVdFFvIf2J1a
 j+Tp+nZp8yQGTY6q36QPA0MLgIrWrb9Bx8cQNwtqqqjrVLZnZwioDmG3eRJoerGBWkAI
 Pv3w2egzEMJa5iEv6XuTYpnI6oj1/nhi9AJ6WwGopNYX6CDQ8lwucB4+jItLY1HdnFDy
 O9HQVwX3yfsI5HB5JYh5vovN24zNu4Pc1+L5H8CQvFgwozbNSZs17x31o5XVdAxKgpEH
 a1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nZ2K4V2ivdKLfbKoVnSYBVoL3RBoX57AcCyNb6p0llo=;
 b=HrEqoq5wYltbsdW9GnXrQoTGpS19JrSuUJ26vsoTfO9WLfSG8ZlNs6fCalVrwSRyti
 59BXSl00wEMTRXE+MOjmd/5uhGETakA3r0r0qJFKGHWZvnNuixVjD5UOv/Xtvham+qUQ
 cZfSDx3HTloA3oVc+xA9EZzX14uPJQk4YIJzvhLqzRALtaYBZT6vzogZjA/k2S7GZMIN
 DeBJ5TXvMJbOyKsirlLYFDwpa9z80XF1OpYWD6xvrqaV7XIJMupV7PspkwREFBSaixQk
 Spn0UBSGcS8obS7Uz9R7Vsv3DpZjlx318xpbu/FsryT0QtnRWpO8kFiohy7Wv3dLD/Qc
 0Hig==
X-Gm-Message-State: AOAM533vrOoNHEiumia4xW0YmDB8LQ8rVFBRGl3mdYY+PMbgDhfGbb8h
 ZgvvLMT4Uj2MfIP7t+srR3Zfa/gDQTPYbcc8LKhxaA==
X-Google-Smtp-Source: ABdhPJyEf6dDNquRbPI7mEEjgyU7b8EI011IFLAx5lKqSQzM2yVPc6Ws5teiQOo/jZXJs8/jCxOFZasj4dXdjy3nlyA=
X-Received: by 2002:a92:8747:: with SMTP id d7mr3395657ilm.235.1589441523625; 
 Thu, 14 May 2020 00:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200513074523.21086-1-steves.lee@maximintegrated.com>
In-Reply-To: <20200513074523.21086-1-steves.lee@maximintegrated.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 14 May 2020 15:31:52 +0800
Message-ID: <CA+Px+wV7o1P41ZdidpwNFtwWL1-RYcwV3dU9R7PG+66k1L_p_A@mail.gmail.com>
Subject: Re: [V3 PATCH 2/2] ASoC: max98390: Added Amplifier Driver
To: Steve Lee <steves.lee.maxim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: jack.yu@realtek.com, ALSA development <alsa-devel@alsa-project.org>,
 ryan.lee.maxim@gmail.com, ckeepax@opensource.cirrus.com,
 ryans.lee@maximintegrated.com, steves.lee@maximintegrated.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, nuno.sa@analog.com,
 Mark Brown <broonie@kernel.org>, geert@linux-m68k.org, dmurphy@ti.com,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 rf@opensource.wolfsonmicro.com
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

On Wed, May 13, 2020 at 3:47 PM Steve Lee <steves.lee.maxim@gmail.com> wrote:
> +++ b/sound/soc/codecs/max98390.c
> @@ -0,0 +1,1030 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * max98390.c  --  MAX98390 ALSA Soc Audio driver
> + *
> + * Copyright (C) 2020 Maxim Integrated Products
> + *
> + */

My previous comments on Gerrit may confuse you.  Please use C++ style
comments (i.e. // for all lines) here as the maintainer asked.

Mark, may I ask why we need to do so?  Is it also applicable to header files?

> +static int max98390_dsm_calib_get(struct snd_kcontrol *kcontrol,
> +               struct snd_ctl_elem_value *ucontrol)
> +{
> +       /* Do nothing. */
> +
> +       return 0;
> +}

This is an intentional NOP.

> +static int max98390_dsm_calib_put(struct snd_kcontrol *kcontrol,
> +               struct snd_ctl_elem_value *ucontrol)
> +{
> +       struct snd_soc_component *component =
> +               snd_soc_kcontrol_component(kcontrol);
> +
> +       max98390_dsm_calibrate(component);
> +
> +       return 0;
> +}

Entry point from userspace to start to calibrate.

> +++ b/sound/soc/codecs/max98390.h
> @@ -0,0 +1,663 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2020, Maxim Integrated.
> + */

I guess these block would also need to use C++ style comment.
