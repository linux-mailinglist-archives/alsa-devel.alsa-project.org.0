Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 854DB573944
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 16:53:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 273E51735;
	Wed, 13 Jul 2022 16:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 273E51735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657723981;
	bh=H44k0stDDfSIB8CrSlnU1LefRVj+Z1tv6lxviGVW00g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l7ucIta6s3K1zTE1h0Qw55p3EE2c5VW6O57tl7HTKOGhDt80pzT7mBExHa5+OJ+V+
	 LbDMHI442NqknMytPha0scp/h0le9glWHkqDxHjIzLHy/cZI9QoBUhZ003NDE9Kn/c
	 4vmnToHjeR/sac8qakuAcz7Zr4R5lZS31mazwpxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0452CF804CA;
	Wed, 13 Jul 2022 16:51:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3FDFF8047B; Wed, 13 Jul 2022 16:51:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9687DF80249
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 16:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9687DF80249
Received: by mail-il1-f174.google.com with SMTP id a20so6820214ilk.9
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 07:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cbWdiZoh5wzyuIDkAn23C3lc8R+dDJHxrU38In/KSpg=;
 b=MFi/CR9dX0XWXMSQV+sRyytgpu8Ybuj7nqMh06+EVOydowZKX5zEDe1DeXB5vXy1pP
 /W1i/f8/DcQNOCRPhNjZz9SUVSu4Z2QEbRUhcFD7h/fSVzWXrWfS5IEhY8bzN6ZyBMkr
 a6BXklKBd8/86qMxBKFMUcBGTJyOaMDUV8A2koGxiD1rnfaAsAjblAfJbGeMd1Vnh1Zl
 7Mv9fWXiiVEnf+UczlIxf/0egZ9s2MFsoLopvyMdoAN5W0P9ZifX0tFTgyVBYUqcwpef
 Uj0LgQoj5ilZRndrUjFoBDGgb5GSoVE+sHkEAVcK+QIxJNo0rFoN+R0VBcej3sS/jLvg
 MfJA==
X-Gm-Message-State: AJIora+5lsEk79ZNmDd3dKo8SMrUvSoTv0/6P0uLWhRWqGxUzg03OujK
 lrvi5DO4983FHZstkRB7Ng==
X-Google-Smtp-Source: AGRyM1vlqSyqn/DNiLH0sEZqhnwl+nomOxIJLs8Dxya4Zqtw2DMih3DWzYvv0ZGf6BRBeofDYeIzjg==
X-Received: by 2002:a92:b00f:0:b0:2d6:5628:6865 with SMTP id
 x15-20020a92b00f000000b002d656286865mr1976996ilh.230.1657723892195; 
 Wed, 13 Jul 2022 07:51:32 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a05663825c300b00339dfb793aesm5395787jat.86.2022.07.13.07.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 07:51:31 -0700 (PDT)
Received: (nullmailer pid 3941026 invoked by uid 1000);
 Wed, 13 Jul 2022 14:51:30 -0000
Date: Wed, 13 Jul 2022 08:51:30 -0600
From: Rob Herring <robh@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v5] update tas2780.yaml
Message-ID: <20220713145130.GA3909157-robh@kernel.org>
References: <20220712050857.267-1-13691752556@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712050857.267-1-13691752556@139.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, navada@ti.com,
 broonie@kernel.org, asyrus@ti.com, raphael-xu@ti.com, shenghao-ding@ti.com
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

On Tue, Jul 12, 2022 at 01:08:57PM +0800, Raphael-Xu wrote:
> 1.remove unused item in DT 2.revise the format

Again, fix your subject. Run 'git log --oneline 
Documentation/devicetree/bindings/sound/' for inspiration of the format 
of the subject.

However, there's a bigger issue here. We already have a binding for this 
device. It's in tas27xx.yaml. And you added 2780 to it, so why did you 
add another schema? (All the same issues in that patch too. wrong 
subject, broken schema. So you haven't learned.)

And then there is also tas2770.yaml which appears to be about the same 
as well.

> 
> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>  .../devicetree/bindings/sound/tas2780.yaml    | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
