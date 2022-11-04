Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C30F61A37E
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 22:40:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C3F015C2;
	Fri,  4 Nov 2022 22:39:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C3F015C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667598020;
	bh=9xH3Q7olL+JKBBt7AnMk2GFmK+SFupf1DRss7UWhxGg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FOYMovKpSbLsRBqvrIxzUR/QrU+0jdsxKSNZ3TW8QGaMrLNCDmrM3D/amrV0nHnb6
	 Yxb6cEegWgfjTCFGqU9XZvFpRtRI6lxL3nCufvNh7LjGMBHTX8/rAIDbF+GdOVFpUh
	 Mn8rHhWT8riF9hxtlMA3dOy+1LqnniStY0zNUimk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AD9EF8047D;
	Fri,  4 Nov 2022 22:39:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFDB1F80448; Fri,  4 Nov 2022 22:39:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2AD8F80155
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 22:39:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2AD8F80155
Received: by mail-oi1-f178.google.com with SMTP id n83so6486433oif.11
 for <alsa-devel@alsa-project.org>; Fri, 04 Nov 2022 14:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=newmcT3dWVHHi0k2AzKHxIAzbgauqUYBBbVo3BlPTgk=;
 b=4t0EtB99PGBQETJD6uVFYG2qYHJkJxO6+9bZE8n9KvapWyJpRcTPprX0r0TG4mUK9Q
 y44nKrWW6+21JTqQExwhvNovjNwWHTnC8oYFFLl5QB3XAjmlapS9VewDssmRtI4tTgqW
 ti8x3qVvhXJMVo3U42uPWYd6QkV6T8vVYE9s83WsYQcG9VkezlDmQBCaRWN0OWjmSO4B
 RI2PgyPmMTVdgNbO4jyH95J89JInOv8v4cIbOJuz78TRxlkTr0MzMptzJ2saqujQE3MH
 csN6LrbU0MpTVTEuykJPpYPixY7icj5UpWZ0zbdWgaF+FnIcb8ycNtnjkdqixQtgS1Ij
 aokw==
X-Gm-Message-State: ACrzQf0e+WiZpVvAcku9+bQG/BAhCzboU+GthHlAQMvYEX1xGouxKugY
 Ug1sYFCD68WbxJ+m9Aw8+g==
X-Google-Smtp-Source: AMsMyM6ECrXkT2/0pcWb+2yxaeQZEWevvl9EUUDRIk2D/iBgUdWBGzVwCL0SMNW/QXnmtgckjY5lqg==
X-Received: by 2002:a05:6808:3dc:b0:35a:c37:3309 with SMTP id
 o28-20020a05680803dc00b0035a0c373309mr15750204oie.199.1667597956330; 
 Fri, 04 Nov 2022 14:39:16 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w2-20020a056808090200b0035763a9a36csm75651oih.44.2022.11.04.14.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 14:39:15 -0700 (PDT)
Received: (nullmailer pid 2876506 invoked by uid 1000);
 Fri, 04 Nov 2022 21:39:17 -0000
Date: Fri, 4 Nov 2022 16:39:17 -0500
From: Rob Herring <robh@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v6 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
Message-ID: <166759787920.2873722.6503685794432759025.robh@kernel.org>
References: <20221102125936.2176748-1-ajye_huang@compal.corp-partner.google.com>
 <20221102125936.2176748-2-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102125936.2176748-2-ajye_huang@compal.corp-partner.google.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu . li" <chunxu.li@mediatek.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


On Wed, 02 Nov 2022 20:59:35 +0800, Ajye Huang wrote:
> Add a property "dmic-gpios" for switching between two MICs.
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml        | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

