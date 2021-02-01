Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 949A130ABFD
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 16:53:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A23AF1786;
	Mon,  1 Feb 2021 16:52:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A23AF1786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612194779;
	bh=wFPAaHp6RMYXSrWt2zvqPLVkMQghRErgxBoHhuHNJ3E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PaOakIwbit8e0OtX3d7rpByfjWA2WChjpXoUyQKFpPQepZrgK/0DTKXVBINuRG3rI
	 czp7Phr6TfckpbRidmXaJtoxOkGWgarUnSrN5w/JqG8tLfDD5LPEQVxwdPhPBB7VdH
	 OxuQfhLf1BOxShRNv6bjpXBbmq17DdoM+uBEEH/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1390F80246;
	Mon,  1 Feb 2021 16:50:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09C71F8023C; Mon,  1 Feb 2021 16:50:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CF20F80224
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 16:50:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CF20F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mTKjnoJu"
Received: by mail-wm1-x32e.google.com with SMTP id u14so13037101wml.4
 for <alsa-devel@alsa-project.org>; Mon, 01 Feb 2021 07:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9SQRjueWaKmSSazcBA8yDI55u3K41q7hZM11WC1U8Ik=;
 b=mTKjnoJugjcXR3sKFULi+p9zfv/Th63Paq4Oq+Kkz/A6W6SNSz6miH0NykGwY111Fo
 ht/kLHAf6HpEd2Q8L1TfvUKVAKrmaezO15bKWUS7G6lSBjGeLfm8p5uI3UWssnqO07dc
 u9eFYxco7bWXUulvtxM2HFlgDd/nac0SYOYdZtxb711hhIdLpd5aOXNLyInT93oGx6iL
 382PyA2w5qmbabY27r8GdTDrjm/XjlvQxg1plS0V11joAHd+8IfWI1ndCnRDm89ZqXeW
 t3lVF+Q19zXwTHxFwzYC5bfhVXaO8SQxrXbjROn8Z0cgr2cJTR8DkH3qCeKGWVuEvGZG
 oucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9SQRjueWaKmSSazcBA8yDI55u3K41q7hZM11WC1U8Ik=;
 b=GYiuevD7U0uW2bljXBpfmWMTySa4D6SkJ6v58hH83jjWDsn7ZXajsUXWYucqLlB4ni
 hJdTJxfqLmuQaGCcyrsaejaNPLWojTe6ZDjB7Om+o86+cDVR6njh9KMtU31T7UAlsfod
 Own18PmdR2zdoA0zsub3+sAzFhIBmPqwlm8dC908QPnEsnyjEiQfiNwwRrZ9cuaeDZLS
 Ekvse+eqfwbtRTM/tr4EjxwBkDZRtJU0uOP8j5rpfWS0yPx2i224GPODQizcHXUWXyhe
 7uJ9xCDxx7YaPqfKbE/i3DyzT79HiyC/ROOwHSuEuXAjRjlk+3C6N6uLPMxkHKwZxR1Z
 T/6A==
X-Gm-Message-State: AOAM533QfMM4v8hfvze4bIOK1P0W+RJVtB2HU+Qu3fTN3iWMGxCmmDTz
 jX+azzqNAfbNQ4g4CLHdEadB7Meo60asfw==
X-Google-Smtp-Source: ABdhPJx9ocHG2qdEixxtdblxCEnXXx8oNiCtR+emo6iZ2yc1eaNp7dchIjWPaNrutZ5z2nz9whFZgQ==
X-Received: by 2002:a1c:de54:: with SMTP id v81mr7898989wmg.181.1612194637773; 
 Mon, 01 Feb 2021 07:50:37 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id s23sm5872363wmc.29.2021.02.01.07.50.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 07:50:37 -0800 (PST)
Subject: Re: [PATCH 4/6] soundwire: qcom: start the clock during initialization
To: Vinod Koul <vkoul@kernel.org>
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-5-srinivas.kandagatla@linaro.org>
 <20210201142134.GC2771@vkoul-mobl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <bdedf84c-68fd-767d-8b3b-5a6ba03e03d8@linaro.org>
Date: Mon, 1 Feb 2021 15:50:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210201142134.GC2771@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
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



On 01/02/2021 14:21, Vinod Koul wrote:
> On 29-01-21, 17:32, Srinivas Kandagatla wrote:
>> Start the clock during initialization.
> 
> A detailed log please, which clock..? Also how do older controllers work
> w/o this clk

By default this is ON, however depending on that is not really reliable!

Explicitly enabling this will make things clear when we add clk pause 
feature for this driver!

--srini
> 
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/soundwire/qcom.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 3669bac11a32..83df15d83935 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -47,6 +47,8 @@
>>   #define SWRM_MCP_FRAME_CTRL_BANK_ADDR(m)		(0x101C + 0x40 * (m))
>>   #define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK			GENMASK(2, 0)
>>   #define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK			GENMASK(7, 3)
>> +#define SWRM_MCP_BUS_CTRL					0x1044
>> +#define SWRM_MCP_BUS_CLK_START					BIT(1)
>>   #define SWRM_MCP_CFG_ADDR					0x1048
>>   #define SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK		GENMASK(21, 17)
>>   #define SWRM_DEF_CMD_NO_PINGS					0x1f
>> @@ -345,6 +347,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>>   	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
>>   	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
>>   
>> +	ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
>>   	/* Configure number of retries of a read/write cmd */
>>   	if (ctrl->version_major == 1 && ctrl->version_minor >= 5 &&
>>   	    ctrl->version_step >= 1) {
>> -- 
>> 2.21.0
> 
