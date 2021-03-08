Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05713331334
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 17:17:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F05B192C;
	Mon,  8 Mar 2021 17:17:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F05B192C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615220270;
	bh=Hf55fkCww1Btslpb4csEw76QDlJxLHAO9j5RJ5HekjM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tn1sSyV5/IHmKet8cwfOYUMRGDJ9dm3wKy6G9kztqIkZnLaA8FNUzgY/6xx3kOr4V
	 u2DqidQEwSnbb25AtZLG7nbKE62XBfHge7wKYGVMfnPrTOwgB9eNUmGImFHhN3ceuy
	 +/fqy7CH8X7/g5a6NF92PIMSoyCa8tGns5XvcI6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FD61F80139;
	Mon,  8 Mar 2021 17:16:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84A46F801D8; Mon,  8 Mar 2021 17:16:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D69EFF80139
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 17:16:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D69EFF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Nff/mQrl"
Received: by mail-wm1-x32e.google.com with SMTP id w7so6390819wmb.5
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 08:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dUhsdpgyKbkw4pWWzlPQlJO0EnmBV3jJKURQm4/QkFA=;
 b=Nff/mQrlyV5ROAurVkLSqXKFuMVDszocw7rDWhPBnR1Ok/wDmBLCS7nSDiGVDCozIp
 80abNeWluZ3qJunraTaWeTDrTS6QZ55A1JrT+eOXxLY/VB8r0lVPL4S2vI9JqXfUw0Qg
 jb+a3xx6pBIAaJX274bWbRkLGTLpBwGJCgCj/mU7Jh1LVVmhvZbA1Yfo5a594wVROqUF
 cbvNKf6TSIj9Cebzvjd+bnKKtgJfjwRW4lwN84X4C8ewFjkxdJsneCURVdlOu38mHCCF
 LGW4Eqinvni1b7sguCO8y/yy0KD8f0vs5HY7l6zV1f0csCm/Z6QNTZIXx80Spfy2uVhK
 r2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dUhsdpgyKbkw4pWWzlPQlJO0EnmBV3jJKURQm4/QkFA=;
 b=IJQpFPCeendYQGrTx9sasNbY6PqI4ZwUzAswqKQyxaXzm9z790rUZUqxYvKji0YUD0
 OvRzUaRkWH9o/4j5r3nYFX8i4S3JNGFFsOSMyqndOthd5YlHo9G/wWGRiYluC88J2yWt
 EqWHDAMTDzpKbmrQxJp8U7gATm1qNW+Ka44TEH3bQ+xMYC7ASQgbCsrPYiKC/TU9VyYl
 e+SiX1lnihJPI98roLD3D0Vb81e8/VaNOuE2yFv6Kt0gGfyQmi5Zl1kDDoVX/6iPdp72
 B5O4dMRZRisUkQvFm5BRJ3XlYROgaZgKnWxMdOoEKZ7qchrjThH+bdIZltXEjhn2lraY
 RuJA==
X-Gm-Message-State: AOAM531UZiaeX4w2mE2LC7UMF5jG20ExkNPJp2e9tC2P4z5n+rkXIig8
 N7zTqIwaWlc+OgnDsPMuXnB8ApsZdbuijA==
X-Google-Smtp-Source: ABdhPJx+IiBiziHQQ87PcUBmZFUJZZod0kR9YdAx8gqEn3DHUhj10eGtKcUpB9mxBAwo+eSgd3bZaQ==
X-Received: by 2002:a1c:c282:: with SMTP id s124mr22525795wmf.99.1615220172820; 
 Mon, 08 Mar 2021 08:16:12 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id n6sm20123107wmd.27.2021.03.08.08.16.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Mar 2021 08:16:12 -0800 (PST)
Subject: Re: [PATCH v3 8/9] soundwire: qcom: add auto enumeration support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20210308134957.16024-1-srinivas.kandagatla@linaro.org>
 <20210308134957.16024-9-srinivas.kandagatla@linaro.org>
 <ab00438b-dbb9-e6c6-019a-d50494e5dee1@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6050461e-5594-6272-e0ef-2ebdc271d809@linaro.org>
Date: Mon, 8 Mar 2021 16:16:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ab00438b-dbb9-e6c6-019a-d50494e5dee1@linux.intel.com>
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



On 08/03/2021 15:56, Pierre-Louis Bossart wrote:
> 
>> +static int qcom_swrm_enumerate(struct sdw_bus *bus)
>> +{
>> +    struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
>> +    struct sdw_slave *slave, *_s;
>> +    struct sdw_slave_id id;
>> +    u32 val1, val2;
>> +    bool found;
>> +    u64 addr;
>> +    int i;
>> +    char *buf1 = (char *)&val1, *buf2 = (char *)&val2;
>> +
>> +    for (i = 1; i <= SDW_MAX_DEVICES; i++) {
>> +        /*SCP_Devid5 - Devid 4*/
>> +        ctrl->reg_read(ctrl, SWRM_ENUMERATOR_SLAVE_DEV_ID_1(i), &val1);
>> +
>> +        /*SCP_Devid3 - DevId 2 Devid 1 Devid 0*/
>> +        ctrl->reg_read(ctrl, SWRM_ENUMERATOR_SLAVE_DEV_ID_2(i), &val2);
>> +
>> +        if (!val1 && !val2)
>> +            break;
>> +
>> +        addr = buf2[1] | (buf2[0] << 8) | (buf1[3] << 16) |
>> +            ((u64)buf1[2] << 24) | ((u64)buf1[1] << 32) |
>> +            ((u64)buf1[0] << 40);
>> +
>> +        sdw_extract_slave_id(bus, addr, &id);
>> +        found = false;
>> +        /* Now compare with entries */
>> +        list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
>> +            if (sdw_compare_devid(slave, id) == 0) {
>> +                u32 status = qcom_swrm_get_n_device_status(ctrl, i);
>> +
>> +                found = true;
>> +                if (status == SDW_SLAVE_ATTACHED) {
>> +                    slave->dev_num = i;
>> +                    mutex_lock(&bus->bus_lock);
>> +                    set_bit(i, bus->assigned);
>> +                    mutex_unlock(&bus->bus_lock);
>> +
>> +                }
> 
> you haven't changed that part, if the device is not in DT we should 
> still set bus->assigned::i

My bad! I missed it again!

Will fix it in next spin!


--srini
