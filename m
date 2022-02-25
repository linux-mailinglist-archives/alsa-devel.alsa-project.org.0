Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 699E94C4D34
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 19:04:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF01D1AFA;
	Fri, 25 Feb 2022 19:03:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF01D1AFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645812283;
	bh=JIHBDR1ljAkL5aYO/3oDZOQ+Glox2EubHQHOXC0xP1w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ulM8rwLJllroE084AvtgEYg45mQYSawX3mw9LLfvrf2OaPulIEn4rW2AT2Mw11Tm6
	 IEvHZWv9pX9Q6S8xOhUYb1kHl4iKejz1J/nCHsejrrYbB/0S0X7MAYVZQ89mSUyQeL
	 GTS1zgqqYba31Cs+yhXx4gR+81PEwmBa0rvQnWSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C2F3F80118;
	Fri, 25 Feb 2022 19:03:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CCE7F80132; Fri, 25 Feb 2022 19:03:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93AE7F800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 19:03:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93AE7F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jOi89ia8"
Received: by mail-wr1-x42f.google.com with SMTP id d17so5651184wrc.9
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 10:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=myxelBqy30bTcJ8ZX5UhYCHIKBHFqSW0CcEE1Z58khk=;
 b=jOi89ia8H2rFcP3T7+wURDQtxvvySEXht1DO13PIwFY9RJIC/QiSqLOm1dtVkdAyaf
 AbYh/oSAOyApE9Q1Kn/SpPICp4CNncqYnBYGAUyAGspr1g1GvGGFqLdM7rgD91v4+oxu
 PWhLDigQFqAdiLhHI/JPrvGC+Rv/YYNnLlA2yzJVwr5dfMs7NQkqFay3wPrgTRyqGr0y
 RosJil9OVqTiq+9ABreNkg2ZbxVtQefuRQwZhgN+VwviRBOoLfunc9ocRyUzinV0JAqi
 VyCJrUSUMQH+F3MGkSN1QVb2Czn2J3jI73XkYiBHEI5aCts8fyqgVSGdE5ov+B7vV6UQ
 Q+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=myxelBqy30bTcJ8ZX5UhYCHIKBHFqSW0CcEE1Z58khk=;
 b=VHQ7ukhvJ+c4nWFYxZWYjIw3HxJb3T1fIbIbfEZCdgm4WEkjPztrx7SZlhr/noe7gU
 VkCPZIFa2W71AeR3ZSIRS1Unf+uXf+xqm2SEKWS0THMOHHIY0BqOshDp+DXdhzuy2dxX
 h14I9T2CernFOm6Ty0B10SFjyIeFnV/4QRtdywDK7pYlThcTn2q5qGbRAOYUi3c98T36
 D+lpfGPgWjWSCjKOFzIGjwdf6LQOvOBXPc+AxrVLNFclLa6SZu62kUvcK0b8OIXdGMBV
 Hc5PUppcaiFIfKK3Nsgp9Pk1/YQZ4klzQUUSKG7T4audqA6Y2HEsJN0OJhHYl14DBrg9
 k03w==
X-Gm-Message-State: AOAM532OnfhM+MLWeUwcBpKahYAPenG0zqlb5ugxTLhkrmddEj/2cCBi
 qitekVv1ZaUBbwMtffgATdnp0g==
X-Google-Smtp-Source: ABdhPJxjMNMdYhsq1gDFcmAYq8MGRlkuy47ls/d6GXdHncZa9U6DNBLuj8UsSq1feDuCyGWhxSUoJg==
X-Received: by 2002:a5d:5245:0:b0:1ed:9eca:cf3d with SMTP id
 k5-20020a5d5245000000b001ed9ecacf3dmr6811167wrc.666.1645812207584; 
 Fri, 25 Feb 2022 10:03:27 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 s3-20020adfbc03000000b001e4b0e4a7fdsm2918057wrg.93.2022.02.25.10.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 10:03:26 -0800 (PST)
Message-ID: <4811be6f-7e86-2a62-94cf-98504d5e64e7@linaro.org>
Date: Fri, 25 Feb 2022 18:03:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] soundwire: qcom: remove redundant wait for completion
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <1645800257-27025-1-git-send-email-quic_srivasam@quicinc.com>
 <a99a59eb-cd59-f566-b98d-486c94f32eec@linaro.org>
 <06650d56-eed3-73ad-d6b4-6b56a5a70669@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <06650d56-eed3-73ad-d6b4-6b56a5a70669@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 25/02/2022 15:43, Pierre-Louis Bossart wrote:
> 
> 
> On 2/25/22 08:45, Srinivas Kandagatla wrote:
>>
>>
>> On 25/02/2022 14:44, Srinivasa Rao Mandadapu wrote:
>>> Remove wait_for_completion_timeout from soundwire probe as it seems
>>> unnecessary and device enumeration is anyway not happening here,
>>> hence this api is blocking till it completes max wait time.
>>> Also, as device enumeration event is dependent on wcd938x probe to be
>>> completed, its of no use waiting here.
>>> Waiting here increasing the boot time almost 4 seconds and impacting
>>> other modules like touch screen.
>>>
>>> Fixes: 06dd96738d618 ("soundwire: qcom: wait for enumeration to be
>>> complete in probe")
>>>
>>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>>
>> LGTM,
>>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> I don't get the idea, sorry.
> 
> If you look at the code, these are the cases where this 'struct
> completion' is used
> 
> 	struct completion enumeration;
> 	complete(&ctrl->enumeration);
> 	/* Enable Auto enumeration */
> 	init_completion(&ctrl->enumeration);
> 	wait_for_completion_timeout(&ctrl->enumeration,
> 
> 
> so if you remove the wait_for_completeion, then you might just as well
> remove the whole thing and revert 06dd96738d618
> 
> what am I missing?
Yes, that makes more sense to revert it, as it is the only user of this 
completion.
We could add it back when we really need this again in pm runtime setup 
if required.

--srini
> 
> 
>>> ---
>>>    drivers/soundwire/qcom.c | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>>> index 5481341..9a32a24 100644
>>> --- a/drivers/soundwire/qcom.c
>>> +++ b/drivers/soundwire/qcom.c
>>> @@ -1309,8 +1309,6 @@ static int qcom_swrm_probe(struct
>>> platform_device *pdev)
>>>        }
>>>          qcom_swrm_init(ctrl);
>>> -    wait_for_completion_timeout(&ctrl->enumeration,
>>> -                    msecs_to_jiffies(TIMEOUT_MS));
>>>        ret = qcom_swrm_register_dais(ctrl);
>>>        if (ret)
>>>            goto err_master_add;
