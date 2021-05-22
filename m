Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 338F438D6DB
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 20:11:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E747167B;
	Sat, 22 May 2021 20:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E747167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621707109;
	bh=cusmRGFIeIToWYccwVlrbIyEf7MPI4ObHJl/jwgiJyc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lYEtUEnl0qndph8TTkw9pmfRMahXOZtYHsZWToC5TwWHo5OZ/FcJPGhxjFXRc5KiX
	 eQRTYY6VWjflvvkBNYGZaonlrVhaEA+RbZt2CVeaz12uAKRux2UXHIXL4RznoR1OYL
	 PfmB0eOgw44J88r7O2uv8oqILUlkSpn0rU2yMHDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83961F8049C;
	Sat, 22 May 2021 20:09:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6DC5F80482; Sat, 22 May 2021 20:09:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C6D6F80431
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 20:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C6D6F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QT4CiTAZ"
Received: by mail-pg1-x52f.google.com with SMTP id 27so15571935pgy.3
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 11:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qn3/PcKn8NXdi3aHEFVBAqeCO7oFTPdMzEZYpKKC4i8=;
 b=QT4CiTAZ+Y/dFzAyKLxTinNBUxlTgdTPib5bcad1V32wjKjSQNRlRSR2QVDkX/Vzyw
 3/mIV3SsvaB19zqzbBX/7tgLNLKgtNcfPiHth8X9jQt9U7MD+f3G+K2lsMNK4Kmy1PwJ
 veuhtO/WP7X5rYOnbvGVzS0MuUL4MluzKUTeImQV+vQwIkgY6gj2tk9BCk4eSJT22d1M
 wWy42xAuyIiH10kUINyIiMcfN7NdwoE0R+Vg5tP8PHHpvFLnXco1n+jKatd3uk/FBK35
 3VvcHDnoBTbfjdHdppgGzGD/LjIU/lCDnflzSrFGg1f/i0UZDpuVfwaFjl2kSZn48F7W
 UKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qn3/PcKn8NXdi3aHEFVBAqeCO7oFTPdMzEZYpKKC4i8=;
 b=WRNQzbS4AzkD/fTW6/t1WmmafbTzj7iUuQrcXTX7uyJ9kj5IVeeakWJhHHWntL4Uzr
 nYYqCfPllhE3R1at+A4zV2GqDg+VTzMR5l4tj/kXZZqXsDz17LSuv8Vu/xKtN6NbUu/2
 gQsDX+qHuNF8hgrdbI6xJ59tjhuoqTFhZqFAtXsyzmd3TdkqBGqsXtVsjqNWufgam5eS
 Zfx693+/bQpFaRFmoX+7OQ905BB6+8OA72fGiy46pH4kF22gqs5BSgrYaqjMiZsIjwt0
 Tc6DlSws/xb7Vkt/XJZj+8LevC/li4dRc4MlRHUfHS92/kiF0oylOHaGVPoA+G+wClGj
 qJzw==
X-Gm-Message-State: AOAM532r04rP/tA7+NApnylzDk22U12fDKublwG1ZssyyMrHoGj+rzlg
 9BrRniRXiv93JYGkpyXTtvPoAfzmbNWr/WqGT6k=
X-Google-Smtp-Source: ABdhPJwmQ3Nnq6VwzozIoJ3lWw1SEcVOjgOghqVqYgc1/h9Zf9GVciy0E3aRI+cSQh4nQqyKMFoUaUu1tyuE9RR1rco=
X-Received: by 2002:a05:6a00:1591:b029:2d9:369a:b846 with SMTP id
 u17-20020a056a001591b02902d9369ab846mr16410984pfk.40.1621706975983; Sat, 22
 May 2021 11:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210521171418.393871-4-hdegoede@redhat.com>
In-Reply-To: <20210521171418.393871-4-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 22 May 2021 21:09:19 +0300
Message-ID: <CAHp75VfL0U90qcG4D1eOEP0f8sOMiNsrHwXVe4YjR1ypQFBLwQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] iio: accel: bmc150: Move check for second ACPI device
 into a separate function
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-iio <linux-iio@vger.kernel.org>, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jeremy Cline <jeremy@jcline.org>,
 Mark Brown <broonie@kernel.org>, Jonathan Cameron <jic23@kernel.org>
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

On Fri, May 21, 2021 at 11:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Move the check for a second ACPI device for BOSC0200 ACPI fwnodes into
> a new bmc150_acpi_dual_accel_probe() helper function.
>
> This is a preparation patch for adding support for a new "DUAL250E" ACPI
> Hardware-ID (HID) used on some devices.

...

> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id bmc150_acpi_dual_accel_ids[] = {
> +       {"BOSC0200"},

> +       { },

I guess it is a good chance to drop a comma.

> +};

...

> +       if (!IS_ERR(second_dev))
> +               bmc150_set_second_device(client, second_dev);

I would comment on the pattern here, but I have noticed that this code
is changed in the further patches anyway.

-- 
With Best Regards,
Andy Shevchenko
