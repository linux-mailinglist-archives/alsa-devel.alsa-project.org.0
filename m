Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 569973803D0
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 08:52:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7C341791;
	Fri, 14 May 2021 08:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7C341791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620975152;
	bh=vZB9rfm+2v9/HTKvs3MoGkoURtRjEYTSwOAB1n1p5ZY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UxIO4OH5R89sT39p+HBmiJkgw0Mpi/9vZKhquqFx7pyyiFKEvKodNXUKL5OT1NjXk
	 8z1jntPMS9QzMhO5ptdJOdSVb+9avqKks6FJB6rBLnh60yPzmp5Do5UoFclTFS8ciJ
	 50LpGxvoavEVsEmf56NzTFb5gTiG2CxVT9RWefmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43FD1F8026B;
	Fri, 14 May 2021 08:51:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FBE3F80240; Fri, 14 May 2021 08:51:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 889C5F8012A
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 08:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 889C5F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="reaMK7px"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620975059; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=d51erDtkha1RR6bdcED15Fv71pub36quAgP8GlBGWEc=;
 b=reaMK7px/xpYF49CbUkJUVN5eagcfzOlpptc3jvUD9qYablw/h2ebm8vt5PtQ06zZVA09kie
 QlrmLdXhZ8Brr56OcFk7izxido5QSNFZXxm9RclGVJ6bJFtho3RNEaLhXlPpEAjSbw04cTR0
 75ozhTqC28l0brEzmvLxukp7wKg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 609e1dd0c7220f8fd361656d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 14 May 2021 06:50:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 803F8C4338A; Fri, 14 May 2021 06:50:55 +0000 (UTC)
Received: from [192.168.1.100] (unknown [157.48.128.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 399BFC433F1;
 Fri, 14 May 2021 06:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 399BFC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture
 begin
To: Mark Brown <broonie@kernel.org>
References: <20210513114539.4813-1-srivasam@codeaurora.org>
 <20210513133132.GC5813@sirena.org.uk>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <a6649fad-c2ca-1808-4227-8bcb373f66bd@codeaurora.org>
Date: Fri, 14 May 2021 12:20:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513133132.GC5813@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, rohitkr@codeaurora.org,
 swboyd@chromium.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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

Hi Brown,

Thanks for your review comments!!!

On 5/13/2021 7:01 PM, Mark Brown wrote:
> On Thu, May 13, 2021 at 05:15:39PM +0530, Srinivasa Rao Mandadapu wrote:
>
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +		ret = regmap_fields_write(i2sctl->spken, id,
>> +						 LPAIF_I2SCTL_SPKEN_ENABLE);
>> +	} else  {
>> +		ret = regmap_fields_write(i2sctl->micen, id,
>> +						 LPAIF_I2SCTL_MICEN_ENABLE);
>> +	}
> This commit doesn't remove the matching update in triger() so we'd have
> two redundant updates.  I guess it's unlikely to be harmful but it looks
> wrong/confusing.

Yes, It's not harmful, as clk_prepare_enable is enabling clock only once 
but maintaining count.

As Some times in Suspend/resume Sequence not hitting startup/shutdown, 
but Trigger, so for maintaining

consistency not removed in trigger.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

