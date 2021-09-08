Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB04403721
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 11:42:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6218C16D7;
	Wed,  8 Sep 2021 11:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6218C16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631094159;
	bh=vgbifXvXDGBSoDxdLBO5pjdmlODdaj+LMfs94Sc4Mx0=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=asvp91IfGkO/TuQlgOVsrnojGdIP4DanRcUndcxBgOQ9Cr8jtHEnJtFRdC1hsT4GA
	 Ql0NygzEkYasmBBA19AeiowOy3PHOnDMfC58jxjWBoJawSTwYnVpA4COvbUzpQvBEo
	 ReYDVJodt8M0EDYD/PGml7v80iq1rgkhenGBtAfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3D62F8049C;
	Wed,  8 Sep 2021 11:41:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75D56F802E7; Wed,  8 Sep 2021 11:41:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 188B6F80149
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 11:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 188B6F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xgl5YoSw"
Received: by mail-wm1-x333.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1017250wmi.5
 for <alsa-devel@alsa-project.org>; Wed, 08 Sep 2021 02:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=SyPGzxAlIqgp8BIndR9Y9ROAIR781ZTstJe/EicRs6I=;
 b=xgl5YoSwmZ/JDpR5AsGbii8s58EHYdi//SdRbQOLJKixRBhIZy0BQCLNlzGexZ6qdw
 h8lBMzGQpdASpjBUSLMFnzYXbj7bGFl9dAEN34sAhTIrpG2yw3qgoMgIvIhIIKQ+7Ffr
 51oW5U/swPa/1r7WbQtZJscez/dsoO/nrBuX38uPFluHu1fDXpqwrhPgdiEadyZ5mKA+
 QtH/mCi1iJMM/WPTqIncsBYD9Y3wPKy0ROgwmR+rB6v7BozQkJdgsrUrN0X73ONL+5oV
 NInwqT4dLj2wCH4HQGxRs0i8jIYd7Yjg9HcVCPu+4aygjZAyawRC541SxhU1rUsOvZh0
 iitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SyPGzxAlIqgp8BIndR9Y9ROAIR781ZTstJe/EicRs6I=;
 b=CaRP8yPSOJjWUGd4AZlJdU32zz7R3tz/0sLX2vPtGbLx4Rw18UthKHgUgj5mjS/jml
 sVTsa0m/0jKOExFYv3TLumvrRkhxwzreoOb7A19lDS3lsEI7Y7kxMwyazl2D6PxeuE/g
 1bhrPiUsg4M27UfbI0YnSHYKC+rpvhjb9CKpYtUmMEky5OoVH2KDtbdv3fRuwgNQKYYg
 ZSsVBYXpHkrjJe9uHOBplDiqBEDF44eJThX9zqjzOYq3r14cGiMKO/RwNRWRmA13ysLV
 ERsUD/1EbkuZ4EEJHKIjlEZG4aU+CI1IrofKqQlsAbq9KLvclrmDVvXfEttB+nqdtOG1
 s7EA==
X-Gm-Message-State: AOAM533RHSEYENVd2OjIPmFgdnNfESejpqnXz3TBeHc3P/EEmBmSb3mC
 5ZvPTy6TV1aGTgn49ONOqXn1Qg==
X-Google-Smtp-Source: ABdhPJx+MGhYGRDQv1Wckw4j7kWKIVjSN3mAwvDiPMKb4OmbCpAMkXCnTxgyYueaL00h2huX4/Crow==
X-Received: by 2002:a05:600c:4ece:: with SMTP id
 g14mr2531749wmq.6.1631094071666; 
 Wed, 08 Sep 2021 02:41:11 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id j4sm1599363wrt.23.2021.09.08.02.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 02:41:10 -0700 (PDT)
Subject: Re: [PATCH] ASoC: dt-bindings: lpass: add binding headers for digital
 codecs
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1630934854-14086-1-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4a513810-ab33-006d-4bce-5e35702a51e0@linaro.org>
Date: Wed, 8 Sep 2021 10:41:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1630934854-14086-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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



On 06/09/2021 14:27, Srinivasa Rao Mandadapu wrote:
> +#define LPASS_CDC_DMA_RX0 6

You are only adding RX0, what happens to RX1.. RX7

TBH, skipping other entries for ex CDC_DMA_RX will end up with sparse 
numbering.

Please add all the entries for CDC_DMA_RX and other ports as well.

Like:

#define LPASS_CDC_DMA_RX0	6
#define LPASS_CDC_DMA_RX1	7
#define LPASS_CDC_DMA_RX2	8
#define LPASS_CDC_DMA_RX3	9
#define LPASS_CDC_DMA_RX4	10
#define LPASS_CDC_DMA_RX5	11
#define LPASS_CDC_DMA_RX6	12
#define LPASS_CDC_DMA_RX7	13


> +#define LPASS_CDC_DMA_TX3 7
> +#define LPASS_CDC_DMA_VA0 8
You mean VA_TX0?


> +#define LPASS_MAX_PORTS 9
We really do not need this in bindings.
You could add this is some of the driver header files instead.

--srini
> +
