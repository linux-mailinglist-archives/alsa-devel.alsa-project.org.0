Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBF8300DDC
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 21:39:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F011AEB;
	Fri, 22 Jan 2021 21:38:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F011AEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611347974;
	bh=pwAtmugjODxApW4qEkwzn4jk/EFF43VmEvG0icXcX+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cqvsd7oZ5TPX8JSzwY5GOQEAEfDsd43NUirZE6suY32vUCWtpKvETDVhkIuJkTc6s
	 zFfdTMlKZZlwvX7e1zMlCp1aEYh5q7cqPyhlh0hjUxABl0cJJMk81l4E2jNCjwaMGy
	 FnJtyCGv+bUugPP8QpKvBBfETjObJ4ByDtXQ3lXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3772F8019B;
	Fri, 22 Jan 2021 21:38:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FE83F8016E; Fri, 22 Jan 2021 21:37:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99DF4F80129
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 21:37:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99DF4F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OWmyPIOE"
Received: by mail-pl1-x62c.google.com with SMTP id 31so3942812plb.10
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 12:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T7RKVj4HjhL/VE3gqWzeMrd+2B2zwHVMlYZv61VFwxU=;
 b=OWmyPIOE0HtWOGRdGpEjvMDUsbv9/r4t5CQ3xekXyaSBMsCrM1Kx7nRMiRXkjEo6Ix
 Lwdar/ZkqxdcaMDY5Gpz5QBPU03jr2f9OnIYMQAxrLSJkG6l5/q/41mYCjoaZVvpaMKb
 YdKeZmXdfWeVu93YO8rjOC0w6aXTtPtMb/FAoZd7w5e+1CIgwYzyypmz8J5ekG0u5Ck/
 ezNwQNiGP0nx13Bi4Acxplw+f1z/18EHZ2i29e4cXMZzkIdaIPgB2K6ouCRhViSqnNUK
 jDcaLU68/+MeER16Nw/4mf9fxt3M0fCSiDYKoPN4GjWT0QaZ2U1O7E43VPijHcfk0aRq
 oqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T7RKVj4HjhL/VE3gqWzeMrd+2B2zwHVMlYZv61VFwxU=;
 b=UhZxh6c5tUQtbcokMamLzROi2GbN+hcZ59npO1SIo7pMNd4bequVkajVsOekoL+119
 TaDujfZRqMhATIsHyQRwpTYlcsSGdr4yRHwZUBuPkjoLYKcY3ocKZDeeo/9EFXIodGu3
 /c6w7+CMjcetpPf457RBMSNf5UqS52UA3Dc1WRvs2cS8n/Y+MdtH3fqgmVZ3l4TsUh9b
 9WRdr1uLD+vbzrSeyB6nhMutz1YqKf7yr3POw0+yfFrC4WrTwnNwQpiq9eUjQf33JB8n
 63MtI+3UAr+m07bLBu8W9m8TVV80hWpbyeBNqD5ARunxJDuJOHwbBUDbYk60MXVlFN1t
 ZYAA==
X-Gm-Message-State: AOAM531h+Zbm8P6T3YLXw0GeGro5Ba+nk6lr8D6butKqsL/Q1wZuKGfe
 q5WJbCJxbVArE0PpPmLatq+LWLWJu/ugmKgS7dhGUih2m7NaIg==
X-Google-Smtp-Source: ABdhPJyaZCzzPtsVRgUFheO/bfg6aAARel8TmeS5o+NRW9JpzWDxq8jbbDgMYPP40nYH46wk6vga5nbK95yI326adus=
X-Received: by 2002:a17:90a:c84:: with SMTP id
 v4mr7482084pja.228.1611347860241; 
 Fri, 22 Jan 2021 12:37:40 -0800 (PST)
MIME-Version: 1.0
References: <20210122164107.361939-1-hdegoede@redhat.com>
 <20210122164107.361939-6-hdegoede@redhat.com>
In-Reply-To: <20210122164107.361939-6-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Jan 2021 22:38:29 +0200
Message-ID: <CAHp75VdPVNMvQnkOr2YOL_VirwS7QxKfG5A9P-P8q2suK=J9dw@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] extcon: arizona: Always use pm_runtime_get_sync()
 when we need the device to be awake
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
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

On Fri, Jan 22, 2021 at 6:41 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Before this commit the extcon-arizona code was mixing pm_runtime_get()
> and pm_runtime_get_sync() in different places.
>
> In all places where pm_runtime_get[_sync]() is called, the code
> makes use of the device immediately after the call.
> This means that we should always use pm_runtime_get_sync().

I think it implies the non-atomic (may sleep) context in the below functions.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - This is a new patch in v3 of this patch-set
> ---
>  drivers/extcon/extcon-arizona.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
> index 72d23b15108c..56d2ce05de50 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -290,7 +290,7 @@ static void arizona_start_mic(struct arizona_extcon_info *info)
>         unsigned int mode;
>
>         /* Microphone detection can't use idle mode */
> -       pm_runtime_get(info->dev);
> +       pm_runtime_get_sync(info->dev);
>
>         if (info->detecting) {
>                 ret = regulator_allow_bypass(info->micvdd, false);
> @@ -695,7 +695,7 @@ static void arizona_identify_headphone(struct arizona_extcon_info *info)
>         dev_dbg(arizona->dev, "Starting HPDET\n");
>
>         /* Make sure we keep the device enabled during the measurement */
> -       pm_runtime_get(info->dev);
> +       pm_runtime_get_sync(info->dev);
>
>         info->hpdet_active = true;
>
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
