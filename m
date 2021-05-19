Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A483895ED
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 20:57:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE7921679;
	Wed, 19 May 2021 20:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE7921679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621450625;
	bh=sFhFcNzf0yu48jsaaUnw5mOIGpNU0JuPIXuP5h0p0gs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IoYvsLIZg58lgeTA25Aelhhag/XEQt+erKSxq6xQMm+3EI8GgKn8uuWriGrXhbtDY
	 HlSSDhSDuhu/Q8RMFGwpkhIQWR+PyyFEXWJJ5vIdUqxsHJoy3MLZZ1RxGPjXHU4/sn
	 BpNS/pl3aT1T47z9kB//izZfjzUGBR99B37qaqiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CCF3F80127;
	Wed, 19 May 2021 20:55:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99471F8016E; Wed, 19 May 2021 20:55:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13DB8F8014C
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 20:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13DB8F8014C
Received: by mail-oi1-f175.google.com with SMTP id w127so10225458oig.12
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 11:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DfJwaFSSdfu0thZ2Cn3t+uJakI2Lyxq/EcGAu8YcPsg=;
 b=LMk7xGUU1oAJg2zpquqKiDPPgsnQraU0StmquBjhMBtwRrJNjYb7bmIM06zMKlXFqb
 gUkBIzZAyjiukEq/jy4F8G2cfZ+MTcmnLPCCd4P7ZFldzoMxj7RdVsRT8cjjliRaIk+a
 95BWjzAaxQdwOG8ai7hhBcd3eH+ZW1Cb0Lxq5D/GfKbQCyIeusdGoweES8VtGrsedf+9
 1BSsuAF/0yvjIi1zJkOO9loPjLHjQPcoxfwSrxLAHPoljO8BdTph8hM+9nHD61BbUzow
 nQLR0OOsd5KJUGdjP2iyqlGVNDZbVc0+VIWlQTEdsxwiqZ8WKqQdbFIuMvzw2gUu5zUt
 1YgA==
X-Gm-Message-State: AOAM533rSoyRItskGOhnEFBDsFkN4eQ5rwps5gi03Xw26pgaQ1rtJEFE
 mxgYpfw6g9yPQDSx8qWTkw==
X-Google-Smtp-Source: ABdhPJzoGCN0N40Nhaq9Ddug/dAwXluP1+HZQcWkRFpkBk/o4g6/sSDkr4/qhIyZP2IC3dnt/zTsSA==
X-Received: by 2002:aca:1015:: with SMTP id 21mr495980oiq.92.1621450524171;
 Wed, 19 May 2021 11:55:24 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s17sm46433oog.31.2021.05.19.11.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:55:23 -0700 (PDT)
Received: (nullmailer pid 3449813 invoked by uid 1000);
 Wed, 19 May 2021 18:55:21 -0000
Date: Wed, 19 May 2021 13:55:21 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: imx-card: Add binding doc for
 imx sound card
Message-ID: <20210519185521.GA3449751@robh.at.kernel.org>
References: <1621247488-21412-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621247488-21412-1-git-send-email-shengjiu.wang@nxp.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, festevam@gmail.com,
 timur@kernel.org, Xiubo.Lee@gmail.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, robh+dt@kernel.org,
 broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

On Mon, 17 May 2021 18:31:27 +0800, Shengjiu Wang wrote:
> Imx-card is a new added machine driver for supporting
> ak4458/ak5558/ak5552/ak4497 codec on i.MX platforms. But these
> DAC/ADCs are not only supported codecs. This machine driver is
> designed to be a more common machine driver for i.MX platform,
> it can support widely cpu dai interface and codec dai interface.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v3:
> - use a generic compatible string as Rob's comments.
> - change the file name
> 
> changes in v2:
> - update doc accoring to Rob's comment, use the common porperties.
> 
>  .../bindings/sound/imx-audio-card.yaml        | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
