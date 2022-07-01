Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 934905653A6
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:35:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EBF7175A;
	Mon,  4 Jul 2022 13:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EBF7175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934523;
	bh=Sh366/k69UZaXPU9YcMwiPEq82tk8r5/ROKf6kNRAaw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=izJIthUbJSNew1lx78xGLT8zJEKqCRNF3/dVOyYdUWr5Zloy0+D4rJB+RaX1fhmCj
	 y7+JBQ573ZOljiNgh65KeVa5u23ZtDlmeCgNidNaq+W0WdUTJ3swXCfusIJolqoSG2
	 ka92eSVfqrMrruMGJQXLRCP8QxLC6+7jsna7q3pU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 478ABF8063A;
	Mon,  4 Jul 2022 13:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F160F80155; Fri,  1 Jul 2022 21:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C2A2F80107
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 21:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C2A2F80107
Received: by mail-io1-f50.google.com with SMTP id z191so3209965iof.6
 for <alsa-devel@alsa-project.org>; Fri, 01 Jul 2022 12:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oYGwea+9Dc5qlyJ44ffM89yyXqLnWemdQ1bnBNc3VDk=;
 b=jx3Zb+Rjmc83XI3RUW2nCN0cUWohFWSu8NxgeSxDW0WVzlv9WqLWkuhFQawP80fzI5
 HfP1wZ97I4HePBAhslds9RbkNW1xRu2K2U1BgFNQA9xTubIFRUqJeDhQ8pODqDrvo/Rx
 d+/blWUT4WexV5GMkNTY18qBlTXvvu1gIfmPilgy5/6tdjwUK3hpFyjVNVaAKhqnbuDy
 /It17R3ESfvqySj+6pbteOdTuMbn1VTMAl67BlhpiLLazNWUT7hNGS+f20HFU3Zfo9BJ
 1M8dvkBOUeXmXXErlV06FXSCWFYlHP9I2TujcUOtafazne6goPsCxqKJFKQ2Q+u5uQfI
 uYWQ==
X-Gm-Message-State: AJIora9ZprvN0S+CxSmbZo3eQCGcShcbM3vg29N4NncnCMHoJIoWdgxR
 u1oKIdDY5VnVj362Gju1qQ==
X-Google-Smtp-Source: AGRyM1uejcIwzsBE+pycB2Qnm2yYV9wtrnyFGLocbsLu1VxbRBag5KlqP0ugvtvcy/HrL02BZGM2Jw==
X-Received: by 2002:a05:6602:2e8d:b0:64f:b683:c70d with SMTP id
 m13-20020a0566022e8d00b0064fb683c70dmr8094734iow.62.1656704295753; 
 Fri, 01 Jul 2022 12:38:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a92c801000000b002d8f1269e97sm9277818iln.42.2022.07.01.12.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 12:38:15 -0700 (PDT)
Received: (nullmailer pid 1385506 invoked by uid 1000);
 Fri, 01 Jul 2022 19:38:12 -0000
Date: Fri, 1 Jul 2022 13:38:12 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 02/15] dt-bindings: display: ili9341: document canaan
 kd233's lcd
Message-ID: <20220701193812.GA1385448-robh@kernel.org>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-3-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-3-mail@conchuod.ie>
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:02 +0200
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Vetter <daniel@ffwll.ch>, dmaengine@vger.kernel.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
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

On Wed, 29 Jun 2022 19:43:31 +0100, Conor Dooley wrote:
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
