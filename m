Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1143F6505
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 19:09:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF9E91682;
	Tue, 24 Aug 2021 19:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF9E91682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629824976;
	bh=V7xjlaDPfwwU5aS1geFUmkZd2v2TxhmtSJPvz8JWsZM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jlpGg2MTRrDQ9UFpaNQw+oEcguPSzHavffgMLi8Vr7XJqibW3WCBa8vTBRExCYTGw
	 5iHaviHpF6gv9mY+Ogk6YsBcgiLfkiAWVLvHjfRNL2hX0yZHK8IX0fPw/auJ5VyuI0
	 4IExQ+4qIHWJ1Cdl6ONmUPq/GNixXDXMxphq4vTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55053F801D5;
	Tue, 24 Aug 2021 19:08:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2ECD9F80224; Tue, 24 Aug 2021 19:08:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE834F801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 19:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE834F801D5
Received: by mail-oo1-f52.google.com with SMTP id
 z1-20020a4a2241000000b0028e8dfb83b4so3934331ooe.13
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 10:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zwubaYFj/lvlyUUP+l/btChNzFkq5suM9jrCNFdviZc=;
 b=MQfyB5y9zMLFmIYVqDZq4d5vetHPmFBBI6MeEvUSQECc5w+RHNIn77Xs9ZiJNXFJBj
 EHTLoZVZbrWKRK+4gLNsbOF9C3Duce3z3WarxX1r8fmDe8kQ+A0MX+GzDUuRlW+m5gS2
 2z2hnN8BRtmTuq8qYlB8JNMG+t+8Kf4PvYFyjeCHV0RitMBLBtJZKh++C2LRvMV8VXfr
 2ZFAaS+lp+LGHKAAw2AyrCrlsDBH7QUZhr0XXguIyzNLIL1DGGsX2GItzuJbLVIGGfpF
 3nf01nstfkaGGTV0UwElzyFhxGHwRuKHhCIDRvSzl2cLnMIG+7HRpVP1xjl41Vfx+TT9
 RYvA==
X-Gm-Message-State: AOAM530ILxUYrKw0m8UIgVx/D5vvvVzKsJYAY+5bG+iesAToiq3yZSmd
 YVjMFWvI+f0q2Sa8MzwGXQ==
X-Google-Smtp-Source: ABdhPJzLMc7ooV0oFHNXxw248f+31EgtiyHafVjQcBW9XOazHhf59JoPDr8NJbnlA1QzydJ7uQsjNQ==
X-Received: by 2002:a4a:5592:: with SMTP id e140mr20076850oob.59.1629824910169; 
 Tue, 24 Aug 2021 10:08:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z26sm4515905oih.3.2021.08.24.10.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 10:08:29 -0700 (PDT)
Received: (nullmailer pid 641467 invoked by uid 1000);
 Tue, 24 Aug 2021 17:08:28 -0000
Date: Tue, 24 Aug 2021 12:08:28 -0500
From: Rob Herring <robh@kernel.org>
To: Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: Re: [PATCH v2 15/15] ASoC: dt-bindings: rockchip: i2s: Document
 property TRCM
Message-ID: <YSUnjLfcntDob/sT@robh.at.kernel.org>
References: <1629796561-4025-1-git-send-email-sugar.zhang@rock-chips.com>
 <1629796734-4243-5-git-send-email-sugar.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629796734-4243-5-git-send-email-sugar.zhang@rock-chips.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 heiko@sntech.de, linux-rockchip@lists.infradead.org
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

On Tue, 24 Aug 2021 17:18:54 +0800, Sugar Zhang wrote:
> This patch documents property 'rockchip,trcm-sync-tx-only/rx-only'
> which is used to specify the lrck.
> 
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> ---
> 
> Changes in v2:
> - split property trcm into single 'trcm-sync-tx-only' and
>   'trcm-sync-rx-only' suggested by Nicolas.
> - drop change-id
> 
>  Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
