Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A64E187D18E
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 17:54:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A70242356;
	Fri, 15 Mar 2024 17:53:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A70242356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710521643;
	bh=J/mesTovEYtNSpXC1b7Hu6rWx3dBemBmXwuP4LpnTNA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FhWpMzyWid09jefXaNvAJwt2VqcF7wC8mGzoc77LxlZPKzFUevP08l1hnmqKVBu34
	 Lwk1A2p1vmjzfsJuBXMOzrQsr3Gfh5fTLdxM1DT1zMgwy4YPh0VvnrUiDmQKtkO4BL
	 kgO3VsSFSQ+K+0bc1R5M0Qy/7NtIC4R+Sf1kZbJk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10B44F8057C; Fri, 15 Mar 2024 17:53:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90F7FF8059F;
	Fri, 15 Mar 2024 17:53:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F5E6F8028D; Fri, 15 Mar 2024 17:53:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75255F8014B
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 17:53:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75255F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RRxKpWjJ
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d109e82bd0so27469141fa.3
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Mar 2024 09:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710521587; x=1711126387;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52kT8RCFGC7okKDqG5Bcwj1POjAaTduZrpTnpA9FpD0=;
        b=RRxKpWjJkuqX8A6C8EVeb5zgOEHYVOdT7q1m2kOAwuQUL80hyXCFmYe7OXfKQGJS57
         Jb+JbZuDTVjwdihkKQdoe8qN9UG05yF7Rpm6+vg83ZmcbhnxkKkwQOrodza6UzMvRGoi
         wN+rx7wyNwux/Zrccw9LIReoIZn5GrnIcNexQYjMLMc02HyFJiymqbpfkDUm8uOPWfZd
         fgKNXd48wOaqA72FGbrd41sgYFLU4qXpfQS7U3XAVhJiWb07DWpk5Xg4Nqe2kQkqz9Un
         xHXZ2x0brJsOBguGMBhlu5XClBJtKpLaK28bSUErAeKi5fziUhhbJKyW0ZH2x241yKqq
         YXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710521587; x=1711126387;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=52kT8RCFGC7okKDqG5Bcwj1POjAaTduZrpTnpA9FpD0=;
        b=IOWKkf0XhOlDHmypILFtQMhFeViNqZB95gGGxBGxEPh1CZiqfTjr2E7+IxmMQtu66T
         wgUUVXFKyaksggtCW5FcBQ+sQxDfRRNsDdmMdGWTbw7INWrUb5q42atoVuqGusps4rCF
         gkvXFa91vR880uIms3uSd1p2HFooJE4D8t9F3IAKzwUL2DvCox122x5ep5pYncKu7u70
         lgR5oaojp+bm6u3f9UBGQCB89THzUQ1iLhq6f43tz3IOr/zFz3SF1tdQsH3fbTZ/PaJc
         9noswK0vjDYyf9R/ATUhzTSf9FBYIIxtA0cZeb0Lxwq1HWyTnAbBR1QYZUndhl2NCCPj
         GUHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmZaNkQ9p9xOePi4D2UKlL23/hQIfrI9ptjtvtrQj/Wx8PCwk+5jSECk7klp8ZQteHfIa7DukCvz/ZxT3ypCy7L2lqvIRPMW9QZv0=
X-Gm-Message-State: AOJu0YzGPPR2WHjIaMDoDaxFy+AZQX+TpwLEx5xnjj6sO4SOP4Imb6p1
	xdQEB/XSibeg9/2+eLy5Buvk+x6cYCkUzaI2S/N888WiiEGmQs7PnKiklI/mgus=
X-Google-Smtp-Source: 
 AGHT+IHLfd0FUA2LIoNuC9vV0UbukiLHlnyaISY5TaECNKl/ARlCMBUC7tn6mgNu/CU8tNB0bzSEnQ==
X-Received: by 2002:a19:911e:0:b0:513:d24f:6455 with SMTP id
 t30-20020a19911e000000b00513d24f6455mr3304106lfd.29.1710521587073;
        Fri, 15 Mar 2024 09:53:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a633:992a:92cc:9c3?
 ([2a01:e0a:982:cbb0:a633:992a:92cc:9c3])
        by smtp.gmail.com with ESMTPSA id
 l24-20020a05600c1d1800b00413e6a1935dsm6359144wms.36.2024.03.15.09.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 09:53:06 -0700 (PDT)
Message-ID: <4bb2fa50-0944-456d-b51b-449a2bd9bb69@linaro.org>
Date: Fri, 15 Mar 2024 17:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 00/25] Introduce support of audio for Amlogic A1 SoC
 family
Content-Language: en-US, fr
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: kernel@salutedevices.com
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2ANIDDJHS34L5ZENDLOTEQBRMRVOUN7E
X-Message-ID-Hash: 2ANIDDJHS34L5ZENDLOTEQBRMRVOUN7E
X-MailFrom: neil.armstrong@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: neil.armstrong@linaro.org
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ANIDDJHS34L5ZENDLOTEQBRMRVOUN7E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jan!

On 15/03/2024 00:21, Jan Dakinevich wrote:
> This series includes the following:
> 
>   - new audio clock and reset controller data and adaptation for it of existing
>     code (patches 0001..0004);
> 
>   - adaptation of existing audio components for A1 Soc (patches 0005..0021);
> 
>   - handy cosmetics for dai-link naming (patches 0022..0023);
> 
>   - integration of audio devices into common trees (patch 0024);
> 
>   - audio support bring up on Amlogic ad402 reference board (patch 0025). This
>     patch is not actually checked on real hardware (because all ad402 that we had
>     were burned out). This patch is based on ad402's schematics and on experience
>     with our own hardware (which is very close to reference board);

Thanks for your serie, it's nice you're working on upstreaming this feature.

In my opinion it's fine to have a "big" initial serie if you're not sure
if your changes are ok, but next time add the RFC tag so we know it's not
a final changeset and you seek advices.

Overall the code is clean and your patch order makes sense if they were meant
to be applied by a single maintainer, but in this case it will be split
into multiple subsystems so it's better to split them as Jerome explained
to ease review and the maintainers process.

Don't hesitate discussing with us in the #linux-amlogic IRC channel
on Libera.Chat, the goal is to reduce the number of patch version and
ease the review and maintainance process.

Concerning the link-name property, I think it should be done afterwards
since it's not necessary to support audio on A1, and I think it could
be extended to other SoC boards (which would be a great feature).

Neil

> 
> Dmitry Rokosov (2):
>    ASoC: dt-bindings: meson: introduce link-name optional property
>    ASoC: meson: implement link-name optional property in meson card utils
> 
> Jan Dakinevich (23):
>    clk: meson: a1: restrict an amount of 'hifi_pll' params
>    clk: meson: axg: move reset controller's code to separate module
>    dt-bindings: clock: meson: add A1 audio clock and reset controller
>      bindings
>    clk: meson: a1: add the audio clock controller driver
>    ASoC: meson: codec-glue: add support for capture stream
>    ASoC: meson: g12a-toacodec: fix "Lane Select" width
>    ASoC: meson: g12a-toacodec: rework the definition of bits
>    ASoC: dt-bindings: meson: g12a-toacodec: add support for A1 SoC family
>    ASoC: meson: g12a-toacodec: add support for A1 SoC family
>    ASoC: meson: t9015: prepare to adding new platforms
>    ASoC: dt-bindings: meson: t9015: add support for A1 SoC family
>    ASoC: meson: t9015: add support for A1 SoC family
>    ASoC: dt-bindings: meson: axg-pdm: document 'sysrate' property
>    ASoC: meson: axg-pdm: introduce 'sysrate' property
>    pinctrl/meson: fix typo in PDM's pin name
>    ASoC: dt-bindings: meson: meson-axg-audio-arb: claim support of A1 SoC
>      family
>    ASoC: dt-bindings: meson: axg-fifo: claim support of A1 SoC family
>    ASoC: dt-bindings: meson: axg-pdm: claim support of A1 SoC family
>    ASoC: dt-bindings: meson: axg-sound-card: claim support of A1 SoC
>      family
>    ASoC: dt-bindings: meson: axg-tdm-formatters: claim support of A1 SoC
>      family
>    ASoC: dt-bindings: meson: axg-tdm-iface: claim support of A1 SoC
>      family
>    arm64: dts: meson: a1: add audio devices
>    arm64: dts: ad402: enable audio
> 
>   .../bindings/clock/amlogic,a1-audio-clkc.yaml |  83 +++
>   .../reset/amlogic,meson-axg-audio-arb.yaml    |  10 +-
>   .../bindings/sound/amlogic,axg-fifo.yaml      |   8 +
>   .../bindings/sound/amlogic,axg-pdm.yaml       |   5 +
>   .../sound/amlogic,axg-sound-card.yaml         |  12 +-
>   .../sound/amlogic,axg-tdm-formatters.yaml     |  22 +-
>   .../bindings/sound/amlogic,axg-tdm-iface.yaml |   6 +-
>   .../bindings/sound/amlogic,g12a-toacodec.yaml |   1 +
>   .../bindings/sound/amlogic,gx-sound-card.yaml |   6 +
>   .../bindings/sound/amlogic,t9015.yaml         |   4 +-
>   .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 126 ++++
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 471 +++++++++++++++
>   drivers/clk/meson/Kconfig                     |  18 +
>   drivers/clk/meson/Makefile                    |   2 +
>   drivers/clk/meson/a1-audio.c                  | 556 ++++++++++++++++++
>   drivers/clk/meson/a1-audio.h                  |  58 ++
>   drivers/clk/meson/a1-pll.c                    |   8 +-
>   drivers/clk/meson/axg-audio.c                 |  95 +--
>   drivers/clk/meson/meson-audio-rstc.c          | 109 ++++
>   drivers/clk/meson/meson-audio-rstc.h          |  12 +
>   drivers/pinctrl/meson/pinctrl-meson-a1.c      |   6 +-
>   .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 ++++
>   .../reset/amlogic,meson-a1-audio-reset.h      |  29 +
>   .../dt-bindings/sound/meson-g12a-toacodec.h   |   5 +
>   sound/soc/meson/axg-pdm.c                     |  10 +-
>   sound/soc/meson/g12a-toacodec.c               | 298 ++++++++--
>   sound/soc/meson/meson-card-utils.c            |  12 +-
>   sound/soc/meson/meson-codec-glue.c            | 174 ++++--
>   sound/soc/meson/meson-codec-glue.h            |  23 +
>   sound/soc/meson/t9015.c                       | 326 +++++++++-
>   30 files changed, 2394 insertions(+), 223 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
>   create mode 100644 drivers/clk/meson/a1-audio.c
>   create mode 100644 drivers/clk/meson/a1-audio.h
>   create mode 100644 drivers/clk/meson/meson-audio-rstc.c
>   create mode 100644 drivers/clk/meson/meson-audio-rstc.h
>   create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
>   create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
> 

