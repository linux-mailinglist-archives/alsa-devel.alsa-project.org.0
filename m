Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A27403A4E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 15:06:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FBD316CE;
	Wed,  8 Sep 2021 15:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FBD316CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631106409;
	bh=TZ2hT5maMzpFA72X6D7Zb+tdIPS4DxVXGM/WOe3mUSo=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tc3jB3ECUzVdHtp7un+B+ux2CMbZt31V/R8iuErm28bM8fg6W63Kz3RMqziGHwAIp
	 xZFAsWZ9ofFhwuU6UVxzR06+YB/tE9Z87tidCCmYM8qGRzdf6vLccM/VDU5w2GKPKv
	 VtgQ9iX7gmGmU1R7xRJ2Tvec+9neJcXmOYqkBcwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9784F8049C;
	Wed,  8 Sep 2021 15:05:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42DC4F802E7; Wed,  8 Sep 2021 15:05:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7363FF80166
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 15:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7363FF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="Uq4iiLam"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631106329; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=vw2aL2Cthy/tQZoFWOmfPqpnMlONA1rEbkDkuPgSY3E=;
 b=Uq4iiLam41QFa1F5Uuf7xUXZCU5pYKSKzQfnTqZBihVYFcGo0OkX4nrjVHaeDnc1xkOet169
 CUpYTuWwjcCnRew4zmD4xjr+EUZGCWld0ldY8mY46dhreb2f8qitkbVGQgCg+zE1Gg3R/fm7
 hwtalB1WSQhwZIZ83GvpPfAUnZs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6138b50f6fc2cf7ad95c0df5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Sep 2021 13:05:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B2B50C43616; Wed,  8 Sep 2021 13:05:18 +0000 (UTC)
Received: from [10.242.137.170] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C46CC43460;
 Wed,  8 Sep 2021 13:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0C46CC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] ASoC: dt-bindings: lpass: add binding headers for digital
 codecs
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1630934854-14086-1-git-send-email-srivasam@codeaurora.org>
 <4a513810-ab33-006d-4bce-5e35702a51e0@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <689316cf-7de7-6702-6e82-ee52d786a602@codeaurora.org>
Date: Wed, 8 Sep 2021 18:35:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <4a513810-ab33-006d-4bce-5e35702a51e0@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Thanks for your time and valuable suggestions Srini!!

On 9/8/2021 3:11 PM, Srinivas Kandagatla wrote:
>
>
> On 06/09/2021 14:27, Srinivasa Rao Mandadapu wrote:
>> +#define LPASS_CDC_DMA_RX0 6
>
> You are only adding RX0, what happens to RX1.. RX7
>
> TBH, skipping other entries for ex CDC_DMA_RX will end up with sparse 
> numbering.
>
> Please add all the entries for CDC_DMA_RX and other ports as well.
>
> Like:
>
> #define LPASS_CDC_DMA_RX0    6
> #define LPASS_CDC_DMA_RX1    7
> #define LPASS_CDC_DMA_RX2    8
> #define LPASS_CDC_DMA_RX3    9
> #define LPASS_CDC_DMA_RX4    10
> #define LPASS_CDC_DMA_RX5    11
> #define LPASS_CDC_DMA_RX6    12
> #define LPASS_CDC_DMA_RX7    13
>
>
Okay. Will add and Share new patch.
>> +#define LPASS_CDC_DMA_TX3 7
>> +#define LPASS_CDC_DMA_VA0 8
> You mean VA_TX0?
>
Yes. Will change accordingly.
>
>> +#define LPASS_MAX_PORTS 9
> We really do not need this in bindings.
> You could add this is some of the driver header files instead.
>
Okay Will remove.
> --srini
>> +

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

