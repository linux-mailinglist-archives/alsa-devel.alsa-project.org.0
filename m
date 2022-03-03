Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9D84CB49C
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 02:57:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC87B1A6B;
	Thu,  3 Mar 2022 02:56:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC87B1A6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646272656;
	bh=S1GuRPnyYaNf80EYuZYfaDICh9ByX3QnITdARR7oqnQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NmF+tQU/trTkzLs5by5nWpEmy1nFpMPhIuKvr00TU9zQW4BbMHrhL5d8GAyyUG8ZG
	 S4Sy3wT4jB3uWRZktiquAuS8QnZK+eEjLltfwKeYBFurX+wriymzIY7IxgZpTj4WcD
	 a+aFY5+VGtztHVLO6dlFReNe0ejiUqyhZgl4iLso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24423F80054;
	Thu,  3 Mar 2022 02:56:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAE17F80167; Thu,  3 Mar 2022 02:56:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B13DF80167
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 02:56:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B13DF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="hSkV/0dC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646272582; x=1677808582;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3bzSRY1al0oYlmM52NOwKtS+br8ieRk+tPabImmuEUM=;
 b=hSkV/0dCuzjdSQQ/FTt8NaferQ5NsIzVOg7PxOB49VS93FcN61CWLQ+z
 PeLMYL9ALJw1tryAg6j5XfiJ4A5T8R2OyqUKjdZQEk1BaIARmHLzvEyvg
 D3wNMdbERAKg2PvVbYutOhI1pLt+mDSgHALHPaOicUATtqGrsbT6yDs+i U=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Mar 2022 17:56:18 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 17:56:17 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 2 Mar 2022 17:56:16 -0800
Received: from [10.216.42.174] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Wed, 2 Mar 2022
 17:56:09 -0800
Message-ID: <7e9fceed-6b29-d6a6-2035-fdf3fc70a773@quicinc.com>
Date: Thu, 3 Mar 2022 07:26:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v6 3/3] dt-bindings: soundwire: qcom: Add bindings for
 audio CSR reset control property
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
References: <1646224982-3361-1-git-send-email-quic_srivasam@quicinc.com>
 <1646224982-3361-4-git-send-email-quic_srivasam@quicinc.com>
 <Yh+RwQS1Cyeuq4Jf@matsya>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <Yh+RwQS1Cyeuq4Jf@matsya>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, yung-chuan.liao@linux.intel.com,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, rohitkr@codeaurora.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, quic_plai@quicinc.com,
 sanyog.r.kale@intel.com, bjorn.andersson@linaro.org, judyhsiao@chromium.org,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
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


On 3/2/2022 9:18 PM, Vinod Koul wrote:
Thanks for your time Vinod!!!
> On 02-03-22, 18:13, Srinivasa Rao Mandadapu wrote:
>> Update description for audio CSR reset control property, which is
>> required for latest chipsets to allow software enabling in CGCR HCLK register.
> too many acronyms pls explain!
Okay. Will expand and re post the patch.
>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>> index b93a2b3..84c8f54 100644
>> --- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>> @@ -150,6 +150,18 @@ board specific bus parameters.
>>   		    or applicable for the respective data port.
>>   		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>>   
>> +- reset:
>> +	Usage: optional
>> +	Value type: <prop-encoded-array>
>> +	Definition: Should specify the SoundWire audio CSR reset controller interface,
>> +		    which is required for SoundWire version 1.6.0 and above.
>> +
>> +- reset-names:
>> +	Usage: optional
>> +	Value type: <stringlist>
>> +	Definition: should be "swr_audio_cgcr" for SoundWire audio CSR reset
>> +		    controller interface.
>> +
> We should add these in example as well...
Okay. Will add in Example.
>
>>   Note:
>>   	More Information on detail of encoding of these fields can be
>>   found in MIPI Alliance SoundWire 1.0 Specifications.
>> -- 
>> 2.7.4
