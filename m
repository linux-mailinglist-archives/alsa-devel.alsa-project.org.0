Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D0636ACAB
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 09:07:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 736131676;
	Mon, 26 Apr 2021 09:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 736131676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619420875;
	bh=d9ykR/IPeJVJ0vuYT/vnd40WbHVcaNRUVKUhpTaLruk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W9yuygcE3E/lcBZ2L0JbFKmcahxnE8+S3H95Wsvq/PQsgaTVKz5Ii1mb1IeObZ5MM
	 L6HE0mtguxEnr9o5vLUMs/lMhnbQ9XAOWopZMWYW+rmS7F23XAwELRpJlYzMCFVRe7
	 rBfGKXlPQ4chbdwGmA/XlbZPtp5Ncti7LSyCz1bM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE717F800E3;
	Mon, 26 Apr 2021 09:06:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C508F8016C; Mon, 26 Apr 2021 09:06:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB882F800F0
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 09:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB882F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rIb8+v2F"
Received: by mail-wr1-x429.google.com with SMTP id q9so405694wrs.6
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 00:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=5RuHvbrZHVloxRo7eENq0ZIryQnDTJP0ete42G83Dm0=;
 b=rIb8+v2FAdA/HfhwuFQ6R8dphR1T0XKcem+hDmiyp8QJyiWsUG/VegWao1LxxolHOc
 ctEIXLn6mFraIjAcGx8exbmzWC852dgXWwKnm3td7C06aBOHnlsNlS160CFJsN2ch7Vj
 HWWjhQbqWx0x6IG9wItFTZ7CFHUw87oc7fyqNSc+/s7ZHgo7JuV9fKzCZn674JYEsCX6
 +JY2w1OdFXrf2gQXf6S9eNPX7nVE/EMMHAlAlr+3OXLCHkZjMdIqHV0Zr7RTiOc+GI+a
 gWafVirCtDjutoLU7lw5+fWllx0HFwPneUNauWgJcEPM4s8PQEDUE5Fz8Ws+QQ5hE5Rh
 LJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5RuHvbrZHVloxRo7eENq0ZIryQnDTJP0ete42G83Dm0=;
 b=eIHc0xNXoNCZ9fj1JuwY9cbe5g18Fl8g3g+QZFaFy3rEYqINKfsaFx1Os1yG35YEP6
 3imDHjCxJBKYFASkPBmbzZK+K9Omlc5SWcHBO+8SiS5veg4OZG/o0lBb6baGByesW6v6
 D6EBbxg1FEOSkyq4MZZnjbA+4pSo0JwEVBTSQJeheojEZPn/Fb2egn8DE+//QmkcsG7R
 GKjW7tzS6/GObEIDWrnpQivIziY/gtF0TOtgrZ2dwkBRlle3i2F0bXvlkTwUSkehInQT
 RYsQmhrcU1/+QBbeL2AkMOpYd7+6/kToS9V4ZaeOuTt7JIsOOhO+/hK5nl4ZemzpmxQr
 NkUg==
X-Gm-Message-State: AOAM530TXs3EJHOsp3DRvkCr6YyT17Fkq9Hf3ZpQTgXfG9M7WoCMB4R5
 eTZGu30Zxn08Yq5T/CJ5kZ1B5Q==
X-Google-Smtp-Source: ABdhPJxQA11AMLyg/X551pHlVu8f4n+OUBOFc1FV8/qEkPz+6JKC49mgf31rgbpUC8pVKrxLOFj9Lw==
X-Received: by 2002:a5d:4402:: with SMTP id z2mr20396301wrq.179.1619420770263; 
 Mon, 26 Apr 2021 00:06:10 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id 200sm16751584wmb.1.2021.04.26.00.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 00:06:09 -0700 (PDT)
Date: Mon, 26 Apr 2021 08:06:07 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] firmware: replace HOTPLUG with UEVENT in FW_ACTION defines
Message-ID: <20210426070607.GG6446@dell>
References: <20210425020024.28057-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210425020024.28057-1-shawn.guo@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-scsi@vger.kernel.org,
 James Smart <james.smart@broadcom.com>, linux-serial@vger.kernel.org,
 linux-media@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kalle Valo <kvalo@codeaurora.org>, Timur Tabi <timur@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Stuart Hayes <stuart.w.hayes@gmail.com>,
 dmaengine@vger.kernel.org
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

On Sun, 25 Apr 2021, Shawn Guo wrote:

> With commit 312c004d36ce ("[PATCH] driver core: replace "hotplug" by
> "uevent"") already in the tree over a decade, update the name of
> FW_ACTION defines to follow semantics, and reflect what the defines are
> really meant for, i.e. whether or not generate user space event.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/dma/imx-sdma.c                      |  2 +-
>  drivers/media/platform/exynos4-is/fimc-is.c |  2 +-

>  drivers/mfd/iqs62x.c                        |  2 +-

Acked-by: Lee Jones <lee.jones@linaro.org>

>  drivers/misc/lattice-ecp3-config.c          |  2 +-
>  drivers/net/wireless/ti/wlcore/main.c       |  2 +-
>  drivers/platform/x86/dell/dell_rbu.c        |  2 +-
>  drivers/remoteproc/remoteproc_core.c        |  2 +-
>  drivers/scsi/lpfc/lpfc_init.c               |  2 +-
>  drivers/tty/serial/ucc_uart.c               |  2 +-
>  include/linux/firmware.h                    |  4 ++--
>  lib/test_firmware.c                         | 10 +++++-----
>  sound/soc/codecs/wm8958-dsp2.c              |  6 +++---
>  12 files changed, 19 insertions(+), 19 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
