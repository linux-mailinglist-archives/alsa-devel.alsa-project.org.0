Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B464F8FD0
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:49:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B761E18CC;
	Fri,  8 Apr 2022 09:48:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B761E18CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649404187;
	bh=xdQZa32pNo5xnf5JXsjAQp2Droc/xkiIYpA/NtwNZAg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lmu2rCrWvEeqcJAMFdXgY69TbG/FhdYALzJ7GHXiyoSQsBQyiaO5OqHXFUllBiLG/
	 3nHe/B205gut3VyBm8j1tCa14nP1cD45IOQQ1Gk5f2pl9sOjtKyWwc/mSswYBbSXr1
	 yC0ZHsQ95qlEP6KacW0MW2jkI48+w4FtTIR8OTtw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 808E0F804B0;
	Fri,  8 Apr 2022 09:48:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F149DF80162; Mon,  4 Apr 2022 12:15:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95F83F80100
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 12:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95F83F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="M6UB/xq5"
Received: by mail-ed1-x529.google.com with SMTP id d10so5639504edj.0
 for <alsa-devel@alsa-project.org>; Mon, 04 Apr 2022 03:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s/rlqtfSH/+OKtlWbKj/8X8QmPBtgrwTTfh5H/AMmr8=;
 b=M6UB/xq5U2lez0akpMy5cdYkLpWp5TY7avZOr9EOmD3mOmC7LnKWizhrsWVbS9OYXV
 WxZR1L3Zip6LzxkB/OPBaxvuvHRQ+I4ccmh7WVg7layXLF9PfwqQYZ+jlB6EvWgmb6tq
 0lZWCE3uc7LImkbQu2mlfWDe2OdVL/M2gk8b/f83Msuz2BzcI+DWU/n4c03LXmBik2KW
 KbNMC8korkh/nF0C0QAzLDf4TOGpyF8a6IoEG8l74xBIia5wiIab+cBhjD/6K3P9R06b
 EK2dkk2s3pESu8s3Lp5ePedMQzZPflgxpC1RgXqt3TXscJmh/VeMBZJdhbyeZhLuCe4J
 VwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s/rlqtfSH/+OKtlWbKj/8X8QmPBtgrwTTfh5H/AMmr8=;
 b=sxr+6xtO7wUYLsg2NQaoA0VtqIhhNvwGpv5KRpcswAovUlpDXepr/+Dp6Z6pgCa2SG
 cxyluYMWmSujEpt5XUSJetG3gMuKuxTZn9h1HgS3sbkifQAnpQ+5OiHGxLloefdYP3A1
 RvpkRno4U/4i1bk8c0XNP/qbrZEU4W/JZSSz3ZlZ6HdHE9HjpDzDVnu+lAQf8ROdvFch
 28GsTShfEC/U9dc+yGwCCocbonfGPzTMB3t7g93II4Ypz4BrvhH9z1xyFOeFWPT6s1bW
 g2qahsOO8NdDaKP3x0A1tctuXp+5t0bxIckfON91T6/KE/YEr+rIbAndA/iWvAN/5IDO
 ohIA==
X-Gm-Message-State: AOAM5317G8vuhbSvi14fVr+8kOdM/3LlHGdd2Bq9rdmGcixJzRSCM1rn
 UxtQwJb1fYpoPKU6GTaY01GIyORMvQS3+UklbvU=
X-Google-Smtp-Source: ABdhPJxh9T+A1Yt+ILwhaxqoZIRZw7XK7bOr8aWn5QI6DqXoAfRnxar+91mJpxHWbEEB8aKP53yR05gviFAyUrKxBls=
X-Received: by 2002:a05:6402:b19:b0:41c:d713:5cba with SMTP id
 bm25-20020a0564020b1900b0041cd7135cbamr2668518edb.270.1649067326747; Mon, 04
 Apr 2022 03:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220403183758.192236-1-krzysztof.kozlowski@linaro.org>
 <20220403183758.192236-2-krzysztof.kozlowski@linaro.org>
 <CAHp75Vczm9f9Bx_w4nW31cnBgwEzPiN-Eqn-7DKZuB+Hew0F=Q@mail.gmail.com>
 <2976f4f9-4fda-c04f-45cf-351518f88ec0@linaro.org>
In-Reply-To: <2976f4f9-4fda-c04f-45cf-351518f88ec0@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Apr 2022 13:14:22 +0300
Message-ID: <CAHp75Vd-=-unRzQPtpfOs80dN=pDSsBaj=10nwOmmyWE8OqDPg@mail.gmail.com>
Subject: Re: [PATCH v6 01/12] driver: platform: Add helper for safer setting
 of driver_override
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 08 Apr 2022 09:48:11 +0200
Cc: Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
 Stuart Yoder <stuyoder@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, linux-remoteproc@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On Mon, Apr 4, 2022 at 12:34 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 04/04/2022 11:16, Andy Shevchenko wrote:
> > On Sun, Apr 3, 2022 at 9:38 PM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:

...

> >> +int driver_set_override(struct device *dev, const char **override,
> >> +                       const char *s, size_t len)
> >> +{
> >> +       const char *new, *old;
> >> +       char *cp;
> >
> >> +       if (!override || !s)
> >> +               return -EINVAL;
> >
> > Still not sure if we should distinguish (s == NULL && len == 0) from
> > (s != NULL && len == 0).
> > Supplying the latter seems confusing (yes, I see that in the old code). Perhaps
> > !s test, in case you want to leave it, should be also commented.
>
> The old semantics were focused on sysfs usage, so clearing is by passing
> an empty string. In the case of sysfs empty string is actually "\n". I
> intend to keep the semantics also for the in-kernel usage and in such
> case empty string can be also "".
>
> If I understand your comment correctly, you propose to change it to NULL
> for in-kernel usage, but that would change the semantics.

Yes. It's also possible to have a wrapper for sysfs use.

> > Another approach is to split above to two checks and move !s after !len.
>
> I don't follow why... The !override and !s are invalid uses. !len is a
> valid user for internal callers, just like "\n" is for sysfs.

I understand but always supplying s maybe an overhead for in-kernel usages.

In any case, it's not critical right now, just a remark that it can be modified.

> >> +       /*
> >> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
> >> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
> >> +        * Thus we can store one character less to avoid truncation during sysfs
> >> +        * show.
> >> +        */
> >> +       if (len >= (PAGE_SIZE - 1))
> >> +               return -EINVAL;
> >
> > Perhaps explain the case in the comment here?
>
> You mean the case we discuss here (to clear override with "")? Sure.

Yep. Before the below check.

> >> +       if (!len) {
> >> +               device_lock(dev);
> >> +               old = *override;
> >> +               *override = NULL;
> >
> >> +               device_unlock(dev);
> >> +               goto out_free;
> >
> > You may deduplicate this one, by
> >
> >                goto out_unlock_free;
> >
> > But I understand your intention to keep lock-unlock in one place, so
> > perhaps dropping that label would be even better in this case and
> > keeping it
>
> Yes, exactly.
>
> >        kfree(old);
> >        return 0;
> >
> > here instead of goto.
>
> Slightly more code, but indeed maybe easier to follow. I'll do like this.


-- 
With Best Regards,
Andy Shevchenko
