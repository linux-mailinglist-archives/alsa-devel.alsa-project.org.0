Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38641474917
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 18:16:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF7721FF8;
	Tue, 14 Dec 2021 18:16:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF7721FF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639502213;
	bh=7Chk8ePc8fgwfb6GoMDMcWBnfNzzXQjDNRjxe2RwyHM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pKj3GSGgIdorgvkA0GC32Uib9Bp+tYTy+xz1SguRp79oOwYakrWwBvh7ki6XE9x9E
	 NHS0EGEYG8XJQgX4X4isCSn/tMekGwn0yIA5Im6Uv5qB/H55jwQtyDN16uH9v2pP9F
	 hTkLivT7Y9CLjvyuJUkiJfqcclEhaQ4/+gC5zmEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13082F80249;
	Tue, 14 Dec 2021 18:15:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0FFCF80246; Tue, 14 Dec 2021 18:15:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AEE2F8016A
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 18:15:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AEE2F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="i8FI4tVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639502139; x=1671038139;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=V3ZUoQpiArCEzg9uDWxQEPmkSZnIQmzZmlxrBFeYcTE=;
 b=i8FI4tVuPsOpHdmvPgKd9vtgonDrVoqAjzho3h06Cn3wmQr7Yc99HX9W
 c65V17mCWQR78pEEynidhM0Lp1dWP/HwQnGx3Dlhb66pyrFwqA+qPiTc1
 I/T41VDGaLl6NohAQSPaTuodvTXFTl7tIOOQb+F4STLUNpBfbh6Ba68wa c=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Dec 2021 09:15:34 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:15:33 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 14 Dec 2021 09:15:33 -0800
Received: from [10.216.27.180] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 14 Dec
 2021 09:15:26 -0800
Subject: Re: [PATCH v5 3/5] pinctrl: qcom: Extract chip specific LPASS LPI code
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
 <1638891339-21806-4-git-send-email-quic_srivasam@quicinc.com>
 <CAHp75Vd=47Tv9Sf+styPhxS2=O1H2KUDeKQXTULUYU5fDgGwwA@mail.gmail.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
Message-ID: <0f6621e5-f014-27c9-be8b-6c32ab994304@quicinc.com>
Date: Tue, 14 Dec 2021 22:45:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd=47Tv9Sf+styPhxS2=O1H2KUDeKQXTULUYU5fDgGwwA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: devicetree <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 Takashi Iwai <tiwai@suse.com>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, rohitkr@codeaurora.org,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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


On 12/8/2021 11:58 AM, Andy Shevchenko wrote:
Thanks for your time Andy!!!
> On Wed, Dec 8, 2021 at 2:39 AM Srinivasa Rao Mandadapu
> <quic_srivasam@quicinc.com> wrote:
>> Extract the chip specific SM8250 data from the LPASS LPI pinctrl driver
>> to allow reusing the common code in the addition of subsequent
>> platforms.
> ...
>
>> @@ -661,8 +454,10 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
>>
>>          return ret;
>>   }
>> +EXPORT_SYMBOL(lpi_pinctrl_probe);
>> +
> Stray change.
>
> ...

okay. will remove it.

>
>> +#ifndef __PINCTRL_LPASS_LPI_H__
>> +#define __PINCTRL_LPASS_LPI_H__
> Missed headers.
> At least bits.h.
>
> ...
Okay. will add.
>> +#define NO_SLEW                                -1
> Naming sucks for the header.
>
> LPI_NO_SLEW ?

Actually it's already mainline code. Just these patches are 
rearrangement of old code.

still do you suggest to change?

>
> ...
>
>> +struct lpi_pingroup {
>> +       const char *name;
>> +       const unsigned int *pins;
>> +       unsigned int npins;
>> +       unsigned int pin;
>> +       /* Bit offset in slew register for SoundWire pins only */
>> +       int slew_offset;
>> +       unsigned int *funcs;
>> +       unsigned int nfuncs;
>> +};
> Are you going to convert this to use struct group_desc?
>
> ...
>
>> +       LPI_MUX__,
> Strange naming. Besides, if it is the terminator, drop the comma.
okay will remove comma. but name is from existing code.
>
