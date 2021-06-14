Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B8D3A5DAD
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 09:27:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1579E17A7;
	Mon, 14 Jun 2021 09:26:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1579E17A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623655632;
	bh=fyjCWVqqtrl65x0xSVEfBM7dYp+vdp+YgoPpB86o7k0=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E/+dQFH+1ndbSPeOkShy4RTgGqsv5tQ0hBaBqCvEfBzgnzVmeNYSkye8K2T0+V859
	 vEd/cat4pHyHhvJkE0K7h9OrSIQ2H4UORqX2FweEiQdPuy/4v5tMlITm5qpLi6ApIP
	 DW+GvJV2gxHKuWP/0dfV9tX+IL4nZTnDByroQAn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CE6AF8023C;
	Mon, 14 Jun 2021 09:25:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 681E2F80234; Mon, 14 Jun 2021 09:25:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51401F800DD
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 09:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51401F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qj5JAnB5"
Received: by mail-pf1-x42d.google.com with SMTP id k15so9886954pfp.6
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 00:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=AMykhyDqQBbaHMiywFSB9ML+JDGa+EpZX1LNPgYY4Zc=;
 b=qj5JAnB588HOc2jwLQqrovr1XGhoYQv5RFkElZzigkYtxrUduAbxlPgoi9gVfdY02A
 ZR7+R1dCkIihxS4IuKuYveYt0vvMUCpCMrjXI+DOd2ywzwnBVwqGi3IroErjZuBmAzX+
 z0uQU/IRWcoPclJ6zpOsYyfSqYpD2SrlsUOQFm/ollqrUfsFjbDKfBVy1Hmitw+ns8Q/
 K/KxjPe90heu7U1QVO95XZVKtZTfBF7eMeWPypyYaNmlgNJU9emVDy+brsT6xFEuvnjx
 3jAy60Cey85rPhkokk2qTb5MZdIZfTQKJfcSySnWo3SNL2jpKWffiQfRJ4jqDZSQCNvn
 f14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=AMykhyDqQBbaHMiywFSB9ML+JDGa+EpZX1LNPgYY4Zc=;
 b=hX061mb4ZqTe5EHKxNXBUZPlOMoBfPESW7oWfKswiZV+HvAIW6Xh2XmAsVMSl4bf3a
 /oTrczcT8Szd7ANJh6XRpr97o6kGI2h4Ws1Z90tIOZsbXgEpvVXTPYxU+XkuEeNxR/5C
 vshXqhaWmaRZPBswKggtWLS1hhuIjMy9Uf+TGMkY47eqzvEBBb/Cw4pc+nXQPbZrbYj1
 3yvzRJjt2Zv96glpUs0PrAqIg1+FO/LkfpuxGaTqz2YhD6N5HQ4aQyRwzMbqF4EiIwww
 rjlVHwh4lEqpPKV67x3pppBpPOuEoYz2CLAx5adWM5wfArYweAU53fIkXc8QOJIGPUT5
 1dcg==
X-Gm-Message-State: AOAM530vLacVtHjhA5wZlLtcxYi/Bp8ViegBlm7Umjr3NZF+z9EG4lEb
 Lpc686epsnIj/BZfUoyJB2pHG9Rktq1jbceoSr8=
X-Google-Smtp-Source: ABdhPJyp7zIxr65YJCOiZ6K/FwBFmlTWCutupU196eRa7Pb7taMb3Xn0YWA2wmKNWo+aR9YpwQk25tYu27sHw3v+2KU=
X-Received: by 2002:a63:79c3:: with SMTP id
 u186mr15720923pgc.203.1623655530978; 
 Mon, 14 Jun 2021 00:25:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:c002:0:0:0:0 with HTTP; Mon, 14 Jun 2021 00:25:30
 -0700 (PDT)
In-Reply-To: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
References: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jun 2021 10:25:30 +0300
Message-ID: <CAHp75VdMxns2GJf6WGVY=tsv=dwf_f++q2-Chw0CJLp_R8n09A@mail.gmail.com>
Subject: Re: [PATCH 0/7] Prepare EP93xx drivers for Common Clock Framework
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Nikita Shubin <nikita.shubin@maquefel.me>, Takashi Iwai <tiwai@suse.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
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

On Monday, June 14, 2021, Alexander Sverdlin <alexander.sverdlin@gmail.com>
wrote:

> Nikita posted a patch converting EP93xx to use Common Clock Framework. It
> turns out some cleanup is necessary in the EP93xx drivers to avoid
> "Enabling unprepared" clock warnings.
>
> Patches with stack traces in the commit messages are tested on EP9302.
>
> Link: https://lore.kernel.org/patchwork/patch/1435884/
>
>
For all commit messages: please, reduce the noise in them as much as
possible, i.e. leave only up to ~3-4 most significant lines out of
trackbacks.



> Alexander Sverdlin (7):
>   iio: ep93xx: Prepare clock before using it
>   spi: spi-ep93xx: Prepare clock before using it
>   Input: ep93xx_keypad: Prepare clock before using it
>   video: ep93xx: Prepare clock before using it
>   dmaengine: ep93xx: Prepare clock before using it
>   ASoC: cirrus: i2s: Prepare clock before using it
>   pwm: ep93xx: Prepare clock before using it
>
>  drivers/dma/ep93xx_dma.c               |  6 +++---
>  drivers/iio/adc/ep93xx_adc.c           |  6 +++---
>  drivers/input/keyboard/ep93xx_keypad.c |  4 ++--
>  drivers/pwm/pwm-ep93xx.c               | 12 ++++++------
>  drivers/spi/spi-ep93xx.c               |  4 ++--
>  drivers/video/fbdev/ep93xx-fb.c        |  4 ++--
>  sound/soc/cirrus/ep93xx-i2s.c          | 12 ++++++------
>  7 files changed, 24 insertions(+), 24 deletions(-)
>
> --
> 2.32.0
>
>

-- 
With Best Regards,
Andy Shevchenko
