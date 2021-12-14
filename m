Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE35F474935
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 18:23:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A2ED2015;
	Tue, 14 Dec 2021 18:22:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A2ED2015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639502616;
	bh=RoL28VqXX6H78cfJAZqio7K3mFPr/WD+Zrr5YBTR/bg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M6nl4XCsO6uQWFYWIkbz5Ai0dv/UXVNstCwDSn1fV+kVOrcu39VNn/a5VC4ywSxiT
	 u4dfTTdoaZFFMnUBdvyNSwcby0vXLMgIzmgNZL5NIAdCqdBWDZZVnIQEgKuQULk4I7
	 nDSkaozHSuVXRRtdhxCetIcxRIMJlNCDZRKq2lRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64C11F8025E;
	Tue, 14 Dec 2021 18:22:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AF2EF8025A; Tue, 14 Dec 2021 18:22:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 499C1F8016A
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 18:22:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 499C1F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="hRlLdatv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639502543; x=1671038543;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=yq8N2AXZoLLyeKdy61gCr0CS4sQ/YtBJ910CTaGYMFY=;
 b=hRlLdatvhpmNyWzfqaoIIPcmyf2cy/aoSsVzeuYkB5Ykg67WEbtngkc0
 Mz2Bx3PXb91hvAquC5AwU7s2SQSLn5K5hn4KXaJcK8KSHyDp/XiomX1e6
 PcMVwQ9fpgh1o1USyKLH1lOIfCk5x/tA/AyFO/DvURGvmwC/50NA2BBxq k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Dec 2021 09:22:19 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:22:19 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 14 Dec 2021 09:22:18 -0800
Received: from [10.216.27.180] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 14 Dec
 2021 09:22:11 -0800
Subject: Re: [PATCH v5 3/5] pinctrl: qcom: Extract chip specific LPASS LPI code
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
 <1638891339-21806-4-git-send-email-quic_srivasam@quicinc.com>
 <CAHp75Vd=47Tv9Sf+styPhxS2=O1H2KUDeKQXTULUYU5fDgGwwA@mail.gmail.com>
 <0f6621e5-f014-27c9-be8b-6c32ab994304@quicinc.com>
 <CAHp75VdL3hmr23CcJLDpvbHaKv5HrDZjmVQpCnRNmPM7nEx6WQ@mail.gmail.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
Message-ID: <4bcfadd0-8abb-e9e9-ad18-a5b1d3d46308@quicinc.com>
Date: Tue, 14 Dec 2021 22:52:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdL3hmr23CcJLDpvbHaKv5HrDZjmVQpCnRNmPM7nEx6WQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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


On 12/14/2021 10:46 PM, Andy Shevchenko wrote:
> On Tue, Dec 14, 2021 at 7:15 PM Srinivasa Rao Mandadapu
> <quic_srivasam@quicinc.com> wrote:
>> On 12/8/2021 11:58 AM, Andy Shevchenko wrote:
> ...
>
>>>> +#define NO_SLEW                                -1
>>> Naming sucks for the header.
>>>
>>> LPI_NO_SLEW ?
>> Actually it's already mainline code. Just these patches are
>> rearrangement of old code.
>>
>> still do you suggest to change?
> I would, but this means it should be in a separate change.
>
> ...
Yes. Will do it separate patch later.
>
>>>> +struct lpi_pingroup {
>>>> +       const char *name;
>>>> +       const unsigned int *pins;
>>>> +       unsigned int npins;
>>>> +       unsigned int pin;
>>>> +       /* Bit offset in slew register for SoundWire pins only */
>>>> +       int slew_offset;
>>>> +       unsigned int *funcs;
>>>> +       unsigned int nfuncs;
>>>> +};
>>> Are you going to convert this to use struct group_desc?
> Any comments on this? It sounds like further improvements.
Actually this also needs as separate patch. these patches will do as 
separate series.
>
