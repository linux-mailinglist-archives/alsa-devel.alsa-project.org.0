Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBBB118C43
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:15:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E90C31714;
	Tue, 10 Dec 2019 16:14:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E90C31714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575990921;
	bh=hGkkIhokgAOrI5s5UrZSrQ7CKv7EciZwwT6A2pSxDEw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qMkLxaZ5dcCvPC52OSWpEqIRNVLDkKa+Qfnvwv4I0BqmMGuk/8/yfqNe0z76qCKJP
	 5VTHIdaLJtS9juCnhgYaNw7fU/e2DOeRo4upCOpjd+Air+hUseZiovg4TDMKX4y7JQ
	 jP0W4GGMfMxYjwa/kO9EqKnaWGgtGtOQLk8G5uN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 879ACF8020C;
	Tue, 10 Dec 2019 16:13:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CA1BF8020C; Tue, 10 Dec 2019 16:13:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A66DF800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 16:13:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A66DF800F3
X-Originating-IP: 90.182.112.136
Received: from localhost (136.112.broadband15.iol.cz [90.182.112.136])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E678840011;
 Tue, 10 Dec 2019 15:13:30 +0000 (UTC)
Date: Tue, 10 Dec 2019 16:13:27 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191210151327.GO1463890@piout.net>
References: <20191210145406.21419-1-tiwai@suse.de>
 <20191210145406.21419-3-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210145406.21419-3-tiwai@suse.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: Re: [alsa-devel] [PATCH for-5.6 02/23] ASoC: atmel: Drop
	superfluous ioctl PCM ops
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

On 10/12/2019 15:53:45+0100, Takashi Iwai wrote:
> ASoC PCM core deals the empty ioctl field now as default.
> Let's kill the redundant lines.
> 
> Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/soc/atmel/atmel-pcm-pdc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
> index 18a2fd02fffe..59c1331a6984 100644
> --- a/sound/soc/atmel/atmel-pcm-pdc.c
> +++ b/sound/soc/atmel/atmel-pcm-pdc.c
> @@ -379,7 +379,6 @@ static int atmel_pcm_close(struct snd_soc_component *component,
>  static const struct snd_soc_component_driver atmel_soc_platform = {
>  	.open		= atmel_pcm_open,
>  	.close		= atmel_pcm_close,
> -	.ioctl		= snd_soc_pcm_lib_ioctl,
>  	.hw_params	= atmel_pcm_hw_params,
>  	.hw_free	= atmel_pcm_hw_free,
>  	.prepare	= atmel_pcm_prepare,
> -- 
> 2.16.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
