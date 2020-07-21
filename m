Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD6F22770F
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 05:37:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A28CD1678;
	Tue, 21 Jul 2020 05:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A28CD1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595302650;
	bh=3fBH0klz0fm9ReZinxYrQPMQRKhmMW0koH78by8tf1c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mg5R+7Bdf8ALz2BDtInQuFrT9j61pBukSm27qfinVAxAavBdPPpyxa8N6rF1GqbRm
	 z9CWbbL14iVz93rHXoIENiXTL5c4t75RkI2M5qt5ocJkQsrJcpaArj8EY48rgeuiGD
	 ZsYwk4UzpQOiCy+ltsevNJdcMU8GIXsyGPw0dxCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AEBCF80290;
	Tue, 21 Jul 2020 05:35:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB0EDF802BD; Tue, 21 Jul 2020 05:35:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C450F80268
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 05:35:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C450F80268
Received: by mail-io1-f67.google.com with SMTP id p205so19872953iod.8
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 20:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3efDbbFBeN9lqo2tvpiUSIlbTXNfjWRmqWbgrnEOjxI=;
 b=sov4gINP0ACHZ+kjsTUFyPN7XAHdc+rpi2gfZHwsGEe2MOsDAZFp6pF04wBecslewR
 ihDw8UGYSxtmsNzcZY3Fnhjc+Ab7MHhRAUa73zSCbs8p2fYPNjEgY7TES9PNh20wJ+FA
 6qxTrBOFhNGmWL06sO+8bBNSAXDeFxkiFAPvLQxtuCSxFbwStPr0rQQMp/TEbBZz80DB
 31QvAklk80IPFz6LGP0WCr2Db49Xp5G6AsG+3TTQTlvSBfNs1x5GA/os7lP1a6+JJ7zr
 7qI2zzouT7ojdQMH2C89Khn1U1ogoNBjLLosoDXF6UzsOSkjAvpf79wglfVOUPnYeQyV
 khgA==
X-Gm-Message-State: AOAM530viDYcXEOilU5tZozEqTHx20UDE1jPToGQOV0bwJoRTShqjpJZ
 lxfm1EmDxe3QUsj/gVI6NA==
X-Google-Smtp-Source: ABdhPJxyTK/slrF/ELkVKEXDGq34caiEcqrqROYHvjuYHKegslg+EOIDnAZwxhbIOcvtRfx4gn0QQA==
X-Received: by 2002:a6b:4409:: with SMTP id r9mr25670926ioa.158.1595302526232; 
 Mon, 20 Jul 2020 20:35:26 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id m5sm9868709ilg.18.2020.07.20.20.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 20:35:25 -0700 (PDT)
Received: (nullmailer pid 3505359 invoked by uid 1000);
 Tue, 21 Jul 2020 03:35:21 -0000
Date: Mon, 20 Jul 2020 21:35:21 -0600
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 08/20] dt-bindings: usb: usb-xhci: Document r8a774e1
 support
Message-ID: <20200721033521.GA3505276@bogus>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594919915-5225-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-i2c@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Niklas <niklas.soderlund@ragnatech.se>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org
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

On Thu, 16 Jul 2020 18:18:23 +0100, Lad Prabhakar wrote:
> Document r8a774e1 xhci support. The driver will use the fallback
> compatible string "renesas,rcar-gen3-xhci", therefore no driver
> change is needed.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
