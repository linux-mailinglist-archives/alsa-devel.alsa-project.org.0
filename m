Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A55B289BB6F
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 11:17:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 710AF227E;
	Mon,  8 Apr 2024 11:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 710AF227E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712567859;
	bh=ydZJw7d35Ff9MPe3LKMKV9TaBpQgVGBrz9NBba+U30U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sHhDb2L7S3JRx71VP3F4np5tQyOMFgsYmm9IAfCHM8UjWkqobNglqL6k6P3VFhE7S
	 KcWXHlkyLDQ+omHsztUSGPgMpyhzT2Gw3ee//t1V1+etLOIBamNYZ0DHrHfUW5kXnF
	 fwkJi+9kxqiiV1+C7M+Qcr+/TAcJNngsevmY1QOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C48E4F80589; Mon,  8 Apr 2024 11:17:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77BCCF8057E;
	Mon,  8 Apr 2024 11:17:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AC67F8026D; Mon,  8 Apr 2024 11:17:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF75CF80130
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 11:16:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF75CF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=C/UItviN
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-345600106d3so1116697f8f.0
        for <alsa-devel@alsa-project.org>;
 Mon, 08 Apr 2024 02:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712567818; x=1713172618;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kyn/nAbJTaoSC8qDBWXGUmDfOwA1IOLpAo8aFHObHYE=;
        b=C/UItviN/GmTqWjcYb4h5/sckCXbqMKLNSFxjUiXfCX9YDJaGPsW/N5j4ceI3eGuIn
         aboPFcyxMTQ6+8QUun0/loG8VBn1AePzxx0Kn+oMRYeSPMh7ubpE9I4bqMmjeprLzn/8
         TkxwmIm7MFG9sMBBwMgkG9moxr4YGcdl8aU+/y1VitVPaOh4bCiiiV20gNry/Oxxxr+V
         MHyvdWz/dRzm/0WPj/2Ah6lxNz6b+vGWHqdmVemfC44kELKOJT/dMKUMbJGOvafYRW0X
         ZwhB5XxmhRLInt5nKcRjainAVYpBHi0NhPD+R5TAiktaK2SHfDn/REZ2EDiHtBzMdmsv
         503g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712567818; x=1713172618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kyn/nAbJTaoSC8qDBWXGUmDfOwA1IOLpAo8aFHObHYE=;
        b=kUqwOkRcECnH9OrNnetdRh6bn1+jk2A9H4AoyEU6yuvoTEXbUgKUZY4E7PA/Cnlc3f
         PgTyQsFaTbvJ7M5qFvZ1Xnpnn0crd9cC4e/znEKAUv+USp1/vdpjvrIvkPNew8tjb6er
         1BIgIy57SJs3zOGbcF8wcB0HghQWH5nvblVUkXw0rH2urSQYt2O8Mx046iEIvUXXjbxi
         bAP5MuVszPW1jNnq9cwoHTVKIapqVQjm+GW5xxbKkMxGV40sXvKqARJBoaqB7eJSSv/K
         5PgKWGyeZjmlT9WDEqKYkNiEiPjjSbyELWjn6Nmm89hqRLSm1Vh52cxTnJaeICNyZyfe
         0hTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAkU1Wr1xi0I9l54IhfB4KoNy35Rv8RoHEaNQPaKoCr9ELfUcjlDTFhm4YDYKP5uqgUiVtLSn3fXcFLJrXkX9WF7M8vggOJmVtgBE=
X-Gm-Message-State: AOJu0YxVvlB8nU5BnYJoaUiz3ANejv8no9qB7ofVDXeFuo3IWBLaDOGG
	WLnNZRx1R72u8Rd7eYt2393o50uPs72Srd8fJef21wIgm8bREB9K92gh+jUq4KE=
X-Google-Smtp-Source: 
 AGHT+IFbW+GZvWtDNwC+hUfv0CeQti5p0/4Lt39sOJliVc7683eESlFh87O+IacxG6iRBQDyz+nk9A==
X-Received: by 2002:adf:f28e:0:b0:33e:3bf3:a097 with SMTP id
 k14-20020adff28e000000b0033e3bf3a097mr5598241wro.26.1712567818504;
        Mon, 08 Apr 2024 02:16:58 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 q8-20020adfea08000000b00341c6440c36sm8586391wrm.74.2024.04.08.02.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 02:16:58 -0700 (PDT)
Message-ID: <499dc405-a292-44c2-860f-db78ad7becc8@linaro.org>
Date: Mon, 8 Apr 2024 10:16:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v3 0/2] Add support for QCM6490 and QCS6490
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com
References: <20240408042331.403103-1-quic_mohs@quicinc.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240408042331.403103-1-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PUM2BVL4TJ4JD3PTRCC4DU4IBJPLH6UY
X-Message-ID-Hash: PUM2BVL4TJ4JD3PTRCC4DU4IBJPLH6UY
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PUM2BVL4TJ4JD3PTRCC4DU4IBJPLH6UY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 08/04/2024 05:23, Mohammad Rafi Shaik wrote:
> This patchset adds support for sound card on Qualcomm QCM6490 IDP and
> QCS6490 RB3Gen2 boards.
> 
> Changes since v2:
> 	- Modify qcm6490 compatible name as qcm6490-idp. Suggested by Dmitry
> 
> Changes since v1:
> 	- Use existing sc8280xp machine driver instead of separate driver.
> 	- Modify qcs6490 compatible name as qcs6490-rb3gen2.
> 
> Mohammad Rafi Shaik (2):
>    ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd QCS6490 sound card
>    ASoC: qcom: sc8280xp: Add support for QCM6490 and QCS6490
> 

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
>   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
>   sound/soc/qcom/sc8280xp.c                                | 2 ++
>   2 files changed, 4 insertions(+)
> 
