Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6D73FD987
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 14:26:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FDC716EE;
	Wed,  1 Sep 2021 14:25:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FDC716EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630499196;
	bh=gY3fV7ZVHFbuN/0xH94v1A2qHLqV5bbg+lenPS7Wtjc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iQBmBeyUCRlNLPUFLKtjOYYBcFZ+KyXD0taukYqdr0mQEot+ejrzj4nls8/N6DMZd
	 RYVkKIMQxoWELWy550H0wxTvG/VpM+H/tVO9s9ulhtv2Yfd5oUqFKcpl1WaZMx0FAf
	 UhVMySsXpY1UeE61rgP6rQiTNhchqGBLj2LVndVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53DC4F80171;
	Wed,  1 Sep 2021 14:25:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CA65F80254; Wed,  1 Sep 2021 14:25:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4339F80218
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 14:25:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4339F80218
Received: by mail-oi1-f171.google.com with SMTP id n27so3598442oij.0
 for <alsa-devel@alsa-project.org>; Wed, 01 Sep 2021 05:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OGno47MbHUIv9+PhbtrT66UdJTYUHB0R8oj64LoIDJw=;
 b=cjXApAGoVoM3wWuX7J7J/sq9tQTTCaV4J/MrJvrlI27l6lFKRzSA/fHq0wpFwKcjuj
 82m09LU4U4QHLOQLkr6bFYjiJC97tFD3HEDWU0O1/T6yVgd7amgWl1z5aUH8giM6pa4y
 1oZsJwPWJMWIcDvCj/Q2SkNqoMnYtit8cwFzRc5akXekefihmLDDIL08A5tmzDi1kqjv
 b/y+pOXslsdwFn482WzkLg1X1A7X5VzD3eSmWCYCfaHG2cXfmMCm/H4K2WRg0PFt1RzT
 8o1oLpVpIEnBXwOYDERdpWN6SY1kwbvw+ThueyAgcIVOuIdj3pFVzn8rjQDXd1pF1OGI
 2Zrw==
X-Gm-Message-State: AOAM532rWUEu710As2U2OkSp8h1UD66DTAjGs89QTdensmkXN4nsoLrm
 67q3Ecb6iwHdsrPBS4l7KQ==
X-Google-Smtp-Source: ABdhPJzZQe8HXodDYefhYmHlXG1vGCmYhYO7vuQaDcvmPY6zALuTsohNF0ssWXcNhBgqmJhLviI2Iw==
X-Received: by 2002:aca:3c09:: with SMTP id j9mr7056083oia.115.1630499101947; 
 Wed, 01 Sep 2021 05:25:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x1sm4387341otu.8.2021.09.01.05.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:25:01 -0700 (PDT)
Received: (nullmailer pid 1939094 invoked by uid 1000);
 Wed, 01 Sep 2021 12:25:00 -0000
Date: Wed, 1 Sep 2021 07:25:00 -0500
From: Rob Herring <robh@kernel.org>
To: Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: Re: [PATCH v3 2/7] ASoC: dt-bindings: rockchip: Add binding for
 rv1126 pdm
Message-ID: <YS9xHAGwymzn57tl@robh.at.kernel.org>
References: <1630468039-7186-1-git-send-email-sugar.zhang@rock-chips.com>
 <1630468083-7248-2-git-send-email-sugar.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630468083-7248-2-git-send-email-sugar.zhang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 broonie@kernel.org, heiko@sntech.de, devicetree@vger.kernel.org
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

On Wed, 01 Sep 2021 11:47:58 +0800, Sugar Zhang wrote:
> This patch documents for rv1126 pdm.
> 
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/sound/rockchip,pdm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
