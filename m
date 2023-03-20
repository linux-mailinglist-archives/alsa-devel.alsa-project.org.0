Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F476C1AD4
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 17:03:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8242C1E8;
	Mon, 20 Mar 2023 17:02:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8242C1E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679328214;
	bh=aS3kvy0hf4rROq0OOeJ5m5ki7R+oJAsQgVol28UKzG8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cBrVsZ+7nohqIAMBRRHQyht6044TnCufJBRP2ad/RxINJ4TfVpE7tfo7HG8HTPANp
	 e9I6TLjTuD1FTmO6m8oYEWf89TZnaco/zr7T7c0F340SH7SDTZrfW8GVre9zF1bIc1
	 Kiqr99ZimhTNAe53uaHWJEK+q4Bk/MtZD1HxcYws=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CA7CF80482;
	Mon, 20 Mar 2023 17:02:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51297F804FE; Mon, 20 Mar 2023 17:02:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF2B2F8027B
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 17:02:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF2B2F8027B
Received: by mail-ot1-f54.google.com with SMTP id
 w22-20020a9d77d6000000b0069d2032f98aso6896744otl.12
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Mar 2023 09:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679328152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ONYF9Dhx9WuItYv8TAksl5NcQGpYz4D/9DErzT0sW8=;
        b=vEfH+t0K67ft8m2VSbDxvYAhKT+698zevCBgjh6ns19dTU1l+Rq5swSkXIlzxlm74J
         XhKaNjgDZC0D9nevuB/suh2nVi5LBgcmPeePPa9JpGtvEWWYHWQxo7ZwS/pqf1nGGJS5
         JpwWffygAlNylAWO/UDYqLDe4ZPkyfJxNuQ6edUIvO9CZ0GWycquHWupu6biwKdXeY30
         HvUfqb1h3iWdXpCDOJFLVyVOMAB6om294Bok7v8mBi8jOU6CsLwCTLKCoyoOhvjVC4+x
         3YJeotxq+IN9CTd+xxrzD0uvL76LXYD76cd8WV+TUaoAbzezfUKPwaILMfLOduyzQDRz
         SX2A==
X-Gm-Message-State: AO0yUKWIOGkPGHLNFI3+5wiU8ewO5Pxs52sp8Yx2goXaAT/hDnpaBKP8
	e3PgyA54PYgngASz9mgjhw==
X-Google-Smtp-Source: 
 AK7set8NH1bWAW41KIn+lr6vHiP/x1CpF/1YMJ08oLnvsEuB8hZrMa5U2xgwSIKI0WC3TSJ4A51DjA==
X-Received: by 2002:a9d:7595:0:b0:69e:80e7:905f with SMTP id
 s21-20020a9d7595000000b0069e80e7905fmr243497otk.13.1679328152031;
        Mon, 20 Mar 2023 09:02:32 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 c7-20020a9d6847000000b0069f71b0d060sm117205oto.36.2023.03.20.09.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 09:02:31 -0700 (PDT)
Received: (nullmailer pid 1767227 invoked by uid 1000);
	Mon, 20 Mar 2023 16:02:30 -0000
Date: Mon, 20 Mar 2023 11:02:30 -0500
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 03/11] ASoC: dt-bindings: everest,es8316: Document audio
 graph port
Message-ID: <167932814988.1767188.7685028838394723224.robh@kernel.org>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-4-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315114806.3819515-4-cristian.ciocaltea@collabora.com>
Message-ID-Hash: NN35EOCH4TYT2NVD34GKRXLBUU6IRIVT
X-Message-ID-Hash: NN35EOCH4TYT2NVD34GKRXLBUU6IRIVT
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-serial@vger.kernel.org, Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
 Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>, Daniel Drake <drake@endlessm.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NN35EOCH4TYT2NVD34GKRXLBUU6IRIVT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 15 Mar 2023 13:47:58 +0200, Cristian Ciocaltea wrote:
> The ES8316 codec is currently used in conjunction with audio-graph-card
> to provide an endpoint for binding with the other side of the audio
> link.
> 
> This is achieved via the 'port' property, which is not allowed:
> 
>   rk3399-rockpro64.dtb: codec@11: Unevaluated properties are not allowed ('port' was unexpected)
> 
> Fix the issue by documenting the missing property.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/sound/everest,es8316.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

