Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 229B5880433
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Mar 2024 19:02:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B11A2BA9;
	Tue, 19 Mar 2024 19:01:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B11A2BA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710871323;
	bh=fURqETKu8mthWcz2QdEl07SUDYEre4FagvpPaVAfaU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iXEQN7aZOiCHFH2tUDuP5FeKbXwF4LU2IksiWqZvU9ODR9v2C0rz7+GC1x3L+55iJ
	 dKctsloZudU/d7RPQ7hJ5B4TNdAcRLK6LTdZ4Qfx7G1GQoYLZtFe8zQ0lAej98PXcJ
	 rcwN8fI79VdzBB6gnApGLopdU7We9BjhHy1XmmW0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34397F8059F; Tue, 19 Mar 2024 19:01:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71E25F8057E;
	Tue, 19 Mar 2024 19:01:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B116F804E7; Tue, 19 Mar 2024 19:01:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1C44F80088
	for <alsa-devel@alsa-project.org>; Tue, 19 Mar 2024 19:01:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1C44F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=f2aGhVpi
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d41d1bedc9so103837151fa.3
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Mar 2024 11:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710871268; x=1711476068;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RFqJ9v2zgUJwbKbtJortrw7B6iqBove/bjKEeSOHJg4=;
        b=f2aGhVpine5g/iVzLxI/gNFuvqdVN2UgYQB62+AxPGuoY2EvX8VYCnNWR0UvfdqMrV
         WQGET8CR9WMknEfPFzDiCfPXpQMUENPY4kn5D+zvhXLNg6awYfi5l20mcuEqQ1nUGig9
         wiwoWjQaw4k6jsB4GId+v41v2jvbJG/1Rhx/oXpuQOQbol80vG5IQ6nczbbACwVTxjFT
         q89e9VW87ftjdj0YRTJh2/xEz6LIGclUtLLlIr4mYTVgCuM2TzS0Npq+L5xEUcuUJiQZ
         1CZZKp0J3i4E6V9oPXkpaZBp7ujACZq70LjBSDBe2xcvdh5kXWbTSs/zhwVqc7SrLe7e
         e6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710871268; x=1711476068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RFqJ9v2zgUJwbKbtJortrw7B6iqBove/bjKEeSOHJg4=;
        b=BBoMf0PKFlEBaTedPNh8UWMIElvfu3YOUVWSVh0RIqV2atvIC8XG44fu3jIwLxA9Vm
         rH6auQHE58TMCFs6NZTr/S2JgJvlmXKJv6Dg5WiPG4sIG3UbuCebdzv+sRoFAyHGseqy
         kihBCDtrHLHysqzYYRZa3AdOQG1QxrDI6GJH2BTCHn++0syBVQzgyb5qr7kmezuPKeew
         RB/sOvZXGBO91u/WOe3kByIkx0+pr9d9aA/qXrFOxfRTnGi8ghqEWCRBEfyFlCPfLcwW
         tlPRZ6Q6PRYlt/yBfHoQnlFYQ3E3QIVZTqEmNXjQyib+IxUg31rEJgoeOlzTuK94ZuFM
         imgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxBsZPV6qWlaFDSXSBvYuKSil1ESn/en0e7WLT+zv1ueuI/agP0FD7taqw88RUjK+/vRPvAp01oJpSUCVmq/+wVlomyAJTMTJYQu4=
X-Gm-Message-State: AOJu0YzwHgGmPhFSErLEs6emj2MnfX9PPN8VuiIbDrA7KE55c0+Vf0/e
	awy4XMDN5cOWILsJzueB9itmq1qpZX223JsWNcY8gBtHD0ddGe8m
X-Google-Smtp-Source: 
 AGHT+IH0wFJ4592JDW/65IORR4qqB7fVXRxiU1BJVdjEM8SP91uo7X5gC1S4P1w5CR0U9QhO74npjA==
X-Received: by 2002:a2e:8e99:0:b0:2d6:84a4:99b4 with SMTP id
 z25-20020a2e8e99000000b002d684a499b4mr2261330ljk.20.1710871268053;
        Tue, 19 Mar 2024 11:01:08 -0700 (PDT)
Received: from [10.0.0.100] (host-85-29-76-118.kaisa-laajakaista.fi.
 [85.29.76.118])
        by smtp.gmail.com with ESMTPSA id
 g6-20020a05651c078600b002d0b21bf81esm1946002lje.43.2024.03.19.11.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 11:01:07 -0700 (PDT)
Message-ID: <6e120eee-5cec-460c-87d2-40ef776efc3d@gmail.com>
Date: Tue, 19 Mar 2024 20:02:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] ASoC: dt-bindings: davinic-mcbsp: Add the
 'ti,drive-dx' property
Content-Language: en-US
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, herve.codina@bootlin.com,
 christophercordahi@nanometrics.ca
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-13-bastien.curutchet@bootlin.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20240315112745.63230-13-bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PZCZ5I3AAHJUJ3OKSBAV5TKJUHMFRFXL
X-Message-ID-Hash: PZCZ5I3AAHJUJ3OKSBAV5TKJUHMFRFXL
X-MailFrom: peter.ujfalusi@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZCZ5I3AAHJUJ3OKSBAV5TKJUHMFRFXL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 15/03/2024 13:27, Bastien Curutchet wrote:
> McBSP is able to handle capture and playback stream.
> The McBSP's DX pins that outputs serial data during playback streams can
> be used to output a chosen pattern during capture streams. For instance,
> this can be useful to drive an active-low signal during capture streams
> (by choosing <0> as pattern)

or configure the MCBSPx.DX pin as GPO and use it as a GPIO?

Quite novel use of the hardware, no doubt about it. If you don't have
DMA servicing the TX, it will just re-transmit the word from from the
DXR register when the transmitter is pulled out of reset.

Interesting, but I'm not sure if this belongs to DT.

> Add a 'ti,drive-dx' property that can be used to repeatedly output a
> chosen pattern on DX pin while capture stream is ON.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
>  Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
> index d8d4e7ea6e02..f4d1fc6bcd61 100644
> --- a/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
> +++ b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
> @@ -80,6 +80,13 @@ properties:
>        Enable synchronisation error detections when an unexpected frame pulse is
>        received. If not present, unexpected frame pulses are ignored.
>  
> +  ti,drive-dx:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      If the property is present, McBSP will repeatedly output the selected
> +      value on DX pin during capture streams. For instance, if set to 0, this
> +      can be used to drive an active-low signal.
> +
>  required:
>    - "#sound-dai-cells"
>    - compatible

-- 
Péter
