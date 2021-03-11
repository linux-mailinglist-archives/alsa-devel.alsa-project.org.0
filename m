Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA63375B3
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 15:30:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 083D91884;
	Thu, 11 Mar 2021 15:29:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 083D91884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615473017;
	bh=+oWjS3V8isrh9LPwAJSj1Aa53CPXFRTeoi+gtU1roxA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oxQhzRlXuzFP0iHSXox0MU9lkjkMWyr+OSGvS2gGEytrFJ6g+KebKvd9gE4sdHz6V
	 PdZrXfht38XjsXQPReXlTmwUbUnERAzhOzTcSP5uV6dwAQ833RBPykFubcuSDyDOFA
	 naC2uFEngzmLzEJjH8KW+0nCFvVD9IcZ0m76WR/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BBFCF80276;
	Thu, 11 Mar 2021 15:29:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 972EFF80276; Thu, 11 Mar 2021 15:29:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C4BFF8019B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 15:29:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C4BFF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="d7z3RFx3"
Received: by mail-wr1-x42d.google.com with SMTP id b18so2092255wrn.6
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zz2dzqsYyuv4TG4XCyNaaaDqLyEogy9K3vM+/DJNeRQ=;
 b=d7z3RFx3RJumtimxNkd0yjwUe21UkXeHpFlxmEyXTAGKRy8ycK2VCXbqQA+jrutbDR
 b9My3exvIlqKO1M7XfqrxvZdzlTAOKAxP45TYmhKugVNSXIu7teyiLvNF4J/uTXsB4BG
 ODBmTzmqv4b5xrlvpKFlyW7ebtsA0Ufz455EUTtP7D+cyoCX9SLWYkUET6zpB3NQJS6T
 W2oucydzmeIzYj0DMRjc6gL/2cpDNrubM6XrmUlcGGE2BIubzxflDF/dthhJQqurHnjh
 KWUApFL2tn7JBY7qYcuUZWD1270CDg3VMdmJvaQ3e0pKkKmvl+S5jdU5PTanMz5EIIat
 Okhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zz2dzqsYyuv4TG4XCyNaaaDqLyEogy9K3vM+/DJNeRQ=;
 b=jkH3kSc6/EBesTi9DCIDhkxs900KgUO0lo16ce6wMLYfREyVBsSZmobXPhaYRGWgGJ
 k1NbvDVsyaDfPBcdYA9lZWAoeFVJbBojJI0BINuCGIrExg7EQ8YK5DdacYwfZoL4S+km
 HZx8wZPc36Z12vE+huHlI8g3f5oZ9hZ638RQHggk4PF0zjcnZsKcBc/tVihXScMA2LL6
 900HYdefRURsdRHsuMinWWmkuEX2tIVPCPtQqmTu5Bx1FVzP8nrPkGQxCNuTl6S4PdJN
 V2Pf6P1hFgVyUQjf7V9k5jreOg8SOEm5CAMXkRRsRRpCh/ErWHJ6QdL9yNDIFJyTy3sb
 XYzA==
X-Gm-Message-State: AOAM532Wix+lYIa2n1hSrjDKrJCK13GOAVxObR/9QaWcwx/DJFzM7E36
 f6/78oETVFhutansV9tA7AYw/fdhf60m3w==
X-Google-Smtp-Source: ABdhPJzzQG2F9CZpV0ycA0fwL9GxCT0yySRfeLze4eWRwL+TtvM0nFwZG2SdHshnogSGL/UvJfWsGQ==
X-Received: by 2002:a5d:56d0:: with SMTP id m16mr8966893wrw.355.1615472955686; 
 Thu, 11 Mar 2021 06:29:15 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id h20sm3764829wmp.38.2021.03.11.06.29.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Mar 2021 06:29:15 -0800 (PST)
Subject: Re: [PATCH v2 3/5] soundwire: qcom: add static port map support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, vkoul@kernel.org
References: <20210309141514.24744-1-srinivas.kandagatla@linaro.org>
 <20210309141514.24744-4-srinivas.kandagatla@linaro.org>
 <cc812a5b-c3c3-bb46-f2fe-3e0a14cf0524@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <508f875f-6fed-9bfc-5f3e-297e4c21ec29@linaro.org>
Date: Thu, 11 Mar 2021 14:29:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cc812a5b-c3c3-bb46-f2fe-3e0a14cf0524@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, sanyog.r.kale@intel.com,
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



On 09/03/2021 16:10, Pierre-Louis Bossart wrote:
> 
> 
> 
>>       list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
>> @@ -473,8 +475,13 @@ static int qcom_swrm_compute_params(struct 
>> sdw_bus *bus)
>>           }
>>           list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
>> +            slave = s_rt->slave;
>>               list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
>> -                pcfg = &ctrl->pconfig[i];
>> +                m_port = slave->m_port_map[_rtp->num - 1];
>> +                if (m_port)
>> +                    pcfg = &ctrl->pconfig[m_port - 1];
>> +                else
>> +                    pcfg = &ctrl->pconfig[i];
> 
> Maybe add a short comment on port allocation, I had to think a bit to 
> figure out why the -1 was required on both peripheral and manager but it 
> is not below [1]

I agree, will add some comment here to explain the offsets correctly!

--srini

> 
>>                   p_rt->transport_params.port_num = p_rt->num;
>>                   p_rt->transport_params.sample_interval =
>>                       pcfg->si + 1;
>> @@ -535,8 +542,10 @@ static int qcom_swrm_stream_alloc_ports(struct 
>> qcom_swrm_ctrl *ctrl,
>>       struct sdw_master_runtime *m_rt;
>>       struct sdw_slave_runtime *s_rt;
>>       struct sdw_port_runtime *p_rt;
>> +    struct sdw_slave *slave;
>>       unsigned long *port_mask;
>>       int i, maxport, pn, nports = 0, ret = 0;
>> +    unsigned int m_port;
>>       mutex_lock(&ctrl->port_lock);
>>       list_for_each_entry(m_rt, &stream->master_list, stream_node) {
>> @@ -549,9 +558,15 @@ static int qcom_swrm_stream_alloc_ports(struct 
>> qcom_swrm_ctrl *ctrl,
>>           }
>>           list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
>> +            slave = s_rt->slave;
>>               list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
>> +                m_port = slave->m_port_map[p_rt->num - 1];
>>                   /* Port numbers start from 1 - 14*/
>> -                pn = find_first_zero_bit(port_mask, maxport);
>> +                if (m_port)
>> +                    pn = m_port;
>> +                else
>> +                    pn = find_first_zero_bit(port_mask, maxport);
> 
> [1]
> 
>> +
>>                   if (pn > (maxport)) {
>>                       dev_err(ctrl->dev, "All ports busy\n");
>>                       ret = -EBUSY;
>>
