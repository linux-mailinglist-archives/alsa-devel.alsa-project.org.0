Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D432276EB
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 05:35:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42100165E;
	Tue, 21 Jul 2020 05:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42100165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595302548;
	bh=/Ruyt31NFI5sI30fJDI/y8nmbFQsM/U3W9lruITyABE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jwdo6yEVsogzcjOpEVGhREe43P+u/O6eOOYaGATwHeDxwjzL/m1ru8hQclJx0rB77
	 vOvnd2xpAZhzJWP7Pj9pJKaxj8bfv3zCwTh+kodPT2lWYDeHnRB0Yliqbcr3Mo3Zii
	 F6tTZ3Ykv34QuRNjrd43B4z2LoK9TTE2sTprs+yQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DF8BF80087;
	Tue, 21 Jul 2020 05:34:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 375ACF8024A; Tue, 21 Jul 2020 05:34:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88A88F80117
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 05:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88A88F80117
Received: by mail-il1-f196.google.com with SMTP id t4so15228178iln.1
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 20:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SBcdY3HFaainNH7/Ra9c82Wh/rj6UMBKXbkEBttOuWA=;
 b=shaJYt7YWnCRb8uuY0mArsI95DyIXzIdo7hIoWWfC//5pCXTPhaq86Q4Ruog8EfpNr
 URWWEmkvDSkeKkw58M8eL3At7xJJKEBTukTGhmNPnumBaNXZzjlJCQCSshFUINaIAJMr
 PZxmGepo10FfhBkekQWiDCC4eZIOvIrNtGctyXLZGyLurNMgaWpzfPNAhw8UdlDsVbxc
 bNuy0sSoff1+Mb/WfEQG0jkIbvz2OCpGRu7bjY/eh77S7YAl1c6HcJH7hMrcozBS6hr6
 t4I5K6AXdrGPsZZF6zUER0aPK9eP8ib3uom2s2A/ixs8SdOOGkllSF8tbAMNsDTSD002
 uHXQ==
X-Gm-Message-State: AOAM533Mc1ROIW/ufzxe1Mevj8EGpNjAz/CPzk0LgaJgi46vNuH10aE3
 d1SsPSIGPTq4z+qy4U2dzg==
X-Google-Smtp-Source: ABdhPJzQK7HIV/ZdYzlF04FRAnR2t2Iyb81D/LpbBVswH0ZpPuKlVzm71H/c6uxFmJxJiRvZiRiOvQ==
X-Received: by 2002:a92:6a02:: with SMTP id f2mr23892378ilc.68.1595302434623; 
 Mon, 20 Jul 2020 20:33:54 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id v15sm9039035ili.28.2020.07.20.20.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 20:33:53 -0700 (PDT)
Received: (nullmailer pid 3503019 invoked by uid 1000);
 Tue, 21 Jul 2020 03:33:52 -0000
Date: Mon, 20 Jul 2020 21:33:52 -0600
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 01/20] dt-bindings: pci: rcar-pci: Add device tree
 support for r8a774e1
Message-ID: <20200721033352.GA3502973@bogus>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pci@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-ide@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-i2c@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Niklas <niklas.soderlund@ragnatech.se>
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

On Thu, 16 Jul 2020 18:18:16 +0100, Lad Prabhakar wrote:
> Add PCIe support for the RZ/G2H (a.k.a. R8A774E1).
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/pci/rcar-pci.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
