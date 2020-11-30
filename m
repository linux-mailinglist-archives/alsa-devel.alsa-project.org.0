Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6A12C905A
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 22:58:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCEEF174A;
	Mon, 30 Nov 2020 22:57:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCEEF174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606773504;
	bh=s1+gRngT2Qnhudj2pwKnK2vU96kTX5EFFAzdQBKob+w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xe3uVVv8uZ666zunrEDJ9q8ZeKyoXnkxK/G1F9nztkNjkR6PZI+MchwApoH5BoHlJ
	 xpiTAmyre593MVYFQS91466/X0MRlJmHiIZ3AMOSZZkoTGpzWBrqvZ7co4whR0UrYz
	 EjJ5zbKmCfv8myohAzGEjOPS99tHWqnDsliGqZEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A504F804AB;
	Mon, 30 Nov 2020 22:57:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A28FF804AA; Mon, 30 Nov 2020 22:57:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4084CF8049C
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 22:57:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4084CF8049C
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr
 [86.194.74.19]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B5ACD40002;
 Mon, 30 Nov 2020 21:57:10 +0000 (UTC)
Date: Mon, 30 Nov 2020 22:57:10 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: adau1372: add missing dependencies
Message-ID: <20201130215710.GV1296649@piout.net>
References: <20201130215626.2400999-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130215626.2400999-1-alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
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

On 30/11/2020 22:56:26+0100, Alexandre Belloni wrote:
> SND_SOC_ADAU1372_I2C and SND_SOC_ADAU1372_SPI prpoerly select the REGMAP
> config they need but forget to depend on the underlying bus.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

I forgot:

Reported-by: kernel test robot <lkp@intel.com>

> ---
>  sound/soc/codecs/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index a457300f95da..625f762903ea 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -371,11 +371,13 @@ config SND_SOC_ADAU1372
>  
>  config SND_SOC_ADAU1372_I2C
>  	tristate "Analog Devices ADAU1372 CODEC (I2C)"
> +	depends on I2C
>  	select SND_SOC_ADAU1372
>  	select REGMAP_I2C
>  
>  config SND_SOC_ADAU1372_SPI
>  	tristate "Analog Devices ADAU1372 CODEC (SPI)"
> +	depends on SPI
>  	select SND_SOC_ADAU1372
>  	select REGMAP_SPI
>  
> -- 
> 2.28.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
