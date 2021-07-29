Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2EC3DABAF
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 21:13:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DDA81EF9;
	Thu, 29 Jul 2021 21:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DDA81EF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627586013;
	bh=izvz3qgIrh+IksbLnuRRT83XGaqfqXcjGzI8vGSv35Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W+RKm63BgxJzdpW5oFpIEdVafq5buLVu66okIJJvhrjQvVvgq0cSS6yoR1cF8YUUS
	 qhOGEa0vQ/CQgUx34Es13ZJyuE2DLwZysdPN/3Z21hGNb+gtsp4+koNjGxQY2j42E/
	 iB1B6tolc65nAJNsP+kmjVP/OCUshFNtwIaovhfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 915B8F80258;
	Thu, 29 Jul 2021 21:12:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 695CAF8026C; Thu, 29 Jul 2021 21:12:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDC80F8020D
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 21:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDC80F8020D
Received: by mail-io1-f49.google.com with SMTP id r6so188403ioj.8
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NaSqg5Dy6NR+5wzG2UYaFke/OgRx15sowMjM1gKRcW0=;
 b=COtv3uRuTtXDk9FjLyxnc1R4l/htBW+Rg0Lhq1KyL446J1WMjEsL90dWxNDZVRiA6n
 jlLmNvugeRgAIhWpmOmErtRResVu5OmJljUA3AD66iPnVlPXutcb//P4vVjS+TH36BE4
 NuYIm9LX8kgqD2V/PPNd9oy1W2LDmUN6O5CK/T4Q6ECjYC7XMb9/hNUaxim/SgZfourw
 1Gwo5eBMV2grhSSXacmPLDY3zQHN7vN766jSczxPz11KzH/XkCnjehtMlNf6G8zknWPD
 O2RRhx7BX0x/BlZDJdtPF62fA2oejf6/udBAvJ5inoWQSzADQawU5HhJFpnpd5fkeMLP
 eF9g==
X-Gm-Message-State: AOAM533qT/HVRvKDF5MhLXLbFk0Mcbmx+zQUqBlJwXUr2peiInfUGKvY
 Z4g6gGpQbeaUJd7Gm7Eubw==
X-Google-Smtp-Source: ABdhPJyS1smTfMN39+3tatPcWeX5erHamYok3e4tmVqMDZMGCmohcJ5juqEvp15cA9k9S70+JXdRcg==
X-Received: by 2002:a6b:b795:: with SMTP id h143mr5320080iof.74.1627585915681; 
 Thu, 29 Jul 2021 12:11:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id 204sm2909507ioc.50.2021.07.29.12.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 12:11:54 -0700 (PDT)
Received: (nullmailer pid 709564 invoked by uid 1000);
 Thu, 29 Jul 2021 19:11:53 -0000
Date: Thu, 29 Jul 2021 13:11:53 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 1/8] ASoC: dt-bindings: Document RZ/G2L bindings
Message-ID: <YQL9eSVUzVxVUi7o@robh.at.kernel.org>
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
 <20210719134040.7964-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719134040.7964-2-biju.das.jz@bp.renesas.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Mark Brown <broonie@kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>
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

On Mon, Jul 19, 2021 at 02:40:33PM +0100, Biju Das wrote:
> Document RZ/G2L ASoC serial sound interface bindings.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * Rebased to latest mainline rc branch.
> ---
>  .../bindings/sound/renesas,rz-ssi.yaml        | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
