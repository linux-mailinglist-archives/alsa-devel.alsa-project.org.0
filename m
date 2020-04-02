Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A3D19C0A3
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 14:00:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2BED1674;
	Thu,  2 Apr 2020 13:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2BED1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585828841;
	bh=2UP7n2mD95XrWlIJhQaSK9X/Izc0emgUzPHy+6sen2c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HOAJinxWrnvVO5dgyFV5h1Xagju/kC951YFspf9kfJsUjAtoFoFP5sLqoPVkewLjw
	 4xsucIZOK/x4zaZdDrzIJzDZpPmTyWUHZY8+5BxoUggclkbOLaXR39ivMIuvmIdBeE
	 MTujaais438CK8yEdY7pPbxgIRFXOqrJzgMtidZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9E62F80157;
	Thu,  2 Apr 2020 13:59:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59235F80148; Thu,  2 Apr 2020 13:58:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17C1AF80141
 for <alsa-devel@alsa-project.org>; Thu,  2 Apr 2020 13:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17C1AF80141
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr
 [86.202.105.35])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AE629C0007;
 Thu,  2 Apr 2020 11:58:51 +0000 (UTC)
Date: Thu, 2 Apr 2020 13:58:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ALSA:atmel:Use platform_get_irq_optional()
Message-ID: <20200402115851.GG3683@piout.net>
References: <20200402112135.18604-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402112135.18604-1-tangbin@cmss.chinamobile.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 nicolas.ferre@microchip.com, tiwai@suse.com, ludovic.desroches@microchip.com,
 linux-arm-kernel@lists.infradead.org
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

On 02/04/2020 19:21:35+0800, Tang Bin wrote:
> In order to simply code,because platform_get_irq() already has
> dev_err() message.
> 

But what I see is a dev_dbg message so your patch actually changes the
behaviour when debugging is not enabled.

> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  sound/atmel/ac97c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
> index a1dce9725..25cfd5710 100644
> --- a/sound/atmel/ac97c.c
> +++ b/sound/atmel/ac97c.c
> @@ -715,7 +715,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
>  		return -ENXIO;
>  	}
>  
> -	irq = platform_get_irq(pdev, 0);
> +	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq < 0) {
>  		dev_dbg(&pdev->dev, "could not get irq: %d\n", irq);
>  		return irq;
> -- 
> 2.20.1.windows.1
> 
> 
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
