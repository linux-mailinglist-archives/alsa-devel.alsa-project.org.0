Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0A33FD989
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 14:27:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97103169F;
	Wed,  1 Sep 2021 14:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97103169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630499238;
	bh=HOAH91fZdHUMNfPG7HhZ/TX50/BLfpgKRSqFq1o+jf8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AvLVjnAT7xdYiMzerV+XkL8LyA4BqiBcYeCnInVCTVHN04XVAjZAsIIoyDY6yemS2
	 /Pmz6wy5lb4c56wTcJ4Wy13VznFW/1tBDfbPMVKSet2uvVGQMK8tEphODqKUlCV3pM
	 dj1esVsQGSDGhP4HCRrwvXJE4suvAyFy6VzUQrbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5F37F804E2;
	Wed,  1 Sep 2021 14:25:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 629E7F804D9; Wed,  1 Sep 2021 14:25:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29A47F80423
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 14:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29A47F80423
Received: by mail-ot1-f51.google.com with SMTP id
 q11-20020a9d4b0b000000b0051acbdb2869so3225443otf.2
 for <alsa-devel@alsa-project.org>; Wed, 01 Sep 2021 05:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=moGKLgAMctDhdayXDYXUaaxJMf7F5RhBbpAYaCRzoR8=;
 b=tTmg9t3zRrm8T+FLplgjYEE66FcVGijAXe8GowNlg82UI2Nzf6CoMZoWmZDjP8sNM5
 Swjcwy/n7C4nrfUst6iS/a/UaZ/8+cPJG5MieZHsSQV6qvr46yfijbGUP4jNyq2toLYe
 3OU6pOpc4aS9VRZAj5x17Ox0f81bd9td9vAPfKSAnuuechPZBtPsN/97PRTK9NvGImmd
 GUKrxpP0lpqCdMPhRkhBacdiO1GXyAtiAORgYo1osHip6JKsH9gmTaTMjLlsfBVkke8g
 ENqm6LGe9bUrPuaOZdHtNwlW0QsNp/3/lJIO97+xMYb6TS4NkCZxkYVp9D0/pc2N72LT
 ODbQ==
X-Gm-Message-State: AOAM532NTX4b81w6U47rG7g5eQhKs+2G9Y4Jq1wlPYtDOZp0kZmqLu5D
 h7cprFq9g5r/89gssE9zrq+WNFaHpA==
X-Google-Smtp-Source: ABdhPJz08+fp6tHNieUoTd7qpfXjVJpOPeRep66NHmc3MP3mFNRssU+kE4r9x0uR6tD6ISUGcRzdmg==
X-Received: by 2002:a9d:7111:: with SMTP id n17mr23458475otj.279.1630499137969; 
 Wed, 01 Sep 2021 05:25:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m16sm4240656oop.3.2021.09.01.05.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:25:37 -0700 (PDT)
Received: (nullmailer pid 1940206 invoked by uid 1000);
 Wed, 01 Sep 2021 12:25:36 -0000
Date: Wed, 1 Sep 2021 07:25:36 -0500
From: Rob Herring <robh@kernel.org>
To: Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: Re: [PATCH v3 6/7] ASoC: dt-bindings: rockchip: pdm: Document
 property 'rockchip,path-map'
Message-ID: <YS9xQPfUCzOOpkjY@robh.at.kernel.org>
References: <1630468039-7186-1-git-send-email-sugar.zhang@rock-chips.com>
 <1630468118-7321-1-git-send-email-sugar.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630468118-7321-1-git-send-email-sugar.zhang@rock-chips.com>
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

On Wed, 01 Sep 2021 11:48:37 +0800, Sugar Zhang wrote:
> This is an optional property to describe data path mapping.
> 
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/sound/rockchip,pdm.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
