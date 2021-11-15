Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D5445609A
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:35:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B832917F6;
	Thu, 18 Nov 2021 17:34:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B832917F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253346;
	bh=Tt/V8+BsQdP/PwlVQ+qF4Q2qLVnIF/cqFh8qa2ec1iY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mpa3jz26O920ad/ZFkUiXw6H80d11U095VbiefBOfrk2P/eeXGFreQG6HZ4GpvF9Z
	 jrwl0E/IQraeHpFRlYO17bqq1KzdertnMYF30tgZIP1Dvewvb6qESx9yFP9yruHQWp
	 5gt0/C83Ao4Sy7gEJq/qKW14Nc72UHrI3+Lf+a/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D35CF804FC;
	Thu, 18 Nov 2021 17:33:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E81E6F801D5; Mon, 15 Nov 2021 10:56:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77060F801D5
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 10:56:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77060F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ehc21nRz"
Received: by mail-ua1-x935.google.com with SMTP id t13so33562487uad.9
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 01:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gsBk71NedBBsVpsWIk4ACHvjoj+bC3+VIVEUbcpO8IA=;
 b=ehc21nRzLc8i1U+EqW4HnjY+RWjGWh14ZBLj7yNPUxl816A1Dbell6St7S/yW4X/vv
 tt7qOOmMMY85WSc7GghoYpJGJ9xgEBBUokeqlapvAJX5EFUnaN1rvUlEUeE8epbheu5B
 bWVKVRopMxxBfMWO9giRCidfYfZ56vuyGO7o4CSsyVdRcdOlFmosB/G0CBJUF76Dwi9T
 Bi5dKD3S2Ixk/FkU0QqBfwiiGLH1DDHTmYGg0Ci2mql4cvEo0wmrzkz2B7tgBgY5liPS
 E361qlo75lRj9Ddb/VA9aIMjLtX6LX3ck8/h22UNs9feaHP2NMM+vvRDoJtlPCwrDlmi
 9GJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gsBk71NedBBsVpsWIk4ACHvjoj+bC3+VIVEUbcpO8IA=;
 b=j8fEYVrnjCrZviZtLHQ+562eTp0NTo/DyAnouZOgLS2w9qAa6pLQtBxyL2Nhw+bL6y
 qHd5KeEhb7aV8qW78IfhHhv3EBmFdwHiGQZjnaykSW2UHe0HgRtQuTXCiHtyrphgNLum
 eLPYOfT7SUIRnyhUQbt5KK1yxWRJV4ex1DHdL44QvjpJJXHfMm5fm/DCcgkBplANZJ8A
 q4TLCwgbACaARKqNG/ntsU0uoc4Emll7xerI6qNud0stD94a3KBYiaKFks4SHom0wBaU
 YdnZyUxNfBW+dzaxqW1E0vUF1olu+LI6WyoVV/EDpNh0jdVnGQWm3CYys0ToPmmidqX9
 v5MA==
X-Gm-Message-State: AOAM533zCR7Yjy3io6uch0TETetudiwMqnfOKZlZDCxsTEuhADPGGP1P
 9nUHzGwWcU4UEQNn0y6tk6iAOgXmgln4pqsg/lI=
X-Google-Smtp-Source: ABdhPJz6ESqhwfmkhVT1QvVuW/9wYB2eiEui3t3htInxrDx0SkRrPjrQEm+aetErjkG15iM6y1caYpqVdHJBHexZMiA=
X-Received: by 2002:ab0:6883:: with SMTP id t3mr56751869uar.66.1636970168537; 
 Mon, 15 Nov 2021 01:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-11-arnd@kernel.org>
In-Reply-To: <20211115085403.360194-11-arnd@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 15 Nov 2021 10:55:56 +0100
Message-ID: <CAMhs-H98kPNqH491+X0Mp81Ng++v1aQ=97XSHEhs+vx3g8W_4A@mail.gmail.com>
Subject: Re: [PATCH 10/11] staging: ralink-gdma: stop using slave_id config
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 18 Nov 2021 17:33:03 +0100
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-staging@lists.linux.dev, Michal Simek <michal.simek@xilinx.com>,
 Jon Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>
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

Hi Arnd,

On Mon, Nov 15, 2021 at 9:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Picking the connection between a DMA controller and its attached device
> is done through devicetree using the "dmas" property, which is implemented
> by the gdma driver, but it also allows overriding the "req" configuration
> with the slave_id field, as it was done in some linux-2.6 era drivers.
>
> There is no driver in the tree that sets these values, so stop
> interpreting them before anything accidentally starts relying on it.
> Rename the field in the channel from "slave_id" to "req" to better match
> the purpose and the naming in the hardware.
>
> If any driver actually starts using this DMA engine, it may be necessary
> to implement a .xlate callback that sets this field at probe time.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/staging/ralink-gdma/ralink-gdma.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

This driver has been already deleted from the staging tree. See [0].

Best regards,
    Sergio Paracuellos

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-testing&id=5bfc10690c6c590a972be014ed8595e77e1e2dea

>
> diff --git a/drivers/staging/ralink-gdma/ralink-gdma.c b/drivers/staging/ralink-gdma/ralink-gdma.c
> index b5229bc6eae5..f00240e62e1b 100644
> --- a/drivers/staging/ralink-gdma/ralink-gdma.c
> +++ b/drivers/staging/ralink-gdma/ralink-gdma.c
> @@ -106,7 +106,7 @@ struct gdma_dma_desc {
>  struct gdma_dmaengine_chan {
>         struct virt_dma_chan vchan;
>         unsigned int id;
> -       unsigned int slave_id;
> +       unsigned int req;
>
>         dma_addr_t fifo_addr;
>         enum gdma_dma_transfer_size burst_size;
> @@ -194,7 +194,6 @@ static int gdma_dma_config(struct dma_chan *c,
>                         dev_err(dma_dev->ddev.dev, "only support 4 byte buswidth\n");
>                         return -EINVAL;
>                 }
> -               chan->slave_id = config->slave_id;
>                 chan->fifo_addr = config->dst_addr;
>                 chan->burst_size = gdma_dma_maxburst(config->dst_maxburst);
>                 break;
> @@ -203,7 +202,6 @@ static int gdma_dma_config(struct dma_chan *c,
>                         dev_err(dma_dev->ddev.dev, "only support 4 byte buswidth\n");
>                         return -EINVAL;
>                 }
> -               chan->slave_id = config->slave_id;
>                 chan->fifo_addr = config->src_addr;
>                 chan->burst_size = gdma_dma_maxburst(config->src_maxburst);
>                 break;
> @@ -288,12 +286,12 @@ static int rt305x_gdma_start_transfer(struct gdma_dmaengine_chan *chan)
>                 dst_addr = chan->fifo_addr;
>                 ctrl0 = GDMA_REG_CTRL0_DST_ADDR_FIXED |
>                         (8 << GDMA_RT305X_CTRL0_SRC_REQ_SHIFT) |
> -                       (chan->slave_id << GDMA_RT305X_CTRL0_DST_REQ_SHIFT);
> +                       (chan->req << GDMA_RT305X_CTRL0_DST_REQ_SHIFT);
>         } else if (chan->desc->direction == DMA_DEV_TO_MEM) {
>                 src_addr = chan->fifo_addr;
>                 dst_addr = sg->dst_addr;
>                 ctrl0 = GDMA_REG_CTRL0_SRC_ADDR_FIXED |
> -                       (chan->slave_id << GDMA_RT305X_CTRL0_SRC_REQ_SHIFT) |
> +                       (chan->req << GDMA_RT305X_CTRL0_SRC_REQ_SHIFT) |
>                         (8 << GDMA_RT305X_CTRL0_DST_REQ_SHIFT);
>         } else if (chan->desc->direction == DMA_MEM_TO_MEM) {
>                 /*
> @@ -365,12 +363,12 @@ static int rt3883_gdma_start_transfer(struct gdma_dmaengine_chan *chan)
>                 dst_addr = chan->fifo_addr;
>                 ctrl0 = GDMA_REG_CTRL0_DST_ADDR_FIXED;
>                 ctrl1 = (32 << GDMA_REG_CTRL1_SRC_REQ_SHIFT) |
> -                       (chan->slave_id << GDMA_REG_CTRL1_DST_REQ_SHIFT);
> +                       (chan->req << GDMA_REG_CTRL1_DST_REQ_SHIFT);
>         } else if (chan->desc->direction == DMA_DEV_TO_MEM) {
>                 src_addr = chan->fifo_addr;
>                 dst_addr = sg->dst_addr;
>                 ctrl0 = GDMA_REG_CTRL0_SRC_ADDR_FIXED;
> -               ctrl1 = (chan->slave_id << GDMA_REG_CTRL1_SRC_REQ_SHIFT) |
> +               ctrl1 = (chan->req << GDMA_REG_CTRL1_SRC_REQ_SHIFT) |
>                         (32 << GDMA_REG_CTRL1_DST_REQ_SHIFT) |
>                         GDMA_REG_CTRL1_COHERENT;
>         } else if (chan->desc->direction == DMA_MEM_TO_MEM) {
> --
> 2.30.2
>
>
