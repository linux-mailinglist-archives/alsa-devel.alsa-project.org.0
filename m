Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A72D5100DC4
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 22:34:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E2481687;
	Mon, 18 Nov 2019 22:34:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E2481687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574112890;
	bh=J1akQbqBWSAGkOFXvl7L6wHFcCwnxtWn+KAV7ld4Ub0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kX7gAzknhtkCi0d2w1tzkyonrSgOzSr2SnTPnUN6LFYQFdZSor0RhA7M7SQF+7IFw
	 9wasKSmN0rE0xKxOjXPKeonsSr3ORnnvxXtZ1PU3O/H0+6OAcPF0t+DDlQ+KGcMelQ
	 11ZSO59jz+v/PbxwX3F+5xRjp3VlqZKdKXaYKDQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ABD5F8013C;
	Mon, 18 Nov 2019 22:33:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D596F8013B; Mon, 18 Nov 2019 22:33:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_78,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A3BEF800F1
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 22:32:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A3BEF800F1
Received: by mail-oi1-f193.google.com with SMTP id l20so16760444oie.10
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 13:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+gNao6bjSYC1WxI91s+ikl6/okUQ4D7/7Wn4Hq9wK5g=;
 b=GO4rXBhwAQZBQol7lFe+MXucWydPZgHN1l/ToJl47XjDStV0l18cPH3xfAEp4SMyzl
 hed3WgW2eoHerFEIpFlJ3mQB+hRHXsBE+R9kSpY5oL8fujUhUjA5hlSTxd2ecCf+Dmce
 HOxZ8m+5oiLEJKql5n23TuYj/kV0/0qWULAJ75ZjHc8Kmd3efcLJKAbcwZDTKYE2IaHp
 MrF/h22Gc6ohQO6gh7gI3ldgwxY9V6HXqnTkWvvUGqavnBanMVu/lv0CjEqATayK23ZP
 V4T8ngo3gewUZYn1uwg17n3EO6bLG1cz7PDQw0wAPYUbBO9k/qDTNIu8hEk6hxMh3yMa
 xoxA==
X-Gm-Message-State: APjAAAUnlKdrtaCtaaQFfzheijwypMNT7t9fpn+Ik+aog4cr7SI2Nfqb
 SA/PbgBBx6nrSfaQ34n0AQ==
X-Google-Smtp-Source: APXvYqx1RtTBrYQED9QhIjvirrPV/a4JBKzhJx9hGC6wh4UxphAZLwpmJqsB1gKcOe+gKsus8SwRxw==
X-Received: by 2002:aca:d610:: with SMTP id n16mr955357oig.64.1574112778145;
 Mon, 18 Nov 2019 13:32:58 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b12sm6586756otl.34.2019.11.18.13.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 13:32:57 -0800 (PST)
Date: Mon, 18 Nov 2019 15:32:56 -0600
From: Rob Herring <robh@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <20191118213256.GA27262@bogus>
References: <20191113124734.27984-1-peter.ujfalusi@ti.com>
 <20191113124734.27984-2-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113124734.27984-2-peter.ujfalusi@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linus.walleij@linaro.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 1/2] bindings: sound: pcm3168a: Document
	optional RST gpio
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

On Wed, Nov 13, 2019 at 02:47:33PM +0200, Peter Ujfalusi wrote:
> On boards where the RST line is not pulled up, but it is connected to a
> GPIO line this property must present in order to be able to enable the
> codec.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  Documentation/devicetree/bindings/sound/ti,pcm3168a.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt b/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
> index 5d9cb84c661d..f30aebc7603a 100644
> --- a/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
> +++ b/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
> @@ -25,6 +25,12 @@ Required properties:
>  
>  For required properties on SPI/I2C, consult SPI/I2C device tree documentation
>  
> +Optional properties:
> +
> +  - rst-gpios : Optional RST gpio line for the codec
> +		RST = low: device power-down
> +		RST = high: device is enabled

'reset-gpios' is the standard naming for reset lines.

> +
>  Examples:
>  
>  i2c0: i2c0@0 {
> @@ -34,6 +40,7 @@ i2c0: i2c0@0 {
>  	pcm3168a: audio-codec@44 {
>  		compatible = "ti,pcm3168a";
>  		reg = <0x44>;
> +		rst-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
>  		clocks = <&clk_core CLK_AUDIO>;
>  		clock-names = "scki";
>  		VDD1-supply = <&supply3v3>;
> -- 
> Peter
> 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
