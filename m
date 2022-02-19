Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B78BC4BC9ED
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 19:36:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AB27168D;
	Sat, 19 Feb 2022 19:35:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AB27168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645295777;
	bh=zcyjRS151RYzk6qKSNT7cK1NmvELDS3ypS3VdvWDTpo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W7tghmPwhJXbnhb5uIR0i43FCfw8twvpVr4gDG5TMQrhXOzR2tTgPmcl4YWl/MQoY
	 2fmWhk25b+54/GrT653wf1GbSb93aXapA5eTi7zeYCk9QdEhAWMCvk09wCHeVXKhKh
	 fv4fSgWzfJd5NVbZCU4Yhy+boqt5AC2wr8nztf/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0B4FF8014B;
	Sat, 19 Feb 2022 19:35:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70B7EF8016A; Sat, 19 Feb 2022 19:35:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB8E6F800AB
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 19:35:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB8E6F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="wHFEqSro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645295708; x=1676831708;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GeMNBE8jsuT8hCfZtDP782SEZp0RFcr71l9NpIOcAzA=;
 b=wHFEqSroRLwOJZWv2+GT+Mgk3dklVGQEZ+EwWADH1520oX1cyhAnxLkm
 MeLdreqHJJ9Y55YTwCZdAon+Cfew/eZDYkEu5w2CavughaI3doDgsI73z
 ajwAdnn/Ro3E2gdywRn7HKWjnh64l1SKnQS2z+DNFw8jq2yy6QuYta994 c=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Feb 2022 10:35:04 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2022 10:35:04 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sat, 19 Feb 2022 10:34:51 -0800
Received: from [10.216.20.52] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Sat, 19 Feb
 2022 10:34:44 -0800
Message-ID: <619d38f4-9faa-e592-6a96-db23118afd25@quicinc.com>
Date: Sun, 20 Feb 2022 00:04:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v6 6/7] pinctrl: qcom: Add SC7280 lpass pin configuration
Content-Language: en-US
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
 <1644851994-22732-7-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n533mcROZYQ_6SrH4gMhFXjME=1R9oMknsJDcwLUT1LGPQ@mail.gmail.com>
From: "Srinivasa Rao Mandadapu (Temp)" <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <CAE-0n533mcROZYQ_6SrH4gMhFXjME=1R9oMknsJDcwLUT1LGPQ@mail.gmail.com>
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


On 2/19/2022 8:13 AM, Stephen Boyd wrote:
Thanks for Your time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:53)
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> new file mode 100644
>> index 0000000..5bf30d97
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> @@ -0,0 +1,169 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>> + * ALSA SoC platform-machine driver for QTi LPASS
>> + */
>> +
>> +#include <linux/clk.h>
> Drop unused include.
Okay. will remove it.
>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "pinctrl-lpass-lpi.h"
> include ../core.h
Okay. will add it.
>
>> +
>> +enum lpass_lpi_functions {
>> +       LPI_MUX_dmic1_clk,
>> +       LPI_MUX_dmic1_data,
>> +       LPI_MUX_dmic2_clk,
>> +       LPI_MUX_dmic2_data,
>> +       LPI_MUX_dmic3_clk,
>> +       LPI_MUX_dmic3_data,
>> +       LPI_MUX_i2s1_clk,
>> +       LPI_MUX_i2s1_data,
>> +       LPI_MUX_i2s1_ws,
>> +       LPI_MUX_i2s2_clk,
>> +       LPI_MUX_i2s2_data,
>> +       LPI_MUX_i2s2_ws,
>> +       LPI_MUX_qua_mi2s_data,
>> +       LPI_MUX_qua_mi2s_sclk,
>> +       LPI_MUX_qua_mi2s_ws,
>> +       LPI_MUX_swr_rx_clk,
>> +       LPI_MUX_swr_rx_data,
>> +       LPI_MUX_swr_tx_clk,
>> +       LPI_MUX_swr_tx_data,
>> +       LPI_MUX_wsa_swr_clk,
>> +       LPI_MUX_wsa_swr_data,
>> +       LPI_MUX_gpio,
>> +       LPI_MUX__,
>> +};
>> +
>> +static int gpio0_pins[] = { 0 };
> const?
const giving conflicts with group_desc params.
>
>> +static int gpio1_pins[] = { 1 };
>> +static int gpio2_pins[] = { 2 };
>> +static int gpio3_pins[] = { 3 };
>> +static int gpio4_pins[] = { 4 };
>> +static int gpio5_pins[] = { 5 };
>> +static int gpio6_pins[] = { 6 };
>> +static int gpio7_pins[] = { 7 };
