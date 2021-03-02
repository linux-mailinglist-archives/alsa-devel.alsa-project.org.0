Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DFA329A75
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 11:35:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8E1016FE;
	Tue,  2 Mar 2021 11:34:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8E1016FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614681327;
	bh=YypAauVjDyMKn49QGUNQ6+ufupq7BwojESjW72x8LsE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CjVmX9iyL96YjpPEOYHuBnAlX4LQW4iz0sd9fhNiLp09J4w4Q9heqfFFVWcOcFsG2
	 HewVEj/n7UEHamHRIhejj+b8qUgnwWeKJ3dQgRwxCRD/pX8GilQ9o+2XJpzotiVtHB
	 V0jtwb4byBRVlQ2SwTdqMySsw3rxDeCLxKRwhBWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5976CF80273;
	Tue,  2 Mar 2021 11:33:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92A95F80271; Tue,  2 Mar 2021 11:33:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF0CDF80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 11:33:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF0CDF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Bx4EvO9y"
Received: by mail-wm1-x32e.google.com with SMTP id o2so1640953wme.5
 for <alsa-devel@alsa-project.org>; Tue, 02 Mar 2021 02:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nX3UoFuzzMNsB4lVrgERxVlh7s23WyI/5O5RtFPy6nY=;
 b=Bx4EvO9yQep9GrdueyHB8c/d21a2QkGhq+izz7ECyhwS09IazDO/FtVyuiTsYCYQZ3
 d5+k4HK7ksKMKdFIKABfnG9RuMvF5SsTE+uu4jh3dEgLg/iY3hHSoEeJHQrfr4Cfc7NO
 KQ3+kDt/KfA8fUQy7yVZeMwUAWM8oKdLKxSvT9q66k4nVuDmf50gRCT7klR48uBycMM2
 AwoivxYTqzXP0sxmGWVkrJMifNxclOVabZL9NzP6dm5FLqFyF2PNhrSt1CijoNVnIiOI
 rh3dNuzJwruEp/zBANsQyoTPeLAYiPRJBwDZ/2F3kt6DX/OHHWEvjV4nTUrUL2iTnF0A
 2CEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nX3UoFuzzMNsB4lVrgERxVlh7s23WyI/5O5RtFPy6nY=;
 b=gTpMl6AyP0LiWY3Ehn9OOLFe4xF5ufhgscsUy0TNuOWeM1K1ecbtfLWOW3q02m1wHj
 HZlTpNqWumih/6LwOfMZpujIigxk2Y0WQ23UpyaEi2oOwgJjMn58e1YbLxAqx9CHD4HU
 UEUwex6Iw35aGR+3saj82jkdoPvvniAhCKYXiiHz3NywTq9rLUkM1PA6sX9W+EWeVnno
 kChyul/aK4I4x3xVkqEm3wFAWAqyNU47VbgDLoxX3JdvqIqz81CP2zCvmokDIqVpe2nn
 ANbd+S/ez+pMOI2Uc2IYtJbF3U5ojjolkIDLHQEkYZT4rEwUCxQTd9Ml2UPJC+99qxxX
 iAkg==
X-Gm-Message-State: AOAM532QLCN8Bhyr7fPx9v/hhk9EDu0EBqOjuHSNi/axfyhcvuXV02IW
 Trs/ENqdowzC52pXv0hNlhDagI/Xq91qTg==
X-Google-Smtp-Source: ABdhPJx2rSIdbee/+K/KsslLjff4yaAjKlMBXCVceuCurYAl4gZVBdQy58OhHGQTBtHZYRyb4gXZpA==
X-Received: by 2002:a1c:195:: with SMTP id 143mr3306604wmb.147.1614681230475; 
 Tue, 02 Mar 2021 02:33:50 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id j26sm20997516wrh.57.2021.03.02.02.33.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Mar 2021 02:33:49 -0800 (PST)
Subject: Re: [PATCH 2/3] soundwire: qcom: add auto enumeration support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20210226170250.9067-1-srinivas.kandagatla@linaro.org>
 <20210226170250.9067-3-srinivas.kandagatla@linaro.org>
 <0c551b23-7ed4-59d7-72c2-284bdf8584f1@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4721dd27-c8ce-f988-3c10-794841390656@linaro.org>
Date: Tue, 2 Mar 2021 10:33:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0c551b23-7ed4-59d7-72c2-284bdf8584f1@linux.intel.com>
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



On 26/02/2021 17:44, Pierre-Louis Bossart wrote:
> 
>> +static int qcom_swrm_enumerate(struct sdw_bus *bus)
>> +{
>> +    struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
>> +    struct sdw_slave *slave, *_s;
>> +    struct sdw_slave_id id;
>> +    u32 val1, val2;
>> +    u64 addr;
>> +    int i;
>> +    char *buf1 = (char *)&val1, *buf2 = (char *)&val2;
>> +
>> +    for (i = 1; i < (SDW_MAX_DEVICES + 1); i++) {
> 
> I don't understand the (SDW_MAX_DEVICES + 1)?
If you mean +1 then probably we can add <= instead of just < to make it 
look like other parts of code in bus.c

for (i = 1; i <= SDW_MAX_DEVICES; i++)

> 
> 
>> +        /*SCP_Devid5 - Devid 4*/
>> +        ctrl->reg_read(ctrl, SWRM_ENUMERATOR_SLAVE_DEV_ID_1(i), &val1);
>> +
>> +        /*SCP_Devid3 - DevId 2 Devid 1 Devid 0*/
>> +        ctrl->reg_read(ctrl, SWRM_ENUMERATOR_SLAVE_DEV_ID_2(i), &val2);
> 
> Do you mind explaining a bit what happens here?
> Does the hardware issue commands to read all DevID registers and set the 
> device number automagically?

exactly the hardware assigns device numbers to slaves automatically, and 
the devnum can be figured out by the controller driver by reading 
SWRM_ENUMERATOR_SLAVE_DEV_ID_1/2 registers!

> If yes, then in SoundWire parlance the enumeration is complete. What you 
> are doing below is no longer part of the enumeration.

yes, enumeration is complete by the hardware, however the controller 
driver need to know the dev number assigned by the hardware, this 
routine is doing that!
> 
> 
>> +
>> +        if (!val1 && !val2)
>> +            break;
>> +
>> +        addr = buf2[1] | (buf2[0] << 8) | (buf1[3] << 16) |
>> +            ((u64)buf1[2] << 24) | ((u64)buf1[1] << 32) |
>> +            ((u64)buf1[0] << 40);
>> +
>> +        sdw_extract_slave_id(bus, addr, &id);
>> +        /* Now compare with entries */
>> +        list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
>> +            if (sdw_compare_devid(slave, id) == 0) {
>> +                u32 status = qcom_swrm_get_n_device_status(ctrl, i);
>> +                if (status == SDW_SLAVE_ATTACHED) {
>> +                    slave->dev_num = i;
>> +                    mutex_lock(&bus->bus_lock);
>> +                    set_bit(i, bus->assigned);
>> +                    mutex_unlock(&bus->bus_lock);
>> +
>> +                }
> 
> And that part is strange as well. The bus->assigned bit should be set 
> even if the Slave is not in the list provided by platform firmware. It's 
> really tracking the state of the hardware, and it should not be 
> influenced by what software knows to manage.

Am not 100% sure If I understand the concern here, but In normal (non 
auto enum) cases this bit is set by the bus code while its doing 
enumeration to assign a dev number from the assigned bitmap!

However in this case where auto enumeration happens it makes sense to 
set this here with matching dev number!

AFAIU from code, each bit in this bitmap corresponds to slave dev number!


> 
>> +                break;
>> +            }
>> +        }
>> +    }
>> +
>> +    complete(&ctrl->enumeration);
> 
> you have init_completion() and complete() in this patch, but no 
> wait_for_completion(), so that should be added in a later patch, no?

make sense, will move that to other patch!

--srini
> 
>> +    return 0;
>> +}
>> +
>>   static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>>   {
>>       struct qcom_swrm_ctrl *swrm = dev_id;
>> -    u32 value, intr_sts, intr_sts_masked;
>> +    u32 value, intr_sts, intr_sts_masked, slave_status;
>>       u32 i;
>>       u8 devnum = 0;
>>       int ret = IRQ_HANDLED;
>> @@ -382,10 +443,19 @@ static irqreturn_t qcom_swrm_irq_handler(int 
>> irq, void *dev_id)
>>                   break;
>>               case SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED:
>>               case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
>> -                dev_err_ratelimited(swrm->dev, "%s: SWR new slave 
>> attached\n",
>> +                dev_err_ratelimited(swrm->dev, "%s: SWR slave status 
>> changed\n",
>>                       __func__);
>> -                qcom_swrm_get_device_status(swrm);
>> -                sdw_handle_slave_status(&swrm->bus, swrm->status);
>> +                swrm->reg_read(swrm, SWRM_MCP_SLV_STATUS, 
>> &slave_status);
>> +                if (swrm->slave_status == slave_status) {
>> +                    dev_err(swrm->dev, "Slave status not changed %x\n",
>> +                        slave_status);
>> +                    break;
>> +                } else {
>> +                    dev_err(swrm->dev, "Slave status handle %x\n", 
>> slave_status);
>> +                    qcom_swrm_get_device_status(swrm);
>> +                    qcom_swrm_enumerate(&swrm->bus);
>> +                    sdw_handle_slave_status(&swrm->bus, swrm->status);
>> +                }
>>                   break;
>>               case SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET:
>>                   dev_err_ratelimited(swrm->dev,
>> @@ -472,8 +542,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl 
>> *ctrl)
>>       ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>> -    /* Disable Auto enumeration */
>> -    ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 0);
>> +    /* Enable Auto enumeration */
>> +    ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 1);
>>       ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
>>       /* Mask soundwire interrupts */
>> @@ -507,6 +577,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl 
>> *ctrl)
>>           ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN,
>>                   SWRM_INTERRUPT_STATUS_RMSK);
>>       }
>> +    ctrl->slave_status = 0;
>>       return 0;
>>   }
>> @@ -1068,6 +1139,7 @@ static int qcom_swrm_probe(struct 
>> platform_device *pdev)
>>       dev_set_drvdata(&pdev->dev, ctrl);
>>       mutex_init(&ctrl->port_lock);
>>       init_completion(&ctrl->broadcast);
>> +    init_completion(&ctrl->enumeration);
>>       ctrl->bus.ops = &qcom_swrm_ops;
>>       ctrl->bus.port_ops = &qcom_swrm_port_ops;
>>
