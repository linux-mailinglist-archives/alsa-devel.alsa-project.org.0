Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A69564D1B
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 07:40:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3CB016D5;
	Mon,  4 Jul 2022 07:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3CB016D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656913241;
	bh=BdspoA9xzqnd3jumIH7JemFKr9rrNcNW03ZTjqfY11o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=avfjEQ2VOeDn82Ta5ZBv9xLZUfV5rh0mp9TGg9xDhNA9yV6iRTyqssdsIwT2Y+pUp
	 A4PEwkzmx2ABUbGM1IiA2eWk6rVtD017nMpCedPsL8YxW5XgoGf30E0x+vk0HW7Vc8
	 Tid9aXFOLqDM80aReoTxN6ADRpVWse5ezbrm4n4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17731F80139;
	Mon,  4 Jul 2022 07:39:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76639F8014E; Mon,  4 Jul 2022 07:39:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8ABEF800ED
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 07:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8ABEF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="xqkKNW7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656913178; x=1688449178;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KgHIbFiQUUgKqBjKxsqEcUkfQUGl1q/bi8wR0tnF4to=;
 b=xqkKNW7uMh0IrZr7/9yor4wNV6tpnYDv0mLzVYs8f0ZEpQ+nUqiB/H3Q
 ZTUt9iqINoFwqq0VBTl9QSn3dk3KmCuhzOsXPy/MpQ+kGht36z51In8mh
 0E1ivqnhfCtg+eh8ZmOk4AlojHJJhwZOJNeoQRUV96IDA0Gnd7Xgl+tBZ c=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 03 Jul 2022 22:39:34 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2022 22:39:33 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 3 Jul 2022 22:39:32 -0700
Received: from [10.216.21.19] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 3 Jul 2022
 22:39:27 -0700
Message-ID: <68c65ea9-cb54-bb5f-2296-7628e62c9cc2@quicinc.com>
Date: Mon, 4 Jul 2022 11:09:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [RESEND v5 2/2] ASoC: qcom: soundwire: Enable software clock
 gating requirement flag
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
References: <1656659827-27450-1-git-send-email-quic_srivasam@quicinc.com>
 <1656659827-27450-3-git-send-email-quic_srivasam@quicinc.com>
 <YsJ8WHgiybU0cQP/@matsya>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <YsJ8WHgiybU0cQP/@matsya>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 quic_plai@quicinc.com, bjorn.andersson@linaro.org, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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


On 7/4/2022 11:06 AM, Vinod Koul wrote:
> On 01-07-22, 12:47, Srinivasa Rao Mandadapu wrote:
>> Enable software clock gating flag in private data for SC7280
>> based platforms, which are soundwire 1.6.0 version based.
> why is this tagged ASoC... ???
As regular habit, did this mistake. No particular intention. Will take 
care from next time.
>
> I have fixed it up while applying
Thanks Vinod. Sorry for inconvenience caused.
>
