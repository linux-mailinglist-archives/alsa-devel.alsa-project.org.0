Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 591934B8B4F
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 15:21:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F088B193B;
	Wed, 16 Feb 2022 15:21:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F088B193B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645021316;
	bh=KoWa0akEfjYDRz1er5o4EjprGKVFybd/AJSc0T8y8lk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=moOi0h0Nl1WdXxaj7edu1cRp18aCmZ7pdUSBs8XQVkHRX3EmXltHuUShHBzNPaOvA
	 g5UjVJ2J7VYQs9lWXLHkU7OZYMJIYNVxBbpvSkx9nemp0cTCc4HHeVAFOwprh/jYWN
	 2aBTNO1L3vMpSvxTPHxdxmKCdYfzDcHqDqLjhAN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F280EF80519;
	Wed, 16 Feb 2022 15:20:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A0F9F80518; Wed, 16 Feb 2022 15:20:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62E19F80516
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 15:20:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62E19F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WGexOQIl"
Received: by mail-wm1-x32e.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso1729054wme.1
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 06:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=wMfxI0Hd2SbSzakzeFPLxOWB5h6XEFlubm95jAhvb/o=;
 b=WGexOQIlhTvYMjSmv7dTY8NFq2DFmGwQTbEOeazPGATpb3ygAExomKrk9SgSuzoawm
 IazEfGjnuS8DygMSKN1qL1kVt3vi1UtK/DpMv7qd9m/KqOmyPLlBNu8Lub5BXlXDQqWW
 TftyBaX0AMsJ4w36HssvwqzC9CXwaLUhH6DmtmvLHgtxlwsRfX6TxpFPhsYA13FF0hU8
 +PnEY/TfqLHxsP1OCv7aI0vzQJCfG21iZl47KBmpCwK2LuMeARYQCAbrNX+XwEjbK6zH
 MCYPNfOHelDXiO0XCgtQCsbkUvd8rRlWaEAcMlN+y2F2S79T3gbNUvfRQ9HtCeVWs7ep
 FHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wMfxI0Hd2SbSzakzeFPLxOWB5h6XEFlubm95jAhvb/o=;
 b=hSMZc/A+Cir1tB7xmGIzMFZM9UZLhbIxnG/943WZq8iNEe27UrCrm9Wd+YlxHAb/+k
 9TpUnaWpGiqvqLFDAFxa1xMdNs53CeaEI67V5aYUBF2gYXo1hL2RlopYqX6tOBtm8+if
 h0IoDpg4OfMWISXOEHd0ko9PAKo+F/fIlh1NvFhSLz3V0Z6hHtetqiHxRTxWFGyTKALI
 L48AGQhwcOhqIcZPlb0spDAaT6AoyfZG9OIFNjRVYzXZaBZI/BI9+Dp567N/3mEHwrd2
 ixIXCPYU9tIAXiGQIRF06DAfOmyu5brkF9a/0NqKVLcz5tyl6O11+5YQZcrTpRizEJ2q
 7CwQ==
X-Gm-Message-State: AOAM532Icja2QRk5zXqCtuaem5ov27VA6MCE84kdjnLNmbVwFY+lLDsV
 acygfsrUNB+TQHozzq7U/Kx0iA==
X-Google-Smtp-Source: ABdhPJw+HIMlxvyMyiZHqYnDAVhxDQCh9sJA/W3kdjGvLRtbtmg0yVD7Etvv2zoR3BXysQE3ej5LJw==
X-Received: by 2002:a05:600c:34c1:b0:352:41db:bc55 with SMTP id
 d1-20020a05600c34c100b0035241dbbc55mr1829647wmq.112.1645021225490; 
 Wed, 16 Feb 2022 06:20:25 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id n11sm19555593wms.13.2022.02.16.06.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 06:20:24 -0800 (PST)
Message-ID: <a55e8624-7a90-e02f-9c52-5d5d2c825fd0@linaro.org>
Date: Wed, 16 Feb 2022 14:20:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 0/7] Add pin control support for lpass sc7280
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 14/02/2022 15:19, Srinivasa Rao Mandadapu wrote:
> This patch series is to split lpass variant common pin control
> functions and SoC specific functions and to add lpass sc7280 pincontrol support.
> It also Adds dt-bindings for lpass sc7280 lpass lpi pincontrol.
> 
> Changes Since V5:
>      -- Create new patch by updating macro name to lpi specific.
>      -- Create new patch by updating lpi pin group structure with core group_desc structure.
>      -- Fix typo errors.
>      -- Sort macros in the make file and configuration file.
> Changes Since V4:
>      -- Update commit message and description of the chip specific extraction patch.
>      -- Sort macros in kconfig and makefile.
>      -- Update optional clock voting to conditional clock voting.
>      -- Fix typo errors.
>      -- Move to quicinc domain email id's.
> Changes Since V3:
>      -- Update separate Kconfig fields for sm8250 and sc7280.
>      -- Update module license and description.
>      -- Move static variables to corresponding .c files from header file.
> 
> Changes Since V2:
>      -- Add new dt-bindings for sc7280 lpi driver.
>      -- Make clock voting change as separate patch.
>      -- Split existing pincontrol driver and make common functions
>         as part of separate file.
>      -- Rename lpass pincontrol lpi dt-bindings to sm8250 specific dt-bindings
> 		
> Changes Since V1:
>      -- Make lpi pinctrl variant data structure as constant
>      -- Add appropriate commit message
>      -- Change signedoff by sequence.
> 
> Srinivasa Rao Mandadapu (7):
>    dt-bindings: pinctrl: qcom: Update lpass lpi file name to SoC specific
>    dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi pinctrl bindings
>    pinctrl: qcom: Update macro name to LPI specific
>    pinctrl: qcom: Update lpi pin group structure
>    pinctrl: qcom: Extract chip specific LPASS LPI code
>    pinctrl: qcom: Add SC7280 lpass pin configuration
>    pinctrl: qcom: Update clock voting as optional


Tested this on SM8250 MTP with WSA and WCD codecs

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

> 
>   .../bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml   | 133 -----------
>   .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml     | 115 +++++++++
>   .../pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml     | 133 +++++++++++
>   drivers/pinctrl/qcom/Kconfig                       |  16 ++
>   drivers/pinctrl/qcom/Makefile                      |   2 +
>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           | 257 ++-------------------
>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |  87 +++++++
>   drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c    | 170 ++++++++++++++
>   drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c    | 166 +++++++++++++
>   9 files changed, 706 insertions(+), 373 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
>   create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
>   create mode 100644 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>   create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
> 
