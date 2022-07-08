Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D8456B6BC
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 12:12:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04E5A3E7;
	Fri,  8 Jul 2022 12:12:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04E5A3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657275178;
	bh=gENMgg5qKm1yqbQv/hJlVhM+i2hOHUj7PaTw4IRpEuw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n/NedWR5p8APP3AqQLUotKbsoWSoNWSh8IqSfF0rXLh0tJlSFr87Oi2em9pTP6PR5
	 N6oywWX7ngDlNtusD6+liJKWGnfMxj3CxxVh361kkcgHYnbsF05KBNer2vuR7x2oSQ
	 x7MhhixrCDOpodYy1iYziru2pn0WQDiCviSLiMCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 684C1F8025B;
	Fri,  8 Jul 2022 12:11:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40EB1F800E9; Fri,  8 Jul 2022 12:11:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA80BF800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 12:11:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA80BF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GG2oup2r"
Received: by mail-wm1-x32e.google.com with SMTP id
 r129-20020a1c4487000000b003a2d053adcbso857738wma.4
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 03:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=81okasB3g0ekpD8niaqxxgdkdfiBn6Pr7NqUFt5DBEo=;
 b=GG2oup2rv/ga/OnSyutUz+S+rBqREaqHTkx+gB+ADu7sa0SBu42CvT0CSElqsSFWhZ
 Lr+Q+l6DrU4UfBc4bH621yyvfTEU4ylv+RH1Qh6aYwDQLAT7A12x2AvYvn1Y/mZi8lCc
 ZgMh604fWqZ1iW9+KCdZhf7fgB0+R2ZUU8QivYy9x1NeN7j2K7nYu+dAmgiMXpxsorOk
 2xwOdjbOJb7p9A6g6OG88iO66uVe81StH6gcxVck63+H2Hec41b86vbLy5uy6DQk06ji
 x6PwtSvJU7OHxBxCehyjzcRmW0ftH/T6m9vqDIIyfLsqRUzMCMGBtGulWCzeKTegq8mB
 mTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=81okasB3g0ekpD8niaqxxgdkdfiBn6Pr7NqUFt5DBEo=;
 b=ObaPalX56guwqPrafsaKWQKQ9P8gSinRqq8BGuD87xQ2ATihMSV2yBkLbPiQ9kTUri
 gGoXZ+LMsY0k3HMrk5LpJb9ZEPRyQ+17Xw4IYh53dXOjyrcBq5U9x7Ar9vjayb7/wTd9
 rjfdLpzX9dSQZfpBUEZLBH0ZHykVNZrvNUdSJrp2xHUhgHUpUVVgQhqq0QKh10l10Yje
 7PfEi7rbVCE7UlscBvMTnhRvi8S+kCTNQvLEYdCrpBAY0+QKpm80x2a27PtnLuyvPI/a
 UZ5qCvsljuwT9pOB1wKdAGHujkxSMQgKUnPhJV/D+EnnWgfblSOWWY7uoSANAmsPpwck
 cXUw==
X-Gm-Message-State: AJIora9RQmb/1L3L4pg9aq9suqU5LuMaO2XjYUYbYd0mEYA+4Z8Jt+2K
 zVZ7ZbRjwbgzdGbCcgOQKxBn7w==
X-Google-Smtp-Source: AGRyM1vDkPE98jrS2Me8n5r7/R9H34mgmtL+Fc/cv224985Zm6C1y8NPkd/Aw90Ph3on7smNzjvWCA==
X-Received: by 2002:a05:600c:4243:b0:3a2:db2d:ebdc with SMTP id
 r3-20020a05600c424300b003a2db2debdcmr1786084wmm.41.1657275106530; 
 Fri, 08 Jul 2022 03:11:46 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 bk12-20020a0560001d8c00b0021d7050ace4sm327428wrb.77.2022.07.08.03.11.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 03:11:45 -0700 (PDT)
Message-ID: <42056cab-237c-3f3a-da43-5138be64243b@linaro.org>
Date: Fri, 8 Jul 2022 11:11:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] soundwire: qcom: fix max auto-enumeration devices
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20220708091947.5610-1-srinivas.kandagatla@linaro.org>
 <20220708100453.GM2316@kadam>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220708100453.GM2316@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, stable@vger.kernel.org, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
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



On 08/07/2022 11:04, Dan Carpenter wrote:
> On Fri, Jul 08, 2022 at 10:19:47AM +0100, Srinivas Kandagatla wrote:
>> Controller only supports up to max of 1-11 device ids via auto-enumeration,
>> and it has only those many registers.
>>
>> In the existing code, we can protentially cross this boundary and read incorrect
>> registers.
>>
>> Cc: stable@vger.kernel.org
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Fixes: a6e6581942ca ("soundwire: qcom: add auto enumeration support")
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>> Thanks to Dan for reporting an overflow issue, which turned out to be
>> another issue, where we could read registers that do not belong to
>> auto-enumeration devid.
>> Either way this fixes both issues, one reported by Dan and other
>> incorrect register access.
>>
>> Thanks,
>> Srini
>>
>>   drivers/soundwire/qcom.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 9df970eeca45..dd1365a44458 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -119,6 +119,8 @@
>>   #define MAX_FIFO_RD_RETRY 3
>>   #define SWR_OVERFLOW_RETRY_COUNT 30
>>   #define SWRM_LINK_STATUS_RETRY_CNT 100
>> +/* devid 1 - 11 */
>> +#define SWRM_MAX_AUTO_ENUM_DEVICES	11
>>   
>>   enum {
>>   	MASTER_ID_WSA = 1,
>> @@ -479,7 +481,7 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
>>   	int i;
>>   	char *buf1 = (char *)&val1, *buf2 = (char *)&val2;
>>   
>> -	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
>> +	for (i = 1; i <= SWRM_MAX_AUTO_ENUM_DEVICES; i++) {
> 
> I'm sorry, I don't understand.  Both of these defines are 11 so this
> doesn't change anything?
> 
My bad, I thought this was 15...


--srini


> regards,
> dan carpenter
> 
>>   		/* do not continue if the status is Not Present  */
>>   		if (!ctrl->status[i])
>>   			continue;
>> -- 
>> 2.25.1
