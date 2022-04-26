Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA450F916
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 11:49:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52C0B1899;
	Tue, 26 Apr 2022 11:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52C0B1899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650966549;
	bh=HwzlP9ctz6jV/a43vkpO9tU6Cv2CGeyHofD6Jo+WtjA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q97vTrxpWLjvX4Y2OR/iEV546bvI4s+Um2CJQZo/czpnx4hLAN+FAAfiwmrFjG/wM
	 0CLFfUvwyUMmRgV+zZFrG78JlFdnKGRIcFAHOCYLtdTUS/mXe1IwjzAGGc6aS7Heo1
	 aGuADb5RDj4ZyRLZASwrBADtBB6oIgUmO8jWYLtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C300FF80171;
	Tue, 26 Apr 2022 11:48:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C46DDF80152; Tue, 26 Apr 2022 11:48:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mxout01.lancloud.ru (mxout01.lancloud.ru [45.84.86.81])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB25BF800AE
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 11:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB25BF800AE
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 5627820AF4DD
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2 2/3] ASoC: sh: rz-ssi: Propagate error codes returned
 from platform_get_irq_byname()
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 <alsa-devel@alsa-project.org>
References: <20220426074922.13319-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220426074922.13319-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <5bb82736-50bc-eafd-7d68-df1ed966d572@omp.ru>
Date: Tue, 26 Apr 2022 12:47:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220426074922.13319-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Pavel Machek <pavel@denx.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
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

Hello!

On 4/26/22 10:49 AM, Lad Prabhakar wrote:

> Propagate error codes returned from platform_get_irq_byname() instead of
> returning -ENODEV. platform_get_irq_byname() may return -EPROBE_DEFER, to
> handle such cases propagate the error codes.
> 
> While at it drop the dev_err_probe() messages as platform_get_irq_byname()
> already does this for us in case of error.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> * No change
> ---
>  sound/soc/sh/rz-ssi.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
> index cec458b8c507..d9a684e71ec3 100644
> --- a/sound/soc/sh/rz-ssi.c
> +++ b/sound/soc/sh/rz-ssi.c
> @@ -977,8 +977,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
>  	/* Error Interrupt */
>  	ssi->irq_int = platform_get_irq_byname(pdev, "int_req");
>  	if (ssi->irq_int < 0)
> -		return dev_err_probe(&pdev->dev, -ENODEV,
> -				     "Unable to get SSI int_req IRQ\n");
> +		return ssi->irq_int;

   Why not:

		return dev_err_probe(&pdev->dev, ssi->irq_int,
				     "Unable to get SSI int_req IRQ\n");

[...]
> @@ -990,8 +989,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
>  		/* Tx and Rx interrupts (pio only) */
>  		ssi->irq_tx = platform_get_irq_byname(pdev, "dma_tx");
>  		if (ssi->irq_tx < 0)
> -			return dev_err_probe(&pdev->dev, -ENODEV,
> -					     "Unable to get SSI dma_tx IRQ\n");
> +			return ssi->irq_tx;

   Same here...

>  
>  		ret = devm_request_irq(&pdev->dev, ssi->irq_tx,
>  				       &rz_ssi_interrupt, 0,
> @@ -1002,8 +1000,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
>  
>  		ssi->irq_rx = platform_get_irq_byname(pdev, "dma_rx");
>  		if (ssi->irq_rx < 0)
> -			return dev_err_probe(&pdev->dev, -ENODEV,
> -					     "Unable to get SSI dma_rx IRQ\n");
> +			return ssi->irq_rx;

   And here...

[...]

MBR, Sergey
