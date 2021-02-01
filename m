Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 397B730ABFE
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 16:53:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFEA11773;
	Mon,  1 Feb 2021 16:52:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFEA11773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612194810;
	bh=ZI377EK6DOpynicNiTZQgBdmCPHx328dlCMloZf6dF4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nLwfNO9QwFgwQ1Fzv7XDr6JQaYC3WVIWnv+PkrxeNrAVQXdkShTyvgO/G5Ni75RQ5
	 yYg8ougee03nRPUYIaKMlcclnQQWvU0duGnPP054EfGvlS+SMREbseEjOxuG6WXRLE
	 k62inHUqAADdKj98Ii6P8t2N8HNUTdQ91bdUqiPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69CEFF80264;
	Mon,  1 Feb 2021 16:50:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23989F8025D; Mon,  1 Feb 2021 16:50:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E60FF8023C
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 16:50:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E60FF8023C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="iVwe12+w"
Received: by mail-wr1-x430.google.com with SMTP id v15so17139839wrx.4
 for <alsa-devel@alsa-project.org>; Mon, 01 Feb 2021 07:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kUbSt0j2uNzzROn36a7WfkVYptDQ/uSsFU0bvcjSRt4=;
 b=iVwe12+w6d+TvGIK6PdqeM5/IyY+6TdYFfcg6cIsXVAhkvpXl5+Vn4uzAMd7IX8Nlf
 xdu7G033xQ8LjtRsbwBv3lo1EYW8z3Ne7aqlIo7+5n2t0jwUbvEsto+hKaB+tCyz5L6S
 WKA2BDkp0ubXCcUeq80dxk1/D4eRptxa1bXXYS/n89duMIxegfiMyLZd+bLPUHLyDQxE
 n3E9u9VxII8nWJdj3HhIjjelD3TcNitolmNo7ll5I7Nz7M+onDV7HV+GXtF/9kQjthDg
 Gi8IfWk+J1KpzO/lQM/BRK4givkrcJmbFiTCOQvbC7ks/rdyG4XaUBIMXeijMN9weWcq
 35yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kUbSt0j2uNzzROn36a7WfkVYptDQ/uSsFU0bvcjSRt4=;
 b=hR5hCYBICZK7XlAuDvDaWO5sOtUxTnGEs9UK4uw2yVBQ3MPqWm+cjdxPfc5Co82Bfx
 sNZwcfOIJGYl3szL5j5ycz2M2TvaCGsedi/XH6w0B2jTXj2523r8Pw9Nlf0sPGY2DMYF
 F/dUvamTXLBCIgKsog83yzogjoRKdV1MrNX60IjVJEMGg2vS9VQVut5TM/5AaOkGZ4dz
 lcCPi67UaBLwhvAedoBtlOsYTGQ3JIKqs+vtMSGP8kWEQiMQn2f7EzzY2ZRCSSbjLOC9
 zDT7ZKClxhfslNqbQvoDnw0cgF9+45i6scbnyd8Wjl/GW0TYnsJe6+dFchTarSSwfLWV
 RQzQ==
X-Gm-Message-State: AOAM530+IctMkVQeXDm/q5jBVZv5PvKJDSlSWKla67Zkg7ytDbW+6T6L
 xtTGAu61zV9YcajwacSnXskpQ6u83mjjdw==
X-Google-Smtp-Source: ABdhPJzDgzhQ6fs0p2Eb2FufY9C7QaoAJX+/hVppqdwV2uli4Jwr9tU0w32Jgf+dv/0c5OePuLHjkg==
X-Received: by 2002:a05:6000:1372:: with SMTP id
 q18mr18592228wrz.280.1612194645863; 
 Mon, 01 Feb 2021 07:50:45 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id y6sm27196771wrp.6.2021.02.01.07.50.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 07:50:45 -0800 (PST)
Subject: Re: [PATCH 5/6] soundwire: qcom: update register read/write routine
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-6-srinivas.kandagatla@linaro.org>
 <5c69ed09-60be-2f3d-ed25-f6dbfcb9d62f@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3a2b5c2d-21aa-2bf5-62df-ef85c7c9293c@linaro.org>
Date: Mon, 1 Feb 2021 15:50:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5c69ed09-60be-2f3d-ed25-f6dbfcb9d62f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
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



On 29/01/2021 19:33, Pierre-Louis Bossart wrote:
> 
> 
> On 1/29/21 11:32 AM, Srinivas Kandagatla wrote:
>> In the existing code every soundwire register read and register write
>> are kinda blocked. Each of these are using a special command id that
> 
> what does 'kinda blocked' mean?

I meant read/writes are waiting for completion interrupt!

> 
>> generates interrupt after it successfully finishes. This is really
>> overhead, limiting and not really necessary unless we are doing
>> something special.
>>
>> We can simply read/write the fifo that should also give exactly
>> what we need! This will also allow to read/write registers in
>> interrupt context, which was not possible with the special
>> command approach.
> 
> This is really unclear, sorry.

If read/writes are waiting for an interrupt, it becomes difficult to 
read or write to any registers from same interrupt handler!


> 
>> +    if (id != SWR_BROADCAST_CMD_ID) {
>> +        if (id < 14)
>> +            id += 1;
>> +        else
>> +            id = 0;
> 
> that is really odd. if id=13 (group2) then id becomes 14 (master 
> address). A comment is really needed here.

This is magic value for each fifo read or write, so that we can verify 
that them by comparing with this magic value!

This has nothing to do with device number!

> 
>> +    if (cmd_id == SWR_BROADCAST_CMD_ID) {
>> +        /*
>> +         * sleep for 10ms for MSM soundwire variant to allow broadcast
>> +         * command to complete.
> 
> that's also super-odd. There is nothing in SoundWire that makes any 
> difference between a regular and a broadcast command. they all complete 
> in the same time (a frame).
>> +         */
>> +        ret = wait_for_completion_timeout(&swrm->broadcast, (2 * 
>> HZ/10));
> 
> is this 10ms really or dependent on CONFIG_HZ?
> 
>> +        if (!ret)
>> +            ret = SDW_CMD_IGNORED;
>> +        else
>> +            ret = SDW_CMD_OK;
> 
> no CMD_FAILED support?

Qcom controllers does not provide that information if the command is 
ignored or failed by any means!

That was the behavior from the starting of this driver.

> 
>> +static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *swrm,
>> +                     u8 dev_addr, u16 reg_addr,
>> +                     u32 len, u8 *rval)
>> +{
>> +    u32 val;
>> +    u32 retry_attempt = 0;
>> +    u32 cmd_data;
>> +    int ret = SDW_CMD_OK;
>> +
>> +    mutex_lock(&swrm->io_lock);
>> +    val = swrm_get_packed_reg_val(&swrm->rcmd_id, len, dev_addr, 
>> reg_addr);
>> +
>> +    /* wait for FIFO RD to complete to avoid overflow */
>> +    usleep_range(100, 105);
>> +    swrm->reg_write(swrm, SWRM_CMD_FIFO_RD_CMD, val);
>> +    /* wait for FIFO RD CMD complete to avoid overflow */
>> +    usleep_range(250, 255);
>> +
>> +retry_read:
>> +
>> +    swrm->reg_read(swrm, SWRM_CMD_FIFO_RD_FIFO_ADDR, &cmd_data);
>> +    rval[0] = cmd_data & 0xFF;
>> +
>> +    if ((((cmd_data) & 0xF00) >> 8) != swrm->rcmd_id) {
>> +        if (retry_attempt < MAX_FIFO_RD_FAIL_RETRY) {
>> +            /* wait 500 us before retry on fifo read failure */
>> +            usleep_range(500, 505);
>> +            if (retry_attempt == (MAX_FIFO_RD_FAIL_RETRY - 1)) {
>> +                swrm->reg_write(swrm, SWRM_CMD_FIFO_CMD, 0x1);
>> +                swrm->reg_write(swrm, SWRM_CMD_FIFO_RD_CMD, val);
>> +            }
>> +            retry_attempt++;
>> +            goto retry_read;
>> +        } else {
>> +            dev_err(swrm->dev,
>> +                    "failed to read fifo: reg: 0x%x, \
>> +                    rcmd_id: 0x%x, dev_num: 0x%x, cmd_data: 0x%x\n",
>> +                    reg_addr, swrm->rcmd_id,
>> +                    dev_addr, cmd_data);
>> +            ret = SDW_CMD_IGNORED;
>> +        }
>>       }
> 
> the flow seems complicated with multiple tests and goto? Can this be 
> simplified?

I will try to simplify this in next version!
