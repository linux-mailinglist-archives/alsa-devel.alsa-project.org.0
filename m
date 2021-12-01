Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A875465A0A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 00:51:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 272E62697;
	Thu,  2 Dec 2021 00:50:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 272E62697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638402705;
	bh=1QHFpPZ0fsSVo0vCC1eh4Hmsy+J3QCYOnExPxw+tOMc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ahMjBopItx2XAl6VvPQtXPIlHqCbOkPJ/Pj0hPkFtt7reVGetKXYPrSmN5vFysNO4
	 Dk/8Mjhj/gqWsY5oGT7ONYWY+VOTQ+y23Bc1+UhpJSofxhBgIehnFkxxXELGt8mTpc
	 aTsd931k35TjACG1m683D/Qs0ijaUiJ1G51zCqJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0BCDF8028D;
	Thu,  2 Dec 2021 00:50:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94C5BF800EE; Thu,  2 Dec 2021 00:50:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D339F800EE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 00:50:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D339F800EE
Received: by mail-oi1-f178.google.com with SMTP id u74so52006065oie.8
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 15:50:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0IBjqdZEeeg77iPYkDZoFpBZRuuv2qtLrZudT3FLe2I=;
 b=0cpR4QElCOk1jXqzXgIp6VrDdmwUSEPnmhNHYLPuJnBG9GSxA6BfEB424aBNVEYE8l
 icImrv/oQlVow/KVgsU4pX1A505d2DyA3uLdCujsSG4xWoZ+iwucM/9Ou1s4T0KFJ4/d
 pv93cVgNS+PcCwis7l+bnkZ70CnluPtELerT2vswauX1IMYoy1fbNpOYqwGjocRVnK0U
 QZVP4gZ8hnuLjZ8JVZ8wqw4GFIq9w6DXWj3C9VjOCS22m6Fv7zxydejbQlLhPB3CqAH3
 U1XSlFXQErYfirepIumwWdnWdnLrZVUHeecX+DBG6XBgAI+Ysda/DsnzdHwYAY2z6fTT
 AcRA==
X-Gm-Message-State: AOAM530ilSihYmJz4MU0WcE11ouqusUl9pjf9dDpyohgr+S5Dbo2d9PI
 j2LVyA2T4I+NJEVerwUYTA==
X-Google-Smtp-Source: ABdhPJwn2VLKRH8+XzlklXlXHqPfdqGlRUdJfpAK+ZeM72wicy129S30tZtgMgot+gs2OS7mx1lWPg==
X-Received: by 2002:a54:4019:: with SMTP id x25mr1569020oie.116.1638402639199; 
 Wed, 01 Dec 2021 15:50:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bh12sm648367oib.25.2021.12.01.15.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 15:50:38 -0800 (PST)
Received: (nullmailer pid 3242597 invoked by uid 1000);
 Wed, 01 Dec 2021 23:50:37 -0000
Date: Wed, 1 Dec 2021 17:50:37 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 03/20] ASoC: dt-bindings: tegra20-i2s: Document new
 nvidia,fixed-parent-rate property
Message-ID: <YagKTc61evfbvhk4@robh.at.kernel.org>
References: <20211126161807.15776-1-digetx@gmail.com>
 <20211126161807.15776-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126161807.15776-4-digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org
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

On Fri, 26 Nov 2021 19:17:50 +0300, Dmitry Osipenko wrote:
> Document new nvidia,fixed-parent-rate property which instructs that this
> board wants parent clock to stay at a fixed rate. It allows to prevent
> conflicts between audio components that share same parent PLL. For
> instance, this property allows to have HDMI audio, speaker and headphones
> in the system playing audio simultaneously, which is a common pattern for
> consumer devices.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
