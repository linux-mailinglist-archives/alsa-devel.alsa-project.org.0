Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A57C56B503
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 11:03:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12263161F;
	Fri,  8 Jul 2022 11:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12263161F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657270990;
	bh=0D0e19JoUZEll6KRrz+//ob/M3GI0OTGNNN9fBt6w7s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ijcufI/u2UaIrGjwLT/QarXyNpIUplf0FsjzFsDj0eD6F3V2InKEoiX9zOyd7Ixyj
	 s1Sb43Ml4YUdvGC/qigCsqfVYwyFTkomqO4O34z6CTFMlNeuijLuVYl5DA5OFlewJ0
	 OgPCYWIPSGTO10kymg5tW1A0GglRg3a+av8KlgLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F220F8025B;
	Fri,  8 Jul 2022 11:02:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B327F80084; Fri,  8 Jul 2022 11:02:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EA14F80084
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 11:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EA14F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hnOBmA99"
Received: by mail-wr1-x42c.google.com with SMTP id z12so20020738wrq.7
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 02:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GODW9lyTgpfg9eTkIPBh2I3pr9WtGGsDfyAVcDz3gMU=;
 b=hnOBmA99uf3xyegN08L/BDTiTTsrUt4WXdlw65mIS1lMd84QUn3xZCHlEVPsEoA3SO
 mLONpqxtDeLNN2TqL9pqjxgPjSANq9kWyXZ588/+4/FgYa9B30NBobYEpPPGVz6TUY4H
 Us+X4/p5DrFj0nq1bz2pLO7PNQCMaf7tRccCbpd+Yw/xLJOACAyCXxDJpNlNZp2Q9Iea
 9mKr024lBE9S7eVhetn6PwQMTCorrQFolH6GS0DztvPiWeQSGU6gZg7LPBGWTGF3cmJl
 vv+N45y+wvf0tPjzu67olRc6mS3qqv4xMbL0GnKif1DiXJuIvs4FFORk1ZC+MskN61ao
 Nq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GODW9lyTgpfg9eTkIPBh2I3pr9WtGGsDfyAVcDz3gMU=;
 b=KhN8kBd3kf9shyFH1prHKryjWJIg62gGLUisJ1k1m5z2rnhgcGDn0OhAXDJx4qVE40
 nVtDfBKCyjT0LgSQzE9YUZ3DfL0faBjNSLgmwhXe+HQ4Eq6gKnO/ebeB6OKyDZLTpfEI
 f2figkBS2wlW5rQISLsc7KzMLQBmQLai8d2TpIbpEnFQvY5ZFVWFeZyMLjQPbvVWLVn7
 2xQ5NTSF/FbmydNGZJ19YBzRtatV34TdfmdZZypy9Ys7WobpxLVUL7I/OPd6mWoC6REn
 AsSEoVz+fovndKhbcR6izH3uZm6blW8XxnMXQUoVIAKEpnk6bIO/Qc3PtxJ14boRp0Wj
 4QXg==
X-Gm-Message-State: AJIora+35OlwBLM2DI7ljG82hk/00/C8lF4BXUN4sfIo+2QQn/r2RbZ3
 WPMlNw03taQrba1dV8tHdSsRug==
X-Google-Smtp-Source: AGRyM1twnWseD7eMfZ83S3p+n3aDmBTuthR0gYE8R5CVmU6OL8ElnucPYwnomLt/JopS1gt2O/eqFQ==
X-Received: by 2002:a05:6000:1847:b0:21b:eda7:e0fc with SMTP id
 c7-20020a056000184700b0021beda7e0fcmr2123711wri.664.1657270921919; 
 Fri, 08 Jul 2022 02:02:01 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 t9-20020adfeb89000000b0021d887f9468sm3173727wrn.25.2022.07.08.02.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 02:02:00 -0700 (PDT)
Message-ID: <ff3c59c4-9af4-f5c8-0804-61a4583e5fab@linaro.org>
Date: Fri, 8 Jul 2022 10:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [bug report] soundwire: qcom: Check device status before reading
 devid
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <Ysfl7lzEyRVuQ+Dg@kili>
 <747099de-504a-daed-6d45-34bf0e379562@linaro.org>
 <20220708084555.GJ2316@kadam>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220708084555.GJ2316@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 08/07/2022 09:45, Dan Carpenter wrote:
> On Fri, Jul 08, 2022 at 09:31:31AM +0100, Srinivas Kandagatla wrote:
>> Hi Dan,
>>
>> On 08/07/2022 09:08, Dan Carpenter wrote:
>>> Hello Srinivas Kandagatla,
>>>
>>> The patch aa1262ca6695: "soundwire: qcom: Check device status before
>>> reading devid" from Jul 6, 2022, leads to the following Smatch static
>>> checker warning:
>>>
>>> 	drivers/soundwire/qcom.c:484 qcom_swrm_enumerate()
>>> 	error: buffer overflow 'ctrl->status' 11 <= 11
>>>
>>> drivers/soundwire/qcom.c
>>>       471 static int qcom_swrm_enumerate(struct sdw_bus *bus)
>>>       472 {
>>>       473         struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
>>>       474         struct sdw_slave *slave, *_s;
>>>       475         struct sdw_slave_id id;
>>>       476         u32 val1, val2;
>>>       477         bool found;
>>>       478         u64 addr;
>>>       479         int i;
>>>       480         char *buf1 = (char *)&val1, *buf2 = (char *)&val2;
>>>       481
>>>       482         for (i = 1; i <= SDW_MAX_DEVICES; i++) {
>>>                        ^^^^^
>>> This a loop that starts from 1 instead of 0.  I looked at the
>>> surrounding context and it seems like it should be a normal loop that
>>> starts at 0 and goes to < SDW_MAX_DEVICES.
>>>
>>
>> In SoundWire world device id 0 is special one and used for enumerating the
>> SoundWire devices.
>>
>> Only addresses from 1-11 are valid devids that can be assigned to devices by
>> the host/controller.
>>
>> This part of the code is reading the devids assigned by the hw
>> auto-enumeration, So the loop start from 1 is correct here.
>>
>>
>>> (Or possibly the other loops are buggy as well).
>>
>> Atleast this code is fine, but I see other places where are starting from 0
>> which could be fixed but the SoundWire core will ignore the status for devid
>> 0.
> 
> This code is *not* fine either because it should be < instead of <=.
> 
> It might be that we always hit a zero first and break so the bug might
> not affect users but it's still wrong.

I agree, Let me send a fix or send a v2.

--srini
> 
> regards,
> dan carpenter
> 
