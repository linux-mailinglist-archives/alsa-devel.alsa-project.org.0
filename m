Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 878083A49C0
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 22:01:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A01F11AB4;
	Fri, 11 Jun 2021 22:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A01F11AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623441679;
	bh=sRy+jQEkIHOB6HRr5yH1kNEl/T9Ug+vd5ir6oS5/xio=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BUbMGLj+iy0I1hucEGJQ+LM2b1hyfOHOKxC5+zl+w1EUloZRI+3WI8wErnjradcKH
	 kHPRPS0k5mFDayreHIxD16BZ/0991+/AkyVAiiC/HQsVjPVQShdSX6/jFhrr+1x/0+
	 UyYGafASKX3Ca1UkVVkTwQyB2/Qdwb0HGAwwZ5bY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9ED0F802A0;
	Fri, 11 Jun 2021 22:00:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3610EF8027C; Fri, 11 Jun 2021 22:00:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65EFEF8026C
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 22:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65EFEF8026C
Received: by mail-il1-f171.google.com with SMTP id i13so6243999ilk.3
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 13:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DzmVIjfzBD5jhfScoy5heM8EH5uUqlFxXkGnXNxuSAY=;
 b=pO131w5wQY6FrpLDKtQ2j+kyLTZIYF5zQtxq/iYrrEyGq+yfuO35b7QUWAmSDCzkxl
 onv2prFPrbOceq13Ugh/EzBBbtMU86FsLd4wIeofDefvnhPxU2qtdEbA9lZroefCoN7H
 s2qzgAuGgwoh4VA4ZlYh3DhGq+Wkp7THsMsMZeaW+VkyDH09Q2pqBp6f4T+1b/Dg3D+V
 IJP1DMsdKR5gFFPsv4QpabLYQ4u9TeQzd6iRoXaQbwGL5sFD6NxxdNCoNyjAyNIDAPnd
 Tr3nASa6NumaDD5+M/mH34W9cPnVE4js2J5XzyuIik6Ik1jLaSPAMSjI22XVTmRH9t34
 dldg==
X-Gm-Message-State: AOAM531G5KzUtpDcAxYPr4g2l4vJvR2V5611CPqSZeQy5ttYUdf36i4u
 MKuI0zjBbGmuHuSGL7EyEA==
X-Google-Smtp-Source: ABdhPJzVeNzzrXgrr9Ha2gZ9pD2XPuSKMASquAuSOHl4eL8kE92/WuTc4NVmGrPRmMyxKaJYaaVogw==
X-Received: by 2002:a92:7d07:: with SMTP id y7mr4480835ilc.68.1623441617690;
 Fri, 11 Jun 2021 13:00:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id 14sm3830076ilx.61.2021.06.11.13.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 13:00:16 -0700 (PDT)
Received: (nullmailer pid 1583052 invoked by uid 1000);
 Fri, 11 Jun 2021 20:00:15 -0000
Date: Fri, 11 Jun 2021 14:00:15 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl,spdif: Add compatible string for
 imx8ulp
Message-ID: <20210611200015.GA1582999@robh.at.kernel.org>
References: <1622613849-10271-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622613849-10271-1-git-send-email-shengjiu.wang@nxp.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org
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

On Wed, 02 Jun 2021 14:04:09 +0800, Shengjiu Wang wrote:
> Add compatible string for imx8ulp, which supports spdif module
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,spdif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
