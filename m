Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C4EB8FEA
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 14:44:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28C721679;
	Fri, 20 Sep 2019 14:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28C721679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568983494;
	bh=oDVddZbkppNoUqxuxx9TUPsBy8O2gU/U/nBm8IIdGNk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UnalOYHBMvXetPBKwsjE/q+/45EOKvrqE4gXM7o2alZvYURA+b6EOGnkiQ9+1bH9q
	 dzuQRJ1bGO7rv5/MENGPolPfiaSOWpAyV2Bl/rcLvZzdMubLU6IanLTWYtPsfDDtfT
	 1CJxqHVDOfary2FHPOSDTCPHxaA/SNKoFrisscvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97AF4F80527;
	Fri, 20 Sep 2019 14:43:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6276BF80506; Fri, 20 Sep 2019 14:43:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EF6FF80096
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 14:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EF6FF80096
Received: by mail-wm1-f65.google.com with SMTP id y21so2161693wmi.0
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 05:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IUIz0TFnK+oC5M96ipiDUxKW+O/HTgXIaIGHBEPFmZk=;
 b=WRr3tQu7VWExsz89mMlr/YwzlWIEc2nKdTBS44Z6Z8FnjErFntTOn1ON8yaAjz0RDz
 NyBjegV4nbmwU0S1J6S4aVncyV2PI4xeGzn0ZPUrns1QOC4yIvm8Iyab+nwQ1kWGO72o
 1wSr7bhqQ67TnOajF7yQK23OyQK9TPNdZl+eq2Q4XXzgZGSjyJmZYi7b8pirDSJ3LpN6
 PUCyBaq6YU0lL7HFPKtiH/GvArNiv2lWwmGSi40lO6j/qCDev8NTRQRDGDGTWBd+/ceK
 Q5HHg4QiQt9XdDQyWKnrrvTt4tVqYHSHsL0r9DtxuuOSpw+mAUiZynYxXNJToS7FmcAi
 HlzQ==
X-Gm-Message-State: APjAAAVb1FRO3EVuB7Pbf3XkkRgwbtshSvhaNLhp4gIyw/n2HGBTMhUh
 j/mkBptooSwzdmIB4Lkcvcg=
X-Google-Smtp-Source: APXvYqzbaPx3iXSpFSvDy/ZXK9L8E7TXMCemVZw3zZNJjaJFe/Zom9X+pjc+WhUMLjEMWMRXD5G5Eg==
X-Received: by 2002:a1c:96cd:: with SMTP id y196mr3276669wmd.67.1568983384086; 
 Fri, 20 Sep 2019 05:43:04 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id l9sm1678293wme.45.2019.09.20.05.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 05:43:02 -0700 (PDT)
Date: Fri, 20 Sep 2019 14:43:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20190920124300.GA26917@pi3>
References: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
 <CGME20190920115200eucas1p2253a3eb13373061ef8aa39131c98a319@eucas1p2.samsung.com>
 <20190920113540.30687-1-m.szyprowski@samsung.com>
 <20190920122616.GA26862@pi3>
 <68ec938a-29b5-0c07-3a5e-771d6ce587b4@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68ec938a-29b5-0c07-3a5e-771d6ce587b4@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Maciej Falkowski <m.falkowski@samsung.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v3] dt-bindings: sound: Convert Samsung I2S
 controller to dt-schema
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Sep 20, 2019 at 02:33:13PM +0200, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
 >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/exynos-audss-clk.h>
> > Does it really work? When I tried, it was failing... If you look up at
> > resulting DTS example it is wrong.
> 
> In which way it was wrong? We checked and it was correctly propagated to 
> the example dts. It also compiled fine without errors. The only minor 
> issue was that the include was generated inside the root node, but for 
> the clock definitions this doesn't matter, but it makes the example 
> easier to understand.

Hmmm.... indeed this works. The output DTS is weird as include goes to
example node (not even root) but it compiles. Somehow my previous tries
with it were failing, I need to check why. In general I am all in for
this include.

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
