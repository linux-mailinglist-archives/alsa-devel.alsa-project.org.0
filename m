Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA11403988
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 14:10:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3725B1663;
	Wed,  8 Sep 2021 14:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3725B1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631103027;
	bh=12VK/9TbnJiySzDVMaLZPEjAY3p8qHRe4JK0bNsJtF4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cxfcLkZUTnPKR/4weXHhHfxvpCKei6LNPC8rmI41OpmI7d+GNy6HWCw6/RupbyRSG
	 ffOOrQ2yXbif3kUeILqZza+uOWWt+LNCBC2q+N2FzEgUr+TWCnTPUlG7l14iJ6sg3H
	 33DQhpfkIVENWk4lt/BImSKBbP+HPGqRPHY5hSDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B117AF80149;
	Wed,  8 Sep 2021 14:09:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1067F802E7; Wed,  8 Sep 2021 14:09:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA5A5F800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 14:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA5A5F800C7
Received: by mail-ot1-f46.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so2565868otq.7
 for <alsa-devel@alsa-project.org>; Wed, 08 Sep 2021 05:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vrLLvw3xOTTCRU86Xfj4PMbgmYuibMDeCWrdzyiGca8=;
 b=EhFNdj9zbhd5NiZiY/RaGtcskx+uSjVWCGovsFTlvKmKHoolDRRVzjRm3PofxWFw1p
 sZZ4gHwZ+kxfHwOG2jEe02Nwhg6qA9o6eetF4UwU37Ha28rwlA/+f0ivtCEK2DFUDvZh
 2QZQdBk71H43uWR4rhw1IbpDfdMZF9OJmJLKjCZgVQLzNCYSvbXuCAFKb7yyaTvRX4TU
 TVxfYZshIAuMRkFf51r7deTamTtWNOvuNJ3E/k8Fb+8imqtlUEoQCootxC6l5hej+JBI
 l36bx7JrnmQJgG4+XtTwyHBbFaJqwxGUKX9HEMgoFsekNHxfTQC6s53p/A066H3Ml5s6
 93xw==
X-Gm-Message-State: AOAM532FWYR6R4QHuWS4NlR7xGJN04VONb3YOIhEEQGzwWV03gU1FVJT
 7lLxI/pFnsf/ovvZGM3hfg==
X-Google-Smtp-Source: ABdhPJyKe/fxlDI+Fva7pn1G9AJ4ZdpS+C3pvKgu6+LleWD1wC5liKyozojGH0TXlI8unEmxTos7Bw==
X-Received: by 2002:a05:6830:603:: with SMTP id
 w3mr2664233oti.147.1631102935279; 
 Wed, 08 Sep 2021 05:08:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k21sm397255ots.53.2021.09.08.05.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 05:08:54 -0700 (PDT)
Received: (nullmailer pid 1867581 invoked by uid 1000);
 Wed, 08 Sep 2021 12:08:53 -0000
Date: Wed, 8 Sep 2021 07:08:52 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: sound: add rockchip i2s-tdm binding
Message-ID: <YTin1C4DHMTIAwH7@robh.at.kernel.org>
References: <20210903231536.225540-1-frattaroli.nicolas@gmail.com>
 <20210903231536.225540-3-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903231536.225540-3-frattaroli.nicolas@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On Sat, 04 Sep 2021 01:15:34 +0200, Nicolas Frattaroli wrote:
> This adds the YAML bindings for the Rockchip I2S/TDM audio driver.
> 
> Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> ---
>  .../bindings/sound/rockchip,i2s-tdm.yaml      | 218 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 219 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
