Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDF44C8A8A
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 12:19:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E49911B07;
	Tue,  1 Mar 2022 12:18:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E49911B07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646133590;
	bh=pjS2o3inJdkY+itN4TE9HmTjybISLxWDIoEs9DorWBw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uyP8n9yFRwPgFDfRrSBz7pPJHpQwCEqYZtgP7PxIOgsDYo4CwGvkx92z3VHWSdVHg
	 PgtHc2n327RopxzKv8o5MvlPGHsESgKESvHoDNvJN+u+O/2Da7VUKLL2tNAuIa1IEc
	 g7fJU7pKbQcmagfDOKPs/FS1r0DjUUu8PS3x9wCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51504F80054;
	Tue,  1 Mar 2022 12:18:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07884F80227; Tue,  1 Mar 2022 12:18:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C63DEF80095
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 12:18:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C63DEF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="mrgSYljU"
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F1F13200003;
 Tue,  1 Mar 2022 11:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646133513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1onpxNnFoCXsqo506jvf7SOJaOlkoC3XKwD8NMc9uTQ=;
 b=mrgSYljU26q9SyublNacGu2CJRJlEXAsqilOiDlbsTI3WISP1QS1VUesZ0AixgqWisvyoK
 aEq9vGYD0V0rkIWWOwTzg2MNvz+UHfg3XCG9oTaZMcuwXfUpY6xY0T7KXBwymDFGPAwD9S
 gGhs7Qf7QUy07EEwIgNu1ZzQkpEFpIjhSQNIIvO3mMLqFjQ18lcYmBUa6bBioQUtmu3Z7M
 U+b+NUQZ1JjgGF7ZrDwih1ojKwcV8ATShVp0xBr4/d6jCl4VPV/gNbmEHcuBEw/1Gn8Ivd
 C+5ippITlTrmBVKtF3sFQhz7mpHJv86z5L6Zv4n0kkH07IEPcUAeZqR93iEAcQ==
Date: Tue, 1 Mar 2022 12:18:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: atmel_ssc_dai: Handle errors for clk_enable
Message-ID: <Yh4BCPqPngcsvER1@piout.net>
References: <20220301090637.3776558-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301090637.3776558-1-jiasheng@iscas.ac.cn>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, tiwai@suse.com,
 broonie@kernel.org, codrin.ciubotariu@microchip.com,
 claudiu.beznea@microchip.com, linux-arm-kernel@lists.infradead.org
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

On 01/03/2022 17:06:37+0800, Jiasheng Jiang wrote:
> As the potential failure of the clk_enable(),
> it should be better to check it and return error if fals.
> 

As I already replied to an earlier patch, this will never, ever fail,
this patch doesn't fix anything.

> Fixes: cbaadf0f90d6 ("ASoC: atmel_ssc_dai: refactor the startup and shutdown")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>  sound/soc/atmel/atmel_ssc_dai.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
> index 26e2bc690d86..c1dea8d62416 100644
> --- a/sound/soc/atmel/atmel_ssc_dai.c
> +++ b/sound/soc/atmel/atmel_ssc_dai.c
> @@ -280,7 +280,10 @@ static int atmel_ssc_startup(struct snd_pcm_substream *substream,
>  
>  	/* Enable PMC peripheral clock for this SSC */
>  	pr_debug("atmel_ssc_dai: Starting clock\n");
> -	clk_enable(ssc_p->ssc->clk);
> +	ret = clk_enable(ssc_p->ssc->clk);
> +	if (ret)
> +		return ret;
> +
>  	ssc_p->mck_rate = clk_get_rate(ssc_p->ssc->clk);
>  
>  	/* Reset the SSC unless initialized to keep it in a clean state */
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
