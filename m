Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC74C0CED
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 08:02:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D5F51929;
	Wed, 23 Feb 2022 08:01:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D5F51929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645599734;
	bh=BgOFDJBnKwFGywesIJYdpobTLbeR8+y/Y8OzmG64e6k=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M1HtptqzJ/4GuvHPvpR2zJQA67qgXA8rtfvSXsrwhJW/yLQyxWsnlhDP40TsM6oKS
	 mpuZ4oYYc0TkYUuJn2raXNFgvXBru4hHRH3IjEC5AwseMt23Lg1XQ7ouD3TN1MeeWD
	 N6zKszLQ9nLx2fRjWNMJorBxRgkTVJLRk/EMnn4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AB9CF8019D;
	Wed, 23 Feb 2022 08:01:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AC2CF80237; Wed, 23 Feb 2022 08:01:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CD3EF80118
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 08:00:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CD3EF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="DxAHyWmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645599662; x=1677135662;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=P8IB5i4i8mccW/2mm5mdBV6fgyPwz4NSzRZVqW15XCw=;
 b=DxAHyWmjzd5ZvzmcoJlSsK+bAlSAYg5VZFE+68heCCf4uP3FI7a5LKpF
 HcCAI8L3LwZS0he/59gpP8vNiK+SFtdrz3ISuYNLk44XACXDtwejSYhIt
 2ay3BC7x0ZRYoWTVJSxxcmNnjjpb5btxC85MZqLoTw8GGDegwvsohj32Z 8=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Feb 2022 23:00:52 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 23:00:51 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 22 Feb 2022 23:00:51 -0800
Received: from [10.216.58.51] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Tue, 22 Feb
 2022 23:00:45 -0800
Message-ID: <9a618cb6-c528-94f1-c10c-248e2a04aa13@quicinc.com>
Date: Wed, 23 Feb 2022 12:30:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v6 5/7] pinctrl: qcom: Extract chip specific LPASS LPI code
Content-Language: en-US
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: Stephen Boyd <swboyd@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <agross@kernel.org>,
 <alsa-devel@alsa-project.org>, <bgoswami@codeaurora.org>,
 <bjorn.andersson@linaro.org>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <judyhsiao@chromium.org>,
 <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <perex@perex.cz>, <quic_plai@quicinc.com>, <robh+dt@kernel.org>,
 <rohitkr@codeaurora.org>, <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-6-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n53-GRneymVoac=AT6M17aYseS88vM-o1xZxmk8sFQOYhw@mail.gmail.com>
 <ee5004ea-0aa9-b7ef-061a-e07d0d47c7c6@quicinc.com>
Organization: Qualcomm
In-Reply-To: <ee5004ea-0aa9-b7ef-061a-e07d0d47c7c6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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


On 2/20/2022 12:02 AM, Srinivasa Rao Mandadapu (Temp) wrote:
>
> On 2/19/2022 8:13 AM, Stephen Boyd wrote:
> Thanks for Your time Stephen!!!
>> Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:52)
>>> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c 
>>> b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
>>> new file mode 100644
>>> index 0000000..27e358e
>>> --- /dev/null
>>> +++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
>>> @@ -0,0 +1,166 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
>>> + * Copyright (c) 2020 Linaro Ltd.
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/gpio/driver.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +
>>> +#include "pinctrl-lpass-lpi.h"
>> Please include ../core.h here as well for the pin_group definition.
> Okay. will add it.

Actually, core.h was included in pinctrl-lpass-lpi.h. Including again 
here giving redefinition errors.

Already sent V8 with this change. will revert it and post again in v9.

