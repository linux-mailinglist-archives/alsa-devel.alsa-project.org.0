Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4D491A6FC
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 14:52:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 394C3218E;
	Thu, 27 Jun 2024 14:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 394C3218E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719492759;
	bh=XtdvjmExmK9D2dS6fGUdUIVDepbUx+JmHx/WT1CKyFQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=USspYRvUK511lUz9Ob5YLQTqpqtA9r2D4+oQWA99TfzIWf2lPrWi23sdZ00hzTGuq
	 R67Gle+wyQ5Gsy4NzMKHoZNgktciQcYTOx1OIBTFREgMe3R5O6BnEB7C5zbs4ik3zR
	 KKSQgUgJ1dF4ioJrqW+HV+G13UJSSCeVVRYt9b84=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83847F8049C; Thu, 27 Jun 2024 14:52:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94C50F804F2;
	Thu, 27 Jun 2024 14:52:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B5B3F80423; Thu, 27 Jun 2024 14:52:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5FE0F8013D
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 14:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5FE0F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vANfcmde
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-366e70d0330so1697578f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 05:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719492714; x=1720097514;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnYEn+08jqkRCijrF6N5I7CtgtXywXX5Pko+EhFcF/E=;
        b=vANfcmde4Pj3ddMqwn6E/bHZJhojBBCZXUH5znhNqb4bR69OhsvW99R+9Rgwm2zMl1
         cT4P1mgOP6ZNsvn8mfOWvHWKa+4g1q1Z2MxCoIrHWCoHLw9arMfmPj6dAZ2UFbf8c3ee
         lpsFHoIjYf8qridjXyUeI4GEPsSf4oAeiAgtG3thc6xnHg2ZMM+0tY8r4zvfwE3MQAgd
         nj+2bh0JavegKh1SJa7Rl0nVY/VKDhVn2BgBZB3bN6SWQyMDowmyWSjgG51G0aQFU/l6
         xlsXFTfF8Bmp1HLGidYQFc1P6PkKjy9+kBSH7a7HHRKmqprdM40lyAv2xc0qaRZTOFZD
         Kd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719492714; x=1720097514;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fnYEn+08jqkRCijrF6N5I7CtgtXywXX5Pko+EhFcF/E=;
        b=jd13hJvBwh4oteJADwTYNzX1vlTWQz9SZ/EOuoicxjbndDFFQBbXqrcCBmic7gUe49
         busD4vSCeCu92AQ3YpmfEEZE8PCNTiPMYK10kzYpbqgHE7Squ6R/5evL8bHOFCZ+wOhL
         VqY1VSl/u8Q72vH1qJESJP0ifwNLzWuXRgMI/Q41CvC0YrUFnQ5QHBY5WfyXX1yt4arb
         pI1801Aa/qUai16IHVWy15KU9UbIPVS7AAFGdmtdCe/8RGkV+n/pk+OFxQV6zJWdXGP+
         nvgA85bY/eBTQ4c3CETIMU7/Gzg3L4SYD51mMXYnMsS8xx8rlwsZ25HIXBBLMTRdpW1j
         VufA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD1ykW6a7GOzFbBmChEuzcMY22sOmMcQICBnx1KLg3CiH7Ho1OAf3WeKfcCINIMDjl7v3kmbfTJpX1Yjk2vCJVVt3vG/tC0silY3Y=
X-Gm-Message-State: AOJu0Yxcaq4EtHJycgYexPYB2rLFoAEtCW/m7na7yw6sbOvQ001bWMel
	ug9tpLa23Rr/iQ0NR0oFOUT0QKJ9+XJxt5WGK50XiKT3zsMvgThvLsKRIjSQi9vHpEe8j3CAYjt
	EQB8=
X-Google-Smtp-Source: 
 AGHT+IEdepWeFKby2pWGXn4ajKkwBMT3yEWL/Z2uvHjUQvfydEqGgmbC1o+puPl/54j5hAOcRfQ47w==
X-Received: by 2002:adf:ec43:0:b0:366:eaa7:1133 with SMTP id
 ffacd0b85a97d-366eaa711damr8511782f8f.46.1719492713031;
        Thu, 27 Jun 2024 05:51:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a?
 ([2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674357ff28sm1774577f8f.47.2024.06.27.05.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 05:51:52 -0700 (PDT)
Message-ID: <c71feb6b-4da5-4181-8b4a-2f5dac195135@linaro.org>
Date: Thu, 27 Jun 2024 14:51:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] ASoC: codecs: wsa88xx: add support for static port
 mapping.
To: srinivas.kandagatla@linaro.org, Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Manikantan R <quic_manrav@quicinc.com>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UQKPS4U3SQ6CKA2PZTGZDSSRICEJ7PTC
X-Message-ID-Hash: UQKPS4U3SQ6CKA2PZTGZDSSRICEJ7PTC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQKPS4U3SQ6CKA2PZTGZDSSRICEJ7PTC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/06/2024 13:55, srinivas.kandagatla@linaro.org wrote:
> Existing way of allocating soundwire master ports on Qualcommm platforms is
> dynamic, and in linear order starting from 1 to MAX_PORTS.
> This will work as long as soundwire device ports are 1:1 mapped
> linearly. However on most Qcom SoCs like SM8550, SM8650, x1e80100, these
> are NOT mapped in that order.
> 
> The result of this is that only one speaker among the pair of speakers
> is always silent, With recent changes for WSA codec to support codec
> versions and along with these patches we are able to get all speakers
> working on these SoCs.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Manikantan R (1):
>        ASoC: dt-bindings: wsa883x: Document port mapping property
> 
> Srinivas Kandagatla (5):
>        ASoC: codecs: wsa883x: parse port-mapping information
>        ASoC: dt-bindings: wsa8840: Document port mapping property
>        ASoC: codecs: wsa884x: parse port-mapping information
>        arm64: dts: x1e80100-crd: fix wsa soundwire port mapping
>        arm64: dts: x1e80100-qcp: fix wsa soundwire port mapping
> 
>   Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml | 8 ++++++++
>   Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 8 ++++++++
>   arch/arm64/boot/dts/qcom/x1e80100-crd.dts                 | 4 ++++
>   arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                 | 2 ++
>   sound/soc/codecs/wsa883x.c                                | 8 ++++++++
>   sound/soc/codecs/wsa884x.c                                | 8 ++++++++
>   6 files changed, 38 insertions(+)
> ---
> base-commit: 9935be184a55dd84fc3275094f2df095491f6ea1
> change-id: 20240626-port-map-ef50c3304d4a
> 
> Best regards,

I now have both speakers working !

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

Thanks!
Neil
