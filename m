Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD22A3ABE
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 17:45:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32814886;
	Fri, 30 Aug 2019 17:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32814886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567179903;
	bh=HvM4s5fmuj5BLKQdl2bKMgR0q9loQWlPEHG1XPhgV6Q=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uD52ahlvDkQgs9wiw5VASv/3KWhJL8Bk6xyZEXjmTi8DPW6vAPB5UwjmkOPAIvrAH
	 zFtFn/dixD3qKVTFIzyEGMNY4LOke05nM6Or2H8fnLeSpO3RnzH821keLXPpLhHnhg
	 ZWuuPvQPZbZGSFgD8yjvIFPjp5rloQRpYRyVWanc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DECA2F805F6;
	Fri, 30 Aug 2019 17:42:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75E88F805FA; Fri, 30 Aug 2019 17:42:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE678F805F8
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 17:42:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE678F805F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DM1CXlk1"
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E2A9023428
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 15:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567179773;
 bh=SjF+r0sRfSw6guTPuHirWIwopvlcS/mInacUNuCDDCA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DM1CXlk1CMfyPGG+0KfVCNMQGXt7kL6/zsk9Vb3449Al86pJsn6TSalEvXkUtHuzn
 b11LJRp6XB3YsulP4B8pzRz9DudGUcUlJV/mtIvvRYPNXsdwNkGrioCMtzSilJ1tCB
 0lSAXuF1GBwBeDXKDif2Bn5lXm6RoGN3QwI5rrYk=
Received: by mail-qt1-f182.google.com with SMTP id n7so8047719qtb.6
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 08:42:52 -0700 (PDT)
X-Gm-Message-State: APjAAAW74VQ4HtEAcmMqP1pzWa9+XzJp2rh3E7mYhWpdYXRTIAg5Neji
 xA5tdNezkc8FWeubcO7iJ003avQcwecHxmjnKA==
X-Google-Smtp-Source: APXvYqzXCHsQQOsvgsiISFEf/Zttwtxmy7SUxWU0aJkqVW9uY0SYjqHWdC/KWYvM+YsA8KFQRpWU9v+qwwnvZLkjrU4=
X-Received: by 2002:aed:24f4:: with SMTP id u49mr16280140qtc.110.1567179772161; 
 Fri, 30 Aug 2019 08:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190828125209.28173-1-mripard@kernel.org>
In-Reply-To: <20190828125209.28173-1-mripard@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 30 Aug 2019 10:42:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJBs_vmqbe9DmEjNJR3YO6-3mnyxrTbYq0b++0eGJnU3w@mail.gmail.com>
Message-ID: <CAL_JsqJBs_vmqbe9DmEjNJR3YO6-3mnyxrTbYq0b++0eGJnU3w@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v2 1/5] ASoC: dt-bindings: sun4i-spdif: Fix
	dma-names warning
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

On Wed, Aug 28, 2019 at 7:52 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Even though the H6 compatible has been properly added, the exeption for the
> number of DMA channels hasn't been updated, leading in a validation
> warning.
>
> Fix this.
>
> Fixes: b20453031472 ("dt-bindings: sound: sun4i-spdif: Add Allwinner H6 compatible")
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v1:
>   - Fix subject prefix
> ---
>  .../devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml  | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
