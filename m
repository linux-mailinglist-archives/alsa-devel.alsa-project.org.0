Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 402F810B64A
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 20:01:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F9CE16EA;
	Wed, 27 Nov 2019 20:00:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F9CE16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574881286;
	bh=D571o1h5aFnmSsQ2b3ePPnmWoPk56x4PjVAKGoNMtuo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o0S5hM8PwnhRxs4G5kdnQokhCQRxODzng2xyy+bSJM0fv7U9QubE3c1OgBtMGrYI6
	 qcX1ItPRpMMixNj3qghyYYrBM8dmKjSEEwIr8VNrNCI/N+6uo7rNevb8LtDBCh8qHK
	 DGkmFZ5sPT4ybeCb1t98rS3+Vy7BTUaV6Tut2wnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32DAEF8016F;
	Wed, 27 Nov 2019 19:59:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26788F8014D; Wed, 27 Nov 2019 19:59:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50E4CF800E9
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 19:59:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50E4CF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="eHCTU1QY"
Received: by mail-qv1-xf41.google.com with SMTP id cg2so9340847qvb.10
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 10:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=geVGu8MBW5PeHjvdy4rCo2MPVBJQGl//bajAqe2ly1A=;
 b=eHCTU1QYxVuGhChIncMyHJ9Pm+6/dZy6dgMluWm3zrkYV9jdgNv+PuDkJdqjp/SQ68
 OAUxXumGOl5myH27v6FfcWTuDGABtRiSSQMK+xtAX4a4jCFMCvADUT2oCN+GwyYYlTZV
 YwQw+7TMamciR05gVvQZS1Tq4jRYuOAcAwghj/slaAzH/qIFSG5+RwI6zyiw2aVEwPI8
 UBfV74BpdOo0iL2DNIcEMk6Metyucdu2pJfjg8BNCka4XchEnxLK4ZVVPzXe53AZXFys
 XRx3BjrqTHHfWOezDRDr3bKoncCv+SKdRT/bXor99Ezi6spieeClLT4gsoP1gmDb9XWj
 kehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=geVGu8MBW5PeHjvdy4rCo2MPVBJQGl//bajAqe2ly1A=;
 b=sG5VxQUpAL9okipsl8/Yx9NG+XdcVbzJP0sbFb3dnfUrTaMubt3/0v5fMgA0McYcbl
 1NC6hVRqzosqsWxPWSSshiisqsw0Z/g+zjtjV7zHUZNZ1RWxW/sS9xRhn6m0jNVfvyb5
 1xTESvV3FIMnuTRROTr164o8CAfvS1Y4rfTlg/V+SsZL3xQm4WhqWZnVfoxRGtXnqff9
 m+kSlwvuSXU0D4N0x2myjLuv7jQewHgHylAyMQ4Tjm4gn49DmUMccsq697/b66Cl8DOy
 MtwBtFyheMCUkyxkS59iQbleU1yRBc9C6RFyWRFP+Qdr0VInZKQsyfOO9t0Rs83gxxWd
 VDHw==
X-Gm-Message-State: APjAAAU3v2XtgNqJdQtHymAh9+2STuAzQ0oARe4+/5XRvPkjVT79SVJD
 nnWk3473QVyYN+aypeeceU4Wwd7R5g8bYffmko+tCQ==
X-Google-Smtp-Source: APXvYqwzbioROwUxTls76I+kI8XT3+8LulhD/EKcnF1Xcb3Thi0WYWiroVHFIWuQe7i3Hx6HMIOZ7Twk+gkVIhU3wA0=
X-Received: by 2002:ad4:4c4e:: with SMTP id cs14mr6646423qvb.198.1574881174864; 
 Wed, 27 Nov 2019 10:59:34 -0800 (PST)
MIME-Version: 1.0
References: <20191127082145.6100-1-yuehaibing@huawei.com>
In-Reply-To: <20191127082145.6100-1-yuehaibing@huawei.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 27 Nov 2019 10:59:24 -0800
Message-ID: <CAOReqxhf4qU7DwLN104Mq_Q2BCdmPSC9sjJv2QsGY4uPEK-u6g@mail.gmail.com>
To: YueHaibing <yuehaibing@huawei.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [PATCH -next] ASoC: rt5677: Fix build error
	without CONFIG_SPI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Nov 27, 2019 at 12:22 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> If CONFIG_SPI is n, SND_SOC_RT5677_SPI also is n, building fails:
>
> sound/soc/codecs/rt5677.o: In function `rt5677_irq':
> rt5677.c:(.text+0x2dbf): undefined reference to `rt5677_spi_hotword_detected'
> sound/soc/codecs/rt5677.o: In function `rt5677_dsp_work':
> rt5677.c:(.text+0x3709): undefined reference to `rt5677_spi_write'
>
> This adds stub helpers to fix this.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 461c623270e4 ("ASoC: rt5677: Load firmware via SPI using delayed work")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>  sound/soc/codecs/rt5677-spi.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
