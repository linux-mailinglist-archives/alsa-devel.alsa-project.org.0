Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46447508ED5
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 19:47:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E75651AFA;
	Wed, 20 Apr 2022 19:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E75651AFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650476872;
	bh=uelMA2is0TJSf4aWs60eU7cODJVK+lIWWgcRC+Gr+TM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t+pxnfNooNC6xPWFJCmvHiFlG4qgBNbqu5oNoaFQsmqcoqkYSMZDgrgmgWH+4JPdB
	 see93+y3Az34ghJreoNjPCyO6xmciSj+XG0qZoGW662W/zEJTH6apOwOE5Oe8uo21d
	 SOZX04dwUu3xhJrTaBMyl1uf/9Izwou9b2SvsVoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 544D0F80128;
	Wed, 20 Apr 2022 19:46:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F90BF80125; Wed, 20 Apr 2022 19:46:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E235F800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 19:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E235F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="K754ebAi"
Received: by mail-wm1-x32f.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so4212275wma.3
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 10:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Y0o19LlMLuvTnI/xl7SjhLZ4yjEbM01KZ2JzTFRO+wU=;
 b=K754ebAivn6X/9ER/aJ29m5lYECSX3zg3dPY0WZsEgvffqb2iEvH54j1KHGcZi6m9t
 +pL4xSL615v1HrTsFT1E1+lvfuarpSgBeQEnr+o6EqnmG12SfLJ1vHv0UROE7PuMVDZS
 lasMp/amHfMMIxKOkHpccnI9KAZhwOF73jpA2AeNJWN4uMaducamqBbDZ+9V518/B2gJ
 AO0QEWc5oRm8n8ddLvJ5j7AQQbugOPoh236ac29n990DqasvW9lYY5DK0FqOMAmcc1yy
 Nzr9ButMWwAgM3WhD1fuPrvSBcRwDp1HUQd1XT8wvmYNE3dD4I4lQheoFwg1+lhwatAV
 pj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y0o19LlMLuvTnI/xl7SjhLZ4yjEbM01KZ2JzTFRO+wU=;
 b=umXjbz57EXZsqm9pZcdFH9PQy813TV03vGl/E7452QZ0yemhEevT11+zaN6NecffAV
 +3J5LAnDY9wvkQRC7TjUHzRs66FvbyLbp0qko8WVn1yD98qhmH21xLqEaE0c04/mZx8k
 +9Sx/F6HqE1MWjsioXwe3JyKJaWMMJsFgADRmsL4RhzD7EXLTf2c8V8+3OoZVSgCDMAR
 rRvazlpUHU8CPEToHnzeqicpe/1ci9fvYw3QMsyHbrhGkvPsydrSzzqY/yeAdzRwjsQ+
 HUMh6qmYG6DSSYjwHb/CWJFNs7yBvNQaxKDW8LFb5syxxFIFI+AiXGLuyyXepGkFnsi2
 GVVA==
X-Gm-Message-State: AOAM531SUHG5NE5AVSYhGLbiXXeTiXAADV+6dbTQpCvuGZuW0WlQtog/
 7/TuOSsOy9SWHddsHKkPvE5X+YwN5DSQYA==
X-Google-Smtp-Source: ABdhPJy4aiKqzcNlk3U2xq0/sZJ8FBAJfPZTjiM9up9l4jWht1pw6P6GPr9hofMGDUjHCxjRXhT7Uw==
X-Received: by 2002:a1c:7416:0:b0:38e:b8b7:e271 with SMTP id
 p22-20020a1c7416000000b0038eb8b7e271mr4705827wmc.7.1650476805039; 
 Wed, 20 Apr 2022 10:46:45 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 z6-20020a056000110600b00207aa9eec98sm374297wrw.30.2022.04.20.10.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 10:46:44 -0700 (PDT)
Message-ID: <e8ac9fab-85af-8f3c-eb68-c2d4d2f7f046@linaro.org>
Date: Wed, 20 Apr 2022 18:46:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/3] soundwire: qcom: add runtime pm support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 robh+dt@kernel.org, vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
 <20220228172528.3489-2-srinivas.kandagatla@linaro.org>
 <10eb3973-03c4-74cd-d28a-014fc280cdf8@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <10eb3973-03c4-74cd-d28a-014fc280cdf8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, quic_srivasam@quicinc.com
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



On 20/04/2022 18:39, Pierre-Louis Bossart wrote:
>> @@ -1197,12 +1224,23 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
>>   static int swrm_reg_show(struct seq_file *s_file, void *data)
>>   {
>>   	struct qcom_swrm_ctrl *swrm = s_file->private;
>> -	int reg, reg_val;
>> +	int reg, reg_val, ret;
>> +
>> +	ret = pm_runtime_get_sync(swrm->dev);
>> +	if (ret < 0 && ret != -EACCES) {
>> +		dev_err_ratelimited(swrm->dev,
>> +				    "pm_runtime_get_sync failed in %s, ret %d\n",
>> +				    __func__, ret);
>> +		pm_runtime_put_noidle(swrm->dev);
> ... here it's missing?
> 
> I have a fix ready but thought I would check first if this was intentional

Its not intentional.


> 
> https://github.com/thesofproject/linux/pull/3602/commits/6353eec8dc971c5f0fda0166ae1777f71784ea32

Fix looks good.

--srini
> 
