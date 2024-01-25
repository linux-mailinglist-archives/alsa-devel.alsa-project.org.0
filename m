Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5140983BBFF
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 09:29:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5D7B84C;
	Thu, 25 Jan 2024 09:28:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5D7B84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706171346;
	bh=2XiYbkPw3i5edkHdoGLqeOFp6GYs53ELzsqZ7MhTKYc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LXA85RZmZVASLg7bMejyYBs0QMI3hcF8TPxefQ2gD8eD2M7m/ABsv5wA6V7gZXOYn
	 K8AsPrKFGAhKupFbNDe2XVEVCoAX/r2WkK7OGmJPTSxKhbw/qhwbslfr5+d94TcDK4
	 59mlw+2anstytcCiJHi6LfBTkjPT0Lph7WxDY5rU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FD65F80567; Thu, 25 Jan 2024 09:28:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCD2BF8057E;
	Thu, 25 Jan 2024 09:28:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE6DAF8028D; Thu, 25 Jan 2024 09:28:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24810F800C1
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 09:27:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24810F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=i/+FlJJ1
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e86a9fc4bso82258345e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jan 2024 00:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706171273; x=1706776073;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdaT3eh+IWzZ9wRxEt609lH8JpOZmnfT+gedHYcaONU=;
        b=i/+FlJJ1JnhLptD/kXMc5z9a25GbGcKVsRMH6ATf2l6YaAzilZnpCCrrSZqiuSojGm
         BBF0jhYkwMaiZEu76a5AB3ZZjX+Kck2S0MUAJVieGBq+jOvfJh4OX3ZvFvbc21zaRoQX
         TdMR6UA0i+zbqf9S8orlV943yaX4b72hQUImIvESmdzKoaCnSX1x1Pu2Db5qe9T9n+pA
         W10b1F0+fP9Xo5Xdi99W+IhIcnQnyAyyZE1n+xHoHQVy408YPUmP3lqtH/VsZnsMW0ku
         Jbn+19i57nutwgdlXavNZFTHsgoKQGYkgvBpZkmRS8P9Ufx/UlbtitCAT8qneBGnCd/O
         TmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706171273; x=1706776073;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hdaT3eh+IWzZ9wRxEt609lH8JpOZmnfT+gedHYcaONU=;
        b=mWW2Eyo5Dlgkn7mAhrw2hdrUPl/xUDc/ZO3PmvGij3I3we1GTELRJ0P2zF8YdGk1K4
         eHezA03dcGt6zLjZ+hABFzaT3m2Myb5fqWDQU8qZfUL0GX6wD6jNuwevKhVzRes9RQ3k
         7K+YCUfLoa0JaQ8nZuphLCL42x06HmHlYfuaKHrU1APRvIxzfvidFoH5GJLq7ZZPGB83
         HKuOXhacLjZ5WzjBTKQ6iNDL/+r0qoqyVLkmDpdCtzh6EAh63DhphBxxyI0799Hp6fs0
         38g3/jASbDoXVP6Pylsh3FT3DSwC8Jxq+nPb/QeQxmttifurBp6kLPlXXHKYdalOSrlN
         2nUA==
X-Gm-Message-State: AOJu0YyLRCB7qfSsY1phPAUyLRAUQfbe5b6erkYJdIP0nIru4h6+BBgI
	Y6Y7F7WeHFP/Fe99qfdkmUUER4pt4ptratlGtS1DCkUyRR+u5c+H7qq52AXRdAI=
X-Google-Smtp-Source: 
 AGHT+IFWw8xacpEPCFZ/YlUi4IIfiSG8qoo4jjTTTF9CDHtGBE7DgBDccglFMNdlYiGkPtAq5kIhhg==
X-Received: by 2002:a7b:cbcd:0:b0:40e:3854:db2d with SMTP id
 n13-20020a7bcbcd000000b0040e3854db2dmr277842wmi.65.1706171273241;
        Thu, 25 Jan 2024 00:27:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1a7d:7b36:3842:9bc3?
 ([2a01:e0a:982:cbb0:1a7d:7b36:3842:9bc3])
        by smtp.gmail.com with ESMTPSA id
 h21-20020a05600c351500b0040e47dc2e8fsm1716683wmq.6.2024.01.25.00.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 00:27:52 -0800 (PST)
Message-ID: <91158620-775e-4db1-9b8e-7154c6d66cd6@linaro.org>
Date: Thu, 25 Jan 2024 09:27:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Sean Anderson <sean.anderson@seco.com>
References: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
 <20240124074527.48869-5-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240124074527.48869-5-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 64ZNWF2PCFRWKTIHYJWZBPP5LO53YN7W
X-Message-ID-Hash: 64ZNWF2PCFRWKTIHYJWZBPP5LO53YN7W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/64ZNWF2PCFRWKTIHYJWZBPP5LO53YN7W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/01/2024 08:45, Krzysztof Kozlowski wrote:
> Devices sharing a reset GPIO could use the reset framework for
> coordinated handling of that shared GPIO line.  We have several cases of
> such needs, at least for Devicetree-based platforms.
> 
> If Devicetree-based device requests a reset line, while "resets"
> Devicetree property is missing but there is a "reset-gpios" one,
> instantiate a new "reset-gpio" platform device which will handle such
> reset line.  This allows seamless handling of such shared reset-gpios
> without need of changing Devicetree binding [1].
> 
> To avoid creating multiple "reset-gpio" platform devices, store the
> Devicetree "reset-gpios" GPIO specifiers used for new devices on a
> linked list.  Later such Devicetree GPIO specifier (phandle to GPIO
> controller, GPIO number and GPIO flags) is used to check if reset
> controller for given GPIO was already registered.
> 
> If two devices have conflicting "reset-gpios" property, e.g. with
> different ACTIVE_xxx flags, this would allow to spawn two separate
> "reset-gpio" devices, where the second would fail probing on busy GPIO
> request.
> 
> Link: https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/ [1]
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Sean Anderson <sean.anderson@seco.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on previous of change.
> ---
>   drivers/reset/core.c             | 215 +++++++++++++++++++++++++++++--
>   include/linux/reset-controller.h |   4 +
>   2 files changed, 206 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 4d5a78d3c085..60a8a33c4419 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c

<snip>

> +	}
> +
> +	ret = __reset_add_reset_gpio_lookup(id, args->np, args->args[0],
> +					    args->args[1]);

What would happen with gpio controllers using #gpio-cells = <3> (or more) like allwinner,sun4i-a10-pinctrl.yaml ?

On this example the flags are args->args[2] so this would probably fail.

This would also fails badly with #gpio-cells = <1>, args->args[1] value would be undefined.

You should probably limit to args->args_count == 2 for now.

Neil

> +	if (ret < 0)
> +		goto err_kfree;
> +
> +	rgpio_dev->of_args = *args;
> +	/*
> +	 * We keep the device_node reference, but of_args.np is put at the end
> +	 * of __of_reset_control_get(), so get it one more time.
> +	 * Hold reference as long as rgpio_dev memory is valid.
> +	 */
> +	of_node_get(rgpio_dev->of_args.np);
> +	pdev = platform_device_register_data(NULL, "reset-gpio", id,
> +					     &rgpio_dev->of_args,
> +					     sizeof(rgpio_dev->of_args));

<snip>

