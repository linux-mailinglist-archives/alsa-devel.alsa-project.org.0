Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A75EF2554A2
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 08:43:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B311182B;
	Fri, 28 Aug 2020 08:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B311182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598597010;
	bh=UCB42pXjCqrAOwWGGrcCtsZIoT991dmtYxnXSw1wGTY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E35J6UkxmryHYvKBi/JIFz9wcXkxJgk1tDv3uvf4otR0em7QdkY1AqXcpTGB8HGgP
	 z0xyOCTJS4lRZ39YF69nHU3V8vCA8pO73tZ+G9v825v3M96YF823h4dZ3DhY3KwRik
	 ZViGJfduZ6VOaGNHElWuL3VEnCxMaAS3cZI4CM2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50D5DF8016F;
	Fri, 28 Aug 2020 08:41:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DE5AF80118; Fri, 28 Aug 2020 08:41:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A42D1F80118
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 08:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A42D1F80118
Received: by mail-ed1-f68.google.com with SMTP id u1so174105edi.4
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 23:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OazcN7HN9a5E/rLdGkA2HsRtgNCRVnTkO1Ngzs4zc+8=;
 b=CP9d/WX8o0Y8SnJ6qBkKJy9vYjXnEHefCWhkhgP2sbGzVVRXPtuuqTVc76ZXrIS2I+
 g9qjVYhY83qyTPEDSE+T5aJZ+ehBFkrsjJEdNzYBom3OmiFCrOnE1JeHGUzyEorHKFtf
 o6PkQItiXkuwUpFPSwSauZbYLvDUUCAralkXWfbpZz+dZ9aaKS1W5nCk+FO57qrsDbZ4
 Qn+XiKDtYi/NcgWI4pmLBzeVp2H+eFDHW1eIeIbN0WnCT6Iwy+t/bu4DRwSa9exXjb9O
 OGqTDkSiT3bIQc1vCijAkQpBPtghOtPIycAsOzvIDW93uCm8sWYNWPBorD0vHdYiPNHS
 ynTA==
X-Gm-Message-State: AOAM532AYK6Gf0LLR6CXLdkCH4X1n+p5c7eQjCECoXErfvnfhFS3WRjN
 Db7B+s/Yzw8uWw06trN7pSM=
X-Google-Smtp-Source: ABdhPJxlucmdLtn/w19BIOYgR0oWbv9wc9kgrscFOfXHuFO0oaArewtxh298XtJFINJNK8GEvN3ZEQ==
X-Received: by 2002:a05:6402:2359:: with SMTP id
 r25mr377310eda.65.1598596898438; 
 Thu, 27 Aug 2020 23:41:38 -0700 (PDT)
Received: from pi3 ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id j92sm156054edc.82.2020.08.27.23.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 23:41:37 -0700 (PDT)
Date: Fri, 28 Aug 2020 08:41:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] ASoC: wm8994: Skip setting of the WM8994_MICBIAS
 register for WM1811
Message-ID: <20200828064135.GD17406@pi3>
References: <CGME20200827173411eucas1p1283200677c5e077c5e07af938934eb5d@eucas1p1.samsung.com>
 <20200827173357.31891-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200827173357.31891-1-s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, m.szyprowski@samsung.com
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

On Thu, Aug 27, 2020 at 07:33:56PM +0200, Sylwester Nawrocki wrote:
> The WM8994_MICBIAS register is not available in the WM1811 CODEC so skip
> initialization of that register for that device.
> This suppresses an error during boot:
> "wm8994-codec: ASoC: error at snd_soc_component_update_bits on wm8994-codec"
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/codecs/wm8994.c  | 2 ++
>  sound/soc/codecs/wm_hubs.c | 3 +++
>  sound/soc/codecs/wm_hubs.h | 1 +
>  3 files changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
