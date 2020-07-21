Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B45E122770A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 05:36:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52C4D10E;
	Tue, 21 Jul 2020 05:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52C4D10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595302614;
	bh=ima5I++EfNgkpGhOlf1qdlYvIoS5nIvajY//GV7Ng9E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cwQ6vkLz5PIdEsT38SKmktQpWsdHwQvNyXZ7NgIotiDbrTFstmwL3woqMMamWeybq
	 CV0gd0GZle+RpCQ9qeekY0oLe7F4kloByg933UJc4nEcnwpvtYBkR3rlfjtcuq1oy4
	 +/5HoeL7TmXXSy5vRV5CJ0GUl+OFdY93Spu/hgtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A36BF8028D;
	Tue, 21 Jul 2020 05:35:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0370F8028B; Tue, 21 Jul 2020 05:35:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE1D2F80268
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 05:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE1D2F80268
Received: by mail-io1-f66.google.com with SMTP id c16so19867710ioi.9
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 20:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jPBLAvgsfou0JfvJXuEQB+ES0YNVetU29UisTmz55RQ=;
 b=ncLvXXCoSwJHHm4S0brBckNFBb42memZSovMPM+ssK7G0mCrgfqV+S0bwL6o1qwfHv
 4If/f+y5VEN1HZLIpRv1q3DVq8X1uPXK4OdGIDEwNLsTYWWRcDXeRzxLDBWUBoG+O6xb
 1aINSc2WXTaUOmO/z7ebggb8jg/JnWciVrBTmrrGIL88kBGxvoK0q9m21WOvOzVOJEr6
 /fRUMf74/VE6jLwfT6CBHNlCBLZ1cp0xBF3zXzGbTXnd7QqtUxXErc051UGPnvgQejWo
 x8HPoCvW1Q6aJeF0Z19PKg/49l/ih1PhQqPh6wqv//gblA9yg9LrUqnd3z0dlxnZ+PSy
 QscA==
X-Gm-Message-State: AOAM533+qoAw4pZcqsOBb+wrWlOXRIi9yCq8YXuu/IiDhq44fvsji3vM
 OAt72mfLKr37X5ua9Gghpg==
X-Google-Smtp-Source: ABdhPJyiBOR2A1xSeEo/Gj95FPK7DAUeP62MF7tYceygME47H1J8elzK6W14mOyrg7scYIAlDdL/HQ==
X-Received: by 2002:a05:6602:1555:: with SMTP id
 h21mr25590702iow.163.1595302512823; 
 Mon, 20 Jul 2020 20:35:12 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id m5sm9868472ilg.18.2020.07.20.20.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 20:35:12 -0700 (PDT)
Received: (nullmailer pid 3504966 invoked by uid 1000);
 Tue, 21 Jul 2020 03:35:08 -0000
Date: Mon, 20 Jul 2020 21:35:08 -0600
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 07/20] dt-bindings: usb: renesas, usb3-peri: Document
 r8a774e1 support
Message-ID: <20200721033508.GA3504365@bogus>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594919915-5225-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Thu, 16 Jul 2020 18:18:22 +0100, Lad Prabhakar wrote:
> Document RZ/G2H (R8A774E1) SoC bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
