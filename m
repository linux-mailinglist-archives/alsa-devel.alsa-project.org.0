Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA0F40BE6A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 05:45:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC7B617B7;
	Wed, 15 Sep 2021 05:44:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC7B617B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631677547;
	bh=EIljr02fntKSE7YgVoC7UjTPmAZ9Y0vaRUN0LB5NFvE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jo9Zhd5eylKFQ/YG+BHi/R6w/uwFycUzNX8RHWMJjaJpwP4g0sguO0GJUG91O/5Wq
	 h4Gsr5o8sg+nqTyPVFDMTABCovwIYsCRLwBs1j7W2WXr3O7XOtuNKpK+4C1ysArnZq
	 1w89gMnzk488Vsf8DXRLdsc2nn8tDzWrNhaLyY6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FF03F802E8;
	Wed, 15 Sep 2021 05:44:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBB63F8027C; Wed, 15 Sep 2021 05:44:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CB22F80132
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 05:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CB22F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="hw1pE0mo"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631677462; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=un4+OahdUMsVUVi8/7ow3BxZ9Gz3YZpgJT4xqgBMLNA=;
 b=hw1pE0moUU7IYP0yo1qnIP9wRtfndALm02V5ZGD7+DooLP6L1id0ccvWzyU00IN6QX4woCty
 fOcMaSIYfrOMLWV4JIgnFEjoWJ1DcBZDxk6QDj+CGhpF2JLUPI250zIuKIB0QjepoJbz6ld5
 yCylj4m5vKk0MWfx0+hy2EN97RE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61416c10ec62f57c9a9c758d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 15 Sep 2021 03:44:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3EAF8C43460; Wed, 15 Sep 2021 03:44:15 +0000 (UTC)
Received: from [192.168.29.24] (unknown [49.37.165.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 09F8EC4338F;
 Wed, 15 Sep 2021 03:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 09F8EC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
To: Rob Herring <robh@kernel.org>
References: <1631124057-17155-1-git-send-email-srivasam@codeaurora.org>
 <1631124057-17155-2-git-send-email-srivasam@codeaurora.org>
 <1631190773.288819.200339.nullmailer@robh.at.kernel.org>
 <f683c69a-58bb-15ba-8db5-6eaea6e1a062@codeaurora.org>
 <CAL_Jsq+uUceorjp75FYABeQYaK2YgRkmDakFNwPL7uwaHGcDLA@mail.gmail.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <d98087ad-31d9-c378-9718-08ac7df20c90@codeaurora.org>
Date: Wed, 15 Sep 2021 09:14:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+uUceorjp75FYABeQYaK2YgRkmDakFNwPL7uwaHGcDLA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Gross,
 Andy" <agross@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 judyhsiao@chromium.org, Patrick Lai <plai@codeaurora.org>
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

On 9/14/2021 6:23 PM, Rob Herring wrote:
> On Mon, Sep 13, 2021 at 3:20 AM Srinivasa Rao Mandadapu
> <srivasam@codeaurora.org> wrote:
>> Thanks for info Rob!!!.
> Don't top-post on maillists.
Okay. Will take care from Next time.
>
>> This error is due to missing dependency
>> patch.(https://patchwork.kernel.org/project/alsa-devel/list/?series=543829)
>>
>> Could You Please check with the above patch applied?
> No. How is a script supposed to handle that?
>
> Where have you noted the dependency in the patch? Without that, I
> assume you just didn't run 'make dt_binding_check' and the maintainer
> doesn't know to check that the dependency is applied.
>
> Rob
Included dependency list in cover letter. Will include in this patch 
next time.
>>
>> On 9/9/2021 6:02 PM, Rob Herring wrote:
>>> On Wed, 08 Sep 2021 23:30:56 +0530, Srinivasa Rao Mandadapu wrote:
>>>> Add devicetree bindings documentation file for sc7280 sound card
>>>> registration.
>>>>
>>>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>>> ---
>>>>    .../bindings/sound/google,sc7280-herobrine.yaml    | 169 +++++++++++++++++++++
>>>>    1 file changed, 169 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
>>>>
>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> Error: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dts:46.24-25 syntax error
>>> FATAL ERROR: Unable to parse input tree
>>> make[1]: *** [scripts/Makefile.lib:379: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml] Error 1
>>> make[1]: *** Waiting for unfinished jobs....
>>> make: *** [Makefile:1438: dt_binding_check] Error 2
>>>
>>> doc reference errors (make refcheckdocs):
>>>
>>> See https://patchwork.ozlabs.org/patch/1525980
>>>
>>> This check can fail if there are any dependencies. The base for a patch
>>> series is generally the most recent rc1.
>>>
>>> If you already ran 'make dt_binding_check' and didn't see the above
>>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>>> date:
>>>
>>> pip3 install dtschema --upgrade
>>>
>>> Please check and re-submit.
>>>
>> --
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
>> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

