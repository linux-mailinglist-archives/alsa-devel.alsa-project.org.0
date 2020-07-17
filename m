Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DA9223C1B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 15:15:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBF591661;
	Fri, 17 Jul 2020 15:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBF591661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594991700;
	bh=cRW5ZlLdUduLX6Ejz/U7B9v4LTong6Lpfcy8RRlKn2w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qusxPb5/FjXFl1sixmh+RcnFUihF1+e26Hod/GRNPdiz2vFlgamexpnApwJwi1A7E
	 b4hDhCfun8+qxBC19CukpEf0i+8Mm287uZBziW8835fq14FX7mmoT/nhXjB5876pJV
	 PyDbll0KQnB0Ghn3JUQnJvj7lZe/PSPdvYpAIMyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D633FF80110;
	Fri, 17 Jul 2020 15:13:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29FC9F80217; Fri, 17 Jul 2020 15:13:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3263F80110
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 15:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3263F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com
 header.i=@ragnatech-se.20150623.gappssmtp.com header.b="Yr2Iz1CP"
Received: by mail-lf1-x144.google.com with SMTP id u12so5999138lff.2
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=IYqIiSc4U+64C+dG7+7slm/+2g/0OvHpgIOhb6Omtgc=;
 b=Yr2Iz1CP+EXc8VfkIDEksEY8LuFINVnWrfFXlpNEfmNponbzhEbML51zKfKEJKcimu
 x1SnWuwfMbqbICdyW0Fkyf8z2jRI0dj2VVtiK0vt9+Li6/mx02iD09DEAMmmnGMZDFsp
 v9qrVYb5fPT/ksWDS6HEEEhxB3mgGQSgpTl9jkHinDmTnMJRBY6ZwvroDmZNtB+/ycaN
 R4CUaCV18VNjMH0K/SPqYMeAlS38rwJ6tO1YuLpWlEl1iGbu4ouGnMmwUp4Qy1S3HxPh
 0hR2twN4iNh9G++ahDfjijCYizBZwgESgeK8xKSjPK2A2oh26Hivv91I99y1X0ci9dI5
 5TjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IYqIiSc4U+64C+dG7+7slm/+2g/0OvHpgIOhb6Omtgc=;
 b=R3eNzxg7H1C085qn1ihLhoh1h/xlBFxCqHgJXU2Ln+tEmEagbbpo+y8PUdD8qJ7qPq
 Kww+GzlEjCeTF8t+93HFHRxWccyOiV7kvoz4QNi/AntR3+PXaxpfbZI6o9yEzk/9yVKR
 ywr1itfYwP9N6ozy2BKfV0C5J8gkEt4+rz1cEBocupjXBH0KgzAr9y9KCEW9NkUb4XlC
 1JZvB5Y42lYeMWFv0SkoV07/NG/Tcbn//sktEa6+70xDU7ztVfVeRdAb2RmrViipqFhE
 e+ai6vYlGv+2JMowc9VwL+Pkb/qyP6HKxEB5Q8H2RIeuuVFQNX++PHtP0srGKHiE7TQw
 dhSw==
X-Gm-Message-State: AOAM531X+ho5icIpi8kC93S5GFng86Q8FBU6PBNy2fhhxwoTNH0w+s0y
 doZWINb4xVppwvo7bpsQUfkftw==
X-Google-Smtp-Source: ABdhPJyuAt5XLkeaHa2ADqc8yqRKoh6hwmeK7QXeggSiowkUr6/ybt/t04bLY7BvMRtrHmWBjAcMCQ==
X-Received: by 2002:a19:710:: with SMTP id 16mr3866800lfh.171.1594991585253;
 Fri, 17 Jul 2020 06:13:05 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
 by smtp.gmail.com with ESMTPSA id j4sm1862395lfb.94.2020.07.17.06.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 06:13:04 -0700 (PDT)
Date: Fri, 17 Jul 2020 15:13:03 +0200
From: Niklas <niklas.soderlund@ragnatech.se>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 16/20] dt-bindings: media: renesas,csi2: Add R8A774E1
 support
Message-ID: <20200717131303.GA175137@oden.dyn.berto.se>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-17-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1594919915-5225-17-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-i2c@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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

Hi Lad,

Thanks for your patch.

On 2020-07-16 18:18:31 +0100, Lad Prabhakar wrote:
> Add the compatible string for RZ/G2H (R8A774E1) to the list of supported
> SoCs.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> index c9e068231d4b..53b078622fd9 100644
> --- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> @@ -22,6 +22,7 @@ properties:
>          - renesas,r8a774a1-csi2 # RZ/G2M
>          - renesas,r8a774b1-csi2 # RZ/G2N
>          - renesas,r8a774c0-csi2 # RZ/G2E
> +        - renesas,r8a774e1-csi2 # RZ/G2H
>          - renesas,r8a7795-csi2  # R-Car H3
>          - renesas,r8a7796-csi2  # R-Car M3-W
>          - renesas,r8a77965-csi2 # R-Car M3-N
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
