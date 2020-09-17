Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ACD26DFAF
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 17:31:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 659CC16B1;
	Thu, 17 Sep 2020 17:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 659CC16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600356700;
	bh=xqnaVuMFxfmnGwaK5XCFxXNuxqM60JqlvXRUCEv24bI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HxZ82FDB+3CEz3CitjPjqBaZe3Q2qIH7ag8Ufbp1LaN/Slmx01IotRD0YH+XAHfE7
	 2mGBjOxu8SjmeLAf1KYrvlp9Q85pS5ZTgtREEDbsw5ZX3WDA6kCEvmzPh35De/iJj8
	 JfmGYmXNwrVeNuLsRcxCQmVWNBpeDhuJNANeYRQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B0DDF800E8;
	Thu, 17 Sep 2020 17:29:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18675F80212; Thu, 17 Sep 2020 17:29:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6453F80134
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 17:29:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6453F80134
IronPort-SDR: sgRheoZBXgYeHg2TRC0sq0q9zcZLrlN1r06/JrrG7zM9yNpdU6Qd3yxFO4lLu/sEYNz3VxycsV
 zgJKUMOA1GiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="221270924"
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="221270924"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 08:29:39 -0700
IronPort-SDR: 15tWBKuLbRiil3HRgMKliUCqNU81jhIYXe3ryDwKOs4fjqnMXDtPV6tSPKXMdG4UD7DRLoJcaN
 Yd6QyQ/M6+bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="320260504"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by orsmga002.jf.intel.com with ESMTP; 17 Sep 2020 08:29:38 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 17 Sep 2020 16:29:36 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Thu, 17 Sep 2020 16:29:36 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v5 02/13] ASoC: Intel: catpt: Define DSP operations
Thread-Topic: [PATCH v5 02/13] ASoC: Intel: catpt: Define DSP operations
Thread-Index: AQHWi32IyHHVImF91k6rxcFTJOLC7alrWLCAgAGd/EA=
Date: Thu, 17 Sep 2020 15:29:36 +0000
Message-ID: <96ee725f1aa746c78ee380bb8e754ff3@intel.com>
References: <20200915162944.16241-1-cezary.rojewski@intel.com>
 <20200915162944.16241-3-cezary.rojewski@intel.com>
 <20200916154409.GQ3956970@smile.fi.intel.com>
In-Reply-To: <20200916154409.GQ3956970@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Proborszcz, Filip" <filip.proborszcz@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>, "Papierkowski,
 Piotr \(Habana\)" <ppapierkowski@habana.ai>, "Gopal, 
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

On 2020-09-16 5:44 PM, Andy Shevchenko wrote:
> On Tue, Sep 15, 2020 at 06:29:33PM +0200, Cezary Rojewski wrote:
>> Implement dsp lifecycle functions such as core RESET and STALL,
>> SRAM power control and LP clock selection. This also adds functions for
>> handling transport over DW DMA controller.
>=20
> Some nit-picks below. FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
...

>> +
>> +int catpt_dmac_probe(struct catpt_dev *cdev)
>> +{
>> +	struct dw_dma_chip *dmac;
>> +	int ret;
>> +
>> +	dmac =3D devm_kzalloc(cdev->dev, sizeof(*dmac), GFP_KERNEL);
>> +	if (!dmac)
>> +		return -ENOMEM;
>=20
>> +	dmac->regs =3D cdev->lpe_ba +
>> +		     cdev->spec->host_dma_offset[CATPT_DMA_DEVID];
>=20
> One line?
>=20
It's exactly 81 after one-lining - that's why I kept it as is.

>> +	dmac->dev =3D cdev->dev;
>> +	dmac->irq =3D cdev->irq;
>> +
>> +	ret =3D dma_coerce_mask_and_coherent(cdev->dev, DMA_BIT_MASK(31));
>> +	if (ret)
>> +		return ret;
>> +	/*
>> +	 * Caller is responsible for putting device in D0 to allow
>> +	 * for I/O and memory access before probing DW.
>> +	 */
>> +	ret =3D dw_dma_probe(dmac);
>> +	if (ret)
>> +		return ret;
>> +
>> +	cdev->dmac =3D dmac;
>> +	return 0;
>> +}
>> +
>> +void catpt_dmac_remove(struct catpt_dev *cdev)
>> +{
>> +	/*
>> +	 * As do_dma_remove() juggles with pm_runtime_get_xxx() and
>> +	 * pm_runtime_put_xxx() while both ADSP and DW 'devices' are part of
>> +	 * the same module, caller makes sure pm_runtime_disable() is invoked
>> +	 * before removing DW to prevent postmortem resume and suspend.
>> +	 */
>> +	dw_dma_remove(cdev->dmac);
>> +}
>> +
>> +static void catpt_dsp_set_srampge(struct catpt_dev *cdev, struct resour=
ce *sram,
>> +				  unsigned long mask, unsigned long new)
>> +{
>> +	unsigned long old;
>> +	u32 off =3D sram->start;
>> +	u32 b =3D __ffs(mask);
>> +
>> +	old =3D catpt_readl_pci(cdev, VDRTCTL0) & mask;
>=20
>> +	dev_dbg(cdev->dev, "SRAMPGE [0x%08lx] 0x%08lx -> 0x%08lx",
>> +		mask, old, new);
>=20
> I saw use of trace points, this looks like non-production leftover.
>=20

In case of all dev_dbg(s) you had mentioned here, I've added these
intentionally - this is similar to ASoC core logging: entire DAI and
board connection process is logged via dev_dbg as there is no need to
show these to user by default. Logging SRAMPGE/LPCS and block
sanitization is useful for developers.

I've given thought to traces on several occasions and ultimately decided
to leave this only for IPC communication with ADSP.

>> +	if (old =3D=3D new)
>> +		return;
>> +
>> +	catpt_updatel_pci(cdev, VDRTCTL0, mask, new);
>> +	/* wait for SRAM power gating to propagate */
>> +	udelay(60);
>> +
>> +	/*
>> +	 * Dummy read as the very first access after block enable
>> +	 * to prevent byte loss in future operations.
>> +	 */
>> +	for_each_clear_bit_from(b, &new, fls_long(mask)) {
>> +		u8 buf[4];
>> +
>> +		/* newly enabled: new bit=3D0 while old bit=3D1 */
>> +		if (test_bit(b, &old)) {
>=20
>> +			dev_dbg(cdev->dev, "sanitize block %ld: off 0x%08x\n",
>> +				b - __ffs(mask), off);
>=20
> So does this.
>=20

Please see above.

>> +			memcpy_fromio(buf, cdev->lpe_ba + off, sizeof(buf));
>> +		}
>> +		off +=3D CATPT_MEMBLOCK_SIZE;
>> +	}
>> +}
>> +
>> +void catpt_dsp_update_srampge(struct catpt_dev *cdev, struct resource *=
sram,
>> +			      unsigned long mask)
>> +{
>> +	struct resource *res;
>> +	unsigned long new =3D 0;
>> +
>> +	/* flag all busy blocks */
>> +	for (res =3D sram->child; res; res =3D res->sibling) {
>> +		u32 h, l;
>> +
>> +		h =3D (res->end - sram->start) / CATPT_MEMBLOCK_SIZE;
>> +		l =3D (res->start - sram->start) / CATPT_MEMBLOCK_SIZE;
>> +		new |=3D GENMASK(h, l);
>=20
> I think better assembly will be generated with
>=20
> 	(BIT(h - l + 1) - 1) << l
>=20
> Looking at the above calculus it seems (needs to be carefully checked!) c=
an be
>=20
> 	u32 bits =3D DIV_ROUND_UP(resource_size(res), CATPT_MEMBLOCK_SIZE);
> 	u32 shift =3D (res->start - sram->start) / CATPT_MEMBLOCK_SIZE;
>=20
> 	new |=3D (BIT(bits) - 1) << shift;
>=20
> Note, your approach is also good from readability point of view, so just =
weight
> pros and cons and choose best one.
>=20

I'm up for performance change later on - I'm still yet to complete all
the missing pieces for FW and SW flow documentation. Code as it is
written now helps me during that process. Once docs are done,
performance could overtake readability here and there.

>> +	}
>> +
>> +	/* offset value given mask's start and invert it as ON=3Db0 */
>> +	new =3D ~(new << __ffs(mask)) & mask;
>> +
>> +	/* disable core clock gating */
>> +	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DCLCGE, 0);
>> +
>> +	catpt_dsp_set_srampge(cdev, sram, mask, new);
>> +
>> +	/* enable core clock gating */
>> +	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DCLCGE,
>> +			  CATPT_VDRTCTL2_DCLCGE);
>> +}
>> +
>> +int catpt_dsp_stall(struct catpt_dev *cdev, bool stall)
>> +{
>> +	u32 reg, val;
>> +
>> +	val =3D stall ? CATPT_CS_STALL : 0;
>> +	catpt_updatel_shim(cdev, CS1, CATPT_CS_STALL, val);
>> +
>> +	return catpt_readl_poll_shim(cdev, CS1,
>> +				     reg, (reg & CATPT_CS_STALL) =3D=3D val,
>> +				     500, 10000);
>> +}
>> +
>> +static int catpt_dsp_reset(struct catpt_dev *cdev, bool reset)
>> +{
>> +	u32 reg, val;
>> +
>> +	val =3D reset ? CATPT_CS_RST : 0;
>> +	catpt_updatel_shim(cdev, CS1, CATPT_CS_RST, val);
>> +
>> +	return catpt_readl_poll_shim(cdev, CS1,
>> +				     reg, (reg & CATPT_CS_RST) =3D=3D val,
>> +				     500, 10000);
>> +}
>> +
>> +void lpt_dsp_pll_shutdown(struct catpt_dev *cdev, bool enable)
>> +{
>> +	u32 val;
>> +
>> +	val =3D enable ? LPT_VDRTCTL0_APLLSE : 0;
>> +	catpt_updatel_pci(cdev, VDRTCTL0, LPT_VDRTCTL0_APLLSE, val);
>> +}
>> +
>> +void wpt_dsp_pll_shutdown(struct catpt_dev *cdev, bool enable)
>> +{
>> +	u32 val;
>> +
>> +	val =3D enable ? WPT_VDRTCTL2_APLLSE : 0;
>> +	catpt_updatel_pci(cdev, VDRTCTL2, WPT_VDRTCTL2_APLLSE, val);
>> +}
>> +
>> +static int catpt_dsp_select_lpclock(struct catpt_dev *cdev, bool lp, bo=
ol waiti)
>> +{
>> +	u32 mask, reg, val;
>> +	int ret;
>> +
>> +	mutex_lock(&cdev->clk_mutex);
>> +
>> +	val =3D lp ? CATPT_CS_LPCS : 0;
>> +	reg =3D catpt_readl_shim(cdev, CS1) & CATPT_CS_LPCS;
>=20
>> +	dev_dbg(cdev->dev, "LPCS [0x%08lx] 0x%08x -> 0x%08x",
>> +		CATPT_CS_LPCS, reg, val);
>=20
> Leftover?
>=20
Please see the above (dev_dbg chapter).

