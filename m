Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3C197A430
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2024 16:32:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2665E9D;
	Mon, 16 Sep 2024 16:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2665E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726497136;
	bh=BkNqGrNJ3t46F7Xl1BYz61Tm9LXflIUC4aRap28qLVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qm+bP/8WkLioQci0HmhASrBh+DdlyQmjwcPn2h/JJ2qXfXoEqPR741oPRlnBait/m
	 Tibbw7b4iBZAjq2kjxz4qB7ctSpYaUoRpdEh2oGjrv4ExnQplYv/4IXMEDUjQivG5Y
	 k+vh/6e4wYBB89Uyu6OUciQfCwOOIYbnxpxd6ngk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6F38F80518; Mon, 16 Sep 2024 16:31:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E44BF80518;
	Mon, 16 Sep 2024 16:31:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A74CF8020D; Mon, 16 Sep 2024 16:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47EBEF800D0
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 16:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47EBEF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BHbjGyh2
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8DBC20007;
	Mon, 16 Sep 2024 14:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726497092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QloBWWiiQvJ9odjtbk/ZDUQVWAaXV9wS+D1Lf/XH/qc=;
	b=BHbjGyh2V5W711FYpda4uynjp9Pj7IzPDyskiBG+W33xrLTe4hJGafNYQ2BkZUdzN7ftwR
	MKNQPQrkh7rvh1McVuzovwb5SGe3qZU55e/i+nq3VUJyaT2xRkcyf/w7QhgMTfxbrkXdtT
	D9CppqOIjE+yv2ITa1z4fLQCk/TALo7kZSJHF+bDv2pGIEH+XAU86aXLK9Ej1otx8IdIkV
	HJv/3VsiYZ3hkmcrS2jSB08bDnpHag2L9lVW6g2bN/C1NXCnZnoTMdhqzZtqTD0pYhxp1T
	y06RDUJYQNdUjPFF8EsNQkjPlLKkzkj41Z0J0YXmoiiFk7N3VrHoIi+MVVYp0g==
Date: Mon, 16 Sep 2024 16:31:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andrei Simion <andrei.simion@microchip.com>
Cc: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, nicolas.ferre@microchip.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: Re: [PATCH v2 2/2] ASoC: atmel: atmel_ssc_dai: Drop S24_LE support
 due to single channel limitation
Message-ID: <20240916143130835e72b4@mail.local>
References: <20240916131910.22680-1-andrei.simion@microchip.com>
 <20240916131910.22680-3-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916131910.22680-3-andrei.simion@microchip.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
Message-ID-Hash: 2GXJ2P44XURJPEXVG4NCZEJMPXRWGDXP
X-Message-ID-Hash: 2GXJ2P44XURJPEXVG4NCZEJMPXRWGDXP
X-MailFrom: alexandre.belloni@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2GXJ2P44XURJPEXVG4NCZEJMPXRWGDXP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/09/2024 16:19:10+0300, Andrei Simion wrote:
> From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> 
> Drop S24_LE format because it is not supported if more than 2 channels
> (of TDM slots) are used. This limitation makes it impractical for use cases
> requiring more than 2 TDM slots, leading to potential issues in
> multi-channel configurations.
> 
> [andrei.simion@microchip.com: Reword the commit title and the commit
> message. Add code comment to explain the removed code.]
> 
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> ---
> v1 -> v2:
> - add code comment to explain why S24_LE is dropped.
> ---
>  sound/soc/atmel/atmel_ssc_dai.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
> index 7047f17fe7a8..89098f41679c 100644
> --- a/sound/soc/atmel/atmel_ssc_dai.c
> +++ b/sound/soc/atmel/atmel_ssc_dai.c
> @@ -821,8 +821,9 @@ static int atmel_ssc_resume(struct snd_soc_component *component)
>  	return 0;
>  }
>  
> +/* S24_LE is not supported if more than 2 channels (of TDM slots) are used. */
>  #define ATMEL_SSC_FORMATS (SNDRV_PCM_FMTBIT_S8     | SNDRV_PCM_FMTBIT_S16_LE |\
> -			  SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
> +			   SNDRV_PCM_FMTBIT_S32_LE)
>  
>  static const struct snd_soc_dai_ops atmel_ssc_dai_ops = {
>  	.startup	= atmel_ssc_startup,
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
