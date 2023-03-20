Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ED86C1AD8
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 17:04:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E7581EE;
	Mon, 20 Mar 2023 17:03:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E7581EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679328262;
	bh=6ICgqrZ8WPih5/1FeVraPmUIWjBfcxuDh1e6GLqDh/E=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LmGktyLsifmEoBNfWFqSsEAwzaT+3nfhD5dJWMg7oOerHJNkX4+bASI9gJdiccDQs
	 nTVkrY3BaHNuQw94WBlM/sZGnjaTthzlbbCHaQKlhNlCHzi5rtKmp+EdOE+MtCL1SW
	 R6GwjFiFcwdTBL6ZitM+YOcOWHl6FWpPMtbOQk1o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB5B4F80529;
	Mon, 20 Mar 2023 17:03:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ABE0F8052D; Mon, 20 Mar 2023 17:03:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DA64F80529
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 17:03:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DA64F80529
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-17ab3a48158so13533379fac.1
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Mar 2023 09:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679328196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fk4bf5o+T0icO2it+WiVyLr9KB3ljMdbR5QHyH11JsI=;
        b=YpkPS2qmbAVGR+FEaTP9wZ/+Q8papwTsI5l8T9YGEln3xfg3n5LGvkTa8akr74gmKB
         M25smt+cT+xdjN9T5R7Iioen5HGnjYsLB1czM1mm++q0owxcsNlHwXdMj8QTUnEeDd+3
         1ScaoD4OtwBiH8Hl9oftj4KXn/G3v24Dg9g/3ATlDEFx/rxOK0qiNs3WMxz/YzvUccTO
         plbZcZy4mL2NU6ZMGaj0eiCB26aeoXOi5ZCA/QSNiDajJqY/pZ0c4v4z3TJVO2IlAPLW
         dD9EQx/vItD/N9C660vZHHy4FYgGvI8zOV7EF0hRdkgiRP8DtIgV7nYPCnDoOtEdfmA+
         OPPQ==
X-Gm-Message-State: AO0yUKVqOUK5c4pgxvXF/erw8DsJWdDPKE1t3oahmjaB63ANM3tEP+lA
	BC+rg1/ejox9saiBqEJXHw==
X-Google-Smtp-Source: 
 AK7set+K3nWOBlUoUowZ7HA8nsud+xt7EyVHYJaSSzw2tyQ5SdbaGQ0LXy0ftmchOcmPlwGf6U+e7g==
X-Received: by 2002:a05:6870:4789:b0:177:baf4:5b10 with SMTP id
 c9-20020a056870478900b00177baf45b10mr5713445oaq.31.1679328196643;
        Mon, 20 Mar 2023 09:03:16 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 zd47-20020a05687127af00b0016dbf59175bsm3363841oab.47.2023.03.20.09.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 09:03:16 -0700 (PDT)
Received: (nullmailer pid 1771200 invoked by uid 1000);
	Mon, 20 Mar 2023 16:03:15 -0000
Date: Mon, 20 Mar 2023 11:03:15 -0500
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 06/11] ASoC: dt-bindings: rockchip: i2s-tdm: Document
 power-domains
Message-ID: <167932819469.1771105.12720875880996381388.robh@kernel.org>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-7-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315114806.3819515-7-cristian.ciocaltea@collabora.com>
Message-ID-Hash: FXVKRPAZTHEODVSCRI4XE5LEDKN5CJUB
X-Message-ID-Hash: FXVKRPAZTHEODVSCRI4XE5LEDKN5CJUB
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: kernel@collabora.com, Rob Herring <robh+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Daniel Drake <drake@endlessm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Brown <broonie@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 devicetree@vger.kernel.org, Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Takashi Iwai <tiwai@suse.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FXVKRPAZTHEODVSCRI4XE5LEDKN5CJUB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 15 Mar 2023 13:48:01 +0200, Cristian Ciocaltea wrote:
> The binding document is missing the power-domains property. Add it.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

