Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 252E05686E0
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:42:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD43E16D4;
	Wed,  6 Jul 2022 13:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD43E16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657107753;
	bh=fju+Y0C9WYZjWSEESGHZWCLXE2xKGF2o2lZbazFp5H8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ibDxB1duCfnYBF6AvD97qXBaewMh3Pp5JdEWzORdiRZWnOZzpU1/BN1b6R44iK42R
	 JrfjGjGkaWzCqIxS1r0We49BivTZZzN+H9btuQoLrvZvA5YfW7UlKwAjT5SZSpszJc
	 QxRCJA9uzNfSJmFAOtaseMbOkS4i6du6Vf/B5ycs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17541F800C5;
	Wed,  6 Jul 2022 13:40:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62CE6F8015B; Tue,  5 Jul 2022 21:05:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B4DEF800CB
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 21:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B4DEF800CB
Received: by mail-io1-f52.google.com with SMTP id h85so12043064iof.4
 for <alsa-devel@alsa-project.org>; Tue, 05 Jul 2022 12:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NYhNf6ucb9Y2EJr3g3GFcYGSI7hDN6hlWNBPyCne12o=;
 b=cpNEBYGk+QC0Pqd9jQ2vUvJIds/l7yzp6UUZoFUPgfsQZMglnoKyRYrixt8cg5bMqk
 zOxQdvqqms0akonAyOf/ngwkrWIw+CY1/bVTBYmHzoT+73oYiwcctdwZ47aq0sAe8TKh
 39nEGaGQuF36W8ucUncEQQsGA17WQ7jCyP6FbO2/jVtAS024c1OkPRh7M8RMcSycxqVF
 dPXMV9maATcno8dGfC34cyOeNGRr1HfYCOylfyqNLiK/G9JelUdw1ZRQrsDGOjdjtOhH
 XE9fXGxjnpQ2f9gNCMbYXiXPx/QImi8ZqKGCzMCNgivTx7nEPMgvvCUGl8Mb0AMrUeK3
 7g+w==
X-Gm-Message-State: AJIora9NVB1NFm/ifeKCMu5TtLIKJYUm3W/kU0t53YNBH93tIfGxh7F8
 sIHp2w+FDaA/6kXd/mUZeg==
X-Google-Smtp-Source: AGRyM1vbgvYpzb6OcGyK9lCHO48fmdYxy4SEAi8PzKsPwRclsAgNdeYXBff/q4XTwjXyQVl9lebl7A==
X-Received: by 2002:a05:6638:2494:b0:33c:cfb8:1e3c with SMTP id
 x20-20020a056638249400b0033ccfb81e3cmr21373745jat.139.1657047900325; 
 Tue, 05 Jul 2022 12:05:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a056638026800b00339c46a5e95sm14948822jaq.89.2022.07.05.12.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 12:04:59 -0700 (PDT)
Received: (nullmailer pid 2450909 invoked by uid 1000);
 Tue, 05 Jul 2022 19:04:57 -0000
Date: Tue, 5 Jul 2022 13:04:57 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v4 02/14] dt-bindings: display: ili9341: document canaan
 kd233's lcd
Message-ID: <20220705190457.GA2450821-robh@kernel.org>
References: <20220701192300.2293643-1-conor@kernel.org>
 <20220701192300.2293643-3-conor@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701192300.2293643-3-conor@kernel.org>
X-Mailman-Approved-At: Wed, 06 Jul 2022 13:40:49 +0200
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Dillon Min <dillon.minfei@gmail.com>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Vetter <daniel@ffwll.ch>, dmaengine@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>
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

On Fri, 01 Jul 2022 20:22:48 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan KD233 development board has a built in LCD.
> Add a specific compatible for it.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9341.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
