Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B30566C1AD5
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 17:03:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B3141F7;
	Mon, 20 Mar 2023 17:02:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B3141F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679328229;
	bh=Fj8tYp17od3b9AfXhpo2dUkmmlUDolLnCON+lhgnLcI=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A7HwfjFME9rG+gfhCRr+1naKkbsIbaiTaeDXAizRF3vD53K+uGNqWyydrrIVOfrAx
	 dbIuBbIPVHCXqBIj5YxMSqkU3eqOvOQXtAR7iHSXpjMk34r6larFnCEo6D20F/5A9O
	 YbEbfFEP3QX+VjurgVc2blC85WZp6tpovaadYVwY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3E34F802E8;
	Mon, 20 Mar 2023 17:02:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1AB0F804FE; Mon, 20 Mar 2023 17:02:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4832EF80254
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 17:02:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4832EF80254
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-17e140619fdso5009453fac.11
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Mar 2023 09:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679328167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXPLPHoO6OcEzh0FRvvTkMYHJJivlJafTToDO4kOl40=;
        b=OQTszpaQOBATtdHbZFDWEqIPdd9EgX9OU5odHYqvztOPLsf+aLFNQVpEyWLYlJnha8
         f3ECdM4KX95pbnapSALuccJUDRvIHwKBmlAdsr18qwWb9SrmfXmV38nH1GaHtdZXKzsa
         rpl1EO6ToswMoJ6vkAm90m7dTsetAKnXSV1muBUhwCY6O7yPeQ5nF0S0OBecCyuDIOmC
         MOW5zoch2jrvUjAzecjzKwwYyfgqgXCxy0nHPm3CnNCWqzUiVlDFqfYXWiQJ8uIL0gjj
         /VGbe9PmhGZHeEQjxLY003ZAfQAFWakt4i5ZqM4YxxKpeMx/V/vu7KUAfgfNbj0tXeRp
         yGuA==
X-Gm-Message-State: AO0yUKUfJxeLocDgBD+BXkQJu+pMNSQnm1vh9QeaYrg73MXfbodS+kjn
	oZvOyYr5T/6sj/Yuu1WV2A==
X-Google-Smtp-Source: 
 AK7set8XvRgwjmJDOYipg3BA4ranqSKnJyKo74CpeOtIhfaO2wH4agFUVkOR5yGuCLkfnjT0NXGXHA==
X-Received: by 2002:a05:6870:a549:b0:17a:b214:f004 with SMTP id
 p9-20020a056870a54900b0017ab214f004mr5277277oal.6.1679328167586;
        Mon, 20 Mar 2023 09:02:47 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 tk6-20020a05687189c600b0017703cd8ff6sm3389673oab.7.2023.03.20.09.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 09:02:47 -0700 (PDT)
Received: (nullmailer pid 1768734 invoked by uid 1000);
	Mon, 20 Mar 2023 16:02:45 -0000
Date: Mon, 20 Mar 2023 11:02:45 -0500
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 04/11] ASoC: dt-bindings: rockchip: Document audio graph
 port
Message-ID: <167932816525.1768684.13404674229392132860.robh@kernel.org>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-5-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315114806.3819515-5-cristian.ciocaltea@collabora.com>
Message-ID-Hash: PIDKF2PZSLVM43L5OIQWLOX7KXQ2OVVT
X-Message-ID-Hash: PIDKF2PZSLVM43L5OIQWLOX7KXQ2OVVT
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 devicetree@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Daniel Drake <drake@endlessm.com>, linux-arm-kernel@lists.infradead.org,
 Takashi Iwai <tiwai@suse.com>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>, kernel@collabora.com,
 Albert Ou <aou@eecs.berkeley.edu>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PIDKF2PZSLVM43L5OIQWLOX7KXQ2OVVT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 15 Mar 2023 13:47:59 +0200, Cristian Ciocaltea wrote:
> The Rockchip I2S controller is currently used in conjunction with
> audio-graph-card to provide an endpoint for binding with the other side
> of the audio link.
> 
> This is achieved via the 'port' property, which is not allowed:
> 
>   rk3399-rockpro64.dtb: i2s@ff890000: Unevaluated properties are not allowed ('port' was unexpected)
> 
> Fix the issue by documenting the missing property.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

