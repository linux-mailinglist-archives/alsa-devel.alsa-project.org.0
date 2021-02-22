Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C55C321F84
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 20:01:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6E241675;
	Mon, 22 Feb 2021 20:00:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6E241675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614020484;
	bh=dHHuXTtoMTz1iLJEEOVaVKK33MK7MxOaH3zMGUXAZXc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s9nbyXqTXVbXUNwiYDqgIRD2H2FmaT8Qm+suPjQLVEtC6FvVEejiHuHp7yw6Y6/c5
	 pRcZxUprpaLKgY9n/TSRR5EozbxAKYB8J0apOCqBDHHPm+CXLexQhuSnI02nCa+Ypi
	 fsIC18X240fn8be20a5Is3kD8FVzzEw4tx6KaVQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01309F8022B;
	Mon, 22 Feb 2021 19:59:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 218B6F8016C; Mon, 22 Feb 2021 19:59:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61591F800CE
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 19:59:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61591F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="RbFcsd9l"
Received: by mail-qk1-x72c.google.com with SMTP id h8so13690419qkk.6
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 10:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g+ZR1SM9fRDEFDpYzaVn4wl0pBvy2hphnmkBddOveeA=;
 b=RbFcsd9l0NMDShRpSjokh3ooj06llE1smHfMD3zAoGMJepBmq714HCdtbQDMHmZASi
 gFWJmAdRGsDsqLVyftw95k4YL6vFc0aMVQnUsf7/1Q5t4SrE250L6DDgEo+Jhv8WeZ8t
 4AzoJr+fNbs866XZtgG7V44aN1Do5bMDqm/nyCTVwt58cebKvi6SgStdOQFzJyR+dARb
 K2j90Ivgpw2guLT6zA3JKh372Hz+ftzKHvTItWpOYMz4RRQ3fVrWxv4T4Uq1mEurjsav
 W9IUiwAJMMdJeYlcrciulZrmoEsw9ZaNXQap73G9Yv6++lE8jQqoXtJF/JDAC6AyX2HO
 si1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g+ZR1SM9fRDEFDpYzaVn4wl0pBvy2hphnmkBddOveeA=;
 b=fnDFxPyNs1LIpiZM4Mb3NKlC8rtgXeExfNq7ifsxqyuEisxiaIWu2gPwR8GSlpWJSC
 UipbausVtEr/goYDeE/5jDlZwo2FqfV8NjJlcFBM75WQ2EQoc4zV7jTTUUo6KyIo4A3v
 ScmEXybWUv5WfO7DCshWzw0xswG0zSs2vIzenXTrLllM4V/75LcgeRbLFW2xOyvkQJsC
 e0PdDeIvhmzp6lQaBYl3E3R0MgUXLKrw3ugTDqbgvmKTpenT85GC/rO8q8+/M1Nrh+MX
 n5nD9uw62ruiZth8tUwZfGYe9UySB3N898DWU6RRCa1SF4Cr1ldTVxJtCVev135TJLoE
 Ds7w==
X-Gm-Message-State: AOAM532Nv0r+Lz0VvgyZKlFteUJeUZ4opTfF+FLla7sH1dWcWPCOhnFH
 31v7KVvXYAmRIIOyr5JytX6lYHXsGveE4L6lp3dzPg==
X-Google-Smtp-Source: ABdhPJwZvAPylZSK5KldRd2WZvhsuGIxruYv6JmB40+KWE4FMtHbjgCsUaDo8QIAk4yq+ZbwXuvrW4WamWG3GDljUmc=
X-Received: by 2002:ae9:edc9:: with SMTP id c192mr21890490qkg.36.1614020385866; 
 Mon, 22 Feb 2021 10:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20210217214914.700751-1-cujomalainey@chromium.org>
 <5b90530b77744937b87bbbd35901e320@realtek.com> <s5hr1ld22a9.wl-tiwai@suse.de>
 <CAOReqxibmAQNQe8PuHkUSW5Kb2L986X9DDqia-aN=ZrS8VJysA@mail.gmail.com>
 <20210222134551.GC6127@sirena.org.uk>
In-Reply-To: <20210222134551.GC6127@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 22 Feb 2021 10:59:34 -0800
Message-ID: <CAOReqxhRi9n-vxayVDNp-9R65s79OAqX8=YweCddFHTDJbbjGw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5682: remove jack detect delay
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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

On Mon, Feb 22, 2021 at 5:46 AM Mark Brown <broonie@kernel.org> wrote:

> On Thu, Feb 18, 2021 at 01:06:27PM -0800, Curtis Malainey wrote:
>
> > I am trying to understand the purpose of this delay currently, won't
> > the press already be registered since we have an interrupt? Or does it
> need
> > to stabilize? The reason is 250ms is well within human perception or even
> > double tap time, which results in users possibly double tapping buttons
> but
> > only seeing one press come through.
>

Would a acceptable solution to everyone be

if inserted && buttonAction
  respond now
else
  run workqueue


>
> It's quite common to have lots of issues with debounce on jacks,
> especially around insert/removal - it looks like this delay covers both
> insert/removal and button presses so it may well be needed for robust
> handling of the actual jack insert.
>
