Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDFB227710
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 05:38:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4528C15E2;
	Tue, 21 Jul 2020 05:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4528C15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595302697;
	bh=QUh4WP32Zhn1T9n1H/an9RfsyceSIFgXaxt+jxn2D5E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KNOxmZed6mjQgnzSF0eROdjqeHeZrb9oOu4kx9Ec6gUOM7RxqKgh8spS2FVwnes8I
	 F00a0fgdi7facQn5hONDLyRvB2yOr71fHJcqGpH4pm9smc6c1IsiqZ78Uzuguo0Rf/
	 BZeu1A5Mob3PnsUDdZ7qNNxrLFU15sFeM8sr0910=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0F2FF80279;
	Tue, 21 Jul 2020 05:37:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0325AF802BE; Tue, 21 Jul 2020 05:36:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FA83F80212
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 05:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FA83F80212
Received: by mail-io1-f66.google.com with SMTP id d18so19910356ion.0
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 20:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XLGTyXCkmMJoVwCT0eUYcNsMnQ7R+zGFloTuhsZ5vXQ=;
 b=KHMq6Y5KsbWWyCLd5gs+N9GzhGM5TDZwxe3i8GjN2db+H9wYdJ4uk86w2Oga7lJ7/X
 7VBejeGwCDs8k0KU8UN/lzz55vbAaD8a+5mz0SZ4Y9MAqAuhcK4Xi2EG8WjR0Ua0TTMv
 q9n5sjI6OBnQqAPfpyE7jiiKcATgKxpKDE37puvIitHNA7hU1jrXKoemKM165OjhTON7
 iYVHErH+R3OFrORdf84P+yrnekxuYKwa+WgGeWZ9bWnBa/S/Cl9onL6APGuRU3aX0A2v
 0NuRSrDigfVoTi8tN/kofBsU4armzXfRfpOyDKiDvXPEgBtenmd/p660gNrGPZPaWZc1
 QhUQ==
X-Gm-Message-State: AOAM530W3ImM+2AI8U9EIyAKhgVIMnur+RJ1EqT0jvI+QPcJ0NEB3nvi
 +y2SqsQRC+/a6ZVMc9fTYA==
X-Google-Smtp-Source: ABdhPJxuljtBA6IS7ZsT9GN703rwNxLoyaryqa25QgNuRvDnlFpDQSGZSl22m1OvsKcpvDZHSnDk2w==
X-Received: by 2002:a05:6638:1014:: with SMTP id
 r20mr29509699jab.44.1595302568835; 
 Mon, 20 Jul 2020 20:36:08 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id n7sm9796964iob.44.2020.07.20.20.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 20:36:08 -0700 (PDT)
Received: (nullmailer pid 3506684 invoked by uid 1000);
 Tue, 21 Jul 2020 03:36:06 -0000
Date: Mon, 20 Jul 2020 21:36:06 -0600
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 16/20] dt-bindings: media: renesas,csi2: Add R8A774E1
 support
Message-ID: <20200721033606.GA3506635@bogus>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-17-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594919915-5225-17-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pci@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-ide@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-i2c@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Niklas <niklas.soderlund@ragnatech.se>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Thu, 16 Jul 2020 18:18:31 +0100, Lad Prabhakar wrote:
> Add the compatible string for RZ/G2H (R8A774E1) to the list of supported
> SoCs.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
