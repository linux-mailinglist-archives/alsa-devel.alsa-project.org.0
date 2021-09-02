Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A683FF428
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 21:27:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4633216F2;
	Thu,  2 Sep 2021 21:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4633216F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630610846;
	bh=pJSx602auvYC/bfz2YYluIVyML8jpl/WTtEE8mBd/js=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dJ3Wdq4NFUsB5ckjn1XMKjJ8fPV9mofRhe5WDbSj/eI7E/qnxokgJXR4Q320B6IKA
	 Evv8aVDkVXocZhmIr2FAFxIfjzOxNggzzEFZ7y6ahb+Oa3yi1sQvYdOhoqlcngazKq
	 wU3kKz+pmWnql3DGlwuqYyUGP9jghUZJi0fA+g1k=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABA59F8028D;
	Thu,  2 Sep 2021 21:26:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 484F8F80125; Thu,  2 Sep 2021 21:26:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61878F80125
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 21:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61878F80125
Received: by mail-ot1-f45.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso3923448ots.5
 for <alsa-devel@alsa-project.org>; Thu, 02 Sep 2021 12:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WfNiJevXXznsjYSTw7sC46xy0DwFMMffCSoTuGS9Xu4=;
 b=PChlz+5MWZcdRruR2k1Ta7YJNbZWAkUxqM/jLpnLYhlHKEyK8FXJFTIunYmW/VCUz+
 UGsZEDeLAXx4eBrX0Guwo3vh0EcVNbZUDpvPDMlyUeJlK6VroC4KEdJ9ZqIm8bp+riK4
 jEjf1PSQMoAnczJ3JhYqKR0DvuZa4wm3uMCszPpy76GP8o39T5zUlid+F0+5ziDQcwVV
 MMe39qMP8PnU4feB88BJW2GFaTgjsUhqFNvdYtAAPIrRcmPOiD80Sg32Q8ekkv5INbna
 CgjyTNk60lVFzzhuoyKDlMiwMo/c0lx3B/JrCYOcFI38QtmqNzVcQ5Ud66IQzLcQFuHm
 jHrg==
X-Gm-Message-State: AOAM5314Ifa4tHvqKGRs5CcpE1ejqFU2uf4eOleSs+zah/VlV+CjFNmd
 vSN2iW7y+Hv725zN2LLnZA==
X-Google-Smtp-Source: ABdhPJxZqPrhAD7h+cRcMlo04U4J5xrjfGsEQCo9fP0tXbDDy09MKoV+rWy84mbFp2TJ7J0+qYSFmw==
X-Received: by 2002:a05:6830:608:: with SMTP id
 w8mr3910518oti.73.1630610753804; 
 Thu, 02 Sep 2021 12:25:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w12sm543935oie.41.2021.09.02.12.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 12:25:53 -0700 (PDT)
Received: (nullmailer pid 1245839 invoked by uid 1000);
 Thu, 02 Sep 2021 19:25:52 -0000
Date: Thu, 2 Sep 2021 14:25:52 -0500
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 1/3] ASoC: Add json-schema documentation for
 sound-name-prefix
Message-ID: <YTElQBgwF6xBFH9l@robh.at.kernel.org>
References: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
 <1630562033-13231-2-git-send-email-spujar@nvidia.com>
 <1jpmtr5egi.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jpmtr5egi.fsf@starbuckisacylon.baylibre.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 stephan@gerhold.net, linux-kernel@vger.kernel.org,
 Sameer Pujar <spujar@nvidia.com>, lgirdwood@gmail.com, jonathanh@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

On Thu, Sep 02, 2021 at 02:47:27PM +0200, Jerome Brunet wrote:
> 
> On Thu 02 Sep 2021 at 11:23, Sameer Pujar <spujar@nvidia.com> wrote:
> 
> > The 'sound-name-prefix' is used to prepend suitable strings to a
> > component widgets or controls. This is helpful when there are
> > multiple instances of the same component. Add relevant json-schema
> > and is inspired from sound-name-prefix.txt documentation.
> >
> > Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > ---
> >  .../devicetree/bindings/sound/name-prefix.yaml     | 35 ++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/name-prefix.yaml b/Documentation/devicetree/bindings/sound/name-prefix.yaml
> > new file mode 100644
> > index 00000000..b58cc9e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/name-prefix.yaml
> > @@ -0,0 +1,35 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/name-prefix.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Component sound name prefix
> > +
> > +maintainers:
> > +  - Jerome Brunet <jbrunet@baylibre.com>
> 
> Since this file is referenced using "AllOf", am I going to be listed as
> maintainer of all the drivers using the property below ? I'm not sure I
> want that ... :P

No. That's not how it works. You're maintainer of files that list you as 
maintainer.

> Maybe it would be better to drop the above ?
> 
> > +
> > +properties:
> > +  sound-name-prefix:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: |
> > +      Card implementing the routing property define the connection between
> > +      audio components as list of string pair. Component using the same
> > +      sink/source names may use this property to prepend the name of their
> > +      sinks/sources with the provided string.
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    analog-amplifier@0 {
> > +        compatible = "simple-audio-amplifier";
> > +        sound-name-prefix = "FRONT";
> > +    };
> > +
> > +    analog-amplifier@1 {
> > +        compatible = "simple-audio-amplifier";
> > +        sound-name-prefix = "BACK";
> > +    };
> > +
> > +...
> 
> 
