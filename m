Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABE2E9E22
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 15:59:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8FEA232F;
	Wed, 30 Oct 2019 15:58:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8FEA232F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572447554;
	bh=6rYe7nWMLWDY/XJcsNvQWaQGvN+jMncBVdkFCdAfCRU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eYNHUB9wktP8Tk1ui8Ztr+cK4JB665Sj2AuCZ4lbnGlkoS+Ih9JNQSZ3u+54aacQJ
	 aYAiEF9nCpf0J9tGgmYT98ZPOMpiLqXCdApVy65tsBOpt7uwvq0DS6qaudMQs4ddjO
	 TaoPa8txbSFiRe+i+aRMsfjY63m1OMjwTDMWJJgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1791F805AE;
	Wed, 30 Oct 2019 15:56:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 988DBF80361; Wed, 30 Oct 2019 15:56:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A94FF8015A
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 15:56:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A94FF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="W3gbXEvu"
Received: by mail-wr1-x444.google.com with SMTP id a11so2653055wra.6
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 07:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3KGaDNuZOqaW+oq9eCygfM069fZ/a2Mqyl7Of0Yf3Bk=;
 b=W3gbXEvu5iu+v3Sxxu1RVFPekMr8X8F8JzwignYx4p0KZkG+YP9eZd1wnj1TxbgO6W
 89sUUPKqCOeUlBJyiMxzKo1T2VxdYaaB/9mvCtJUBKg6nfKXG866CRoT9kPFz/dKq63G
 vIGbZi4dC7QPg6QlVN1ZNSTW2qVYK+tmJHP1QfUFHfcloXf7RwIFFfrBODzE3rVy3Yk4
 LZYG0txO706XP16RwRLHhfX+a+CoZ30rTJndNx+YgErlj3hiQVOnjPw6kQvJzH1mCauE
 +NKqegFjdYqIo+X1UldYjNNnwl+mpUFiKwyoeP2qqOBU2EksImdTj08e+BmgjXA63eeX
 Fwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3KGaDNuZOqaW+oq9eCygfM069fZ/a2Mqyl7Of0Yf3Bk=;
 b=KJWU6U5LXDctafhC34cVb8iv2jYKA+EIBczdmgEEV3u3kR8ld2LVZuvaf34tsemhH5
 ryTVTqi8IKKLMNPCkbbxeEEGoQr7V2gak4M1aDQ4cD0hpSAuCYKT41zMBZNz+gF0fZR2
 C7cvozO2DDb09ZreQu+tJ61RiVNZjs9ShszA7iA9xJ+eB1BAMkpNnlq62t32Lebc1Qk7
 OJqeibb/P0WeKSMhB5JFjxTgNI4PVS0f0Ab+bioteU8SsH5nVTMP8px6D+encDHiWm6z
 PmeRnx2TdZrTg+HYuuqwuSqWh+AmCzxOVmnFz9oMg42oC1wlh/r0piw0proDkGsgpLdP
 vasA==
X-Gm-Message-State: APjAAAUxrwWOd3MwVjXE4OJFICHP1xq/Dmoi8xeTXXOKEbqlzJFKnjH8
 FebCteqCGaWRSe4ukxZlbD+Z9A==
X-Google-Smtp-Source: APXvYqzNEp7v8VF6xzERjzhXpFhkFob5hrJIC4MZV7Tiihtvl6ZSZv8Ub0Haz1Ef1kEUnQ9Tnn0N1w==
X-Received: by 2002:adf:828c:: with SMTP id 12mr274663wrc.40.1572447369376;
 Wed, 30 Oct 2019 07:56:09 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id n11sm272188wmd.26.2019.10.30.07.56.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Oct 2019 07:56:08 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20191011154423.2506-1-srinivas.kandagatla@linaro.org>
 <20191011154423.2506-3-srinivas.kandagatla@linaro.org>
 <20191021044405.GB2654@vkoul-mobl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <17cb6d3f-2317-9667-8642-566a8a88bd4c@linaro.org>
Date: Wed, 30 Oct 2019 14:56:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191021044405.GB2654@vkoul-mobl>
Content-Language: en-US
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v3 2/2] soundwire: qcom: add support for
 SoundWire controller
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 21/10/2019 05:44, Vinod Koul wrote:
> On 11-10-19, 16:44, Srinivas Kandagatla wrote:
> 
>> +static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>> +{
>> +	struct qcom_swrm_ctrl *ctrl = dev_id;
>> +	u32 sts, value;
>> +	unsigned long flags;
>> +
>> +	ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS, &sts);
>> +
>> +	if (sts & SWRM_INTERRUPT_STATUS_CMD_ERROR) {
>> +		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
>> +		dev_err_ratelimited(ctrl->dev,
>> +				    "CMD error, fifo status 0x%x\n",
>> +				     value);
>> +		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CMD, 0x1);
>> +	}
>> +
>> +	if ((sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED) ||
>> +	    sts & SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS)
>> +		schedule_work(&ctrl->slave_work);
> 
> we are in irq thread, so why not do the work here rather than schedule
> it?

The reason is that, sdw_handle_slave_status() we will read device id 
registers, which are fifo based in this controller and triggers an 
interrupt for each read.
So all the such reads will timeout waiting for interrupt if we do not do 
it in a separate thread.



> 
>> +static int qcom_swrm_compute_params(struct sdw_bus *bus)
>> +{
>> +	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
>> +	struct sdw_master_runtime *m_rt;
>> +	struct sdw_slave_runtime *s_rt;
>> +	struct sdw_port_runtime *p_rt;
>> +	struct qcom_swrm_port_config *pcfg;
>> +	int i = 0;
>> +
>> +	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
>> +		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
>> +			pcfg = &ctrl->pconfig[p_rt->num - 1];
>> +			p_rt->transport_params.port_num = p_rt->num;
>> +			p_rt->transport_params.sample_interval = pcfg->si + 1;
>> +			p_rt->transport_params.offset1 = pcfg->off1;
>> +			p_rt->transport_params.offset2 = pcfg->off2;
>> +		}
>> +
>> +		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
>> +			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
>> +				pcfg = &ctrl->pconfig[i];
>> +				p_rt->transport_params.port_num = p_rt->num;
>> +				p_rt->transport_params.sample_interval =
>> +					pcfg->si + 1;
>> +				p_rt->transport_params.offset1 = pcfg->off1;
>> +				p_rt->transport_params.offset2 = pcfg->off2;
>> +				i++;
>> +			}
> 
> Can you explain this one, am not sure I understood this. This fn is
> supposed to compute and fill up the params, all I can see is filling up!
> 
Bandwidth parameters are currently coming from board specific Device 
Tree, which are programmed here.

>> +static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
>> +	.hw_params = qcom_swrm_hw_params,
>> +	.prepare = qcom_swrm_prepare,
>> +	.hw_free = qcom_swrm_hw_free,
>> +	.startup = qcom_swrm_startup,
>> +	.shutdown = qcom_swrm_shutdown,
>> +        .set_sdw_stream = qcom_swrm_set_sdw_stream,
> 
> why does indent look off to me!
> 
Yep, Fixed in next version.

--srini
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
