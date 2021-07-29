Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A05153DABB6
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 21:15:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B65F1EFB;
	Thu, 29 Jul 2021 21:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B65F1EFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627586111;
	bh=0LXBT65kHxVOgA+z1oFImOxSvXxAUkPZzmj09CHHik0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hxyAevQ9zFXTjADHiRi9hq8f90Ab+/jWgUCEdrEVRAKaktnsGKu9SECsOultQuhat
	 qs9CKqT0HV1vtXJzar4znojeeLVlcCXG31NCBpCUE58M+JS7C0EX28MJ0YMq5BchJZ
	 nq/NLfsOW2NFdrVf5AJn4AaWxeWCtMPeWh5NAi7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0AE8F8020D;
	Thu, 29 Jul 2021 21:13:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D603AF8026C; Thu, 29 Jul 2021 21:13:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BC26F8020D
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 21:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BC26F8020D
Received: by mail-il1-f182.google.com with SMTP id z3so6970292ile.12
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i3h26Kx16Zcu1mt0X0GwZ4P1P6W2hA/sItKkHmSYByU=;
 b=gfZK/DXHWQ4Qw84p3FCd7+LCFHfCBZdnuCyp0eBdIk1FZhc4ZXenHEPwga8v0dL6nk
 xGtluHQ+I+Kk++VlQKxjbhQwSIS07ct7zOSID3ZVousvop2yYDu0KAOH4g6LnbuVEIJN
 5v62/Zsr1YhLLpAxrNxxo7XLhHXFZza7oSK38zbvMIGPeDbxxNuG3c7FKTwThpHp/VY4
 v5wiLyTsohBKX2WHJ1H0ijNfLX+ABLEhC+XI/tHUJrX+L+NZrWASQg2GJP3QZ6bVqJiV
 4FT9RnMY/luz26uZkM0VeVEGhlkaCV8qwuqCpxdydGPQkyzs4eWytzh6AILxO5lL50k3
 Se9w==
X-Gm-Message-State: AOAM5336jIVkMtEEeSXe1NV+Qoxb4QvpZAtpbs4tt1tZcWC0fXd1MAdQ
 6S53Hwq9HFFrdOk92uJvPw==
X-Google-Smtp-Source: ABdhPJw/Y9xcUvYhpWN6T0Oq/RDzrHAisxvaEweS96xsGt8b+XEL6sLujl08FiBtcHBUJn5pYif7JA==
X-Received: by 2002:a92:c005:: with SMTP id q5mr4764525ild.117.1627586013001; 
 Thu, 29 Jul 2021 12:13:33 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id 20sm2074552ily.40.2021.07.29.12.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 12:13:32 -0700 (PDT)
Received: (nullmailer pid 712138 invoked by uid 1000);
 Thu, 29 Jul 2021 19:13:30 -0000
Date: Thu, 29 Jul 2021 13:13:30 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 6/8] ASoC: dt-bindings: sound: renesas,rz-ssi:
 Document DMA support
Message-ID: <YQL92t6h9vQh46TF@robh.at.kernel.org>
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
 <20210719134040.7964-7-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719134040.7964-7-biju.das.jz@bp.renesas.com>
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>
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

On Mon, 19 Jul 2021 14:40:38 +0100, Biju Das wrote:
> Document DMA support in binding document.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * No change.
> ---
>  .../devicetree/bindings/sound/renesas,rz-ssi.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
