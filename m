Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F6517D24E
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Mar 2020 08:51:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 516F71694;
	Sun,  8 Mar 2020 08:50:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 516F71694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583653883;
	bh=MKiI7+FmOxPT8xE3d51jWp++sm3zJ9kB9slVHB9VB1o=;
	h=From:References:In-Reply-To:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r7e44yhT/m5LREnyJ2UlAc+oq0x1JdMEj2fAtbth5ZtFXhsvBxuTzU4HteMYlqXbf
	 Mslj8xZJsDzB3SDPdzRIKfXZjCQ1NmT4FCVi3vT5RPUF5KnJM8LJE9VTNsjFzncwFF
	 gybJRrCFfKUbYqkGNM0lqOtWz2Lctqfo0HPR0bqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B93CDF802BC;
	Sun,  8 Mar 2020 08:46:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8839F801ED; Fri,  6 Mar 2020 23:50:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12C22F80126
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 23:50:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12C22F80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.b="e8HNVypb"
Received: by mail-lj1-x243.google.com with SMTP id f10so3884796ljn.6
 for <alsa-devel@alsa-project.org>; Fri, 06 Mar 2020 14:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=from:references:in-reply-to:mime-version:thread-index:date
 :message-id:subject:to:cc;
 bh=+KdFgHd0Khi4D1I+q98xetrP7WjqAjfW7zo+CRETAms=;
 b=e8HNVypbS1BSjAYaVJJGJ+lKqiyoZLEYraBW0NcV4WgM3WRpmeJseFIlMHSsduthi8
 bfvxHTjVtPlItpMk7F/T9BgaTmF4A0GeTIML+V+gg1wHMUr1twtjejyU971EbA3I7srS
 P67lwS73bevLsMsn6lSRm+pieEbC3gt76dyLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:references:in-reply-to:mime-version
 :thread-index:date:message-id:subject:to:cc;
 bh=+KdFgHd0Khi4D1I+q98xetrP7WjqAjfW7zo+CRETAms=;
 b=F5AgLJVTENJ4bb2+B/asu3EEkDZqiXrw8rijdejMC4VrP42yBxd7OJjAJn0VOZadas
 6yfY/bjWSdSIEoiyIFtFWvCDo8vC2hBeALwzCna9DQU/x8K2KxihWlg81ynqFkyu2dWd
 LClmxHsghzFExQ0gc5XP3n7HaSnR9HvcdFHOZ4NXhaLRJV7KaQJqC7vstKLTz1n27rFZ
 zgNjesvg6j6O68ScLWK2vRI8+KOXm+1doFp4JWn/9EcA8zksApuyMksJpZQ2UPqsaRLV
 MbIjMcKyLfvizkaia48ET5nFP3vnpAPut+VMxuWhUU236ZkyquC3n8YoFhgy2EAc1fLN
 V1Yw==
X-Gm-Message-State: ANhLgQ2SRyBeCpuMwa2fhJdtKABsd1N21QFpD+pBZMvrHIxkutW+dexx
 QVLSCUD9M+XprgT7qFg5ejPLbwsUWP9UnzCPkVQgmp/VKFEmsANd
X-Google-Smtp-Source: ADFU+vvb+PrrT95TpfxieL14D0NqyXJi/a9FHEMKFcoukv944eoKgmEzoL0AOVCOoUwoDUqsoNYVB8prKmFXlelzJYQ=
X-Received: by 2002:a2e:80c3:: with SMTP id r3mr3329042ljg.105.1583535048747; 
 Fri, 06 Mar 2020 14:50:48 -0800 (PST)
From: Kevin Li <kevin-ke.li@broadcom.com>
References: <20200306222705.13309-1-kevin-ke.li@broadcom.com>
 <8d4fc59e-f892-7228-4369-f40ced5dc2d3@gmail.com>
In-Reply-To: <8d4fc59e-f892-7228-4369-f40ced5dc2d3@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQK6AtPk+W1UvlC/8YJn5FlJAEq5hQIs4nExpmKljtA=
Date: Fri, 6 Mar 2020 14:50:46 -0800
Message-ID: <31b665e609f3cfee935f4489a073af21@mail.gmail.com>
Subject: RE: [PATCH] ASoC: brcm: Add DSL/PON SoC audio driver
To: Florian Fainelli <f.fainelli@gmail.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 08 Mar 2020 08:46:09 +0100
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Stephen Boyd <swboyd@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
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

Hi Florian,

It is called from bcm63xx-i2s-whistler.c.
Maybe the name "_probe" function confused. It was 2 platform drivers, I
combined them together now.

Let me know if this answers your question, and what to do to address your
question.

Regards!
Kevin

-----Original Message-----
From: Florian Fainelli [mailto:f.fainelli@gmail.com]
Sent: Friday, March 06, 2020 2:34 PM
To: Kevin Li <kevin-ke.li@broadcom.com>; Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; Kuninori
Morimoto <kuninori.morimoto.gx@renesas.com>; Scott Branden
<sbranden@broadcom.com>; Liam Girdwood <lgirdwood@gmail.com>; Ray Jui
<rjui@broadcom.com>; Takashi Iwai <tiwai@suse.com>; Jaroslav Kysela
<perex@perex.cz>; bcm-kernel-feedback-list@broadcom.com; Stephen Boyd
<swboyd@chromium.org>; linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ASoC: brcm: Add DSL/PON SoC audio driver

On 3/6/20 2:27 PM, Kevin Li wrote:
> This patch adds Broadcom DSL/PON SoC audio driver with Whistler I2S
> block. The SoC supported by this patch are BCM63158B0,BCM63178 and
> BCM47622/6755.
>
> Signed-off-by: Kevin Li <kevin-ke.li@broadcom.com>
> ---

[snip]

> +int bcm63xx_soc_platform_probe(struct platform_device *pdev,
> +			       struct bcm_i2s_priv *i2s_priv) {
> +	int ret;
> +
> +	i2s_priv->r_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +	if (!i2s_priv->r_irq) {
> +		dev_err(&pdev->dev, "Unable to get register irq resource.\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev, i2s_priv->r_irq->start, i2s_dma_isr,
> +			i2s_priv->r_irq->flags, "i2s_dma", (void *)i2s_priv);
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"i2s_init: failed to request interrupt.ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	return devm_snd_soc_register_component(&pdev->dev,
> +					&bcm63xx_soc_platform, NULL, 0); }
> +
> +int bcm63xx_soc_platform_remove(struct platform_device *pdev) {
> +	return 0;
> +}

How does one probe this module if the bcm63xx_soc_platform_probe() functions
are not called from anywhere and/or hooked up to the module entry/exit
points?

Are you not missing a platform_driver entry which matches the compatible
string you defined?
--
Florian
