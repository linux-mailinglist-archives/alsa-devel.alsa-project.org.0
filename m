Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 187D98A6B52
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 14:41:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAB6D14E2;
	Tue, 16 Apr 2024 14:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAB6D14E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713271260;
	bh=qmhVGDCB3p9HB3TLlFjPrZ/6xvV+VH4aBoNpHmYC524=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Us3mvSJ8wgmC8O72yUtHkTHfGG6FWUtAMXZ+k42EI0i19TLFIeMWuH51E7pWIZVGr
	 QG4J8J6PaQBSqWM1sW3mXH5DJPy5FOGwBE1rL9MNlQ3zwdtF3ELuQx2w3nl4SjLbkI
	 NCcHenE2NTpVngtVd2S6jM7jNFbLi8KQWwNfT5lU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11E3BF8057F; Tue, 16 Apr 2024 14:40:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56909F805A1;
	Tue, 16 Apr 2024 14:40:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94E08F8025A; Tue, 16 Apr 2024 14:40:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6BD9F80124
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 14:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6BD9F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UHFX1Ftn
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-dcc84ae94c1so4102757276.1
        for <alsa-devel@alsa-project.org>;
 Tue, 16 Apr 2024 05:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713271212; x=1713876012;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XocEjulw3kAiCxPyVJw1Ya87AMjOi1KyGw4TtHVGXCk=;
        b=UHFX1Ftn2JujpkhKyrL0ZkOxYWrCo4BOW8BgLbe6vwDXZCdKpLBSoZ7j4IszPkTJkk
         u5d5yqB72CKTse/gvJoqG/Vx3ytlHhg/WaZ0pRAZd7xWH4goaF3yVW1G9YU8xNNr1w8r
         smLrSnyVeklSe7Rt4yhVajCaJ2I9MCJkUQ/nWo2WftgxrMrdJB5ik0Nkk1WhgdG9/oV4
         oFRxzV4FjfXGxMIAtsAKhFlS6zlmlXg9azf+g/vlPZRodQ9XTqsf8rXvG1feUqhtwo+3
         yQ90VdMDdReBcFusQzhyxuQIsVmUSNDNxo+UdJMYb9RfwhYzd0YEYTSGWK60tGN11+1M
         oVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713271212; x=1713876012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XocEjulw3kAiCxPyVJw1Ya87AMjOi1KyGw4TtHVGXCk=;
        b=pICe61M41a2bTPkpnSxJWw6dnW0miY1DpddC+Ur/9AWsHWLTAY4/boDrndhczECQgc
         zZ6zUCKj4WvL+OeyTrKo0+B/Hdeqtk+BdFbUJ9aetufZVY1dzI7RXy1CIKSvo60mlyP1
         qSvUzH5la6jIjV8YEnqBOn8hPJQXcej7mKz9xgy6nCil2c21xmcK/Hwv/H2Bh9aBYhaU
         WGnsCUPQbfpuHVqKxWpLqvrZC6bfu8WImjhJozqRryq6REAPI95UwGgaJLw1lEQmLjta
         +nshk+PjyavJl3uUO6pRl9teN8PUK06TSokkaITjFF4uwAGyOr7Q80cVhhU6UQXHR+mJ
         0BZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV15mjgsvylCo+eC47l/r7YN+EHqI5BHBmOntsqBbLaYVZo7MnGwSsvhQ5xlNh27A8TGY85woHaxnB5ZmHpEWOIOXxkpjtfezgPAug=
X-Gm-Message-State: AOJu0YyReg7AUUiW86slLR0v8dQSS1dyaQ3dZytfwz3gOGPCPaQYf4Km
	2+hCriKIpfVlemnrxZHYhPwKVfITwKbhRLi2lQfRRltXLhGg45rZmEgOJwDbSOSbRhMpyExV4hE
	4gGcq2lFbk6KQEFd2bYnKL62mhk9ogTJk25+oSA==
X-Google-Smtp-Source: 
 AGHT+IGJhFIyKEbY2TNHNPrCm3GRm5c6L7GB4Z/sH1BLsFZXKmx3pHDdVDxtNq7uyYtUlxMVzqOrk0oaE4WyfbJcIG8=
X-Received: by 2002:a25:bc4c:0:b0:dcb:fe58:a08b with SMTP id
 d12-20020a25bc4c000000b00dcbfe58a08bmr11907548ybk.15.1713271212014; Tue, 16
 Apr 2024 05:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240416063600.309747-1-quic_mohs@quicinc.com>
In-Reply-To: <20240416063600.309747-1-quic_mohs@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 15:40:01 +0300
Message-ID: 
 <CAA8EJprABOeWrAm-PyeLF1ZM95qC17bxyZvEVpGG1Wz97KLYWQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] ASoC: codecs: wcd937x: add wcd937x audio codec
 support
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_rohkumar@quicinc.com, quic_pkumpatl@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: JUDAEQ7OZG6QK63NJGG6QJ6JBTIB44BI
X-Message-ID-Hash: JUDAEQ7OZG6QK63NJGG6QJ6JBTIB44BI
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JUDAEQ7OZG6QK63NJGG6QJ6JBTIB44BI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 Apr 2024 at 09:36, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>
> This patchset adds support for Qualcomm WCD937X codec.
>
> Qualcomm WCD9370/WCD9375 Codec is a standalone Hi-Fi audio codec IC
> connected over SoundWire. This device has two SoundWire devices, RX and
> TX respectively supporting 3 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
> 6 DMICs and MBHC.
>
> For codec driver to be functional it would need both tx and rx Soundwire devices
> to be up and this is taken care by using device component framework and device-links
> are used to ensure proper pm dependencies. Ex tx does not enter suspend
> before rx or codec is suspended.
>
> This patchset along with other SoundWire patches on the list
> have been tested on QCM6490 IDP device.
>
> Changes since v8:

I hope it's a typo here since the series is v2, not v9

>  - Split the patch per driver for easier review as suggested by Krzysztof
>  - Used devm_gpiod_get api to get reset gpio as suggested by Krzysztof
>
> Prasad Kumpatla (8):
>   ASoC: dt-bindings: wcd937x: add bindings for wcd937x
>   ASoC: codecs: wcd937x: add wcd937x codec driver
>   ASoC: dt-bindings: wcd937x-sdw: add bindings for wcd937x-sdw
>   ASoC: codecs: wcd937x-sdw: add SoundWire driver
>   ASoC: codecs: wcd937x: add basic controls
>   ASoC: codecs: wcd937x: add playback dapm widgets
>   ASoC: codecs: wcd937x: add capture dapm widgets
>   ASoC: codecs: wcd937x: add audio routing and Kconfig
>
>  .../bindings/sound/qcom,wcd937x-sdw.yaml      |   71 +
>  .../bindings/sound/qcom,wcd937x.yaml          |  119 +
>  sound/soc/codecs/Kconfig                      |   20 +
>  sound/soc/codecs/Makefile                     |    7 +
>  sound/soc/codecs/wcd937x-sdw.c                | 1148 +++++++
>  sound/soc/codecs/wcd937x.c                    | 3036 +++++++++++++++++
>  sound/soc/codecs/wcd937x.h                    |  655 ++++
>  7 files changed, 5056 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
>  create mode 100644 sound/soc/codecs/wcd937x-sdw.c
>  create mode 100644 sound/soc/codecs/wcd937x.c
>  create mode 100644 sound/soc/codecs/wcd937x.h
>
>
> base-commit: 6bd343537461b57f3efe5dfc5fc193a232dfef1e
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry
