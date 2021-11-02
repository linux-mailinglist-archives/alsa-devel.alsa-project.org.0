Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AEF442C01
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 12:00:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C4BE16E4;
	Tue,  2 Nov 2021 11:59:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C4BE16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635850817;
	bh=qtCy+4Fg2hKaHJi+q5siJd6XWMA50FECeQC2SaXawKc=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BU5Rri1Q0ItikSYaMfsHWi0Yre1Vt9kbGZ+BbYuPoPovBzKOsDWjfnA+u/SszgwSI
	 3clWfJdKxbvRwFUoCA+oqTMkuHygiLdPI4xAZ6qzPe8PHhAgOUD3GwDvFp0NQk1iey
	 uYeN+Dq4nDcyh28XfNCGLAFsSPc2HLisYg7GVmHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A95BFF8025F;
	Tue,  2 Nov 2021 11:59:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CF3EF800BF; Tue,  2 Nov 2021 11:58:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A2B0F800BF
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 11:58:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A2B0F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="uRCUouiP"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635850731; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=bisdeD3X1MxFxI1OCeAyuj8O9/LL4EAudrvUEowmfCw=;
 b=uRCUouiPnNgW2IHO4h2TARCsG3TO1JEbGxgrLlytrKztRTZh6sRIOU5lUqU3jRpiRaeE5bzT
 zt9PtpX12JKQ8/8F3754weQwmxs2KnM2Y8XfcGmHisF0KATfoBV+aVw+cI4JKr/qUKyZqW3s
 BDEqSx9Ya9cEt3umMTKhSch8tjQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 618119e8c8c1b282a56ceb44 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 10:58:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 63350C43460; Tue,  2 Nov 2021 10:58:48 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3002FC4338F;
 Tue,  2 Nov 2021 10:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3002FC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v4 2/2] ASoC: qcom: SC7280: Add machine driver
To: Randy Dunlap <rdunlap@infradead.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
 rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, judyhsiao@chromium.org
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org>
 <1635519876-7112-3-git-send-email-srivasam@codeaurora.org>
 <4d1ca1b5-6656-1b3b-65a0-c05c92824d18@infradead.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <25b2a191-ff9e-25e0-1d46-bc37a92e1ff1@codeaurora.org>
Date: Tue, 2 Nov 2021 16:28:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4d1ca1b5-6656-1b3b-65a0-c05c92824d18@infradead.org>
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


On 10/30/2021 5:04 AM, Randy Dunlap wrote:
Thanks for your time Randy!!!
> On 10/29/21 8:04 AM, Srinivasa Rao Mandadapu wrote:
>> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
>> index cc7c1de..d9ffcb7 100644
>> --- a/sound/soc/qcom/Kconfig
>> +++ b/sound/soc/qcom/Kconfig
>> @@ -152,4 +152,16 @@ config SND_SOC_SC7180
>>         SC7180 SoC-based systems.
>>         Say Y if you want to use audio device on this SoCs.
>>   +config SND_SOC_SC7280
>> +    tristate "SoC Machine driver for SC7280 boards"
>> +    depends on I2C && SOUNDWIRE
>> +    select SND_SOC_QCOM_COMMON
>> +    select SND_SOC_MAX98357A
>> +    select SND_SOC_LPASS_RX_MACRO
>> +    select SND_SOC_LPASS_TX_MACRO
>> +    help
>> +      To add support for audio on Qualcomm Technologies Inc.
>> +      SC7280 SoC-based systems.
>> +      Say Y if you want to use audio device on this SoCs.
>
>       Say Y or M if you want to use audio devices on this SoC.
>
Okay. Will change accordingly.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

