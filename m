Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AEF4E572C
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 18:11:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC32B16FC;
	Wed, 23 Mar 2022 18:10:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC32B16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648055481;
	bh=bz7bBd9PLK2brV7zSolp21uib1aPGR62olQ3/3qXsXo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fDhnX0EUBeFtqv0QT4irytfdJa087WGgqkLOX5sm4vIhtRPdVxGuHxWa+e1ufh7Xc
	 pB26IYWqSRrOg84/c31ndHkcCzH5VQB58K70PnThWfgv2U6RpoOC2TUM3ujvR+mEvz
	 htIYAYvpqMg7l9vArhUB4CSRbO8nw/YBcUvhtkbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B741F80310;
	Wed, 23 Mar 2022 18:10:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C56B0F802DB; Wed, 23 Mar 2022 18:10:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F3AFF800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 18:10:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F3AFF800F5
Received: by mail-oi1-f172.google.com with SMTP id 12so2249944oix.12
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 10:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7hKrd5H7B7WvqIMdiaPvuwOv1aT0mWRSH/OSMprLgR4=;
 b=RnWowFvTgCdmedP7ZEOMSus0KrCANPaZbC8axwFA1Cxn2Zvs5rSNxzIcMq3no1vpnT
 LRjMNLHY+jqJc+H8SxsfuiGhLKXD3CQNnQsm0FBhYkeqBuSkNB1XdqQela2hfO7b3dvv
 A+bKrsRqob80619vfQnjJX/KgWYw76IOdhnKQfTNJV/OnSBNnKY3wOuxDTR1II3RgLoE
 Qdx9RQrqi6Ht5DLRrt/sf4lf6vp8E2DQgbEO3kaSMs/1LdFetnGLjrAz4+xxdgpENFJw
 CGENWLIG23a6rZ5QepXQlCtnhWao0CCAbX+jM6GruEYoSSaC2Sw8iuDo33XLEgcYHbFX
 ZyKA==
X-Gm-Message-State: AOAM531LvRL0KcG0BftYEsm4YrXMR+iMt2yzcDiT3MrF9TIxgZF0ULkS
 4ckEgo/8JXjRNiiRx+l17A==
X-Google-Smtp-Source: ABdhPJx8jPlgF405kvPPYl2lYEG107noZH9leUHMGog8OncHx0ZtDujB9+uS/h2L5Tca9Pa2VoBzyg==
X-Received: by 2002:a54:400c:0:b0:2ef:8951:a271 with SMTP id
 x12-20020a54400c000000b002ef8951a271mr535618oie.267.1648055401409; 
 Wed, 23 Mar 2022 10:10:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 11-20020a05687013cb00b000dd9b5dd71csm184164oat.56.2022.03.23.10.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:10:00 -0700 (PDT)
Received: (nullmailer pid 94890 invoked by uid 1000);
 Wed, 23 Mar 2022 17:09:59 -0000
Date: Wed, 23 Mar 2022 12:09:59 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v3 02/19] dt-bindings: mediatek: mt6358: add new compatible for
 using mt6366
Message-ID: <YjtUZ0gbt/KZ4WKH@robh.at.kernel.org>
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220313151023.21229-3-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Sun, 13 Mar 2022 23:10:06 +0800, Jiaxin Yu wrote:
> Add new compatible string "mediatek,mt6366-sound" for using mt6366.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/sound/mt6358.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
