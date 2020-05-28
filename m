Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0D01E6D51
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 23:11:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 931FA16AF;
	Thu, 28 May 2020 23:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 931FA16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590700278;
	bh=8duFg10Z/WnUMgpUUomO+Cr+4XIVEyIf3Ff41CJuD3M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Is3a+Bzk7qIu0mUO/pc9iL9/qyW0hif4pNBCzws9Rq60P/jDp8O6r4Kp0DdRdbiP2
	 nEhwk9IrRDrTfYzLwp4hC37slegjVeDnE42DJrNjQ9Nw1++s6tAIaPWtJuI3KYuLeb
	 4akAb5BRtjtl7NWvSeenW7YqgRThMqEQdPu5T7As=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3D9DF8015C;
	Thu, 28 May 2020 23:09:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30505F80150; Thu, 28 May 2020 23:09:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C14DF80107
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 23:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C14DF80107
Received: by mail-io1-f68.google.com with SMTP id d5so3504ios.9
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 14:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KmIOS5+GLvB/B5GJpxQI/Z/o0HmmZcFrKSOs+Nw0Guc=;
 b=fh+AMVcR3Z6LZvIGiKM2Ws7+bp2FpvtnVImRbGbvpBkxQoj8Xb/5g5Hxn/fsiQW/hP
 dHwit3442PuA82MNo0mQAzsbbbI7+M3pRUpThaOzEqN9p7XuA5o561tnHiHTNQb8c81D
 SZ24hvBSGfcQjB4H8Fm/ewa6j2dk5wODzZLgriMVsfpjf32jaPCXWWNrgY2PnrriCyY/
 inLoh8OCc+t5rH93FyF2LzV5yAIhXyXrJyRBOPsymx53aDW1jtse7SbZbC1Nh+pKHGjK
 PENvg2+6QoAe2FXLJfspUhWnoA4QVcRaBT8Btkf+1P9Oqm1HgUr9TY/ROTVK/w+Jgkat
 xe+A==
X-Gm-Message-State: AOAM531KjER3Z8gIUkXjt27loLeU8rINfeil7uR3O4mUhzkcgDaggDNC
 aQF1HJgZ++ErWfPrGDiELA==
X-Google-Smtp-Source: ABdhPJwgg174nsCuH+GseZ1yw5yXHdsR4u58wuHIZZnGe+eA2BMeqn5nERsGpQqZuBRBeAM1t6iL9w==
X-Received: by 2002:a5d:8045:: with SMTP id b5mr3914065ior.16.1590700166890;
 Thu, 28 May 2020 14:09:26 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id s2sm3650740ilj.29.2020.05.28.14.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 14:09:26 -0700 (PDT)
Received: (nullmailer pid 688065 invoked by uid 1000);
 Thu, 28 May 2020 21:09:25 -0000
Date: Thu, 28 May 2020 15:09:25 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: fsi: Add missing properties to DT bindings
Message-ID: <20200528210925.GA687765@bogus>
References: <20200519075858.27869-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519075858.27869-1-geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
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

On Tue, 19 May 2020 09:58:58 +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
> 
>     arch/arm/boot/dts/r8a7740-armadillo800eva.dt.yaml: sound@fe1f0000: '#sound-dai-cells', 'clocks', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Fix this by documenting the missing properties.
> Update the example to match reality.
> While at it, improve the document title, and comment the various
> compatible values with the corresponding SoC names.
> 
> Fixes: 7f464532b05dadc8 ("dt-bindings: Add missing 'additionalProperties: false'")
> Fixes: 2f52475bac7e1572 ("ASoC: fsi: switch to yaml base Documentation")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> For a clean "make dtbs_check", this depends on "ARM: dts: sh73a0: Add
> missing clocks to sound node"
> (http://lore.kernel.org/r/20200519075525.24742-1-geert+renesas@glider.be).
> ---
>  .../bindings/sound/renesas,fsi.yaml           | 29 +++++++++++++++----
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 

Applied, thanks!
