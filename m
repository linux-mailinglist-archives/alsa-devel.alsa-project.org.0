Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A3C770B8
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 19:57:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0411B20C5;
	Fri, 26 Jul 2019 19:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0411B20C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564163838;
	bh=4kPbsr3ZPz1BYzkuVXPr+//6Hkv3AwHorH+7hd3/Nks=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b2XYMIq1OzpVVnLq0ZHH2VlydgYyRmbLssRngwMshgN3pQwiP+thnw0MxuOgKghCy
	 Fmjd0EatD6JOypFMph4vaJTb/7xlUxzJsLR5+b/MCIL1UiUU+MJBLzyvmuuW+2ZQTP
	 /BqRpOQLz94ofh4w/XNK9mioIXyiBcrKttVgk5pM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B0BBF80368;
	Fri, 26 Jul 2019 19:55:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19F06F80393; Fri, 26 Jul 2019 19:55:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81A6CF801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 19:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81A6CF801A4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 10:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="198469774"
Received: from andawes-mobl.amr.corp.intel.com (HELO [10.251.145.66])
 ([10.251.145.66])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2019 10:55:24 -0700
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-28-pierre-louis.bossart@linux.intel.com>
 <20190726154322.GJ16003@ubuntu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <38a1f82f-0069-20a8-35d8-cd29b0d4b2ab@linux.intel.com>
Date: Fri, 26 Jul 2019 12:55:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726154322.GJ16003@ubuntu>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 27/40] soundwire: Add Intel resource
 management algorithm
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

Thanks Guennadi for looking at this code, it's hard to review and figure 
things out...
I replied to each, even trivial ones, to have a trace of all the issues.

>> +static void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
>> +				    struct sdw_transport_data *t_data)
>> +{
>> +	struct sdw_slave_runtime *s_rt = NULL;
> 
> Superfluous initialisation.

ok

> 
>> +	struct sdw_port_runtime *p_rt;
>> +	int port_bo, sample_int;
>> +	unsigned int rate, bps, ch = 0;
> 
> ditto for ch

ok

>> +
>> +	port_bo = t_data->block_offset;
>> +
>> +	list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
>> +		rate = m_rt->stream->params.rate;
>> +		bps = m_rt->stream->params.bps;
>> +		sample_int = (m_rt->bus->params.curr_dr_freq / rate);
>> +
>> +		list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
>> +			ch = sdw_ch_mask_to_ch(p_rt->ch_mask);
>> +
>> +			sdw_fill_xport_params(&p_rt->transport_params,
>> +					      p_rt->num, true,
>> +					      SDW_BLK_GRP_CNT_1,
>> +					      sample_int, port_bo, port_bo >> 8,
>> +					      t_data->hstart,
>> +					      t_data->hstop,
> 
> I think the above two lines could fit in one

likely yes.

> 
>> +					      (SDW_BLK_GRP_CNT_1 * ch), 0x0);
> 
> superfluous parentheses

yep


>> +static void sdw_compute_master_ports(struct sdw_master_runtime *m_rt,
>> +				     struct sdw_group_params *params,
>> +				     int port_bo, int hstop)
>> +{
>> +	struct sdw_transport_data t_data = {0};
>> +	struct sdw_port_runtime *p_rt;
>> +	struct sdw_bus *bus = m_rt->bus;
>> +	int sample_int, hstart = 0;
> 
> superfluous initialisation

yes

> 
>> +	unsigned int rate, bps, ch, no_ch;
>> +
>> +	rate = m_rt->stream->params.rate;
>> +	bps = m_rt->stream->params.bps;
>> +	ch = m_rt->ch_count;
>> +	sample_int = (bus->params.curr_dr_freq / rate);
> 
> superfluous parentheses

yes

>> +
>> +	if (rate != params->rate)
>> +		return;
>> +
>> +	t_data.hstop = hstop;
>> +	hstart = hstop - params->hwidth + 1;
>> +	t_data.hstart = hstart;
>> +
>> +	list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
>> +		no_ch = sdw_ch_mask_to_ch(p_rt->ch_mask);
>> +
>> +		sdw_fill_xport_params(&p_rt->transport_params, p_rt->num,
>> +				      true, SDW_BLK_GRP_CNT_1, sample_int,
>> +				      port_bo, port_bo >> 8, hstart, hstop,
>> +				      (SDW_BLK_GRP_CNT_1 * no_ch), 0x0);
> 
> superfluous parentheses

yes

> 
>> +
>> +		sdw_fill_port_params(&p_rt->port_params,
>> +				     p_rt->num, bps,
>> +				     SDW_PORT_FLOW_MODE_ISOCH,
>> +				     SDW_PORT_DATA_MODE_NORMAL);
>> +
>> +		/* Check for first entry */
>> +		if (!(p_rt == list_first_entry(&m_rt->port_list,
>> +					       struct sdw_port_runtime,
>> +					       port_node))) {
> 
> you wanted to write "if (p_rt != ...)"

bad code indeed, thanks for spotting this. I need to double-check this 
one, now I don't trust the ==
it could also be that it was meant to be a NULL check on the first entry.

> 
>> +			port_bo += bps * ch;
>> +			continue;
>> +		}
>> +
>> +		t_data.hstart = hstart;
>> +		t_data.hstop = hstop;
> 
> You already set these two above

need to check this as well.

> 
>> +		t_data.block_offset = port_bo;
>> +		t_data.sub_block_offset = 0;
>> +		port_bo += bps * ch;
>> +	}
>> +
>> +	sdw_compute_slave_ports(m_rt, &t_data);
>> +}
>> +
>> +static void _sdw_compute_port_params(struct sdw_bus *bus,
>> +				     struct sdw_group_params *params, int count)
>> +{
>> +	struct sdw_master_runtime *m_rt = NULL;
> 
> superfluous initialisation

yes

> 
>> +	int hstop = bus->params.col - 1;
>> +	int block_offset, port_bo, i;
>> +
>> +	/* Run loop for all groups to compute transport parameters */
>> +	for (i = 0; i < count; i++) {
>> +		port_bo = 1;
>> +		block_offset = 1;
>> +
>> +		list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
>> +			sdw_compute_master_ports(m_rt, &params[i],
>> +						 port_bo, hstop);
>> +
>> +			block_offset += m_rt->ch_count *
>> +					m_rt->stream->params.bps;
>> +			port_bo = block_offset;
>> +		}
>> +
>> +		hstop = hstop - params[i].hwidth;
> 
> hstop -= ...

yes

> 
>> +	}
>> +}
>> +
>> +static int sdw_compute_group_params(struct sdw_bus *bus,
>> +				    struct sdw_group_params *params,
>> +				    int *rates, int count)
>> +{
>> +	struct sdw_master_runtime *m_rt = NULL;
> 
> ditto

yes

>> +	int sel_col = bus->params.col;
>> +	unsigned int rate, bps, ch;
>> +	int i, column_needed = 0;
>> +
>> +	/* Calculate bandwidth per group */
>> +	for (i = 0; i < count; i++) {
>> +		params[i].rate = rates[i];
>> +		params[i].full_bw = bus->params.curr_dr_freq / params[i].rate;
>> +	}
>> +
>> +	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
>> +		rate = m_rt->stream->params.rate;
>> +		bps = m_rt->stream->params.bps;
>> +		ch = m_rt->ch_count;
>> +
>> +		for (i = 0; i < count; i++) {
>> +			if (rate == params[i].rate)
>> +				params[i].payload_bw += bps * ch;
> 
> I don't know about the algorithm, rates can repeat, right? So you cannot break
> out of the loop here once you found one match?

This code looks wrong. Need to get an intravenous caffeine injection.

> 
>> +		}
>> +	}
>> +
>> +	for (i = 0; i < count; i++) {
>> +		params[i].hwidth = (sel_col *
>> +			params[i].payload_bw + params[i].full_bw - 1) /
>> +			params[i].full_bw;
>> +
>> +		column_needed += params[i].hwidth;
>> +	}
>> +
>> +	if (column_needed > sel_col - 1)
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +static int sdw_add_element_group_count(struct sdw_group *group,
>> +				       unsigned int rate)
>> +{
>> +	int num = group->count;
>> +	int i;
>> +
>> +	for (i = 0; i <= num; i++) {
>> +		if (rate == group->rates[i])
> 
> Are you sure this is correct? You actually check count + 1 rates - from 0
> to count inclusively. I think this isn't what you wanted to do, so my
> proposal below only checks count rates.

I'll have to double check. There's already the warning on krealloc that 
looks suspicious as well.

> 
>> +			break;
>> +
>> +		if (i != num)
>> +			continue;
>> +
>> +		if (group->count >= group->max_size) {
>> +			group->max_size += 1;
>> +			group->rates = krealloc(group->rates,
>> +						(sizeof(int) * group->max_size),
>> +						GFP_KERNEL);
>> +			if (!group->rates)
>> +				return -ENOMEM;
>> +		}
>> +
>> +		group->rates[group->count++] = rate;
>> +	}
> 
> How about this:
> 
> 	for (i = 0; i < num; i++)
> 		if (rate == group->rates[i])
> 			return 0;
> 
> 	if (group->count >= group->max_size) {
> 		group->max_size += 1;
> 		group->rates = krealloc(group->rates,
> 					(sizeof(int) * group->max_size),
> 					GFP_KERNEL);
> 		if (!group->rates)
> 			return -ENOMEM;
> 	}
> 
> 	group->rates[group->count++] = rate;
> 
> 	return 0;

will check offline and see.

>> +
>> +	return 0;
>> +}
>> +
>> +static int sdw_get_group_count(struct sdw_bus *bus,
>> +			       struct sdw_group *group)
>> +{
>> +	struct sdw_master_runtime *m_rt;
>> +	unsigned int rate;
>> +	int ret = 0;
>> +
>> +	group->count = 0;
>> +	group->max_size = SDW_STRM_RATE_GROUPING;
>> +	group->rates = kcalloc(group->max_size, sizeof(int), GFP_KERNEL);
>> +	if (!group->rates)
>> +		return -ENOMEM;
>> +
>> +	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
>> +		rate = m_rt->stream->params.rate;
>> +		if (m_rt == list_first_entry(&bus->m_rt_list,
>> +					     struct sdw_master_runtime,
>> +					     bus_node)) {
>> +			group->rates[group->count++] = rate;
>> +
>> +		} else {
>> +			ret = sdw_add_element_group_count(group, rate);
>> +			if (ret < 0)
> 
> Actually it looks like you should free rates here? I see that not doing this
> makes the caller function below easier, but I'd say this is more error-
> prone... Up to you but I'd go the "safe" way - if it fails, it frees itself,
> if it succeeds - it's freed elsewhere.

good catch, will look into this.

> 
>> +				return ret;
>> +		}
>> +	}
>> +
>> +	return ret;
> 
> I think this will always return 0 here, so you don't need the "ret"
> variable in the function scope, you only need it in the "else"
> scope above.

will check. In general I avoid per-scope declarations.

>> +}
>> +
>> +/**
>> + * sdw_compute_port_params: Compute transport and port parameters
>> + *
>> + * @bus: SDW Bus instance
>> + */
>> +static int sdw_compute_port_params(struct sdw_bus *bus)
>> +{
>> +	struct sdw_group_params *params = NULL;
>> +	struct sdw_group group;
>> +	int ret;
>> +
>> +	ret = sdw_get_group_count(bus, &group);
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	if (group.count == 0)
>> +		goto out;
>> +
>> +	params = kcalloc(group.count, sizeof(*params), GFP_KERNEL);
>> +	if (!params) {
>> +		ret = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	/* Compute transport parameters for grouped streams */
>> +	ret = sdw_compute_group_params(bus, params,
>> +				       &group.rates[0], group.count);
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	_sdw_compute_port_params(bus, params, group.count);
>> +
>> +out:
>> +	kfree(params);
>> +	kfree(group.rates);
> 
> Depending whether or not you change the code above, this might change
> too.

will check

>> +static int sdw_compute_bus_params(struct sdw_bus *bus)
>> +{
>> +	unsigned int max_dr_freq, curr_dr_freq = 0;
>> +	struct sdw_master_prop *mstr_prop = NULL;
> 
> superfluous initialisation

yes

>> +	int i, clk_values, ret;
>> +	bool is_gear = false;
>> +	u32 *clk_buf;
>> +
>> +	mstr_prop = &bus->prop;
>> +	if (!mstr_prop)
> 
> this is impossible, it's an address of bus->prop...

Gah, yes.

>> +		return -EINVAL;
>> +
>> +	if (mstr_prop->num_clk_gears) {
>> +		clk_values = mstr_prop->num_clk_gears;
>> +		clk_buf = mstr_prop->clk_gears;
>> +		is_gear = true;
>> +	} else if (mstr_prop->num_clk_freq) {
>> +		clk_values = mstr_prop->num_clk_freq;
>> +		clk_buf = mstr_prop->clk_freq;
>> +	} else {
>> +		clk_values = 1;
>> +		clk_buf = NULL;
>> +	}
>> +
>> +	max_dr_freq = mstr_prop->max_clk_freq * SDW_DOUBLE_RATE_FACTOR;
>> +
>> +	for (i = 0; i < clk_values; i++) {
>> +		if (!clk_buf)
>> +			curr_dr_freq = max_dr_freq;
>> +		else
>> +			curr_dr_freq = (is_gear) ?
> 
> superfluous parentheses
> 
>> +				(max_dr_freq >>  clk_buf[i]) :
> 
> ditto

yes and yes
> 
>> +				clk_buf[i] * SDW_DOUBLE_RATE_FACTOR;
>> +
>> +		if (curr_dr_freq <= bus->params.bandwidth)
>> +			continue;
>> +
>> +		break;
> 
> I think this is raw code, you'd actually want to write this as
> 
> 		if (curr_dr_freq > bus->params.bandwidth)
> 			break;

I saw this before my Summer break and forgot about it. yes it needs to 
be fixed.

>>   
>>   	bus->debugfs = sdw_bus_debugfs_init(bus);
>>   
>> +	if (!bus->compute_params)
>> +		bus->compute_params = &sdw_compute_params;
> 
> I think it is more usual to not use "&" with functions, but it's valid too

yes, will fix


>> +/* Retrieve and return channel count from channel mask */
>> +static inline int sdw_ch_mask_to_ch(int ch_mask)
>> +{
>> +	int c = 0;
> 
> superfluous initialisation

yes

> 
>> +
>> +	for (c = 0; ch_mask; ch_mask >>= 1)
>> +		c += ch_mask & 1;
> 
> isn't there a built-in or something to count set bits... You could use ffs() to
> at least not loop 31 times for 0x80000000

will check
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
