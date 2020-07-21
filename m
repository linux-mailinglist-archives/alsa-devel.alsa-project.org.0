Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44131227711
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 05:38:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8E7E1669;
	Tue, 21 Jul 2020 05:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8E7E1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595302738;
	bh=66esNYNQdR8zRUAUWKaqOVWSF/r9QbOCqiD9gADqXjg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uy/OxeHrDiGZyWycYFir9mFOJTljtr2F1WICEawIfHH9BqMbhtdZXXKxuVXpPecNy
	 VU4XObwScNw5ioJfIxgrmat/qPV9HQ1ho+DYhV8uyHnTH0Wscgb4x44mO/MOlSYXFd
	 5q696lNCeOuUvN+CDrPGnK1yPY9GgYxpSBJyQbIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08A54F8028C;
	Tue, 21 Jul 2020 05:37:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC1CDF8028C; Tue, 21 Jul 2020 05:36:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69640F80087
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 05:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69640F80087
Received: by mail-io1-f68.google.com with SMTP id e64so19889044iof.12
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 20:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SAsJo8xERfHGR71VJmv3ZbMcHE9rd42Dv9/4mhEH3Wg=;
 b=tTlVeImQbZcaJTzrZyslCTilZ/8g5KCPOvYsdTog2TdN8gFl/do9Iv6eiZabpHysJ4
 IyJRPs5NuPCohCidtfokDu1UFPbpQ3BOVH7klZw5FuNS2pgtOeoLPPUVmqlIPZcpPzXE
 C9WCCq3oWcCgOLYlofXIrb3axJpBkwj4mUD4OrGtAPSZFqw9JzCKGH/wzxylRXsU3c4D
 tpPbgDGQAcZAjnxRzxPpXduxYJRL6jZYfcSD1Z3jzesE9O7tBKeSdEty7eAFL7n+FrLG
 nFfi5+8sVaXydCjeMIJHAHO2mJ6e9Dxgselq9NJmY2Kc+vRWz7L6jCrWhE0nDOpx2uEX
 TEGA==
X-Gm-Message-State: AOAM531/ZZUSJewDl6qDDUj/Dee4bko3P/Gm8I7VrYgbQuZ4F/ZO43vm
 pkS/bP3E6sfhmp5bN8hrtg==
X-Google-Smtp-Source: ABdhPJzrFvJ20jW1Hp+YduXO4PyNsJdhSWfFUkY4PyKiuJTBmQeBTZsE38InZe1NYreyyZDeINhX4g==
X-Received: by 2002:a5d:8f04:: with SMTP id f4mr26176444iof.33.1595302584271; 
 Mon, 20 Jul 2020 20:36:24 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id m6sm10272866ilb.39.2020.07.20.20.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 20:36:23 -0700 (PDT)
Received: (nullmailer pid 3507107 invoked by uid 1000);
 Tue, 21 Jul 2020 03:36:21 -0000
Date: Mon, 20 Jul 2020 21:36:21 -0600
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 17/20] dt-bindings: media: renesas,vin: Add R8A774E1
 support
Message-ID: <20200721033621.GA3507062@bogus>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-18-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594919915-5225-18-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-i2c@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Niklas <niklas.soderlund@ragnatech.se>, Mark Brown <broonie@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dmaengine@vger.kernel.org
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

On Thu, 16 Jul 2020 18:18:32 +0100, Lad Prabhakar wrote:
> Document support for the VIN module in the Renesas RZ/G2H (R8A774E1) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
