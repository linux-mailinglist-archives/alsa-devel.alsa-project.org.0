Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D57324003B9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 18:55:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D0A018D6;
	Fri,  3 Sep 2021 18:54:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D0A018D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630688112;
	bh=xBAI3Q+CTndg55p++4CTyyIwLjEJIdk806gG11kRCVE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TXMdpITLVO0EIpzydzqQtDrZW+4G67cTB5rxOhdLDiCOQFgFihlGGxb2zF9ls7c7Q
	 ZUGzJXJLI10I4oaXSOf/4KIuU1YXt1wID3yQWk90buuoID3wEHczFVrYcX0JCuSEUD
	 R4RqhZW0d0lB4UsAeMl5xnw4AA7R32W2HJ8YqMqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 983A7F80256;
	Fri,  3 Sep 2021 18:53:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9474F80254; Fri,  3 Sep 2021 18:53:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4E5CF800B5
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 18:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4E5CF800B5
Received: by mail-oo1-f50.google.com with SMTP id
 m14-20020a4ad50e000000b002912a944a47so1687515oos.12
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 09:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=enSj79vcN/Dm/uZSTTzwATzvAMHwNRMrauYA74ENvEY=;
 b=LXYgRC7XPsD65LKdE0tV1g4OvRGCNSYBMJ2knkAJnwlVx2iroIOh6MGk+P5JwG818h
 Z1pXD/kHsgMAG45zszS1ymkHL4mJ0pUQxfdUIj9nESoxXvbmcit5786E/ZVrLaIPRBj4
 3whjrV/dX9q6kdMuJYaE3D1KGgZSeaZ5erF2CEnIzjw61gMOjaaNc+oz0EOWCJRndbU/
 pwQMyaj5SGd2sSXtkGV/6CEfrsWi6xfsW18DG/6MFm2DJLpcV6DC8LagIaZvwQqUVmo5
 GV2K5BfhgMofBcsHlMaQLuRp76uIom9Fflub1SqavRnVfk2+fY5NXPnTK/hn99NAaS0a
 RItA==
X-Gm-Message-State: AOAM530XqTNZe1fqQvtBnIeYIL/hlkZcumSremjtz1VSDO4C9CtPTaOO
 wfc3TDVotcZ3ZVXAqOtJiA==
X-Google-Smtp-Source: ABdhPJyRTE/hdWaUnfQdRbuMAMJswUwR6XT/DIJppmGP66ppiqdiMz1FHfSfkortQtFWdbOgrBbIUw==
X-Received: by 2002:a05:6820:235:: with SMTP id
 j21mr3734079oob.75.1630688025383; 
 Fri, 03 Sep 2021 09:53:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v186sm1148174oig.52.2021.09.03.09.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:53:44 -0700 (PDT)
Received: (nullmailer pid 3085928 invoked by uid 1000);
 Fri, 03 Sep 2021 16:53:43 -0000
Date: Fri, 3 Sep 2021 11:53:43 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: dsp: fsl: Add DSP optional clocks
 documentation
Message-ID: <YTJTF5VMOyG2iZb0@robh.at.kernel.org>
References: <20210903145340.225511-1-daniel.baluta@oss.nxp.com>
 <20210903145340.225511-3-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903145340.225511-3-daniel.baluta@oss.nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 festevam@gmail.com, peter.ujfalusi@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, s-anna@ti.com,
 shawnguo@kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Sep 03, 2021 at 05:53:40PM +0300, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> DSP node on the Linux kernel side must also take care of enabling
> DAI/DMA related clocks.
> 
> By design we choose to manage DAI/DMA clocks from the kernel side because of
> the architecture of some i.MX8 boards.
> 
> Clocks are handled by a special M4 core which runs a special firmware
> called SCFW (System Controler firmware).
> 
> This communicates with A cores running Linux via a special Messaging
> Unit and implements a custom API which is already implemented by the
> Linux kernel i.MX clocks implementation.
> 
> Note that these clocks are optional. We can use the DSP without them.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> index 7afc9f2be13a..1453668c0194 100644
> --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> @@ -24,16 +24,49 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 3
>      items:
>        - description: ipg clock
>        - description: ocram clock
>        - description: core clock
> +      - description: esai0 core clock for accessing registers
> +      - description: esai0 baud clock
> +      - description: esai0 system clock
> +      - description: esai0 spba clock required when ESAI is placed in slave mode
> +      - description: SAI1 bus clock
> +      - description: SAI1 master clock 0
> +      - description: SAI1 master clock 1
> +      - description: SAI1 master clock 2
> +      - description: SAI1 master clock 3
> +      - description: SAI3 bus clock
> +      - description: SAI3 master clock 0
> +      - description: SAI3 master clock 1
> +      - description: SAI3 master clock 2
> +      - description: SAI3 master clock 3
> +      - description: SDMA3 root clock used for accessing registers

Sigh, I just rejected this kind of thing for the other i.MX8 DSP 
binding[1].

Add a reference to the h/w block and then get the clocks (and other 
resources) from there.

Rob

[1] https://lore.kernel.org/linux-devicetree/YTDq%2FkWFPLHUnHMN@robh.at.kernel.org/
