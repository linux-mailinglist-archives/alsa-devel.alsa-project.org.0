Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BFC585FAE
	for <lists+alsa-devel@lfdr.de>; Sun, 31 Jul 2022 18:03:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89EC3843;
	Sun, 31 Jul 2022 18:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89EC3843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659283430;
	bh=3gfeeSM9QTFHVE4lyrWbKeNjev19+SKch9FNF3mHBS4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CU+gyRPY9MZ0lYuIFML0AoNJJ857V947RPx4jPoz001q7f8gjSOzuZ7i8VmDu3ACt
	 uPU2BkxThTA4BNrlqZ/MGo3cGJv4hQ7jyxXITmYHECRPP2fKhxVul+YwQkQlsQDmf6
	 rl2HEudPnCs2jzTqRodxwCFVJUTgSYUUw69i7B+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D282DF80240;
	Sun, 31 Jul 2022 18:02:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 194CBF80152; Sun, 31 Jul 2022 18:02:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 NO_DNS_FOR_FROM,PRX_BODY_26,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D06D4F80152
 for <alsa-devel@alsa-project.org>; Sun, 31 Jul 2022 18:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D06D4F80152
Received: by mail-io1-f47.google.com with SMTP id o2so6752651iof.8
 for <alsa-devel@alsa-project.org>; Sun, 31 Jul 2022 09:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=1cJGXIDlYaNEYUvR2NRGrr9WocwvB3UiAWtCmIk18EA=;
 b=z5Jd+MUj1Fi6ETgU2LnLA9jF287Mc8b/YueEWI8BLS1VdgMCP19fwWBfOON4bDyYl3
 Bi9TssLQ7IcHgtvMB/sQA9muxLRuVc3WhM9sNxj+U8YP6kYdD5zaVBoKiUaPc/o3oERc
 6jxFaYNqu8cU/bnqDT7UnB5JuQWZfZPDrjU5sL3JQbqqEbchZqIApPGOWm8mZlXm7W/R
 XjKjLkDvr929u72VtG3HzUUttHYGYI2OmdQ3520PGNgN55GuAxaV6o3qEjRgeVtx2D0X
 ydG8DtBsSN4vTLB2nBcKyyQn5qQgY/aF/64FYeyPk/22ycbkG37Yhnae2v2Epvx4WlrZ
 bs5g==
X-Gm-Message-State: AJIora8OcQX0TIX6OXv0QpqETAccJDrhj8XT3SYozeuI7Blr9joNU2QZ
 YIO3m5Y2lA9FS7xZfvdB+A==
X-Google-Smtp-Source: AGRyM1sYNl3f2m8lc+L6zGIH26tQMfzr0kEk09cofcdtvYk92Axw48a86G07BJTzHcMr9cde/FMepg==
X-Received: by 2002:a05:6602:2ccb:b0:67c:3d7c:c896 with SMTP id
 j11-20020a0566022ccb00b0067c3d7cc896mr4263761iow.153.1659283361719; 
 Sun, 31 Jul 2022 09:02:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 b71-20020a0295cd000000b00339df77c491sm4265856jai.114.2022.07.31.09.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 09:02:41 -0700 (PDT)
Received: (nullmailer pid 3380583 invoked by uid 1000);
 Sun, 31 Jul 2022 16:02:39 -0000
From: Rob Herring <robh@kernel.org>
To: Ban Tao <fengzheng923@gmail.com>
In-Reply-To: <1659271861-3481-1-git-send-email-fengzheng923@gmail.com>
References: <1659271861-3481-1-git-send-email-fengzheng923@gmail.com>
Subject: Re: [PATCH v7 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
Date: Sun, 31 Jul 2022 10:02:39 -0600
Message-Id: <1659283359.419677.3380582.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 samuel@sholland.org, broonie@kernel.org, lgirdwood@gmail.com,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org, wens@csie.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On Sun, 31 Jul 2022 05:51:01 -0700, Ban Tao wrote:
> DT binding documentation for this new ASoC driver.
> 
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Maxime Ripard <maxime@cerno.tech>
> ---
> v1->v2:
> 1.Fix some build errors.
> 
> v2->v3:
> 1.Fix some build errors.
> 
> v3->v4:
> 1.None.
> 
> v4->v5:
> 1.Add interrupt.
> 2.Keep clock and reset index.
> 
> v5->v6:
> 1.None.
> 
> v6->v7:
> 1.None.
> ---
>  .../bindings/sound/allwinner,sun50i-h6-dmic.yaml   | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml:79:4: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

