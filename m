Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B68BE6C1AD6
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 17:04:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 916C5741;
	Mon, 20 Mar 2023 17:03:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 916C5741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679328242;
	bh=pD+jqlf7QV2BR4zoRrOaSuVlub2KrG+bXiMzxzGlcKA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZOfUlhMnk5TTNhg3VUOvZzxbS9O2w6rjPhJskopnGm17GclnKBoksz1S1gszGf2so
	 RjNi4Obdp9wcuvOH27bRlm36c+5SAxrSByfSk3oP0qaI2iuwJGTeyIVfM74rTMGZLb
	 CNOyUIU8GDU/xbcoEIXakVKs1zA0+TJBAN7tuYSs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1215DF8051B;
	Mon, 20 Mar 2023 17:03:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32DABF8051B; Mon, 20 Mar 2023 17:03:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06F9CF80520
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 17:03:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06F9CF80520
Received: by mail-oi1-f179.google.com with SMTP id q30so1926350oiw.13
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Mar 2023 09:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679328180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNC+OXlKdlbVkyP5FbmhjfPQE78DDQdoT/lxRDWBrmE=;
        b=2WKWmCTFO14YEvELB/93jUBu4Vp6RO29BUExgD+2rJcRmkrGx9akSGDITmYgVP7gId
         xfV1ZSrYHHMJDitu64srtFsdTsVRtlbRnfrEURENULFwLDrs1XGuj9z+PmMX/PFZzfJr
         SIdBw3Y38pYZkM6NONNn5hjyeromgdinbpMFuwacP2JihjkuZXchydRWwJ02fOKGOQV4
         iMT3HCGLlpbrWv5qPrCgUxLs/LbBwG1c8tLuH84VL7e5aj+UXy9EZkzuOdi23Wb5c+2M
         5X0kMJ3VbsJ4zNF4uzlFV9gQ3RcP+RqZ/qctylNBnwhfFc8AXZhhUUy+Hw8lZrRzHruY
         3THQ==
X-Gm-Message-State: AO0yUKWXX+UPa9DIuKkRHJw5fWlNwZFwnekzWvE0S0cLHpG/86U2RLot
	ktpfhLOqHEFDxdCxpIXmXg==
X-Google-Smtp-Source: 
 AK7set8Py2GSqg1krKh8kyywDWaz6ivjsTyoY4utp1Q09KYKg3F84NdU3xUAPh4qNBy0G//Ug9VI1w==
X-Received: by 2002:aca:f04:0:b0:387:115d:1e26 with SMTP id
 4-20020aca0f04000000b00387115d1e26mr209867oip.3.1679328180069;
        Mon, 20 Mar 2023 09:03:00 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 bk38-20020a0568081a2600b0037832f60518sm3821272oib.14.2023.03.20.09.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 09:02:59 -0700 (PDT)
Received: (nullmailer pid 1770233 invoked by uid 1000);
	Mon, 20 Mar 2023 16:02:58 -0000
Date: Mon, 20 Mar 2023 11:02:58 -0500
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 05/11] ASoC: dt-bindings: rockchip: i2s-tdm: Document
 audio graph port
Message-ID: <167932817831.1770182.9717265674737412940.robh@kernel.org>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-6-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315114806.3819515-6-cristian.ciocaltea@collabora.com>
Message-ID-Hash: SYVDJK3J3VAN3WLFQZIHLY4Q2IWAD3R4
X-Message-ID-Hash: SYVDJK3J3VAN3WLFQZIHLY4Q2IWAD3R4
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Heiko Stuebner <heiko@sntech.de>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-riscv@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-rockchip@lists.infradead.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Daniel Drake <drake@endlessm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SYVDJK3J3VAN3WLFQZIHLY4Q2IWAD3R4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 15 Mar 2023 13:48:00 +0200, Cristian Ciocaltea wrote:
> Document the 'port' property to allow the Rockchip I2S TDM controller to
> be used in conjunction with the audio-graph-card.
> 
> The property will be used to provide an endpoint for binding to the
> other side of the audio link.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

