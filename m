Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E41251CEA21
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 03:33:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FE5886E;
	Tue, 12 May 2020 03:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FE5886E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589247205;
	bh=OUNODua/XP+uGHleC63oQoqv7mGwj75LS3PC2du8rMU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vJlR/E088TorRLqLvF/uGexu6XkYEMuqY5RD0kwxtixmvh9VNW6SPjKvdg0RJ6zCZ
	 1LGBJQ/uXmlLC/aeMPyFzFJFv4Q0YIf4vpueG6fM3kNZityCiX6eIAeuSKS3+YXZNa
	 Z82gN8rONaRjgomcgjs8o+Pi7VqVNK2vl3eaW5g8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C306FF801F2;
	Tue, 12 May 2020 00:26:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25033F80157; Tue, 12 May 2020 00:26:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC232F800E3
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 00:26:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC232F800E3
Received: by mail-oi1-f194.google.com with SMTP id c12so15564377oic.1
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 15:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=GeCkeYpXNX1z0Dt2MixWzuFP/3nex9jVFyoU5cNVRLs=;
 b=XURrikbR8d7ho0S1GHoPt/5He51GuhW9gCL6UVOAiL+80TwNXGQObeo11a4PYLRWzB
 OeigZNwUcb0wcLnCVEfm1NnKlIS3W2aZOWGRWAIt35ncr97Wmu3o7MswWBKk//xvFuLD
 K6PKvn5LOL/jPH9eaZO9/jhwil9rRb/RWNBTLR5a6CyCe+y6Hfm1jqWPvCVBHPpc0VR4
 GDNC9nM6dmrItBINMHnPSOmdxqyil29FPSkkFLAbeuXaA88XPXIM94jCFJVGyrprFShk
 mjuV8yNbZeeghpy0mXTD29mqRYYooy3tdFiHqKOsXP3HbUXgb9Rbghu6yWdnfeJipEZZ
 JR0A==
X-Gm-Message-State: AGi0Pua+uUOLTc7biEgYU8YcMHvMlBAyX1lEipNk0QE31kwXEvm0L/pZ
 XWmc8Dva9S8/3ifgK3k9/g==
X-Google-Smtp-Source: APiQypI7l3460K6I+pSKo5GqHd8yXHAenw18v+/L3BoW00FvQNghiaUyqF66BrvnvvqyVBwfHGm+bw==
X-Received: by 2002:aca:4a0c:: with SMTP id x12mr21205361oia.19.1589235980743; 
 Mon, 11 May 2020 15:26:20 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p17sm3180892oot.17.2020.05.11.15.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 15:26:20 -0700 (PDT)
Received: (nullmailer pid 27324 invoked by uid 1000);
 Mon, 11 May 2020 22:26:19 -0000
Date: Mon, 11 May 2020 17:26:19 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
Message-ID: <20200511222619.GA27288@bogus>
References: <20200426104115.22630-1-peron.clem@gmail.com>
 <20200426104115.22630-3-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200426104115.22630-3-peron.clem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Sun, 26 Apr 2020 12:41:10 +0200, Clément Péron wrote:
> From: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> H6 I2S is very similar to H3, except that it supports up to 16 channels
> and thus few registers have fields on different position.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  .../devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
