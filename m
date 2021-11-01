Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 111F4441FBE
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Nov 2021 19:00:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CA9A16CF;
	Mon,  1 Nov 2021 18:59:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CA9A16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635789612;
	bh=HxfMvEV0DSsYqDq0Bh9sDTUyfBprrCjB1ZbAChGAee4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JHoZJ+jKlkaRV/LSXXfsFBAoVGLiVjRQzjqMweqwQ9052UNlL7Ulxot6P7oIN4mQH
	 EBZagkrpgMkubCCUMTSqLdokt71QmCaLaenJtQwS3pcXdMVwyCyApD67axObqU59pO
	 e+gTBvE97gD0uBadFyE934HV4omCCoJ7N6eM/vhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15F75F8026A;
	Mon,  1 Nov 2021 18:58:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFE92F8010A; Mon,  1 Nov 2021 18:58:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C18C4F800F8
 for <alsa-devel@alsa-project.org>; Mon,  1 Nov 2021 18:56:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C18C4F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JsBw+/WD"
Received: by mail-wm1-x330.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so49488wme.0
 for <alsa-devel@alsa-project.org>; Mon, 01 Nov 2021 10:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YZ2A2AWagNpv2J8C8P3tLCVgYhd2un+CUt39jsHUZpc=;
 b=JsBw+/WDf2+nx6I0RUT1eXgDPCkJk4ykkvyEZ238RYwKJ3qDaKRsJODzA9eJ1SrR6M
 KR5MYPjaYeQUnH52j2eXrj8I/uz8phJ2Z7uZ+JjusWHJFxfRDYpZ9+sZbyqLjnDzf2P7
 /Z8TjVHHXrDSqPhsxCSjk/6CL8CJsOc5ZJE78ur0eMGBNcJBrd51DCpeRCyzH7ovKCoh
 kgE2c64VAfVU0nY6ajuPze5o6VeNElMlXUmUiJ6wKhmfn6Lvdnc1qGAJouGUubToQr1R
 aIoxZ+m+5GfutNpg8WEN8FS2IfUjXSci/JYQ5IPSRX97WHpmhFJfi//GDhu6nPIvtG9j
 FK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YZ2A2AWagNpv2J8C8P3tLCVgYhd2un+CUt39jsHUZpc=;
 b=6zRzwGN36EKguNyJ9gOJU/7j7agHSvQ1Dzze5k1guMutIQARxH3boBlkVzYfKglyNi
 88LKk9ugb/abgD6CQs1L8oA9Whi5GZ45hZrJlAeMZTDPmCZuwDeMtniLmYa1Kc4e9iXs
 z6zms8Y6Lji74zuccCfg+8XTb46+TJta4zpy64f5ak+nCnnKs1KtZXGk7WC27LpvMMl5
 j9uswUy1zJWKxlaNgbHW639eDattV9FY1mKnrvbry25+HKOArP82MCkti2BzbMzzUnR6
 hCmpZg5NWZRytr5l3zMYr7HA618jfHsAolAxBA9/rkwacr4Sr+7Dle2ZZAPFE/4wT7aS
 3I8g==
X-Gm-Message-State: AOAM530quODvK6s445XSMUDG/zW5afZtv2JeyM56a32KCkMp8ZwC2jbV
 5vGAjbqwXeXncZIbflS1m1hEE6B6IWUE8OuPRvI=
X-Google-Smtp-Source: ABdhPJw8wKcfyMP3WnvzELw4fAFEeF9Qqe/NMhnO6k7F1oamAM9YgTt8bPddiGlxtH3a7+NJoBGGnIWyIHXYGeKvo1o=
X-Received: by 2002:a7b:c1d5:: with SMTP id a21mr502663wmj.14.1635789376712;
 Mon, 01 Nov 2021 10:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211028135737.8625-1-yc.hung@mediatek.com>
 <20211028135737.8625-2-yc.hung@mediatek.com>
 <YXwoB7FtRw0AzgcD@sirena.org.uk>
In-Reply-To: <YXwoB7FtRw0AzgcD@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 1 Nov 2021 19:56:04 +0200
Message-ID: <CAEnQRZCQHxctG+3L72Xx3083shytF478ONGGpZf0A-6-+nFE=w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ASoC: SOF: mediatek: Add mt8195 dsp clock support
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, allen-kh.cheng@mediatek.com,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, YC Hung <yc.hung@mediatek.com>, matthias.bgg@gmail.com,
 Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 angelogioacchino.delregno@collabora.com
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

On Fri, Oct 29, 2021 at 8:00 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Oct 28, 2021 at 09:57:36PM +0800, YC Hung wrote:
> > Add adsp clock on/off support on mt8195 platform.
> >
> > Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: YC Hung <yc.hung@mediatek.com>
> > ---
> >  sound/soc/sof/mediatek/adsp_helper.h       |   2 +-
>
> This doesn't apply against current code, there's no such file upstream.
> Please check and resend.

This patch was sent only to get an Ack-by for 2/2 from Rob Herring.
The patch will go first to SOF tree and then I will
send you a patch based on your for-next branch.

YC sorry for not being more explicit. I think the right way was to
mark this patch series as [RFC PATCH].
