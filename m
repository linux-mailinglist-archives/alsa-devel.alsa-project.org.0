Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D755B3341DD
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 16:47:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4736D175E;
	Wed, 10 Mar 2021 16:46:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4736D175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615391222;
	bh=yIeAvHFqsLjMa89kqXmZq/cL/MIj2Enoy3tKPrg61Uk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F/vwFX51XNTXona9hHOkwmLrmWHfHFohTswo7iz+eYrhfh+seMfUXDjoxuib0rSms
	 wXDWUrX1VPcW0O543/361h7ZSAyXtGbN9XP03fko91SFuZSzDxpUXDwnQUjA+PGUz+
	 nEtpF8E+puRNcglGGK8+vSEbDaafbhlkIe6Qzssw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E716F80475;
	Wed, 10 Mar 2021 16:45:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1F7DF8032D; Wed, 10 Mar 2021 16:45:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DATE_IN_PAST_12_24,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55998F80272
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 16:45:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55998F80272
IronPort-SDR: otHWQHkpn6ng8EPVIFSVMD6c/2cigLUjBJOg5+EunalZUOONx7gxWnJw67hEy043LrCWDgonbJ
 ZDAM3xHcYb+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="188589664"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="188589664"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 07:45:13 -0800
IronPort-SDR: p60gojLrqWi7gsJ+jGQIvHKjinxj4Uyg3tK8TS2R54X0M1l56f9wlmWyvVrGUD3oyomvZXEd29
 rLz46anVIlZg==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="403722234"
Received: from huiyingw-mobl.amr.corp.intel.com (HELO [10.212.214.84])
 ([10.212.214.84])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 07:45:12 -0800
Subject: Re: [PATCH v2 3/5] soundwire: qcom: add static port map support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org, 
 vkoul@kernel.org
References: <20210309141514.24744-1-srinivas.kandagatla@linaro.org>
 <20210309141514.24744-4-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cc812a5b-c3c3-bb46-f2fe-3e0a14cf0524@linux.intel.com>
Date: Tue, 9 Mar 2021 10:10:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210309141514.24744-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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




>   	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
> @@ -473,8 +475,13 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus)
>   		}
>   
>   		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
> +			slave = s_rt->slave;
>   			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
> -				pcfg = &ctrl->pconfig[i];
> +				m_port = slave->m_port_map[_rtp->num - 1];
> +				if (m_port)
> +					pcfg = &ctrl->pconfig[m_port - 1];
> +				else
> +					pcfg = &ctrl->pconfig[i];

Maybe add a short comment on port allocation, I had to think a bit to 
figure out why the -1 was required on both peripheral and manager but it 
is not below [1]

>   				p_rt->transport_params.port_num = p_rt->num;
>   				p_rt->transport_params.sample_interval =
>   					pcfg->si + 1;
> @@ -535,8 +542,10 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>   	struct sdw_master_runtime *m_rt;
>   	struct sdw_slave_runtime *s_rt;
>   	struct sdw_port_runtime *p_rt;
> +	struct sdw_slave *slave;
>   	unsigned long *port_mask;
>   	int i, maxport, pn, nports = 0, ret = 0;
> +	unsigned int m_port;
>   
>   	mutex_lock(&ctrl->port_lock);
>   	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
> @@ -549,9 +558,15 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>   		}
>   
>   		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
> +			slave = s_rt->slave;
>   			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
> +				m_port = slave->m_port_map[p_rt->num - 1];
>   				/* Port numbers start from 1 - 14*/
> -				pn = find_first_zero_bit(port_mask, maxport);
> +				if (m_port)
> +					pn = m_port;
> +				else
> +					pn = find_first_zero_bit(port_mask, maxport);

[1]

> +
>   				if (pn > (maxport)) {
>   					dev_err(ctrl->dev, "All ports busy\n");
>   					ret = -EBUSY;
> 
