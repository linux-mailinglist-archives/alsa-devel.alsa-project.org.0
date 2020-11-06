Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9A82A9956
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 17:19:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADBDF167C;
	Fri,  6 Nov 2020 17:18:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADBDF167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604679554;
	bh=Kb4BTU2FkcyjO5R5l+AmRLTJ+JZdgi8nFoZJCdzU8Ys=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sUt5Wr3Ka1MnqZyWWs8+bp6cVtGSnVQ9ECoXwzacKm5afKJ/S6LrYFHFnXf2Pn1Hc
	 2KevWxkgUQ5FIsk1IiUhH9FjWfFuLvtUosc2Ysuh0ECi9d7fClQBjN4SXvjLOExBiI
	 hWpVmBtccRQBsgUGxXUSdDpbmXq+5QQeOk6TF/G4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 151C0F8023E;
	Fri,  6 Nov 2020 17:17:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B620F80234; Fri,  6 Nov 2020 17:17:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 932F9F800BA
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 17:17:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 932F9F800BA
Received: by mail-oi1-f195.google.com with SMTP id c80so1869767oib.2
 for <alsa-devel@alsa-project.org>; Fri, 06 Nov 2020 08:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WhNIeGRJTGUy5TIPo/bLFio0vUxrOA2JUyr+eH9gH1I=;
 b=RKIbmqpMsZEcNFMJ96WI5XOaQhMrVG/V/ljS5tYRjgbWA+DBllgK0gRla5Elwp0Lt9
 ToX8jnh8HXj6U4MAchbBniprUMnHX+yhOovfnEJkoVtGmVFOSX1TrYsE9NJFW1qE4LYs
 PXcya5ci5N4PDplXjNl87luDnuGaKAGM/W1EWZEXrxVUNw2s/JO3O6RyLLy7OF/OHMH2
 33lZ9xt8RB/NPDJXIE8e9bWZnZw7akd8icE/vWou50eIk9yq6zj3X2FT+VXwJCr4Fl3p
 bPF7OK4y1fOS3iTC32bT/WmKWGEEXwihVDrkuA/dbCWHL1wpgVdp8FtP3Of9BeFkF2Nt
 T8Tg==
X-Gm-Message-State: AOAM530zxzNgLQZKkA1ufnUHYeSnzxTAtAhFZJF875iC0S8/idqG6FtR
 ONfzy26iJ7val4HMFZzTZg==
X-Google-Smtp-Source: ABdhPJxuxAPTWUVzp/R/MIuKz3b7AtavlWQ3e1kc3Zhr+6Ge6ZUtHLXtMitxwZMkKAtGDve0fOfH8w==
X-Received: by 2002:a54:4199:: with SMTP id 25mr1468238oiy.50.1604679452378;
 Fri, 06 Nov 2020 08:17:32 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 8sm360326oii.45.2020.11.06.08.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:17:31 -0800 (PST)
Received: (nullmailer pid 3298774 invoked by uid 1000);
 Fri, 06 Nov 2020 16:17:30 -0000
Date: Fri, 6 Nov 2020 10:17:30 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: Re: [PATCH] dt-bindings: adau1977: convert text binding to yaml format
Message-ID: <20201106161730.GA3298561@bogus>
References: <20201106102052.32582-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106102052.32582-1-alexandru.ardelean@analog.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, bogdan.togorean@analog.com
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

On Fri, 06 Nov 2020 12:20:52 +0200, Alexandru Ardelean wrote:
> This change converts the old device-tree binding for ADAU1977 from text
> format to the new yaml format.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  .../bindings/sound/adi,adau1977.txt           | 61 ---------------
>  .../bindings/sound/adi,adau1977.yaml          | 77 +++++++++++++++++++
>  2 files changed, 77 insertions(+), 61 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/adi,adau1977.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/adi,adau1977.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/adi,adau1977.example.dts:28.37-38 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/sound/adi,adau1977.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1395607

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

