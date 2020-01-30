Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE5D14D767
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 09:20:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B9711665;
	Thu, 30 Jan 2020 09:19:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B9711665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580372411;
	bh=7oTcOpG770k/kHjxTDNvLQ/h5loLG3JZebSWmRmdAMA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BEhHVLXwG5WMr7GBfrpQ5KpfEf1h6EhtCoC4IICsdzT4sT7E02Q+RcumfGtwJKS/V
	 oMH3fPfBiZRtZUdAfDhopLe0QOmSyA0tCUDOlf6XO0tq/JK9NSKOiVwz7d3GJfkX0h
	 2llZKaMh3Bf/AB3htY6dIiw++J1UMepteg2dUmR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0179F801EB;
	Thu, 30 Jan 2020 09:19:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD6AFF801F7; Thu, 30 Jan 2020 09:19:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00888F800F1
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 09:19:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00888F800F1
Received: by mail-ot1-f65.google.com with SMTP id g64so2279373otb.13
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 00:19:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s3I41ZfIrOT79LBysL0u65vz33Hk4LOsapeDNAzlOAI=;
 b=e9tFcbFVBY2AotzF+hsbu/tByPX08E855XObUjo3rugMP0TAh095MwfG1rtuQ03jW1
 B1oi6KWB7mOjmIKH4iWh9sgKNLvZlbbHQ77Tc/wCBDHQN1CdDNnh+WI9US/i/vHhJUWu
 gpfgMwb1cRfU5NggsJFAfGtIapcUnpQf3ERQ36mMO7KHECh1lDdVupVoh1aNwnEipMOB
 uBhwKzCq2YDleBmiNWI5ZDmZlW9qy6DwCj0C5znBzjzoplrIpIZk6+mSnkPr88TrupTk
 Zk4RM62f8pcS/G1I5QL64S41ZSB70hyVysv16ZYkAmFdpc+hRe77RYP1uf7D83CYUpbh
 X7jA==
X-Gm-Message-State: APjAAAV5kUOu7QXWtYWNd8SlFhHjGWJV/chV/DTbRWxIaQSJeH16aaw1
 gDHkzI49fnlIB6ai10xE9cgXuG5X/aQOeELH0ps=
X-Google-Smtp-Source: APXvYqwqmdaXGxYCmHJq4Z/tqKv+f7ulnVAfvZ/0q3dXE5eP+LWDnJSN+Cu5ZkUVt32Ur/IHm3qlurwn2y4v9rtXjm8=
X-Received: by 2002:a9d:8f1:: with SMTP id 104mr2494065otf.107.1580372345508; 
 Thu, 30 Jan 2020 00:19:05 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200130070850eucas1p1a7a09e2bec2f6fe652f206b61a8a04ae@eucas1p1.samsung.com>
 <20200130070834.17537-1-m.szyprowski@samsung.com>
In-Reply-To: <20200130070834.17537-1-m.szyprowski@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2020 09:18:54 +0100
Message-ID: <CAMuHMdWcNK_9RTaWRsEeOZ3k9=LduZOrSLcYHE8Ud1aYfZPUnA@mail.gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 dmaengine@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2] dmaengine: Fix return value for
 dma_requrest_chan() in case of failure
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

Hi Marek,

s/dma_requrest_chan/dma_request_chan/ in one-line summary.

On Thu, Jan 30, 2020 at 8:08 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Commit 71723a96b8b1 ("dmaengine: Create symlinks between DMA channels and
> slaves") changed the dma_request_chan() function flow in such a way that
> it always returns EPROBE_DEFER in case of channels that cannot be found.
> This break the operation of the devices which have optional DMA channels
> as it puts their drivers in endless deferred probe loop. Fix this by
> propagating the proper error value.
>
> Fixes: 71723a96b8b1 ("dmaengine: Create symlinks between DMA channels and slaves")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Sorry for breaking this, and thanks a lot for your fix!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
