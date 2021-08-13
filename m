Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DDA3EBD29
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 22:14:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EF041838;
	Fri, 13 Aug 2021 22:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EF041838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628885667;
	bh=Qs2NF/w5evjrHypN01X+MZc6779EM2oLdkBOKRBcHQ0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EVziEfqXa57SFCnVoghExrskOpkNBNJvAWF2VsXxYU7e5ZbzCqUEbC5zarF+a8Ou5
	 TJDPIRzcGneHaw/iaYoOQJQ1Ria8eT0lPVrddTrSglJOEI9bC/nohtvWR6690Ic93m
	 wOSq2/PLVrwT8PAEKic7+FF7d1qbEStboiFSAuGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1862F804B0;
	Fri, 13 Aug 2021 22:13:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C699CF804B0; Fri, 13 Aug 2021 22:13:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A54FDF8020D
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 22:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A54FDF8020D
Received: by mail-oi1-f169.google.com with SMTP id h11so17706572oie.0
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 13:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OquAakahea26nEMMYnVSuFdMaOwT9nWOuEZ5pT1GDFg=;
 b=BTBpQmohm8J1zyNet3QaAgbKDaC175c2b9VXftBFZ2r2NZFMs0UMB+AAwpteWfDalJ
 m2pwSbvnA3YnHab0M6mVqC8fHXHdq2B+zvWLCSuUKI1BfhQ4mBw3WmT4x3oa1VXwyq3w
 BhdgMqC3RfetDDQFrTRj6+bGgcgtiVegpsleJP9PUbCifeUbjJZdgXGmzbuNKC+hSlY/
 biLuNR+Vw5KfuJalhYu/6HcScda9MXmMCxDyltk/VWCfTMM7RHBLttTOA+OxrdA1qJir
 2SZ3SJK/35Ctc7I2a9eVkuZjzCwk5t5Rcww5NYudJZzuI7OpvN03nDPVUiV741zsWZzY
 YUAA==
X-Gm-Message-State: AOAM532EW9TJfRyxcWN39DN7QqgvoC3bZ6NXNLFSXw//B4UYGCP/U8Vo
 ImOMZFSJV7KxTKaTTP94mg==
X-Google-Smtp-Source: ABdhPJz+sTeYclyG6tB76eUhdgMTPu4W3K1FCrw3tb0uxcBscFGu5U1dDPVVvXhkvpngfi+DznOqcA==
X-Received: by 2002:a05:6808:1389:: with SMTP id
 c9mr3468628oiw.89.1628885601554; 
 Fri, 13 Aug 2021 13:13:21 -0700 (PDT)
Received: from robh.at.kernel.org
 (2603-8080-2a06-ed00-7254-0b80-dd3c-00c6.res6.spectrum.com.
 [2603:8080:2a06:ed00:7254:b80:dd3c:c6])
 by smtp.gmail.com with ESMTPSA id o18sm558321oiw.27.2021.08.13.13.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 13:13:20 -0700 (PDT)
Received: (nullmailer pid 3945957 invoked by uid 1000);
 Fri, 13 Aug 2021 20:13:18 -0000
Date: Fri, 13 Aug 2021 15:13:18 -0500
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 2/3] ASoC: dt-bindings: sound: renesas,rz-ssi: Update
 slave dma channel configuration parameters
Message-ID: <YRbSXn9P41o28u32@robh.at.kernel.org>
References: <20210806102930.3024-1-biju.das.jz@bp.renesas.com>
 <20210806102930.3024-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210806102930.3024-3-biju.das.jz@bp.renesas.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Mark Brown <broonie@kernel.org>, Chris Brandt <chris.brandt@renesas.com>
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

On Fri, 06 Aug 2021 11:29:29 +0100, Biju Das wrote:
> The DMAC driver on RZ/G2L expects the slave channel configuration
> to be passed in dmas property.
> This patch updates the example node to include the encoded slave
> channel configuration.
> 
> Fixes: 5df6dfbb6de815ba3a("ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Note:-
>  This patch is based on [1]
>  [1]:- https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210806095322.2326-2-biju.das.jz@bp.renesas.com/
> 
> v3->v4:
>  * Updated bindings as the DMAC driver on RZ/G2L expects the
>    slave channel configuration to be passed in dmas property.
> v2->v3:
>  * Merged the binding patch with dmas added
>  * Updated dt binding example with encoded #dma-cells value.
> v1->v2:
>  * Rebased on 5.14-rc2.
> ---
>  Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
