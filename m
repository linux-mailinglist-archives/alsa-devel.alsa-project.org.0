Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 751D289DCC7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 16:40:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB0982BCB;
	Tue,  9 Apr 2024 16:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB0982BCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712673614;
	bh=VsIhIpo9XbPHMfhPqNlNwCHGDoqMfYE2kWZHJaXVHvw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YFzZvF5Ru4ahp4OWjF+MZydq8sMNBZxhteGjdJjIdF0XiUw5uzhr4ZlrkEEiIzSVU
	 IHRg9wzCWRZObYWvG2rzkwDYmizOCQC3gu6sn1T0DoxPEN+khm7pSrROFfNW1U8oxj
	 SB/UiJogYkplaVHu6jOXM+w0xAKyK8YSXLOnyzxo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D7D7F80579; Tue,  9 Apr 2024 16:39:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C408AF8057A;
	Tue,  9 Apr 2024 16:39:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D74E3F8026D; Tue,  9 Apr 2024 16:39:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A4C4F80130
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 16:39:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A4C4F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=b4AskDsX
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-516d47ce662so7297234e87.1
        for <alsa-devel@alsa-project.org>;
 Tue, 09 Apr 2024 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712673566; x=1713278366;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKneFpmrGWPkDYn40mrK/8lEAAuKeHF1X4WijCDVMIA=;
        b=b4AskDsXVWs9lqqhagWF35Q+iUwe2ZGrCRr+nu4NAXFyvcFTJiVWLVsYbUCrDrpVqR
         SOPj8bglV+J0W6me+8cx6dgOKpMhTPB01w/WOzHrdqADYXjlj4Yw1d1wW65AsKbmVU7+
         WOzrAdgIm8CSjRKCwdU78IeEKT4cMHqydD0GFYiRIr0LF0yDWN6SGDV4Hp/TpH6nlCcg
         tgp+KQebXFiUD/ZtE1pHj9FP49hBr+yxuwS9meMICwsJMkNFX60/oe33dhGaP2s3YCtM
         Oc5AwsaxsVi4buZU6JAxMyI5Oh9mQYbsAxvuVh+aVMlSmhWLfIT+lPO4xtnhcpKdMytr
         Gg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712673566; x=1713278366;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKneFpmrGWPkDYn40mrK/8lEAAuKeHF1X4WijCDVMIA=;
        b=wMWX7Y2jdK0PiRjk8z1KTzlh+/vPXj2+xCcw17cYwTZX0E88DhK6pt4dbQJWPn2Y8M
         1SKX5Fb4/Hl5TolsiJPjwU5rMQ9sM2h1mIAIfEVaTucMnYCIsi3MLFwysqSTfdsH/dla
         ZDMvtRbNfpzSlqH5RNL3yWGcfAliWFcz0AVGmmjf97a4VwEHeIqN9rwdzoDz6SJNbOWU
         56tgafFkJSpKF55lJ0xtZUEqzrm+U7oLZzpoofdK7K2JYeDy821MvBsVJSSzIkfb8JyF
         rebk4tUdwNgNWl1/a1wWmLin6f6tj+kl/6wjY+xklZg2qM2jzdQxPoWyxCzpL7JxupOU
         4HiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq/A+NAAaSSK5p1lK/OZUbYq+OiQCvoeoudWUr5U97YmNPTbzDiVv/rAb2b+QCISI4ouHK7ynBAnuou/kPs72zoIT0k5sppuvry5E=
X-Gm-Message-State: AOJu0YwUzHzBDHnUIXlKvYtSA1jdybm84K1a99DsjOxnTD4GG7W4t/OB
	YsoTxiSsU/lIR6VigvylLvSrvk2sqK0Ut4aEHsJb0KHHmxyIGipt
X-Google-Smtp-Source: 
 AGHT+IFNvQ/ssefNKErjmnIGx6yZ1F9nt1Qiw7IcOB3RIUN0vBkaXWO1MGpGc6B7hXDExOz5QM8pow==
X-Received: by 2002:a05:6512:1188:b0:515:af1f:5bad with SMTP id
 g8-20020a056512118800b00515af1f5badmr12034231lfr.28.1712673565917;
        Tue, 09 Apr 2024 07:39:25 -0700 (PDT)
Received: from ?IPV6:2001:999:588:88e2:b205:90f0:e68f:63c6?
 ([2001:999:588:88e2:b205:90f0:e68f:63c6])
        by smtp.gmail.com with ESMTPSA id
 a22-20020a195f56000000b00516d0aecc5esm1594774lfj.141.2024.04.09.07.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 07:39:25 -0700 (PDT)
Message-ID: <e15d8d41-c4ad-4cfb-b10a-89e06a4ece11@gmail.com>
Date: Tue, 9 Apr 2024 17:39:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] ASoC: ti: davinci-i2s: Add features to McBSP
 driver
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, herve.codina@bootlin.com,
 christophercordahi@nanometrics.ca
References: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Language: en-US
In-Reply-To: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A36VJJX2KAJSPJTXM6SP5I4THBUVMZW2
X-Message-ID-Hash: A36VJJX2KAJSPJTXM6SP5I4THBUVMZW2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A36VJJX2KAJSPJTXM6SP5I4THBUVMZW2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Bastien,

On 02/04/2024 10:12, Bastien Curutchet wrote:
> This series aims to add some features to McBSP driver.
> 
> Convert bindings from .txt to .yaml.
> Add possibility to use an external clock as sample rate generator's
> input.
> Add handling of new formats (TDM, S24_LE, BP_FC).
> Enable the detection of unexpected frame pulses.
> Set the clock free-running mode according to SND_SOC_DAIFMT_[GATED/CONT]
> configuration in DAI format.
> Add ti,T1-framing[tx/rx] properties in DT. They allow to set the data
> delay to two bit-clock periods.
> 
> This has been tested on a platform designed off of the DAVINCI/OMAP-L138
> connected to 3 daisy-chained AD7767. An external clock drives the
> sample rate generator through the CLKS pin.
> The hardware I have only allowed me to test acquisition side of McBSP.
> It is connected to a 6 channels TDM and acts as Bit clock provider and
> Frame clock consumer.

Nice and clean, thank you for the updates!

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

PS: sorry for the delay.

> 
> Change log v1 -> v2:
>   PATCH 1 (bindings):
>      * Drop power-domains property's description
>      * Drop the unused label 'mcbsp0' in example
>      * Add <> around each entry of the 'dmas' property
>      * Add 'Reviewed-by: Rob Herring <robh@kernel.org>'
>   PATCH 2 (bindings):
>      * Drop the 'ti,enable-sync-err' flag
>      * Drop the 'ti,disable-free-run' flag
>      * Add 'Reviewed-by: Rob Herring <robh@kernel.org>'
>   PATCH 4:
>      * In probe() use dev_err for fixed error
>   PATCH 7 (TDM):
>      * set playback.max_channels to 128
>      * Add a check on tx_mask as the one done for rx_mask
>      * Allow TDM with BP_FP format
>   PATCH 9:
>      * Detection of unexpected frame pulses is enabled by default
>   PATCH 10:
>      * Free-running mode is selected by the DAI format through
>        SND_SOC_DAIFMT_[CONT/GATED]
>   PATCH 12:
>      * drop the 'ti,drive-dx' property
>      * add 'ti,T1-framing-[rx/tx]' properties
>   PATCH 13:
>      * Drop the drive_dx part
>      * Add support for 'T1 framing' with data delay set to 2 bit-clock
>        periods
> Bastien Curutchet (13):
>   ASoC: dt-bindings: davinci-mcbsp: convert McBSP bindings to yaml
>     schema
>   ASoC: dt-bindings: davinci-mcbsp: Add optional clock
>   ASoC: ti: davinci-i2s: Remove the unused clk_input_pin attribute
>   ASoC: ti: davinci-i2s: Replace dev_err with dev_err_probe
>   ASoC: ti: davinci-i2s: Use external clock to drive sample rate
>     generator
>   ASoC: ti: davinci-i2s: Delete unnecessary assignment
>   ASoC: ti: davinci-i2s: Add TDM support
>   ASoC: ti: davinci-i2s: Add handling of BP_FC format
>   ASoC: ti: davinci-i2s: Enable unexpected frame pulses detection
>   ASoC: ti: davinci-i2s: Link free-run mode to
>     SND_SOC_DAIFMT_[GATED/CONT]
>   ASoC: ti: davinci-i2s: Add S24_LE to supported formats
>   ASoC: dt-bindings: davinci-mcbsp: Add the 'ti,T1-framing-{rx/tx}'
>     flags
>   ASoC: ti: davinci-i2s: Add T1 framing support
> 
>  .../bindings/sound/davinci-mcbsp.txt          |  50 ----
>  .../bindings/sound/davinci-mcbsp.yaml         | 113 +++++++
>  include/linux/platform_data/davinci_asp.h     |  15 -
>  sound/soc/ti/davinci-i2s.c                    | 278 ++++++++++++++----
>  4 files changed, 333 insertions(+), 123 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcbsp.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
> 

-- 
Péter
