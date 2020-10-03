Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DE92823EC
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Oct 2020 13:38:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B32718FE;
	Sat,  3 Oct 2020 13:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B32718FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601725088;
	bh=mtVKrUIEU2P91PeqPHYfi7BiD7QWIxpTA+4pVoWAtDs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bqzfIQfpv3cn1snF70MM3yTy5GwHB50X5XvRllot+LFdnAMxBTYKvf6Nbkd3Aogf8
	 UbN4N4a/XaHGpVriDdqvDNAeDvwQoeqWH7hBn+D2QkLCgqRuBvQVj4euAD2a7VsGGe
	 QandUtBlM4usrXiGBfLoIgnkWy2dBEaj3Jm61g4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2500BF801D8;
	Sat,  3 Oct 2020 13:36:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9F66F801F5; Sat,  3 Oct 2020 13:36:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AA45F801D8
 for <alsa-devel@alsa-project.org>; Sat,  3 Oct 2020 13:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AA45F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="AEq2eLs9"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601724983; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+b3m7jKQ1O6fiYm/hL5ZFgqJTiOppqki6YMsfwFKW/s=;
 b=AEq2eLs9fUdqO5o4NchY0EknBNCYQybXffjoGiRgxD0JHm+GIcTmfVTNbfa3ocvD0CmSZqRY
 bYB03F2QX9HrHbVB8RG2lDFnqnFWBORIieJBNm0ncFGcIrrDjPpIFXUQpMyQQqwmmfD3is50
 GmtBGYi2xNolBqWOISGUmF/i9PA=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f78622eaad2c3cd1cb9d97a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 03 Oct 2020 11:36:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 68A94C433CA; Sat,  3 Oct 2020 11:36:13 +0000 (UTC)
Received: from [10.131.172.121]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DC457C433CB;
 Sat,  3 Oct 2020 11:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DC457C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v8 5/7] ASoC: qcom: Add support for lpass hdmi driver
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1601447977-18115-1-git-send-email-srivasam@codeaurora.org>
 <1601447977-18115-6-git-send-email-srivasam@codeaurora.org>
 <c94cf74d-03f6-999e-012f-5d9ef2316d61@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited
Message-ID: <925e2586-39dd-b1d9-174a-bda3367ab668@codeaurora.org>
Date: Sat, 3 Oct 2020 17:06:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <c94cf74d-03f6-999e-012f-5d9ef2316d61@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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

Thanks for bringing up this point Srinivas!!!

On 9/30/2020 8:57 PM, Srinivas Kandagatla wrote:
>
>
> On 30/09/2020 07:39, Srinivasa Rao Mandadapu wrote:
>> +}
>> +
>> +static bool lpass_hdmi_regmap_volatile(struct device *dev, unsigned 
>> int reg)
>> +{
>> +    return true;
>> +}
>
> I did ask this question in multiple reviews, but never got an answer!
> Are all the dp/hdmi port register range really volatile!?

Sorry for incomplete response in last review comment reply.
With making only specific DMA registers and interrupts registers true, 
aplay was stuck.

Now we identified issue causing register and made it volatile.
With that change it seems working fine. After doing all the tests we 
will share v9 series patch.

>
>
>
> --srini
>> +
>> +struct regmap_config lpass_hdmi_regmap_config = {
>> +    .reg_bits = 32,
>> +    .reg_stride = 4,
>> +    .val_bits = 32,
>> +    .writeable_reg = lpass_hdmi_regmap_writeable,
>> +    .readable_reg = lpass_hdmi_regmap_readable,
>> +    .volatile_reg = lpass_hdmi_regmap_volatile,

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

