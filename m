Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1042463EF
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 12:04:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8253F16E2;
	Mon, 17 Aug 2020 12:04:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8253F16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597658690;
	bh=FcZWfAQKiYye4i/D5VsJ9Gk5aeYNdt8paZNp6M4uwbs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SDxu8Vw/GIYeYqPiiGy++otHGPtPMyncgEjia9Aue5Cwl+IonHMIyJ+fF6zm1H6UU
	 RpBFUU4npP1YUn0w6FHKhkX3W+oHFWeIRMBnZknIZuawWWsHNPRDlFArK93u4l7CSS
	 Fe7s93WgxrduIRPxWCM2uJSRZnneLWEN3GiIg1Tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA4D5F80255;
	Mon, 17 Aug 2020 12:03:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88A40F80218; Mon, 17 Aug 2020 12:03:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 857C0F800D3
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 12:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 857C0F800D3
IronPort-SDR: V2crbuchm5Qhv+elnCvwexKTsyaoXjAjP9JDyzLc13+KzP86H0MCZI4mIEwdTjFGU3A4c5wYg/
 8IakhHVPgavA==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="216192130"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; d="scan'208";a="216192130"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 03:02:47 -0700
IronPort-SDR: MaG3zbh7GTQhJxu2qsfIlDwzQWyHSEaOhtmrc9cf6AlgytV20kw5M7N9SxH/mziMNqQs34EUfP
 dp0KePdmWkOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; d="scan'208";a="471370007"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.4.178])
 ([10.213.4.178])
 by orsmga005.jf.intel.com with ESMTP; 17 Aug 2020 03:02:40 -0700
Subject: Re: [PATCH v4 01/13] ASoC: Intel: Add catpt device
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-2-cezary.rojewski@intel.com>
 <20200813182908.GA1891694@smile.fi.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <3280b1a6-81f3-9f3f-d496-2bbf570c82d1@intel.com>
Date: Mon, 17 Aug 2020 12:02:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813182908.GA1891694@smile.fi.intel.com>
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

On 2020-08-13 8:29 PM, Andy Shevchenko wrote:
> On Wed, Aug 12, 2020 at 10:57:41PM +0200, Cezary Rojewski wrote:

Thanks for good review Andy!


>> +static inline bool catpt_resource_overlapping(struct resource *r1,
>> +					      struct resource *r2,
>> +					      struct resource *ret)
>> +{
>> +	if (!resource_overlaps(r1, r2))
>> +		return false;
>> +	ret->start = max(r1->start, r2->start);
>> +	ret->end = min(r1->end, r2->end);
>> +	return true;
>> +}
> 
> JFYI, I have just submitted a series [1] that includes this helper [2]
> to be available for all.
> 
> [1]: https://lore.kernel.org/linux-acpi/20200813175729.15088-1-andriy.shevchenko@linux.intel.com/
> [2]: https://lore.kernel.org/linux-acpi/20200813175729.15088-4-andriy.shevchenko@linux.intel.com/
> 

Well, I'm happy that catpt somewhat impacted resource-API getting more 
flexble, although it would be nice to get --cc'ed as 
_overlapping/_intersecting got moved into general part of kernel without 
changes, basically.

This raises a dependancy issue, am I right? i.e. until this gets merged, 
catpt will cause compilation errors on Mark's for-next. -or- perhaps you 
want me to leave things as they are for current release while removing 
said function later, once your PR get's merged?

>> +struct catpt_dev {
>> +	struct device *dev;
> 
>> +	struct dw_dma_chip *dmac;
> 
> Is it possible to use opaque pointer here? It will be better if in the future
> (I think unlikely, but still) somebody decides to use this with another DMA
> engine.
> 

Any opaque structure comes at a cost -> requires higher level of 
understanding from developers maintaining given piece of code (that 
includes architecture knowledge too, to get a grasp of why such decision 
was even made) == higher maintaince cost.

One could device ADSP architectures into:
1) LPT/WPT
2) BYT/CHT/BDW
3) cAVS (SKL+)
4) new (which I won't be elaborating here for obvious reasons)

To my knowledge, except for 1), none of them makes use of dmaengine.h 
when loading FW or doing any other action for that matter. As such, I 
don't see any reason to convert something explicit into something 
implicit. Don't believe either of options would be reusing struct 
catpt_dev too. In general, to make that happen you'd have to start with 
conversion of existing HDAudio transport (cAVS+) into dmaengine model 
and then do the same with SoundWire (cAVS+) - haven't seen sdw code in a 
while but still pretty sure it's not dmaengine-friendly.

> 
>> +#define CATPT_IPC_ERROR(err) ((err < 0) ? err : -EREMOTEIO)
> 
> err -> (err) in all cases of right side.
> 

Ack.

> 
>> +struct catpt_stream_runtime {
>> +	struct snd_pcm_substream *substream;
>> +
>> +	struct catpt_stream_template *template;
>> +	struct catpt_stream_info info;
>> +	struct resource *persistent;
>> +	struct snd_dma_buffer pgtbl;
>> +
> 
>> +	bool allocated:1;
>> +	bool prepared:1;
> 
> Does this ':1' make any sense?
> 

In current state it does not, really. Playing internally with segments 
which are not part of this release (as noted in cover-letter) where some 
of these did. Will remove in v5.

>> +	struct list_head node;
>> +};
> 
> ...
> 
>> +#ifdef CONFIG_PM
> 
> Perhaps __maybe_unused?
> 

Sure, removal of #ifdefs is always nice.

> 
>> +	ret = catpt_dsp_stall(cdev, true);
>> +	if (ret < 0)
> 
> I'm wondering if all these ' < 0' all over the code make sense? What do you
> expect out of positive returned values if any?
> 

Isn't this more of a preference? Please note I'm basing many of my 
decisions on code that's around me - /sound/core/ and sound/soc/ *.c.

Except for IPCs, basically all catpt rets retrieved from functions 
called will be returning either 0 (success) or <0 (error). No 
objections, but I don't see much difference either.

>> +		goto exit;

> 
>> +#ifdef CONFIG_PM_SLEEP
> 
> Perhaps __maybe_unused?
> 

Same as above~1, ack.

> 
>> +	board = platform_device_register_data(NULL, mach->drv_name,
>> +					PLATFORM_DEVID_NONE,
>> +					(const void *)mach, sizeof(*mach));
>> +	if (!board) {
> 
> Here obviously not correct check.
> 

Indeed, ack.

>> +		dev_err(cdev->dev, "board register failed\n");
>> +		return PTR_ERR(board);
>> +	}
>> +
>> +	ret = devm_add_action(cdev->dev, board_pdev_unregister, board);
>> +	if (ret < 0) {
>> +		platform_device_unregister(board);
> 
>> +		return ret;
>> +	}
>> +
>> +	return 0;
> 
> return ret;
> 

Similarly, to comment~2 regarding preferences, don't mind the change (in 
fact, I'm a fan) but in the past got messaged to leave things explicit - 
leave last 'if' with return ret, while return 0 marking success outside.

> 
>> +	mutex_init(&cdev->clk_mutex);
> 
> + blank line.
> 

Thought wide comment makes enough distance already.

>> +	/*
>> +	 * Mark both device formats as uninitialized. Once corresponding
>> +	 * cpu_dai's pcm is created, proper values are assigned
> 
> Please, use period(s) in multi-line comments.
> 

Used to: all-but-last sentence with period(s). Will update as requested 
in v5.

> 
>> +static int catpt_acpi_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct catpt_dev *cdev;
>> +	struct resource *res;
>> +	int ret;
>> +
>> +	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
>> +	if (!cdev)
>> +		return -ENOMEM;
> 
> 
>> +	cdev->spec = device_get_match_data(dev);
>> +	if (!cdev->spec)
>> +		return -ENODEV;
> 
> You may save some cycles if you do this before memory allocations.
> 

i.e. define a local for spec, assign and begin the init process only 
once it's found? Isn't that a loss in most cases? Comes down to:

	declare local + later cdev->spec = spec assignment
	vs
	unlikely -ENODEV with memory being unnecessarily allocated

Perhaps I'm unaware of what's going on with device_get_match_data, but I 
believe .probe() won't get called until one of .acpi_match_table ids 
matches device available on the bus. Existing list of ids won't ever get 
changed as there are only two platforms available for 2011-2013 ADSP 
architecture.

>> +	catpt_dev_init(cdev, dev);
>> +
>> +	/* map DSP bar address */
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return -ENODEV;
>> +	cdev->lpe_ba = devm_ioremap(dev, res->start, resource_size(res));
>> +	if (!cdev->lpe_ba)
>> +		return -EIO;
>> +	cdev->lpe_base = res->start;
> 
> Why the region is not get requested?
> 
>> +	/* map PCI bar address */
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>> +	if (!res)
>> +		return -ENODEV;
>> +	cdev->pci_ba = devm_ioremap(dev, res->start, resource_size(res));
>> +	if (!cdev->pci_ba)
>> +		return -EIO;
> 
> Ditto.
> 

Comes from catpt_dmac_probe() (dsp.c) making use of 
devm_ioremap_resource(). If you _get_ requested resource there, the 
function called in catpt_dmac_probe() will yielrd -EBUSY.

This is based on existing code:
/sound/soc/intel/common/sst-acpi.c ::sst_acpi_probe() see mmio assignments.
/sound/soc/intel/common/sst-firmate.ce ::dw_probe() see chip->regs 
assignment.

Perhaps you've found even more problems in existing code than I did..

>> +	/* alloc buffer for storing DRAM context during dx transitions */
>> +	cdev->dxbuf_vaddr = dma_alloc_coherent(dev, catpt_dram_size(cdev),
> 
> dmam_alloc_coherent() ?
> 

Nice! Wasn't aware of this helper. Simplifies error-path too.

>> +					       &cdev->dxbuf_paddr, GFP_KERNEL);
>> +	if (!cdev->dxbuf_vaddr)
>> +		return -ENOMEM;
> 
>> +	ret = platform_get_irq(pdev, 0);
>> +	if (ret < 0)
>> +		goto irq_err;
>> +	cdev->irq = ret;
> 
> But you may return directly if you get IRQ resource before allocation (despite
> previous comment).
> 

Indeed, reordering irq-request and dxbuf allocation would alloc for 
s/goto irq_err/return <err>/
Error-path wouldn't be removed though, as final operation - 
catpt_probe_components - must be verified before leaving scope.

>> +
>> +	platform_set_drvdata(pdev, cdev);
>> +
>> +	ret = devm_request_threaded_irq(dev, cdev->irq, catpt_dsp_irq_handler,
>> +					catpt_dsp_irq_thread,
>> +					IRQF_SHARED, "AudioDSP", cdev);
>> +	if (ret < 0)
>> +		goto irq_err;
>> +
>> +	ret = catpt_probe_components(cdev);
> 
> return ...
> 

With dmam_xxx helper, true.

>> +	if (ret < 0)
>> +		goto irq_err;
>> +	return 0;
>> +
>> +irq_err:
>> +	dma_free_coherent(cdev->dev, catpt_dram_size(cdev),
>> +			  cdev->dxbuf_vaddr, cdev->dxbuf_paddr);
>> +
>> +	return ret;
> 
> This will be gone...
> 

Ditto. Thanks!

>> +}
> 
> ...
> 
>> +static const struct acpi_device_id catpt_ids[] = {
>> +	{ "INT33C8", (unsigned long)&lpt_desc },
>> +	{ "INT3438", (unsigned long)&wpt_desc },
> 
>> +	{ },
> 
> No need to have comma in terminator line.
> 

Well, that's a habbit to add a ',' at the end of each enumeration line 
and I bet it's a good one. No problem removing this one though.

>> +};
> 
> ...
> 
>> +static struct platform_driver catpt_acpi_driver = {
>> +	.probe = catpt_acpi_probe,
>> +	.remove = catpt_acpi_remove,
>> +	.driver = {
>> +		.name = "catpt_adsp",
> 
>> +		.acpi_match_table = ACPI_PTR(catpt_ids),
> 
> ACPI_PTR() either bogus (when you have depends on ACPI) or mistake that brings
> you compiler warning (unused variable).
> 
> I highly recommend in new code avoid completely ACPI_PTR() and of_match_ptr()
> macros.
> 

That's something new for me. Thanks for a good advice.

>> +		.pm = &catpt_dev_pm,
>> +	},
>> +};
> 
> ...
> 
>> +#include <linux/iopoll.h>
> 
> Missed headers:
> bits.h (note, the below guarantees to provide this one)
> bitops.h
> io.h (writel(), readl(), etc)
> 

Removed these as registers.h always gets included with other files which 
already inhering them via nesting.
Will update in v5 as requested.

>> +/* DSP Shim registers */
>> +
>> +#define CATPT_SHIM_CS1		0x0
> 
> Please, keep all register definitions of the same width, like 0x00 here or so.
> 

Ack.

> 
>> +#define CATPT_CS_SFCR(ssp)	BIT(27 + ssp)
> 
> In all macros, try to be a little bit defensive, e.g. here ssp -> (ssp).
> 
> ...
> 
>> +#define CATPT_HMDC_HDDA(e, ch)	BIT(8 * e + ch)
> 
> ...or e -> (e) and ch -> (ch) here.
> 

Agreed, will update in v5.

>> +#define CATPT_CS_DEFAULT	0x8480040E
>> +#define CATPT_IMC_DEFAULT	0x7FFF0003
>> +#define CATPT_IMD_DEFAULT	0x7FFF0003
>> +#define CATPT_CLKCTL_DEFAULT	0x7FF
> 
> These looks like set of bit fields, can we describe them either in comments
> or in the values like GENMASK(x, y) | BIT(z) ?
> 

Let's go with the latter. As explained below, I don't have much info in 
regard to re-setting registers to their defaults. This knowldge might 
come in time (and a ton of testing) but certainly, won't be part of this 
release.

One issue might arise when describing the "reserved" regions as some 
bits should not be modified by sw normally, but are part of "recommended 
sequence" anyway. I'll see if there are any among '1's.

>> +/* PCI Configuration registers */
>> +
>> +#define CATPT_PCI_PMCS		0x84
> 
> Why?! We have PCI capability and entire infrastructure for that in PCI core.
> 
> ...
> 
>> +#define CATPT_PMCS_PS		GENMASK(1, 0)
>> +#define CATPT_PMCS_PS_D3HOT	(0x3 << 0)
> 
> Ditto.
> 

No need for astonishment : ) Wasn't aware of this, in fact, I count on 
more experienced kernel developers - like you Andy - to help others in 
learning about such improvements. Certainly, this isn't knowledge one is 
going to inherit from developing drivers in Windows environment.

Ack.

> 
>> +#define CATPT_SSP_SSC0		0x0
>> +#define CATPT_SSP_SSC1		0x4
>> +#define CATPT_SSP_SSS		0x8
>> +#define CATPT_SSP_SSIT		0xC
>> +#define CATPT_SSP_SSD		0x10
>> +#define CATPT_SSP_SSTO		0x28
>> +#define CATPT_SSP_SSPSP		0x2C
>> +#define CATPT_SSP_SSTSA		0x30
>> +#define CATPT_SSP_SSRSA		0x34
>> +#define CATPT_SSP_SSTSS		0x38
>> +#define CATPT_SSP_SSC2		0x40
>> +#define CATPT_SSP_SSPSP2	0x44
> 
> Isn't it PXA2xx register set? Can you use their definitions?
> 

Could you be more specific? Wasn't able to find anything useful in /include.

> 
>> +#define CATPT_SSP_SSC0_DEFAULT		0x0
>> +#define CATPT_SSP_SSC1_DEFAULT		0x0
>> +#define CATPT_SSP_SSS_DEFAULT		0xF004
>> +#define CATPT_SSP_SSIT_DEFAULT		0x0
>> +#define CATPT_SSP_SSD_DEFAULT		0xC43893A3
>> +#define CATPT_SSP_SSTO_DEFAULT		0x0
>> +#define CATPT_SSP_SSPSP_DEFAULT		0x0
>> +#define CATPT_SSP_SSTSA_DEFAULT		0x0
>> +#define CATPT_SSP_SSRSA_DEFAULT		0x0
>> +#define CATPT_SSP_SSTSS_DEFAULT		0x0
>> +#define CATPT_SSP_SSC2_DEFAULT		0x0
>> +#define CATPT_SSP_SSPSP2_DEFAULT	0x0
> 
> These defaults lack of comments.
> 

Because there aren't any available to choose from. While these are part 
of "recommended sequence", the only comment attached is:
     bring hw to their defaults as hw won't reset itself

catpt is an effort of sw and fw guys, no hw input is included as I've 
found only one guy still @ intel but he is busy with different projects 
and honestly, even if he would agree, him digging now why was this 
needed might take weeks. That's 2011 ADSP architecture, not some 
cutting-edge stuff.
