Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F8E44EDBF
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Nov 2021 21:12:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE954166E;
	Fri, 12 Nov 2021 21:11:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE954166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636747931;
	bh=/zHeOhB6ZjQwW8gPSIRWR+vku0hvZ63fSHcn8R6MRU4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nqEeGgnymhbqFcqmQ+LHoPlcwiTOzINr3S9ngtPokV7lsHF1UhTEx7Dg/C75El3s0
	 3749vnL1OkB3d3jhif9NRU4U00cNH/WOHSb0rcudCNZWYLZaJMElpcGPTfEy/UH2k5
	 HkNO8//hLGScF8A/KafdlyaRiII6hJZCPU9J1NTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38FE6F800C1;
	Fri, 12 Nov 2021 21:10:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B350F8049E; Fri, 12 Nov 2021 21:10:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9ED4F800C1
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 21:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9ED4F800C1
Received: by mail-oi1-f172.google.com with SMTP id r26so19963252oiw.5
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 12:10:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9WhJ/EjNNePoaOZvGJkmcFbg7yvTKkxsOk56AmN7Y+s=;
 b=qQ08xZHuU1G+BVRy1iJoJTi3fCrgza9SYgpOJ/33QaasxVcC6a1rMoUHUdONEZMzIz
 3oxMDmFHAM19x68kKSg/YvOuDQFiUyOnLNPDT+7yTnSquJ3jMg3o89JhgUmrCxzeSWIR
 GK4ZnHiS7DWH7KQMqOkGeCD1hjUexUCD3iPkOXSIsA2GDpb435J/51VYIQPk0JYf/3Bb
 mfmy3HLUC5ERKKQgFXkN+JQ947aiWYvyWSONhGN367QKrebB2wP3FCY+oxh8kG/PGtOQ
 yKzfJW1bGKqebbS2zxE6WVtx1bI7CyQHP8RB4lyaa/JJbJ46DSgycKp/3ZVyW53x3rxX
 SM5A==
X-Gm-Message-State: AOAM532Kvm/r1g0NAfBPXik4+oAYIj22tT+Gt0iRH47qY4VUdUa7ef9Z
 wH6A4w94Xoud/zDBTawUEQ==
X-Google-Smtp-Source: ABdhPJz5m+fIBjpw5F5peYuJ09KQImnLYi9vaCrFoMWMk0nUKJK3nt3vBV8Ay7r+mVs5n1Db2c5vBQ==
X-Received: by 2002:a05:6808:120e:: with SMTP id
 a14mr28430803oil.122.1636747843746; 
 Fri, 12 Nov 2021 12:10:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t5sm1221415ool.10.2021.11.12.12.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 12:10:43 -0800 (PST)
Received: (nullmailer pid 3287649 invoked by uid 1000);
 Fri, 12 Nov 2021 20:10:42 -0000
Date: Fri, 12 Nov 2021 14:10:42 -0600
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH 2/4] dt-bindings: mediatek: mt8195: add model property
Message-ID: <YY7KQi6KN4KzVvh1@robh.at.kernel.org>
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
 <20211103100040.11933-3-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103100040.11933-3-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 tiwai@suse.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, daniel.baluta@nxp.com,
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

On Wed, 03 Nov 2021 18:00:38 +0800, Trevor Wu wrote:
> This patch adds the description of model property used to specify card
> name from dts.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml           | 4 ++++
>  .../bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml           | 4 ++++
>  2 files changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
