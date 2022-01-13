Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D4D48DD88
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 19:16:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9355C1FE3;
	Thu, 13 Jan 2022 19:15:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9355C1FE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642097801;
	bh=Yqu6UzyeTstg28QCTQ/jjHcLqL4cuaujqc/+X87uK2o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XH/3wTgW5QFsTEAKYZUc8myneZCkA5f6lKZPLT0FbxsgyR998qK15bVBCijpMjxCE
	 ahsm8tSOqnd1DZpaOyzx94Q7ayK3+UE+YvYnGuUVMKOjQG5+mQquk3OOf6A+RnQZEn
	 7UsrDo1OIAqdtiVTi0a47MoNlwLA6+m3nfaCgLrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3B61F80141;
	Thu, 13 Jan 2022 19:15:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6140F8013F; Thu, 13 Jan 2022 19:15:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DC03F80088
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 19:15:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DC03F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SHLc8jIQ"
Received: by mail-ed1-x529.google.com with SMTP id k15so26098996edk.13
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 10:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ixB+cDjTF6trUNfivYB0goIOsvM4IpCVj51WXKq++M8=;
 b=SHLc8jIQswuWmXLusJb2kfh8Z5x+jw74Lzo+jB+jpblTWTPPlyLymOACZ+yy0Nvl9a
 fdniOuf14v3C+tFX4dO/HI/6AeVxvkwBVAvy4r/0uKuFclcY48c/R5WAjtV/7CdF8q5a
 vZXqWL9lE0EoQLN9Ett4wbk5/toJVXSqoL5eRCY4VfxlBFo0mOMLFj+ChZ5mdZ8bsasY
 zzxfKtAEhGhukpKPorF2tu/euDpVxjqiEaUWT9nWcsSAV6QiDL+MxGL9fxTia/eugLyu
 /swzYoBiAFjf/IuCS7R+mDTBfFeKObP7sHHckfELZ+KEQ2aozQUuBqN7fCMYZdLSLeJ8
 Ic5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ixB+cDjTF6trUNfivYB0goIOsvM4IpCVj51WXKq++M8=;
 b=8K6GgNvC5gEBD5mHPlGJi8tAd/panmoTY3g/ZB1L0gP8P3nPLo9MdJIJU0uY/qJ+E5
 KrzT5saUXYRiC0svUFDoasVxFg+bs2D+GSqXo9rBIUNTmk6qUpaNTHA9G7wGdcw6yJtZ
 4WEyiGHrA3HJePeziGV+sCbKzyxz3oegBkACOdRNNKau6tD99qYI98iVbzsprOw1JHhP
 EPKkOilS23UV7gqx/mw25gTjjnAnycF54umxa56EQt16xP7zaWVSdnSJpSn7Ort2INpy
 8SsK91AA3CTPzOuD5tSkSgT37x+EJ+pHsIf8UIwkmsN5JfzoAo+fjIrJC21c+gF4CsT8
 BCyQ==
X-Gm-Message-State: AOAM530GBWF2z9BcdSrmTinvvqv3rSPtkFX1k6I+rHsxaDqR8q6wRsMK
 1d/TVjWM849mfQXbW7pLS7RMTtTriiRHg6Bqfwo=
X-Google-Smtp-Source: ABdhPJxQ4nL/MJTrU4OfOQDsgdo+2sx7cJBfjPvPJA4jPnCfZZ15HjugqoqDz7oSPjIa76mbSOAowC5rX5KcCjWcB9A=
X-Received: by 2002:a17:907:6e0b:: with SMTP id
 sd11mr4556641ejc.132.1642097721964; 
 Thu, 13 Jan 2022 10:15:21 -0800 (PST)
MIME-Version: 1.0
References: <20211217115708.882525-1-tanureal@opensource.cirrus.com>
 <20211217115708.882525-8-tanureal@opensource.cirrus.com>
 <CAHp75VdQGBixkUStPiq3VuoL+9TJo946ObfRA-L-D72DaFHnrw@mail.gmail.com>
 <66351fd6-f434-775f-d8d5-2a6baf098269@opensource.cirrus.com>
In-Reply-To: <66351fd6-f434-775f-d8d5-2a6baf098269@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 13 Jan 2022 20:13:36 +0200
Message-ID: <CAHp75Vc=x0AanRhkGHvbgs0M9VLdZfEFKJUxRTEMFvT5YwDtzA@mail.gmail.com>
Subject: Re: [PATCH v6 07/10] hda: cs35l41: Add support for CS35L41 in HDA
 systems
To: Lucas tanure <tanureal@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Len Brown <lenb@kernel.org>
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

On Thu, Jan 13, 2022 at 6:53 PM Lucas tanure
<tanureal@opensource.cirrus.com> wrote:
> On 1/6/22 12:29, Andy Shevchenko wrote:
> > On Fri, Dec 17, 2021 at 5:45 PM Lucas Tanure
> > <tanureal@opensource.cirrus.com> wrote:


...

> >> +        * Device CLSA0100 doesn't have _DSD so a gpiod_get by the label reset won't work.
> >
> > So, you need to add mapping tables and switch to regular APIs, tell
> > me, why it won't work.
> I will submit a patch series to fix most of the issues you pointed out.

Thanks!

> The part about how the driver access the ACPI table is going to be
> improved later if possible.
> The laptop has already shipped and doesn't have a _DSD node, so the
> driver needs to read the reset GPIO from a hard coded index inside a
> node that contains more than one cs35l41.

We have a lot of cases like this, hint: `git grep -n -w
devm_acpi_dev_add_driver_gpios`.

...

> >> +int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int irq,
> >> +                     struct regmap *regmap)
> >
> >> +       if (IS_ERR(regmap))
> >> +               return PTR_ERR(regmap);
> >
> > Why?
> It is up to the I2C/SPI module to create the regmap and provide to the
> main module. If that fails the main module can't continue.

So, this is band-aiding the issue, which is in the caller. Caller
shouldn't call this function without the regmap being ready-to-use.

...

> >> +       {"CLSA0100", 0 },
> >> +       {"CSC3551", 0 },
> >
> > I believe these IDs are officially allocated by the Cirrus Logic, right?
> CLSA010* is not a valid id for Cirrus Logic, but the Bios is already in
> production, so we must support it.
> CSC3551 is a valid id for Cirrus Logic.

Thank you for elaborating. Can we be sure that there won't be any
abuse of ACPI specification in the future (meaning all IDs will follow
the ACPI/PNP registries and be allocated by certain vendor)?

-- 
With Best Regards,
Andy Shevchenko
