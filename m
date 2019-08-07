Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A951A841D6
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 03:49:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4056E166F;
	Wed,  7 Aug 2019 03:48:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4056E166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565142575;
	bh=iZmRi7D3NnvEIFPxxjvPcwStNVuYMQJZMKbdz0V/IFQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e22qK9yaoZaQF9XVwXgOZ7L1lJmlYUQYIoz6gSxG/UMzVQg3HCEMrxmqC1oN3aXTl
	 mZ1qDT8UmNEG7ztpOwtvbW05RKd6U4h2LW9mm6g+ZuZFncQf+khyNi/JwKeMYBXej8
	 uQ6ZXjXxyNtobb4xrQzu4OYzqkxbqDqNTnDqo0z8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5E1FF805E1;
	Wed,  7 Aug 2019 03:41:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC426F805E1; Wed,  7 Aug 2019 03:41:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A81AF804CB
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 03:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A81AF804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="C8vEJVaL"
Received: by mail-pl1-x642.google.com with SMTP id c14so38511424plo.0
 for <alsa-devel@alsa-project.org>; Tue, 06 Aug 2019 18:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Hwj3uGjc5P7Ed46PamHKrYgZN25uTv+4Y9CY8N3wDxE=;
 b=C8vEJVaL0ESKCzP7lefx1wgcIKNEPnvmGnxPgANSawJd2TYlYWBNmyzn02+3hhrIW4
 15kK0nHEK/7u1XpXTo8pF61gnaXoiwY6P/Gn50dCUnh6FHquoIT7a6gMNluhLYfMGCMJ
 zxlFl/1BJfY2zEZSoxUaOsr+aev7K7Aeur4d3UsvITBNuCufguDQRYOV+u27pp3JStTz
 hYtaywIaomr71CL0OgEpmgXNwWtz3L6NzXyeJoqhd+8dn80IsTy0gE6Yiv1xJz5GY7P7
 EdrSzazVpkm9tmgS/F8PUFKYloOaQnEXYUSLBj4ao3lLdd0OskVPHMmhS6oOFYE9oC2y
 E5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hwj3uGjc5P7Ed46PamHKrYgZN25uTv+4Y9CY8N3wDxE=;
 b=ll1Cxpj9wpsPJIgF01m3kCj3/aIaP895W785Gx91OEr8/uOtt/y9I9coNW7YaTb4s4
 6InpbOunEnWCiMj1uQnPgNgeELyA8d4XmMkDXZfg7MpZLLDIt0J7bQgvZyLHcYsTCi4i
 2IlE1Sl8CkSmfpdJ3I0XByY/JI8eC3IieJGxqKTVjL2qvOXUAFHGtQjIH71xGVWWgv/2
 XGDWmHajvsAutpNo2NRh5YnkJ46Ci0DaYHNW2hIqAAaSjbq71HGaUK9EYXOxQq7ABG4G
 siuCoBb7IwI4Iq+5pVEl6w9NjTjMp3qt0VoPo8I7MMNKKraMk2CAlpC1NrMNHIAVW+aO
 hK3Q==
X-Gm-Message-State: APjAAAWzmNyyOBCvLki6C71VqBdrkvuGfSNjuUKw5OVkqTazJSBVEwkF
 E8+o+qh763GnEayl+IUopAhfn0Hp
X-Google-Smtp-Source: APXvYqyKWesJtrgg5eVS6TTcftVzlL7G23lqVSgTL3Z85jZoOflA0An/pnwl1gjI3N4imWHwAw2lFA==
X-Received: by 2002:a17:902:925:: with SMTP id
 34mr5869179plm.334.1565142071293; 
 Tue, 06 Aug 2019 18:41:11 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id v22sm87667096pgk.69.2019.08.06.18.41.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 18:41:11 -0700 (PDT)
Date: Tue, 6 Aug 2019 18:42:06 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190807014206.GG8938@Asurada-Nvidia.nvidia.com>
References: <20190806151214.6783-1-daniel.baluta@nxp.com>
 <20190806151214.6783-6-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806151214.6783-6-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 robh@kernel.org, shengjiu.wang@nxp.com, angus@akkea.ca, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, mihai.serban@gmail.com,
 l.stach@pengutronix.de
Subject: Re: [alsa-devel] [PATCH v3 5/5] ASoC: dt-bindings: Introduce
 compatible strings for 7ULP and 8MQ
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

On Tue, Aug 06, 2019 at 06:12:14PM +0300, Daniel Baluta wrote:
> For i.MX7ULP and i.MX8MQ register map is changed. Add two new compatbile
> strings to differentiate this.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Looks good to me. As long as one of DT maintainers acks,

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks

> ---
>  Documentation/devicetree/bindings/sound/fsl-sai.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> index 2e726b983845..e61c0dc1fc0b 100644
> --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> @@ -8,7 +8,8 @@ codec/DSP interfaces.
>  Required properties:
>  
>    - compatible		: Compatible list, contains "fsl,vf610-sai",
> -			  "fsl,imx6sx-sai" or "fsl,imx6ul-sai"
> +			  "fsl,imx6sx-sai", "fsl,imx6ul-sai",
> +			  "fsl,imx7ulp-sai" or "fsl,imx8mq-sai".
>  
>    - reg			: Offset and length of the register set for the device.
>  
> -- 
> 2.17.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
