Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 739403F95CC
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 10:10:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA43116CC;
	Fri, 27 Aug 2021 10:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA43116CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630051849;
	bh=PbRczYOvHYAKmKMe7eRWCaQ3JbC8XwQXcY9W5elx3EQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AKstURP39OEEtStfdDaW88YI6dwofyzElKpGFdzfvZQTRUBBtD4DuhnVvenUviJ2o
	 toSSl6gPXeP+ZADpO24WYlZjJpsBH0yd4ccvSzsYYkVhAeBEbRluoGUtd3JVvpsLCT
	 bMwt3lVv4wNHHyHRpt69oV+JtGfYpI5jLFaNIHBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D182F801D5;
	Fri, 27 Aug 2021 10:09:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49B69F80054; Fri, 27 Aug 2021 10:09:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7EFDF80054
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 10:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7EFDF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SudM1diP"
Received: by mail-pf1-x42b.google.com with SMTP id m26so5065205pff.3
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 01:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KnZ771ayVYug9bm/elMLHVvvuIW6MW3AL+IJic34BwE=;
 b=SudM1diPRRY31Q9YnYRHFhjU3SgL8fYD+iwkN7o3OIV7wt//stVVcnQvZME5kHWYh2
 4/rI3PJfRhPi+X5K8ZTW5iJ9AvJJ9OrSbcs8SmOcQQ6n0qQPvil8So4fOj6wYanwLMhp
 b3MMwAvob9r3HiqJdBBrZkHg2jM8X5QLIF6RtaGb9fbQR/a2AO3t0EkNaam3YrBWNbDz
 FB7DbGO0Vyu0XiqZ8W0nCza0JJixi00AJh7TM9VVTL5se452F2ZU5V7/ibrrEscJErFb
 Lg39mCopIT97Lujp6jGykqqNdXzV7AzAnL9gBkOCHoxHF2SywHvmK6N1MOn3PBVT2kLy
 I8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KnZ771ayVYug9bm/elMLHVvvuIW6MW3AL+IJic34BwE=;
 b=Go9F3zHvqFfBXXzvpj4StL9OFy+ZdZ+mLc0NXmgJf6H68LGW9LRtainA1gVzJzwouP
 3WbTGwUCWQqvsZl0gCCLq1OZiDbetZ2PS36MNTOVfWcG3DNsoV/2cHIm4ID/6Amvb+Np
 LGYfJmy6XFlbIHY+Rau9RAE9xGEWwxNZ7SuFFAm+/edSKRn1LSPLNMy/jA7BdHgRzW5w
 5EKkN5HrcZG0eHKazPj1vDBltPXyr9IkdR1zf3oPzDaTh+hQiVXQqPMw20a/VxGaBPrq
 ppYgsIOddGMns8wu0LId7bMxTiOSqMAO9/orcWLU/T2QNdvSWixqWG6njViKi/mfbcJt
 30Zw==
X-Gm-Message-State: AOAM533ULU8jBpSBeSxunajufJapy2FuoriwmoF9JsnsgBYKEkoxiRj1
 bp0LxQ4wsGxVrRtGzDer/SSEDvr3F0WZVCGc4rw=
X-Google-Smtp-Source: ABdhPJyuozem33uKrywaxg5pMh/3wNwFSdzH9Id5YqkBidB1EZrDvDNU1pc2Ckotx4qwYOtkq8XtpRxlckvXA8g52cQ=
X-Received: by 2002:a65:45c3:: with SMTP id m3mr6873837pgr.203.1630051758158; 
 Fri, 27 Aug 2021 01:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <c857f334e3c9e651e088b675b3938cb5f798b133.1629906123.git.robin.murphy@arm.com>
In-Reply-To: <c857f334e3c9e651e088b675b3938cb5f798b133.1629906123.git.robin.murphy@arm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Aug 2021 11:08:38 +0300
Message-ID: <CAHp75VejabzoA8xBYFH1X-9vwS4U8SsivnS4be+H7vUTGH8fKQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dwc: Get IRQ optionally
To: Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Wed, Aug 25, 2021 at 7:04 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> The IRQ is explicitly optional, so use platform_get_irq_optional() and
> avoid platform_get_irq() logging a spurious error when trying to use the
> thing in DMA mode.

...

> -       irq = platform_get_irq(pdev, 0);
> +       irq = platform_get_irq_optional(pdev, 0);

>         if (irq >= 0) {

It has to be changed to if (irq > 0).
But since it's already applied, I think it will be another patch.

>                 ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
>                                 pdev->name, dev);

-- 
With Best Regards,
Andy Shevchenko
