Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FAC36A50A
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Apr 2021 08:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9373D1760;
	Sun, 25 Apr 2021 08:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9373D1760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619331406;
	bh=auP6JRuummQkkVZR1IcxBPxBUP5jCkGA0V99FK4ibXQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LihPmtshs5A767AT9nOYnftNv3P9mrQJp3PMHd4fiReDZ/iVIBccN6/3Hte1JrM+N
	 tk6TDkY/YfoBtZZJz248bcgP8S6U7osMFYuMprl2HLF+1h9+F4T66SvTVG4nAgpR/0
	 2nZJOheULjQTr04UEJ9hz3CD51UJP5BLV0ICTWpo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28CFBF800E3;
	Sun, 25 Apr 2021 08:15:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA1E9F801EC; Sun, 25 Apr 2021 08:15:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2F35F800E3
 for <alsa-devel@alsa-project.org>; Sun, 25 Apr 2021 08:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2F35F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="BSZo7B0z"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 742AD6124B;
 Sun, 25 Apr 2021 06:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1619331300;
 bh=auP6JRuummQkkVZR1IcxBPxBUP5jCkGA0V99FK4ibXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BSZo7B0ztK/ZJ6b9ewVhX1tiYoKt2aVWLM9tzkidgo8bd4NahwbZgSelW2qjvkeVA
 4Cuf22JgyanY8g/eHylN+oOyZzH/JbOFwp+a8b6jGIdQW2D6lhpPLcxUewADOVt59p
 BfKGkxp270f1RqpnNZxbM7mATC8gj00Vgsj6eMUA=
Date: Sun, 25 Apr 2021 08:14:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] firmware: replace HOTPLUG with UEVENT in FW_ACTION defines
Message-ID: <YIUI3TZf/sZ6Sd3K@kroah.com>
References: <20210425020024.28057-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210425020024.28057-1-shawn.guo@linaro.org>
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

On Sun, Apr 25, 2021 at 10:00:24AM +0800, Shawn Guo wrote:
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
> 
> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index d5590c08db51..e2b559945c11 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -1829,7 +1829,7 @@ static int sdma_get_firmware(struct sdma_engine *sdma,
>  	int ret;
>  
>  	ret = request_firmware_nowait(THIS_MODULE,
> -			FW_ACTION_HOTPLUG, fw_name, sdma->dev,
> +			FW_ACTION_UEVENT, fw_name, sdma->dev,

Naming is hard :)

I can take this after -rc1, but really, is it needed?

What problem does this renaming solve?  Who is the current name
confusing?

thanks,

greg k-h
