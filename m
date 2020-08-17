Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A98246535
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 13:13:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3980316EA;
	Mon, 17 Aug 2020 13:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3980316EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597662838;
	bh=NAQLJ+Xx5cbAk90dRCMjq9otv0yd4Jbly1VOR7+/xtU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VNIHkcBdmzvBJAC08doS5Ht7NS8FDqMeysLHMoVn5ByPuEjg8Uf50secl+O3X00xF
	 UlNUtZqTn2GGZM1E4/JlK0ID1rBV/TiZmpoRQgJ+9WVf0mE8LoagaQnScK++e+uS7Z
	 4wz1Rm9KKzkZgbcfDQXjyIo4ZfeF+5d9xzTHeiuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48243F800EF;
	Mon, 17 Aug 2020 13:12:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB483F80218; Mon, 17 Aug 2020 13:12:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4115AF800EF
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 13:12:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4115AF800EF
IronPort-SDR: SZomAftzAGHwM5EW8nLjvolLAtbLtcoNMuZc34W24EgKqf0PNOM3UqIJB7xzUZ+qnQwZ9YVo0Y
 cr8fLK+VjnWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="153929949"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; d="scan'208";a="153929949"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 04:12:06 -0700
IronPort-SDR: 0x8CxIiz5UEUYBwVcVxqGa7TmrBwLo26BZACzFNEVNvimVj930/IXZGgHiNZ9IXPQvwuJEaTzk
 iqVDKuJhaHcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; d="scan'208";a="471391036"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.4.178])
 ([10.213.4.178])
 by orsmga005.jf.intel.com with ESMTP; 17 Aug 2020 04:12:02 -0700
Subject: Re: [PATCH v4 02/13] ASoC: Intel: catpt: Define DSP operations
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-3-cezary.rojewski@intel.com>
 <20200813185129.GB1891694@smile.fi.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <946fdd80-c89d-ee1b-6eef-e752318b55a6@intel.com>
Date: Mon, 17 Aug 2020 13:12:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813185129.GB1891694@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

On 2020-08-13 8:51 PM, Andy Shevchenko wrote:
> On Wed, Aug 12, 2020 at 10:57:42PM +0200, Cezary Rojewski wrote:
>> Implement dsp lifecycle functions such as core RESET and STALL,
>> SRAM power control and LP clock selection. This also adds functions for
>> handling transport over DW DMA controller.

Thanks for your input Andy!

>> +static void catpt_dma_transfer_complete(void *arg)
>> +{
>> +	struct catpt_dev *cdev = arg;
>> +
> 
>> +	dev_dbg(cdev->dev, "%s\n", __func__);
> 
> Noise. Somebody should provide either trace events, of get used to function tracer / perf.
> 

Agree. Don't have much expertise with DMA-engine and some stuff is based 
on existing stuff:
/sound/soc/intel/common/sst-firmware.c ::sst_dma_transfer_complete()

That's not somebody - that's CI. I don't mind ftracer, but our's CI 
logging is currently dmesg/ event traces -based.

Anyway, with log removed, catpt_dma_transfer_complete() ceases to exist too.

> 
>> +static bool catpt_dma_filter(struct dma_chan *chan, void *param)
>> +{
> 
>> +	return chan->device->dev == (struct device *)param;
> 
> Redundant casting, and please, consider to swap left and right side (in this
> case easily to find these and perhaps provide a generic helper function).
> 

Good point. Yeah, I've tried to find generic-helper before even adding 
this, but with no result.

> 
>> +#define CATPT_DMA_DEVID		1 /* dma engine used */
> 
> Not sure I understand what exactly this means.
> 

Well, you may choose either engine 0 or 1 for loading images. Reference 
solution which I'm basing catpt on - Windows driver equivalent - makes 
use of engine 1. Goal of this implementation is to align closely to 
stable Windows solution wherever possible to reduce maintainance cost.

> 
>> +#define CATPT_DMA_MAXBURST	0x3
> 
> We have DMA engine definitions for that, please avoid magic numbers.
> 

As with most of the dma stuff, based on existing:
/sound/soc/intel/common/sst-firmware.c SST_DSP_DMA_MAX_BURST

Ack.

>> +#define CATPT_DMA_DSP_ADDR_MASK	0xFFF00000
> 
> GENMASK()
> 

Ditto as above. Ack.

>> +	dma_cap_set(DMA_SLAVE, mask);
> 
> How this helps with mem2mem channel?
> 
> ...
> 
>> +	chan = dma_request_channel(mask, catpt_dma_filter, cdev->dev);
>> +	if (!chan) {
>> +		dev_err(cdev->dev, "request channel failed\n");
> 
>> +		dump_stack();
> 
> Huh?!
> 

I'm as surpriced as you : )
Remnant of pm_runtime + single platform_device (for adsp and dw both) 
debug. Removed in v5.

>> +		return ERR_PTR(-EPROBE_DEFER);
>> +	}
> 
> ...
> 
>> +	status = dma_wait_for_async_tx(desc);
> 
>> +	catpt_updatel_shim(cdev, HMDC,
>> +			   CATPT_HMDC_HDDA(CATPT_DMA_DEVID, chan->chan_id), 0);
> 
> Update even in erroneous case?
> 

Yes. This is based on stable Windows solution equivalent and get's 
updated even in failure case to disable access to HOST memory in demand 
more.

>> +	return (status == DMA_COMPLETE) ? 0 : -EPROTO;
> 
> ...
> 
>> +static void catpt_dsp_set_srampge(struct catpt_dev *cdev, struct resource *sram,
>> +				  unsigned long mask, unsigned long new)
>> +{
>> +	unsigned long old;
>> +	u32 off = sram->start;
>> +	u32 b = __ffs(mask);
>> +
>> +	old = catpt_readl_pci(cdev, VDRTCTL0) & mask;
> 
>> +	dev_dbg(cdev->dev, "SRAMPGE [0x%08lx] 0x%08lx -> 0x%08lx",
>> +		mask, old, new);
> 
> trace event / point?
> 

Well, I've just replaced these with dev_dbg (from trace events). Not 
many usages and caused all reg-related prints to be available in dmesg.

>> +	if (old == new)
>> +		return;
>> +
>> +	catpt_updatel_pci(cdev, VDRTCTL0, mask, new);
> 
>> +	udelay(60);
> 
> Delays should be commented.
> 

Similarly to previous review (comment regarding hw support), I'm afraid 
I don't have good comments for most occurences available.

I'll try to add something meaningful for at least some of these.

>> +
>> +	/*
>> +	 * dummy read as the very first access after block enable
>> +	 * to prevent byte loss in future operations
>> +	 */
>> +	for_each_clear_bit_from(b, &new, fls(mask)) {
> 
> fls_long()
> 

Ack.

>> +		u8 buf[4];
>> +
>> +		/* newly enabled: new bit=0 while old bit=1 */
>> +		if (test_bit(b, &old)) {
>> +			dev_dbg(cdev->dev, "sanitize block %ld: off 0x%08x\n",
> 
>> +				(b - __ffs(mask)), off);
> 
> Unneeded parentheses.
> 

Ack.

>> +			memcpy_fromio(buf, cdev->lpe_ba + off, sizeof(buf));
>> +		}
>> +		off += CATPT_MEMBLOCK_SIZE;
>> +	}
>> +}
> 
> ...
> 
>> +	/* offset value given mask's start and invert it as ON=b0 */
> 
>> +	new <<= __ffs(mask);
>> +	new = ~(new) & mask;
> 
> Unneeded parentheses.
> And perhaps in one line it will be better to understand:
> 
> 	new = ~(new << __ffs(mask)) & mask;
> 

Was called out in the past not to combine everything in one-line like if 
I'm to hide something from reviewer.

No problem with combining these together in v5.

>> +	if (waiti) {
>> +		/* wait for DSP to signal WAIT state */
>> +		ret = catpt_readl_poll_shim(cdev, ISD,
>> +					    reg, (reg & CATPT_ISD_DCPWM),
>> +					    500, 10000);
>> +		if (ret < 0) {
> 
>> +			dev_warn(cdev->dev, "await WAITI timeout\n");
> 
> Shouldn't be an error level?
> 

As this causes early return, I agree.

>> +			mutex_unlock(&cdev->clk_mutex);
>> +			return ret;
>> +		}
>> +	}
> 
> ...
> 
>> +int catpt_dsp_update_lpclock(struct catpt_dev *cdev)
>> +{
>> +	struct catpt_stream_runtime *stream;
> 
>> +	bool lp;
>> +
>> +	if (list_empty(&cdev->stream_list))
>> +		return catpt_dsp_select_lpclock(cdev, true, true);
>> +
>> +	lp = true;
>> +	list_for_each_entry(stream, &cdev->stream_list, node) {
>> +		if (stream->prepared) {
>> +			lp = false;
>> +			break;
>> +		}
>> +	}
>> +
>> +	return catpt_dsp_select_lpclock(cdev, lp, true);
> 
> Seems too much duplication.
> 
> 	struct catpt_stream_runtime *stream;
> 
> 	list_for_each_entry(stream, &cdev->stream_list, node) {
> 		if (stream->prepared)
> 			return catpt_dsp_select_lpclock(cdev, false, true);
> 	}
> 
> 	return catpt_dsp_select_lpclock(cdev, true, true);
> 
> 
> Better?
> 

list_first_entry (part of list_for_each_entry) expects list to be 
non-empty. ->streal_list may be empty when invoking 
catpt_dsp_update_lpclock().

>> +	/* set D3 */
>> +	catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, CATPT_PMCS_PS_D3HOT);
>> +	udelay(50);
> 
> Don't we have PCI core function for this?
> 
> ...
> 
>> +	/* set D0 */
>> +	catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, 0);
>> +	udelay(100);
> 
> Ditto.
> 
> ...
> 
>> +	/* set D3 */
>> +	catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, CATPT_PMCS_PS_D3HOT);
>> +	udelay(50);
> 
> Ditto.
> 
> ...
> 
>> +	/* set D0 */
>> +	catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, 0);
> 
> Ditto.
> 

Thanks to you now I know the correct answer: yes.
Ack for all of these. Good advice Andy, again!
