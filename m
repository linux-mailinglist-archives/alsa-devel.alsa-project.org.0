Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4752040865D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 10:22:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 859681657;
	Mon, 13 Sep 2021 10:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 859681657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631521346;
	bh=oCw+NZ8CDSbbRYEbR+gxg/n9iH4THAeJv29x7qdoCQk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rfsBHXj57uwcaW4KGkm3aZz+YdNXORLPglOQATz1v57Ukv2Ya7aNGGDn+4np+l2wv
	 trTjW+rVx0H0uU8byutt1wvj91DscYB9OTMviSE96auYQv//8nYEp0Bqd+9IckXEBO
	 p7yQ4s3TePlA40/bmrhIt5D6A9TJAXGz7RHxtVWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E10CFF802E8;
	Mon, 13 Sep 2021 10:21:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E08CF8027C; Mon, 13 Sep 2021 10:21:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26B6BF80128
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 10:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26B6BF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="llwXcnyJ"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631521261; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=VTesdtiKPdW2NXskIxoPYKcZQR5S7va81TqV59+vlWA=;
 b=llwXcnyJMwR5z8fE7mJT0lHaCk+utmmEdhH+X5y5FYxELDEMNbmj+rAVeY247rTT+LS0U0mB
 kdOg1V++5byTcPE2jrhlc/bQYHATDOYCbboIAJ+IX5I7CdicpVUOpQc+2Adu0tMVoBV5njvV
 u0dZe/h/yyL0WK/z/anuI6EKf/g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 613f09e18b04ef85893f74a7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Sep 2021 08:20:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BEEB7C4338F; Mon, 13 Sep 2021 08:20:48 +0000 (UTC)
Received: from [10.242.137.170] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DC8CEC4360C;
 Mon, 13 Sep 2021 08:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org DC8CEC4360C
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
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <f683c69a-58bb-15ba-8db5-6eaea6e1a062@codeaurora.org>
Date: Mon, 13 Sep 2021 13:50:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1631190773.288819.200339.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 broonie@kernel.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
 rohitkr@codeaurora.org, swboyd@chromium.org, judyhsiao@chromium.org,
 plai@codeaurora.org
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

Thanks for info Rob!!!.

This error is due to missing dependency 
patch.(https://patchwork.kernel.org/project/alsa-devel/list/?series=543829)

Could You Please check with the above patch applied?


On 9/9/2021 6:02 PM, Rob Herring wrote:
> On Wed, 08 Sep 2021 23:30:56 +0530, Srinivasa Rao Mandadapu wrote:
>> Add devicetree bindings documentation file for sc7280 sound card
>> registration.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   .../bindings/sound/google,sc7280-herobrine.yaml    | 169 +++++++++++++++++++++
>>   1 file changed, 169 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
>>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dts:46.24-25 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:379: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1438: dt_binding_check] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1525980
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

