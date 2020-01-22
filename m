Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8355114599F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 17:17:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2B07169D;
	Wed, 22 Jan 2020 17:16:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2B07169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579709870;
	bh=EwBNRJzk7W19LC8kwgQqaE4J/8IvDzA77x9SCOwwgvs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fTswvSmaYT4Xfjs8zd5I4KbEiiSJOZMmORMSDdLKEJposWBytdOlp/FcpDlt6i6eO
	 2VMppqbqnq11eypNkpZIYrq96mqlpxBVZxCE+fLlAVxB73/nESjneyxsqrkfIg/fbE
	 EOSCA0t6y58xbncAjMsI6HRKonFer8Cp7AWQpjdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7504DF8020C;
	Wed, 22 Jan 2020 17:16:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5985EF8020C; Wed, 22 Jan 2020 17:16:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BBAAF8007E
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 17:15:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BBAAF8007E
Received: by mail-ot1-f67.google.com with SMTP id r9so6708109otp.13
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 08:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=p1OCjMXmKiHziHpAWhapeWkfYMdZv9uLGeBBuoIovnE=;
 b=AUSPrCcNbiG+78nnZkjwEBHIewdw/0nfhGe86pTw3tBWykC9xcWXvEwTYfHPkAWCXk
 olas5Ss04O9/COnosgUBlAXgEwnNqaa7eQr6nCwJL+ToawhklQoqR/tsdjmReZVe2nUa
 zlpIYEhJU+mm3Bsj0q+dRZ8w+yDaVgGT1I0TOkItz41pn0EjQA+cAvtwNQCxpXMPrh18
 It1xdq4C20eUpgUe4jCrQMMLbnvg4jU1hUwasSsD5b4MLECVvKjsSC7H+Ul5/hH6ISUp
 dG64kIDMIvq5g98T+g2GmCwvdDcir/1MDomK5BWKg0KPClkWbfEcyWX7nT0QjAxjdob+
 XQxA==
X-Gm-Message-State: APjAAAVyWVsuSy6kAl6T9/zQja+cZDKp6fj4NeK0D+IyP3fTysBigApz
 LuGyUjzAUoaQfNrZocQBYQ==
X-Google-Smtp-Source: APXvYqw58Rk8CdOh5qD6B4KibM7Z80Epls8nYTSXNGBeCyLyJ1Lk0PZfZPeci8FyEvSsoiqg65LGBw==
X-Received: by 2002:a9d:d0b:: with SMTP id 11mr8248931oti.287.1579709758154;
 Wed, 22 Jan 2020 08:15:58 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u75sm13106196oie.15.2020.01.22.08.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 08:15:57 -0800 (PST)
Received: (nullmailer pid 27987 invoked by uid 1000);
 Wed, 22 Jan 2020 16:15:56 -0000
Date: Wed, 22 Jan 2020 10:15:56 -0600
From: Rob Herring <robh@kernel.org>
To: Charles-Antoine Couret <charles-antoine.couret@essensium.com>
Message-ID: <20200122161556.GA23997@bogus>
References: <20200118092315.10384-1-charles-antoine.couret@essensium.com>
 <20200118092315.10384-2-charles-antoine.couret@essensium.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200118092315.10384-2-charles-antoine.couret@essensium.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: tas5756m: Add DT binding document
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

On Sat, Jan 18, 2020 at 10:23:15AM +0100, Charles-Antoine Couret wrote:
> Document the bindings for the tas5756m driver.
> ---
>  .../devicetree/bindings/sound/tas5756m.txt    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tas5756m.txt

Can you make this a DT schema.

> 
> diff --git a/Documentation/devicetree/bindings/sound/tas5756m.txt b/Documentation/devicetree/bindings/sound/tas5756m.txt
> new file mode 100644
> index 000000000000..293eaf20d008
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tas5756m.txt
> @@ -0,0 +1,25 @@
> +TAS5756M audio CODEC
> +
> +Required properties:
> +
> +  - compatible: should be one of the following:
> +    - "ti,tas5756m"
> +    - "ti,tas5754m"
> +  - reg: the I2C address of the device for I2C.
> +
> +Optional properties:
> +
> +  - mute-gpio : GPIO wired to the mute pin.

mute-gpios is the preferred form.

> +  - hybridflow : an integer between 1 and 9 to select the HybridFlow program.
> +      if not supplied default DSP program is used.

Needs a vendor prefix.

Is this something fixed for the life of a board or something users would 
want to change at runtime?

> +
> +Example:
> +
> +	tas5756m: tas5756m@4c {
> +		compatible = "ti,tas5756m";
> +		reg = <0x4c>;
> +		#sound-dai-cells = <0>;

Not documented.

> +
> +		hybridflow = <6>;
> +		mute-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
> +	};
> -- 
> 2.24.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
