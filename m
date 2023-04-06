Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8F46D900E
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 09:04:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C48047F8;
	Thu,  6 Apr 2023 09:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C48047F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680764674;
	bh=2vUQ6zD3fBOy5Gy7ceZYTAaFAszRPYStg3uGV6fQd2c=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gmag/MAcIMLT4kgrXVaa0Bv1KYTVhxqA4N4bj7xujJkEA5UgP780zKadu5EZbKVoV
	 aX5H7l1Q4oZezPCmHqvBe6dmpk6Xm7bUErt53hArFuFY1n38P1WHHPi89MplOAoTNX
	 hMJ0Z1EbZj+RwhH2eM9qrpbT+4hHWI9sxbbP+NIQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37B58F80171;
	Thu,  6 Apr 2023 09:03:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE8AFF80246; Thu,  6 Apr 2023 09:03:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41A86F80149
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 09:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A86F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hVmARTOW
Received: by mail-ed1-x52c.google.com with SMTP id r11so146980499edd.5
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680764611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xt6w7DBEEp2oP9gq6uM1fJrHBdn8VFiv3bhU+Z8knvc=;
        b=hVmARTOWOi8zcXg/wquYPGxpaxjcdvjoCiWvCn/vQkTDpU56ZAhW4rutJ//Xzx6vz6
         sk3iRLVpvhW3aaX6lykCTeKgQdHEX3JMgzS3Fd8W/zp/KAEo3Uym7g3mEqBTKJ918jtL
         ZptyNafVhadzQfCoJ9p/gMqw2crPzdyyUqSqaxzOQBoP36R43wjUYT0BWvOWLp/G4g4r
         w2MNwZyMW99BYuaI53XP55LtMnPpEKKSs3VklWerLWaPLAqduIdjf2PAm+v4eSgUnQ3P
         4jdU3H4yFFIg4N6F6dc7AXYvM5/+VezfVxrJ8j51k/LsJlDEj4wZKerHQUaes0qBUMwa
         FFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680764611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xt6w7DBEEp2oP9gq6uM1fJrHBdn8VFiv3bhU+Z8knvc=;
        b=LcQIjSP9hGD+Ze3HVhK1QeE0vjuwqUWLLlLSqB3/DWcNYiWqolEp3c/5vQngJTminv
         vCA9rQJe/tj6J5zFqAMO0YSNuUBfMChXdOcEPFnGzuEaCQM8eKPShKM2Z3IXDeRHCpmI
         sO1LKY6GTgnLRr1oVdWd0rjLIdRmRBcfOMJOXsvn5In8hhrUsFyMNxul5mM9YDl/0qXI
         p+4C76EKOwy5/X1ucfDlrZ/MpLIcqzXZklGb8LZ9TVUgc/2O+/dt9OJHqQJUW64JG0c5
         oGjDhA6alzUEHuEJ0GVqJ0GQRJ93BVLUhzuZzXlBMbbfEqkRCoePG572AV9dOX3891uc
         lLYA==
X-Gm-Message-State: AAQBX9dOHWEoUkpsmqoxKxn5vCmjUGynB1smPqem9SwYE2h/qwKuJUB2
	JMIY/JvDKOxI/R195IVY0ThYug==
X-Google-Smtp-Source: 
 AKy350YnhKpndWCuKkoEX1F9XMUWGFxBZSXdLPSCgbRgT7xN4Z0Df2myKsprNtK3DO5NAXHENav20w==
X-Received: by 2002:a17:906:9145:b0:931:df8d:113 with SMTP id
 y5-20020a170906914500b00931df8d0113mr4673121ejw.26.1680764611021;
        Thu, 06 Apr 2023 00:03:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed?
 ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id
 f13-20020a170906c08d00b0092f289b6fdbsm390050ejz.181.2023.04.06.00.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 00:03:30 -0700 (PDT)
Message-ID: <11de8706-5753-472b-1fe0-de80bb3d8c8c@linaro.org>
Date: Thu, 6 Apr 2023 09:03:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] soundwire: qcom: Fix enumeration of second device on the
 bus
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20230405142926.842173-1-krzysztof.kozlowski@linaro.org>
 <ecc13046-1a4f-77e7-c4dc-a5a4c1248572@linux.intel.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ecc13046-1a4f-77e7-c4dc-a5a4c1248572@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SY6P5WDN5RE7ZCMKHQROCQP477VJ3H74
X-Message-ID-Hash: SY6P5WDN5RE7ZCMKHQROCQP477VJ3H74
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: stable@vger.kernel.org, Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SY6P5WDN5RE7ZCMKHQROCQP477VJ3H74/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/04/2023 17:01, Pierre-Louis Bossart wrote:
> 
> 
> On 4/5/23 09:29, Krzysztof Kozlowski wrote:
>> Some Soundwire buses (like &swr0 on Qualcomm HDK8450) have two devices,
>> which can be brought from powerdown state one after another.  We need to
>> keep enumerating them on each slave attached interrupt, otherwise only
>> first will appear.
>>
>> Cc: <stable@vger.kernel.org>
>> Fixes: a6e6581942ca ("soundwire: qcom: add auto enumeration support")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Cc: Patrick Lai <quic_plai@quicinc.com>
>> ---
>>  drivers/soundwire/qcom.c | 11 +++--------
>>  1 file changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index c296e0bf897b..1e5077d91f59 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -587,14 +587,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>>  			case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
>>  				dev_dbg_ratelimited(swrm->dev, "SWR new slave attached\n");
>>  				swrm->reg_read(swrm, SWRM_MCP_SLV_STATUS, &slave_status);
>> -				if (swrm->slave_status == slave_status) {
>> -					dev_dbg(swrm->dev, "Slave status not changed %x\n",
>> -						slave_status);
> 
> it's not clear to me how removing this test helps with the two-device
> configuration?
> 
> Or is this a case where the status for both devices changes at the same
> time but the interrupt status remains set, so the next iteration of the
> loop is ignored?

I think the patch is not correct. I misinterpreted the slave status
field and after double checking I see two speakers bound. Please ignore
for now.

Best regards,
Krzysztof

