Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D60E937A6AA
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 14:30:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64CE717BF;
	Tue, 11 May 2021 14:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64CE717BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620736226;
	bh=525wLy5Odn97XDza8uJhTTM3V09Tek8QjGN7Fj4w3OY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R7Cbllw06mQYyVy1aeQbMn13LAZdI82R83+lkXxZ1ezJsM6jIYjjQwsnv2B4Kpuao
	 JtYfxu5e6C59mumicm7f3LziwsD+lWKJTWSJ6webqbHHoAPW0lBd+fyfQ2kH6kW8WV
	 gXq56mTi8k6jPZuQD6OikwaJbb1ohnv/xoEZ+rPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C200AF80129;
	Tue, 11 May 2021 14:28:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4237BF80163; Tue, 11 May 2021 14:28:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8727FF800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 14:28:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8727FF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="no6PvmCZ"
Received: by mail-pj1-x1031.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so1255030pjb.4
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 05:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uKD/eHrXVQc862e3xW+RKYQk7t6rr2oE2k183wwBGWE=;
 b=no6PvmCZNOHK7T8MzNOftaTg3KRqY9xkrlt3cT1/tzJ4GMn5/UPlIfoIvhjAD8g1Q5
 ZCZKIXHFpfMNrWDb+6tpAg9BrxEv/sESyu/pbUKclgXqTCY4DM2y3RDBSEIzZ935oWhB
 6ASRnQAruT+Kewh8VGXjahPRGMr7L0pKwoTOd9SOSuAoOM5opREM1miUcpU9+iZANPqb
 KxMQalLnboi0MnuQLq25iPdd/Hspi4E+uIeYOfAir+33rIFhl4xB6uSXsfztAP6NZukT
 3P5sRZUiyUJajqKA4zY9tLsgEQejuDV4O9OaNUOHgYhdECQEkij92VRK17ibR+GuIACe
 UVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uKD/eHrXVQc862e3xW+RKYQk7t6rr2oE2k183wwBGWE=;
 b=qTJmBkuRWzKGJmXUC7NdGWxVEGxwbSaFQYG5m4Shga9+qzF4Rs4GQyHv5AO8eURYDQ
 HU2nmFetFkjDrYdJWs6ow0FJdX0Hu75F1Vr6pu4/NB4FycDs71/GgVPEip6zNYSmGwFy
 pue0DVECJuVix2hFc30K5aanbqa6Jj8N7pajcPtTMSSoLZsI4V/t7CMASRM1UvQC8ieT
 hM0HTjQrM5rxRCi/nWIURPvWnQ0piY23o8IiQvECevRZXFUTBqJgw2evKXcBFh2QAXJk
 uHnKfid6b6uwUIrq3HQngTYe4Mjku5TvVCnR85dEaIOlqmPc5/WSvFEWnCVkH6PltkGL
 2L3w==
X-Gm-Message-State: AOAM533cLya9MvWa7kNCDs7b4J3T2lcHa7t02x0XrquUb4XPDIXdAG1Y
 mwMcazNosLwBaQDG856y4BpdWtn4tNGuBQtxo+E=
X-Google-Smtp-Source: ABdhPJzGDCPmEuN7Q7ctqKms6Zsa/sPn/lHUOehvHz/mqJ5cO2zN4n12zeOaR0SXr/9znZeBDLDx65xxnk/wTnprqkM=
X-Received: by 2002:a17:902:264:b029:eb:3d3a:a09c with SMTP id
 91-20020a1709020264b02900eb3d3aa09cmr29235247plc.0.1620736114987; Tue, 11 May
 2021 05:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
 <162072071980.33404.13031284441613044277.b4-ty@kernel.org>
In-Reply-To: <162072071980.33404.13031284441613044277.b4-ty@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 May 2021 15:28:18 +0300
Message-ID: <CAHp75Vck5izDB4mTRV5hTaknpx5Bm+OA4rNLVznQxVaEwigBZg@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] spi: pxa2xx: Set of cleanups
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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

On Tue, May 11, 2021 at 11:27 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, 23 Apr 2021 21:24:27 +0300, Andy Shevchenko wrote:
> > Set of cleanups here and there related to the SPI PXA2xx driver.
> > On top of them, adding the special type for Intel Merrifield.


> [07/14] spi: pxa2xx: Introduce int_stop_and_reset() helper
>         (no commit info)
> [08/14] spi: pxa2xx: Reuse int_error_stop() in pxa2xx_spi_slave_abort()
>         (no commit info)
> [09/14] spi: pxa2xx: Use pxa_ssp_enable()/pxa_ssp_disable() in the driver
>         (no commit info)
> [10/14] spi: pxa2xx: Extract pxa2xx_spi_update() helper
>         (no commit info)
> [11/14] spi: pxa2xx: Extract clear_SSCR1_bits() helper
>         (no commit info)
> [12/14] spi: pxa2xx: Extract read_SSSR_bits() helper
>         (no commit info)
> [13/14] spi: pxa2xx: Constify struct driver_data parameter
>         (no commit info)
> [14/14] spi: pxa2xx: Introduce special type for Merrifield SPIs
>         (no commit info)

The above patches are effectively missed.
Anything to fix in your scripts / my patches?

The below does not shed a light.

> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.

-- 
With Best Regards,
Andy Shevchenko
