Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ABE36A5C8
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Apr 2021 10:39:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2905F1699;
	Sun, 25 Apr 2021 10:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2905F1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619339986;
	bh=pvcm7fm+vWxzlp9e8I3ls+dUy7RWxEz3vtAk8tDOGP4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rjyG9PEXNjG5lc7LbAoHG4yVODdcDShUqouJwp8GouwISsPcO+9dliY30a7Y/vnO5
	 52KTO2cTPdN++UMYbryxDyi/MhY2bzcr7TfZSJUgRKKtJ7rMLEQYug2fIX0B/lPpXb
	 8lPPb5A9reJhWQamgSSBg06dsBdP5TWRWvl4i4QY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89CE9F80086;
	Sun, 25 Apr 2021 10:38:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE7B5F801EC; Sun, 25 Apr 2021 10:38:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C174F800E3
 for <alsa-devel@alsa-project.org>; Sun, 25 Apr 2021 10:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C174F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DXhgLEsi"
Received: by mail-pl1-x630.google.com with SMTP id u7so25533774plr.6
 for <alsa-devel@alsa-project.org>; Sun, 25 Apr 2021 01:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3W3NlpZ/7gGHJzSngRPZUKdly0z6CYcYYet1o/3cStA=;
 b=DXhgLEsi/UC0GR5eFowFBe6fqTQ08/CSV6CJndatd25PlCEktjX6zCvjc3ZChBLqXb
 fSYFeoB1EtLxUcP7zuBG6mt6+6dv+g9Dwt2WD/DdcWVMFbz++XjMeHA9MO2A0mor7pem
 uNRuFOmpx5UJ6r1mtRpyCmsPaPwgQUSsrw4azukPCNco++CoqM9+kgWXJ92EzFgRAF97
 6Q6OQgpNecQl25PNJd6A3M0OcP+el5d/oCjkpuZ8nzcVPJF0P+lI3KjaWuLvrtoi4Hzb
 7T02TQpjumvtN7bJCUMGMxdFPncIWy32CBPuYhIzuo/4DhgV5scbUJljgZDMqXkI9duF
 4o+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3W3NlpZ/7gGHJzSngRPZUKdly0z6CYcYYet1o/3cStA=;
 b=iNOYfGu2ObA46hEqPewXb+voGkINiCX2g8En3BclwIejF8KhvuqdlFT7Ws+rM9BU8j
 bsvFtirkZb8UtOyuYcXADWxZ8oEJidcrYrbcgxdimLzDmWpeG9JYvwR8Xb5+/vIXkrae
 yFYmnlk2HmdkHdgbW5z5QSHp8AEbdoGl/IJswp4nLwvZ58GGxbkTDuVXQBO8Bn12zXnh
 9iuuK1ad1jn7Z2sJAIXhF3CL7wdWgZsp5zi92ZJzlLJ3MVmgkKFmapyisM8BwIIj+Hgm
 rKsnT2fCsNdpj3mRptRtASop2XThudGPbz+spAxCtWOqTpQGV2vKAWNbAgY8Q+PgfFNQ
 e0nw==
X-Gm-Message-State: AOAM533ZCrHvJDDRG/P7YmmO60p32VIn97//b5k+lzf4V9A2X6r089Uv
 3COSvB6YuiEruQbZvf9vybYoAw==
X-Google-Smtp-Source: ABdhPJw2m1tS8wv7y7a1jo2Ew6sVzyL43/PoChNVNkvcYnSnbekk+H2+GIggB/9rbKvDSb23HTPzHw==
X-Received: by 2002:a17:902:9347:b029:e8:c21c:f951 with SMTP id
 g7-20020a1709029347b02900e8c21cf951mr12640722plp.14.1619339884119; 
 Sun, 25 Apr 2021 01:38:04 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id fw24sm8820653pjb.21.2021.04.25.01.37.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 25 Apr 2021 01:38:03 -0700 (PDT)
Date: Sun, 25 Apr 2021 16:37:55 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] firmware: replace HOTPLUG with UEVENT in FW_ACTION defines
Message-ID: <20210425083754.GF15093@dragon>
References: <20210425020024.28057-1-shawn.guo@linaro.org>
 <YIUI3TZf/sZ6Sd3K@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIUI3TZf/sZ6Sd3K@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-scsi@vger.kernel.org, James Smart <james.smart@broadcom.com>,
 linux-serial@vger.kernel.org, linux-media@vger.kernel.org,
 Ohad Ben-Cohen <ohad@wizery.com>, Dick Kennedy <dick.kennedy@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kalle Valo <kvalo@codeaurora.org>, Timur Tabi <timur@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-wireless@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Stuart Hayes <stuart.w.hayes@gmail.com>, dmaengine@vger.kernel.org
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

On Sun, Apr 25, 2021 at 08:14:53AM +0200, Greg Kroah-Hartman wrote:
> On Sun, Apr 25, 2021 at 10:00:24AM +0800, Shawn Guo wrote:
> > With commit 312c004d36ce ("[PATCH] driver core: replace "hotplug" by
> > "uevent"") already in the tree over a decade, update the name of
> > FW_ACTION defines to follow semantics, and reflect what the defines are
> > really meant for, i.e. whether or not generate user space event.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  drivers/dma/imx-sdma.c                      |  2 +-
> >  drivers/media/platform/exynos4-is/fimc-is.c |  2 +-
> >  drivers/mfd/iqs62x.c                        |  2 +-
> >  drivers/misc/lattice-ecp3-config.c          |  2 +-
> >  drivers/net/wireless/ti/wlcore/main.c       |  2 +-
> >  drivers/platform/x86/dell/dell_rbu.c        |  2 +-
> >  drivers/remoteproc/remoteproc_core.c        |  2 +-
> >  drivers/scsi/lpfc/lpfc_init.c               |  2 +-
> >  drivers/tty/serial/ucc_uart.c               |  2 +-
> >  include/linux/firmware.h                    |  4 ++--
> >  lib/test_firmware.c                         | 10 +++++-----
> >  sound/soc/codecs/wm8958-dsp2.c              |  6 +++---
> >  12 files changed, 19 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> > index d5590c08db51..e2b559945c11 100644
> > --- a/drivers/dma/imx-sdma.c
> > +++ b/drivers/dma/imx-sdma.c
> > @@ -1829,7 +1829,7 @@ static int sdma_get_firmware(struct sdma_engine *sdma,
> >  	int ret;
> >  
> >  	ret = request_firmware_nowait(THIS_MODULE,
> > -			FW_ACTION_HOTPLUG, fw_name, sdma->dev,
> > +			FW_ACTION_UEVENT, fw_name, sdma->dev,
> 
> Naming is hard :)
> 
> I can take this after -rc1, but really, is it needed?
> 
> What problem does this renaming solve?

To me, it's a leftover from commit 312c004d36ce that made the rename at
driver core.  With this patch, the define will be more matching its user
request_firmware_nowait(..., bool uevent, ...).

> Who is the current name
> confusing?

I'm one at least :)

Shawn
