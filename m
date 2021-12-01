Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BBA465A0B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 00:52:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E6626B1;
	Thu,  2 Dec 2021 00:51:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E6626B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638402720;
	bh=qxwCwbfSgPiOiKCjokJ9EtUPK3eLmrFK413TIwRInDw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rCvewGA67/VX9Tlpab0GEooRhMj9PXB8h21YISDFVxQOZdFvTU6mLF7F63YB8teRU
	 OYd/Q0P1tgaGDk39VOGl+4XbpmYYHOyFImqxZtPLw/wEKqPP4Ih1zRLMRV0tcxXjtA
	 YfvLrQkmPL1V6yDtP7S0hevjrhxtKSdU0gggs0AY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6078EF804EC;
	Thu,  2 Dec 2021 00:51:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7424CF804EB; Thu,  2 Dec 2021 00:51:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02CEEF80121
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 00:50:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02CEEF80121
Received: by mail-ot1-f43.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so37588739otj.7
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 15:50:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=janDAtSPhWlePGFNQ++EVF7JDjqdKemONodqemusei8=;
 b=YqXNnPmJQMeeh8QkH/d/2e3PFGfLjbFGQwLrl31hSRRHSMxqhTmnC/JKIJIoWxrfTK
 nWnZDxzzxqDV7TRaTy6EV5xG1b+Q8Z7nThXblmvbgjX1joy9quZqZIsuE2ZXXdQBMviN
 9FnbSi8UtbZHx0X6aLDuVjnODZe6TCLrIsCxkTgTrJ5XGnI4XmpKOroY7gy/+HFYl6Kl
 rwCROLO+pDnPbj3lyCIcUMnYFwm9gYMX4D71+tSJMWSpS0kkgzkB1M6ZU4YFdCAqYt9g
 sgsEf5orRAi8UO7xXXTb8a1fwnQF6PVYsDcAixS2hADVbA0t6UHYTsPGwcYwOJbYQYh2
 Oqjw==
X-Gm-Message-State: AOAM532E9QD9BEa807FhNa1QhucSogEPYoUbZTdRlGrMbmw9nNNp4fql
 qLrsZQ+36xTEkgrFex6cog==
X-Google-Smtp-Source: ABdhPJx5TFH68EuJ9T0gpn/g1grXRTeXYFnflCit2PV7CCMx8U7wAVQns9O50JdQkJLNhGx8FpK1Rg==
X-Received: by 2002:a9d:868:: with SMTP id 95mr8732322oty.211.1638402658107;
 Wed, 01 Dec 2021 15:50:58 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e28sm624819oiy.10.2021.12.01.15.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 15:50:57 -0800 (PST)
Received: (nullmailer pid 3243259 invoked by uid 1000);
 Wed, 01 Dec 2021 23:50:56 -0000
Date: Wed, 1 Dec 2021 17:50:56 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 04/20] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
Message-ID: <YagKYCbHw5BHAcdI@robh.at.kernel.org>
References: <20211126161807.15776-1-digetx@gmail.com>
 <20211126161807.15776-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126161807.15776-5-digetx@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
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

On Fri, 26 Nov 2021 19:17:51 +0300, Dmitry Osipenko wrote:
> Document new optional sound-dai-cells property of HDMI node. This node will
> be used as endpoint of HDMI sound DAI graph.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt  | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
