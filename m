Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F304A678A62
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 23:10:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C59AE77;
	Mon, 23 Jan 2023 23:09:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C59AE77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674511835;
	bh=0ymHrUm5jDfJLjqCaXzDm+ZmDku6aDdu/f84BssNsIU=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gMMVEytnTOQ/nRd7LF59JHYwt4hvFOEIb1YRYIbo+4vRfTucTCc+3nk9szAGXcvET
	 eQgF4cnbSm1A0ZpE1I9IKpgNnxrGSVVK+v0gQXbTYfm5T+nkwFTE7agIMRAa0wHh1H
	 DAXr11CfFP47ea48BYiKizZXObt7L8eGvZW3OLqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E544F80132;
	Mon, 23 Jan 2023 23:09:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8EB6F804C2; Mon, 23 Jan 2023 23:09:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 025CDF801D5
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 23:09:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 025CDF801D5
Received: by mail-oi1-f170.google.com with SMTP id r132so11668075oif.10
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 14:09:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3+oBU6QhiMJWJA5PyjPdZyGxoFfBGQTI7dLnT9GRQYQ=;
 b=KAm4KqIn2zhkiTy3er2JRZerZQMYnxT0WsV5HaPI07KcZc3xLGSgQDid0oid87camg
 3Gu8uQYq2fw3KulSntU5PkWP9ijj6ZIqpgdbsnIhLmHtMIF6iRHA6Y4vvth7NzYfLSn6
 +qC/pSv76QsLarKMaNIREsIzSQaHWaC5k7DrqOR0H4Uh2ml0vl8HbPGnLfQp5J4WPTOP
 XsGw703NcODlY72t6lV8PxX2STXmDa3lYTvxca/RxRXYeOCmWs1aBPVsvfeRWGPl4RIo
 7idCXPDSeAkQRpMbGnZ/SIOKQsScOnNaPDPWhd5PEHFE9/S8s8uMv1BrnQLs5QTZwTfv
 Nk9g==
X-Gm-Message-State: AFqh2kpCuoq5bElTdUxtXW77SJoxktOqVknoplhZFtF3XRDIqdlesuFF
 Y3FCABk7MYgk22HO7th5qQ==
X-Google-Smtp-Source: AMrXdXuvsZxGtJD0l6UXaq6gtyP+fr1yafFDygzbhBdWeEIl1O6lOPBYCXkauU3R3RjEhpDssOuYPw==
X-Received: by 2002:a54:4810:0:b0:35e:2d5c:6114 with SMTP id
 j16-20020a544810000000b0035e2d5c6114mr12298293oij.25.1674511769870; 
 Mon, 23 Jan 2023 14:09:29 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t10-20020a9d728a000000b006706cd202b0sm209190otj.11.2023.01.23.14.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 14:09:29 -0800 (PST)
Received: (nullmailer pid 2726293 invoked by uid 1000);
 Mon, 23 Jan 2023 22:09:28 -0000
Date: Mon, 23 Jan 2023 16:09:28 -0600
From: Rob Herring <robh@kernel.org>
To: Astrid Rost <astrid.rost@axis.com>
Subject: Re: [PATCH v2 4/4] ASoC: dt-bindings: ti, ts3a227e.yaml: add jack-type
Message-ID: <20230123220928.GA2720169-robh@kernel.org>
References: <20230120102555.1523394-1-astrid.rost@axis.com>
 <20230120102555.1523394-5-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120102555.1523394-5-astrid.rost@axis.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, kernel@axis.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dylan Reid <dgreid@chromium.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jan 20, 2023 at 11:25:54AM +0100, Astrid Rost wrote:
> Add jack-type: Bitmap value of snd_jack_type to allow combining
> card drivers to create a jack for it.
> 
> Signed-off-by: Astrid Rost <astrid.rost@axis.com>
> ---
>  Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml b/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
> index 785930658029..1d949b805f98 100644
> --- a/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
> @@ -27,6 +27,14 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  jack-type:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Bitmap value of snd_jack_type to allow combining

snd_jack_type? Is that a Linux thing? Bindings are independent of Linux.

> +      card drivers to create a jack for it. Supported is
> +        1 SND_JACK_HEADPHONE
> +        2 SND_JACK_MICROPHONE
> +    default: 3

I'm pretty sure jack properties are more complicated than just headphone 
and/or microphone. There's buttons which are detected in differing ways.

Rob
