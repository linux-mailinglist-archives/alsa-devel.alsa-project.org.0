Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D71BA4560B9
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:40:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7995218B5;
	Thu, 18 Nov 2021 17:39:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7995218B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253617;
	bh=H7zphfLIx/KIgfDYl4IOIHLAMRHep0aAJWdFC+/UaNA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ldDv9OXaQ/Wckzm9Jf3Ygm32nT2q/5Ozn2rSx7vt5vQSoa1IPzA9poh3bFzNT9HT9
	 VpHJFFWN154BriJb1MehxMX1G0Y/+jiQkZDetloJ5kQKwQXzn+/36vwWdD5HpqG7j7
	 kZAojZkLUlaiER+qklv3nxcgrDBX7rlKPC/Gb4Pc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80505F8055C;
	Thu, 18 Nov 2021 17:33:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A30D1F8027D; Tue, 16 Nov 2021 03:34:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C7F2F80163
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 03:34:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C7F2F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Rv9D8UmX"
Received: by mail-qt1-x833.google.com with SMTP id t11so17603176qtw.3
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 18:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H7zphfLIx/KIgfDYl4IOIHLAMRHep0aAJWdFC+/UaNA=;
 b=Rv9D8UmXSnZm8Bh1GoID8bVVWxDSBCNC4THC6v2fMK/Xjd292jrTfr7HPA60SNEtwN
 ZgsT0rxJwlV6MOX9Mg6pvUENSnqSy2PQ2g8jSGe+VqlgUmaWXSUfhPUZeSN4Fjajej12
 5XGHxJR8dHzi+y/D5OyS1PY3DAsZpFVkKp3/v6f/uQCqYI1Qr3yD9AkpuaeXc9VqfW+V
 M1x6wN6oOWmV11GcQr/YkSBk23I2+wU1hI/jCjuvcU38zE/cs/R7fEQsdfdOc5KnoW9r
 Rm7LflRIaRzZ6opJytsFOdWfMdhhaI2YGLSFevIBziJS5jOjAAh8T2jiE5v+PuwtXZTT
 AZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7zphfLIx/KIgfDYl4IOIHLAMRHep0aAJWdFC+/UaNA=;
 b=ZoOJFraz4/0Y4RtFK0KzxIOOOFEZHa4nS17QgIrv6c6Sl89E7mGf/RdGPCryOpFfMo
 SEfPUR9WYmuKpp5U995qLlgTOtIvY5SuAt8Hh+5QNIlOB6zKP97PN8RzBZ7HxJYswSb4
 RwLHntFu9ILo7Ch31p9myn7ohV6ulwqnNPyAIROMeqZn/VLbEhP7NlKK9mV7b5W/nxbf
 2vcGY06RezU0Vrdo2h22fFKbsFGFmTOZki8y7fwwdRWCPxWTQMcX0ATr+iM/jzzQ4CqB
 hZbmdzf6Ojs7oIg+6IKzY2lZMmN/V/s8akywy/NwR05ogTFsZ367RS+sSYe0VuLv2crB
 GS6Q==
X-Gm-Message-State: AOAM530m1B0sSozTecRPtXOQ6fSbS0wlHjWhxo9ECFFesiJcOst4eX0n
 fPDmXu7IpY0F287jmtz2lBT4CF8ccdqMV9XikrI=
X-Google-Smtp-Source: ABdhPJxy3/yvIoE1Sby1RB+LrFWAG186ca20J3KfKBtNLU6iYwGxwglI0cKh7RVW16SHtAlV0ZDpZK2743We/bDxwtI=
X-Received: by 2002:ac8:5991:: with SMTP id e17mr3975451qte.344.1637030043682; 
 Mon, 15 Nov 2021 18:34:03 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-7-arnd@kernel.org>
In-Reply-To: <20211115085403.360194-7-arnd@kernel.org>
From: Baolin Wang <baolin.wang7@gmail.com>
Date: Tue, 16 Nov 2021 10:34:39 +0800
Message-ID: <CADBw62oYab_d+uS_8kfC9JqhUxVhK79G4wbWyZy7+RL6P9tVvA@mail.gmail.com>
Subject: Re: [PATCH 06/11] dmaengine: sprd: stop referencing config->slave_id
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 18 Nov 2021 17:33:03 +0100
Cc: alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-staging@lists.linux.dev, Michal Simek <michal.simek@xilinx.com>,
 Jon Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Laxman Dewangan <ldewangan@nvidia.com>, dmaengine@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org
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

On Mon, Nov 15, 2021 at 4:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> It appears that the code that reads the slave_id from the channel config
> was copied incorrectly from other drivers. Nothing ever sets this field
> on platforms that use this driver, so remove the reference.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks. LGTM.
Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>

--
Baolin Wang
