Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09120488CDE
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Jan 2022 23:35:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 691B9176C;
	Sun,  9 Jan 2022 23:34:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 691B9176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641767715;
	bh=sHjMIi3UtFd2lo5kVl5M6RKG4h5+8IOkHm3vLMKXDBc=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UAU8OSPbAHFC/rxPVmvxeGVsFsb+7zMWsUc0wHHq7fL9BVAgPI5/gM7RU6LHHjlYA
	 HSLTRSKkPGNfaE/J9qbE9iUQnsWWsiijZ3Nl7PubBHixtKuhhz8Ja1S+2epxlpjh44
	 bFo19i45RtQo2CrO2NG0TZ7lpmO86VYKij8jHbts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B37C8F800DA;
	Sun,  9 Jan 2022 23:34:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26624F80212; Sun,  9 Jan 2022 23:34:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72EC9F80054
 for <alsa-devel@alsa-project.org>; Sun,  9 Jan 2022 23:33:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72EC9F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YF9O2JsQ"
Received: by mail-ed1-x52c.google.com with SMTP id a18so45324137edj.7
 for <alsa-devel@alsa-project.org>; Sun, 09 Jan 2022 14:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=wMt7vNSHWfSpMgvezxLL6wwNV5AIlNWpqRO4FLaisYY=;
 b=YF9O2JsQ2Q35/62sj+moz3txImXUw5oZR/AFxWDM2w0DPCThZwnKMCvB96Y0CDSPkM
 LafFlN08qSWV5c+b8h70WKaV+s1gNAXA+mYbBdIa7UfrxyH5oq/BE48y3PAJ+Ra3cugs
 1sa4rpvVydHZeq5G/yiNOMUqPbHAJB1TcVIoUCBr6190KpBAy64+1S/GJKNOnHdbT9j1
 5cN2XDjtyvD09q9/tFh6maCCmMHGn6OxQhQQolvKVBaJ5KbBjBgTySybwdVCYk0eVQNB
 y92VxqjbWMNjqhhsJrWwphhI4nPNtAKWfqn1rnbLz2oUjuHooTa6Ztt8w9I1OkWw/76a
 RFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=wMt7vNSHWfSpMgvezxLL6wwNV5AIlNWpqRO4FLaisYY=;
 b=BkyijdaoL79aFQfA7gqCp5zz73sLj4JrrtzC/2RR4V0jYtiuUYtsIu4IABObhbhDfG
 Chh8E4/ZeCn6zClpTNHuxocbvjOojjxjWp+4s+vJbrCjsOT9C+3iHm0ky3K2U/brLvxP
 EpTlK6/Vgru2oaTvK3UiBxSCBfYJphwrSEEuJgrRsaqEJ4KwlSCwzsuJq3mjb0XAAzCN
 ebxgSyYyMfM0wd0BJnINtTK5k85gDGdKW+WF8C0+D4WVsxdhxBDDAhlWBULM/oEzQ39H
 UEW731VcIsjEWNArZek4uRVXx1eIv6Tm3qLkt3IrIW4eTgFdg8LWeBMcrJd5WfvUZ5jT
 HaMw==
X-Gm-Message-State: AOAM530B+7uSrvWTHybe5ypDx2faolViJ6bMfpM+4GrP6SEIHEECRL+T
 grGXWq7xQvJbN16OhvyXzXsl6KG+a12SSI1tQwc=
X-Google-Smtp-Source: ABdhPJxNmmEwxY3A0A63QFtCEhO/prBdBo3ogWY76auo/o3UYEQL0uZ7KPkW/gCJj0VwoFJLmV62u0j4AI6TEB4UOvA=
X-Received: by 2002:a17:906:3ed0:: with SMTP id
 d16mr55868425ejj.636.1641767633146; 
 Sun, 09 Jan 2022 14:33:53 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:907:9718:0:0:0:0 with HTTP; Sun, 9 Jan 2022 14:33:52
 -0800 (PST)
In-Reply-To: <20220108140756.3985487-1-trix@redhat.com>
References: <20220108140756.3985487-1-trix@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Jan 2022 00:33:52 +0200
Message-ID: <CAHp75VfbSmgeyi=8q1_he7mpGrNxYAOewKYWD=h8BSuxz2XWOw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: cs35l41: fix double free in cs35l41_hda_probe()
To: "trix@redhat.com" <trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tanureal@opensource.cirrus.com" <tanureal@opensource.cirrus.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "nathan@kernel.org" <nathan@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Saturday, January 8, 2022, <trix@redhat.com> wrote:

> From: Tom Rix <trix@redhat.com>
>
> Clang static analysis reports this problem
> cs35l41_hda.c:501:2: warning: Attempt to free released memory
>         kfree(acpi_hw_cfg);
>         ^~~~~~~~~~~~~~~~~~
>
> This second free happens in the function's error handler which
> is normally ok but acpi_hw_cfg is freed in the non error case
> when it is still possible to have an error.
>
> Consolidate the frees.
>
> Fixes: 7b2f3eb492da ("ALSA: hda: cs35l41: Add support for CS35L41 in HDA
> systems")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  sound/pci/hda/cs35l41_hda.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> index aa5bb6977792c..265ace98965f5 100644
> --- a/sound/pci/hda/cs35l41_hda.c
> +++ b/sound/pci/hda/cs35l41_hda.c
> @@ -476,7 +476,6 @@ int cs35l41_hda_probe(struct device *dev, const char
> *device_name, int id, int i
>         ret = cs35l41_hda_apply_properties(cs35l41, acpi_hw_cfg);
>         if (ret)
>                 goto err;
> -       kfree(acpi_hw_cfg);
>
>         if (cs35l41->reg_seq->probe) {
>                 ret = regmap_register_patch(cs35l41->regmap,
> cs35l41->reg_seq->probe,
> @@ -495,13 +494,14 @@ int cs35l41_hda_probe(struct device *dev, const char
> *device_name, int id, int i
>
>         dev_info(cs35l41->dev, "Cirrus Logic CS35L41 (%x), Revision:
> %02X\n", regid, reg_revid);
>
> -       return 0;
> -
>  err:
>         kfree(acpi_hw_cfg);
> -       if (!cs35l41->vspk_always_on)
> -               gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
> -       gpiod_put(cs35l41->reset_gpio);
> +
> +       if (unlikely(ret)) {


This is double weird. First of all, wtf unlikely is here? Second, I
commented on the patch that does something with this driver and pointed out
to the return 0 in some cases. This one seems a band aid.


> +               if (!cs35l41->vspk_always_on)
> +                       gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
> +               gpiod_put(cs35l41->reset_gpio);
> +       }
>
>         return ret;
>  }
> --
> 2.26.3
>
>

-- 
With Best Regards,
Andy Shevchenko
