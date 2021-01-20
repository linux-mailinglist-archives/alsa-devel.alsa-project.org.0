Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D272FDA4E
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 21:00:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8840317CA;
	Wed, 20 Jan 2021 20:59:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8840317CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611172806;
	bh=bPJTvAgWvr6xTGbaLSCHqqh0+pUmKJ7ixUVF6ldjLPo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HPZ9/Mrrp/ijN+31fmoWNbxaM6xU8asfSWYT6qUDLkPI4wL5Obz0ipLMY9rWEXQsB
	 T7gzbzrNCiN+k1tkLjINquJZrwLYCFQVeox057KmGVaGaVZYvwgvu4cUTyxGPvg3v6
	 Qx9rgQQoUnJWucw0W2n2BOYYXVM+Y7WAbQMv8K5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1811F8012C;
	Wed, 20 Jan 2021 20:58:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23762F8016E; Wed, 20 Jan 2021 20:58:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47B54F8012C
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 20:58:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47B54F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Y3gG8xOP"
Received: by mail-pl1-x634.google.com with SMTP id b8so13091961plh.12
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 11:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q+k0SrfNNojXVlS+FWWsgz0nGxFtAPSlogEfBj1d6JA=;
 b=Y3gG8xOPJ8D+dF6VXJ17Q7dkXwg1bT0aTPLtMypbfI3wv7a7sePGgyGCScrhthaPMO
 4bQzz63E1fJ+0zuCS8rAhQyg1m19iQH4YyxWTbDTDP8DPwhoIQNei0waglqR4jhBZEIm
 /TNuqEzFCQCbtPIoldae4ZV7GJUClb+U0TrgqXiJp4fImKgH2ndDPTbGtvZ18Wjd8eFA
 pbZUjkWimd/fg6Yk6/V8F21JsGEQMiwsShVip6qVQlxm7wnK0EkbQCVlQhCtQqwTXc8a
 0dfaOvi3vstupvAEj8ya1KHb9CKiHwhooFc4D0mNp69PsEC21lY/z5bKsa1d/eofJEAS
 boBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q+k0SrfNNojXVlS+FWWsgz0nGxFtAPSlogEfBj1d6JA=;
 b=Q+/JjUgCf5kFAtSEG25aqv76ZQ3Lx/B92thmiNvzPHAUm7MN5TGXW2dOAjTUSkr2S7
 ktxeIpi3yfhgKSwFBMPObaUXuXmGXIK3VyeUo+pO2xtDOHJvvnV/L79YZRVf5TskvLxE
 50yCteR8rcLuG4H5QDgkY4XElCJnmGi9qYvtJtUPN1TXwNlaw9XwL/ShuozcE0LtFLot
 12dZGhmlzx6OVQQIwOKr407lNYsR2NZAJgvv4qzHcsIdkod1/yMebrEHSZouf0S+Ptih
 xyvYxwAkcC2UKzwCsyrwhxr+gaJIBAAxSuobplJwsRZcQj6lcIB7Lo7IWLcjF4mQU25Y
 BHEg==
X-Gm-Message-State: AOAM530h3CqYBOLMqd770OY+MUwyrJsnPrF63l6Q6wl6tCzeROjd2aRc
 DeGh9rY8vzimHF4gcLzkTk/9QR36f4OGb9J2L28=
X-Google-Smtp-Source: ABdhPJzf7p4CXCpKfQtwW28/zKqqGpnmvCQcBeJZt0n4T5Nj1R9T9wNVrGtLE4Euw8n3Al0xo6tHslFt6snjB0xmbSM=
X-Received: by 2002:a17:902:7b96:b029:de:7ae6:b8db with SMTP id
 w22-20020a1709027b96b02900de7ae6b8dbmr11408514pll.0.1611172704529; Wed, 20
 Jan 2021 11:58:24 -0800 (PST)
MIME-Version: 1.0
References: <20210117212252.206115-1-hdegoede@redhat.com>
 <20210117212252.206115-4-hdegoede@redhat.com>
 <20210118130227.GI4455@sirena.org.uk>
 <5ccf48f4-45dc-3a30-3d6a-cce066f01270@redhat.com>
 <20210118133449.GL4455@sirena.org.uk>
 <a1ea81b6-8aff-274c-f1b2-a06a27650b25@redhat.com>
In-Reply-To: <a1ea81b6-8aff-274c-f1b2-a06a27650b25@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 Jan 2021 21:59:13 +0200
Message-ID: <CAHp75VeCSOxJr1qMoXj04hnXnZiXdG4PAQ9oaKJNHWXaTqCrVQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] mfd: arizona: Add support for ACPI enumeration of
 WM5102 connected over SPI
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Christian Hartmann <cornogle@googlemail.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
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

On Wed, Jan 20, 2021 at 9:18 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 1/18/21 2:34 PM, Mark Brown wrote:
> > On Mon, Jan 18, 2021 at 02:13:50PM +0100, Hans de Goede wrote:
> >
> >> More in general I'm not aware of any (recent-ish) x86 GPIO controllers
> >> not being able to do active low interrupts. In theory we could hit this
> >> code path on ARM devices using ACPI enumeration, but I don't think it
> >> is likely we will see a combination of ARM + ACPI enumeration +
> >> WM5102 + GPIO controller not capable of active-low interrupts.
> >
> > I've not seen this issue on any ARM based systems.
> >
> >> This overriding of the flags definitely is necessary on the Lenovo
> >> devices in question. I could add a
> >> "if (dmi_name_in_vendors("LENOVO"))" guard around it, but that
> >> seems unnecessary.
> >
> > Possibly just an update to the comment to make it clear that some
> > firmwares might legitimately set the flag?
>
> Ok, I've extended the comment above the override of the irq-flags with
> the following paragraph for v4 of this patch-set:
>
>          * Note theoretically it is possible that some boards are not capable
>          * of handling active low level interrupts. In that case setting the
>          * flag to IRQF_TRIGGER_FALLING would not be a bug (and we would need
>          * to work around this) but sofar all known usages of IRQF_TRIGGER_FALLING

so far

>          * are a bug in the boards DSDT.

board's

-- 
With Best Regards,
Andy Shevchenko
