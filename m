Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E17A3873B9
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 10:03:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA35616C1;
	Tue, 18 May 2021 10:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA35616C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621325009;
	bh=ea43IMXtPXzBWWlh+J3o8CXUPDCS+MnpV3Pi6gCEQ4s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ml1rRwdDwEsHsI1mIaqAohvLTnVep2j7cyCku9HO9ptJOwfI4TeNHXb8T3rDJ+iRn
	 37cn+RPrNbQjjLkV3wXKgpcUKfyDljm3oSsRI0fXEFCKIVtCEJHbgeb8Gc4q2dGWRF
	 /i1+6gmxtNEj/V+Vde41I6TfBNQNfJtpxPF6tz9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D464F804AB;
	Tue, 18 May 2021 10:00:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AB7FF8020B; Mon, 17 May 2021 23:20:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADDF5F80169
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 23:20:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADDF5F80169
Received: by mail-ot1-f46.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so6803245oth.8
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 14:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YcPVqnyxUoQRqLqrcd+xwOvSykAyUXn6XXyXXfewed8=;
 b=qqSyCg0RqiqLpA6bhtEJbOWUHWavaUgZ45KdEDJ7h0aIMhBTappvEUUY9ECV8OqPGP
 qBD9B0/73czl4gLmeyWvdYp/pDvGQE22lEQGdbwg+1GQb+AoTt0qnPTz8BClYDpvWD/p
 e6D5w6kGueasiGWbEmDhj92xiCSZG9US3t/dyZQl/lhJBVHp6bt+GiHiikjS2LlQa6RJ
 iK3ulMUu/R+6nxpHecStEMj0tKUK62SOBRUUd920woqHGs6W7o4OLqe83/GfWo9VQ0ej
 6KruwPfzSkjiIoRKAIvl9aUupEzvG1QkWOFZDDQ1PHbDeqYg57sJyzrGVthP2jmu8d3K
 u8Tw==
X-Gm-Message-State: AOAM530gsK8F4Y1t+lWaHiUIVDFMxvsKqGy99Pd9wHYaOYhTf3pSaqaE
 qBm3NgSZiQcCll0tQi4VIw==
X-Google-Smtp-Source: ABdhPJyETxg9k9XJAKSPDZnyLWwwIHaYxzn+ovOlDY4J+ItNb3j1tMU05rQr9vzb7eu8lf00QgA4Rw==
X-Received: by 2002:a9d:5a1a:: with SMTP id v26mr1334412oth.50.1621286444548; 
 Mon, 17 May 2021 14:20:44 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y191sm2998370oia.50.2021.05.17.14.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 14:19:33 -0700 (PDT)
Received: (nullmailer pid 3215069 invoked by uid 1000);
 Mon, 17 May 2021 21:18:28 -0000
Date: Mon, 17 May 2021 16:18:28 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: More removals of type references on common
 properties
Message-ID: <20210517211828.GA3214995@robh.at.kernel.org>
References: <20210510204524.617390-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510204524.617390-1-robh@kernel.org>
X-Mailman-Approved-At: Tue, 18 May 2021 10:00:15 +0200
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-iio@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, devicetree@vger.kernel.org,
 Odelu Kukatla <okukatla@codeaurora.org>, linux-pm@vger.kernel.org,
 Baolin Wang <baolin.wang7@gmail.com>, Mark Brown <broonie@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-arm-kernel@lists.infradead.org, Alex Elder <elder@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Luca Ceresoli <luca@lucaceresoli.net>, Georgi Djakov <djakov@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
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

On Mon, 10 May 2021 15:45:24 -0500, Rob Herring wrote:
> Users of common properties shouldn't have a type definition as the
> common schemas already have one. A few new ones slipped in and
> *-names was missed in the last clean-up pass. Drop all the unnecessary
> type references in the tree.
> 
> A meta-schema update to catch these is pending.
> 
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Olivier Moysan <olivier.moysan@foss.st.com>
> Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Georgi Djakov <djakov@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang7@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> Cc: Odelu Kukatla <okukatla@codeaurora.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
> Cc: linux-clk@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/idt,versaclock5.yaml    | 2 --
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml         | 1 -
>  Documentation/devicetree/bindings/input/input.yaml              | 1 -
>  Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml   | 1 -
>  Documentation/devicetree/bindings/net/qcom,ipa.yaml             | 1 -
>  .../devicetree/bindings/power/supply/sc2731-charger.yaml        | 2 +-
>  Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml          | 2 +-
>  7 files changed, 2 insertions(+), 8 deletions(-)
> 

Applied, thanks!
