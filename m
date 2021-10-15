Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D77CB42FB34
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 20:43:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54C3A186E;
	Fri, 15 Oct 2021 20:42:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54C3A186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634323393;
	bh=aEKLubok9WP8Kvw2B/IwvLb541cDY1RnNAAwJyp/RBA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cnD4plKP0TrZ32BhDls3F48ye8c5yWviW5YVlJwmIsE+tGHNgeJKiy/UOBKT3hH12
	 tYHlkzUiVouGWrD9sOOc7pBq86aqFAoLJwo+MMDVh43DG4+7eWuI+aTxjDaUkcCUo5
	 iA0kDM8YkP4ssL/5oSqLT8gl5HTR5/cfQKv5DNt4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF038F8028D;
	Fri, 15 Oct 2021 20:41:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE34DF80269; Fri, 15 Oct 2021 20:41:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4CC4F8012E
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 20:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4CC4F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RyUOTcSa"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F092C61040
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 18:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634323306;
 bh=aEKLubok9WP8Kvw2B/IwvLb541cDY1RnNAAwJyp/RBA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RyUOTcSa1z3riwlF+IEmHkagSM5pIFWoMFsbjQzmfptXSmH8JDaTT/1kQDO4K+lOF
 Co4EONGKeC0PlQ1UVD31napP4HUN94f1hAYWk/P+EBB62gICEX+Q99JQwg9f0r/szK
 GAgk3aS0p+sYph8j3RA/qHKbBgLEKhD2vcUq+tFIT92uTeDuxToSPB0XKbn92qcs7N
 gl828pRwWGwsCt66gVtO1wEkVVLPA+eNmARZnPRz1iQyH/T208ZXS1gTcvs3+AdfNs
 kjuBhEvuNVIH4G2+iTl9lW1F4offNRZw9+nUJToSI11MD2leP10IzMAZygQjCDdJSV
 cdOx0v1yniL8w==
Received: by mail-ed1-f50.google.com with SMTP id w14so41403235edv.11
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 11:41:45 -0700 (PDT)
X-Gm-Message-State: AOAM533RcWlRkI1f6HLwlynsIe26KNgQ4uzAcUY2BSj1iuArZvyvaz65
 VCqr0+Gol8bNdIvEBxE/4I6MvMc34l+AZHZ1Jw==
X-Google-Smtp-Source: ABdhPJwaqxAWAw4QXbVNEgxrT5eu76RFWee4sWI7cAEgtvrVHWO6fv6Y7OyylOlsgbi6p5tBxF+CGowe13/DkuR/NEU=
X-Received: by 2002:a17:906:e089:: with SMTP id
 gh9mr8867117ejb.320.1634323304320; 
 Fri, 15 Oct 2021 11:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210914091204.2204278-1-tzungbi@google.com>
In-Reply-To: <20210914091204.2204278-1-tzungbi@google.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 15 Oct 2021 13:41:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL7QbCJrqLZtRX9eNJC39kJWwbva2ZQeD+Azb+pKHzJ=Q@mail.gmail.com>
Message-ID: <CAL_JsqL7QbCJrqLZtRX9eNJC39kJWwbva2ZQeD+Azb+pKHzJ=Q@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: mediatek: mt8192: re-add audio afe
 document
To: Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
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

On Tue, Sep 14, 2021 at 4:12 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> The document was merged as commit 1afc60e00de3 ("dt-bindings:
> mediatek: mt8192: add audio afe document").
>
> However, [1] revealed that the commit 1afc60e00de3 breaks
> dt_binding_check due to dt-bindings/clock/mt8192-clk.h doesn't
> exist.
>
> As a temporary fix, commit 7d94ca3c8acd ("ASoC: mt8192: revert
> add audio afe document") reverted commit 1afc60e00de3.
>
> dt-bindings/clock/mt8192-clk.h is in mainline per commit
> f35f1a23e0e1 ("clk: mediatek: Add dt-bindings of MT8192 clocks").
> Re-adds the document back.

Sigh. What's the status of
dt-bindings/reset-controller/mt8192-resets.h? Because now this is
applied again and has an error in linux-next since the header is
missing.

Rob
