Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B58A3AAC
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 17:43:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3228E1655;
	Fri, 30 Aug 2019 17:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3228E1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567179832;
	bh=80hma7888czbgY5FOEpnFYsKRZTloUH2Ky4WE3qoJjs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P88yGk9R0bpjDwfAcgYcYKCXC34xwReUAm+D/vofauK4wbI5qgnE+dUbvuZiPgmPj
	 eoK52ySqwIJ1c15OnOA+pXF0gPE1y901sfNq2lP2T1UjNM0WePHW43BT++RPlUIS/d
	 wTGtnz1WZk2VASLW4NtwwI0sLWGL15jhNNkz9UmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C639F80369;
	Fri, 30 Aug 2019 17:42:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B145F80369; Fri, 30 Aug 2019 17:42:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E466F800E7
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 17:41:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E466F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oBz2Tae3"
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE5792342E
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567179717;
 bh=lsv2HRJcjTPCOFeqJ4kraE6eDC6maYXr6PJXlqUCXaw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oBz2Tae3hdCx6RiJE6e45gTAvbSObmBRsWEQzcAIaH4OfYdj1Bwv0vHUi6REFP2LQ
 6bH7KOZUI5o5kzfIK74iLaIyT5z0ZxGRpET9Vtq3CuX8I/MGq14AwF2ACzqcSyp6ry
 n7lDiVUgjAxr55lcJd4zoTsHIs2rN8eUIX84j6FE=
Received: by mail-qk1-f180.google.com with SMTP id d23so6523723qko.3
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 08:41:57 -0700 (PDT)
X-Gm-Message-State: APjAAAURvlsLrUsPtY7YBoq5gcNmQ7m2H43SjeOJiw/jUGr5yZuvBK+m
 9eiDxi/tu5FxU8x8LTB3Taboo6sbCYI+g4HDYg==
X-Google-Smtp-Source: APXvYqx9Je0tyYggCCfvH9K5Yx8giZ/vSqa+dRS9Eg9xmRkJhQxAfUT6bndfMmkl21JD4YuSVXy8kryHoASXVusLWWo=
X-Received: by 2002:ae9:e212:: with SMTP id c18mr10022345qkc.254.1567179716986; 
 Fri, 30 Aug 2019 08:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190828125209.28173-1-mripard@kernel.org>
 <20190828125209.28173-3-mripard@kernel.org>
In-Reply-To: <20190828125209.28173-3-mripard@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 30 Aug 2019 10:41:45 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+ZQy02-3TOyagfdtsxFJkMkSiQh0-o1MpcbgvuM_e8oQ@mail.gmail.com>
Message-ID: <CAL_Jsq+ZQy02-3TOyagfdtsxFJkMkSiQh0-o1MpcbgvuM_e8oQ@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: dt-bindings: Convert
 Allwinner A33 codec to a schema
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
> The Allwinner A33 SoC have an embedded audio codec that is supported in Linux,
> with a matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v1:
>   - Fix subject prefix
> ---
>  .../sound/allwinner,sun8i-a33-codec.yaml      | 57 +++++++++++++++++
>  .../bindings/sound/sun8i-a33-codec.txt        | 63 -------------------
>  2 files changed, 57 insertions(+), 63 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
