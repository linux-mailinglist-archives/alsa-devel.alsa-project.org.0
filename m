Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F0BA86BC
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 18:54:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A9751683;
	Wed,  4 Sep 2019 18:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A9751683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567616077;
	bh=/dW0qU7bOpf7z1beRPyD746oVhejIX/XKmiZBHf/e3w=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ii9rnuo4y35VKvmKjO6bJKcEtSSx49oTsNOdxjvudcW60c7/HRRi+QW2DX18Q/JQZ
	 V/8cMukngiLbvRBeTlsiSLoeh+84GHaVyCK+LderaiB0lU7Kud3Dgf8pp8sGraeFlM
	 IzJDT4rYG5f2oqbjq8Hz7YU3KH89I705L8x1dGzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 028F6F803D0;
	Wed,  4 Sep 2019 18:52:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 756EBF803A6; Wed,  4 Sep 2019 18:52:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02B19F8011E
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 18:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02B19F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tJaMPrEv"
Received: from localhost (unknown [122.182.201.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 716E5208E4;
 Wed,  4 Sep 2019 16:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567615962;
 bh=9Zah+m6g12D31+MzrxQoEJQmTT36fHIV8yCjlTJUYRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tJaMPrEvqYdcFCsj9zN3yGuNDA1WKW9qulsgPM92qSQ7297jZ3IMkP2oHx2bW1KYu
 yz/UOTF6a68RmkfsyScEyejzz/A2k08WwRRT0PncYqsp1R/wFyw1cTruHXyo6YiW8/
 uPby00yqAgComZOg2HG/QCkkXaPC9Qtc2p0yaqio=
Date: Wed, 4 Sep 2019 22:21:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190904165129.GB2672@vkoul-mobl>
References: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
 <20190821201720.17768-4-pierre-louis.bossart@linux.intel.com>
 <20190904072131.GK2672@vkoul-mobl>
 <1897e21f-b086-8233-e96e-6024e75a2153@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1897e21f-b086-8233-e96e-6024e75a2153@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Pan Xiuli <xiuli.pan@linux.intel.com>, Keyon Jie <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, srinivas.kandagatla@linaro.org,
 jank@cadence.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 YueHaibing <yuehaibing@huawei.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Rander Wang <rander.wang@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, gregkh@linuxfoundation.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 slawomir.blauciak@intel.com
Subject: Re: [alsa-devel] [RFC PATCH 3/5] ASoC: SOF: Intel: hda: add
 SoundWire IP support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 04-09-19, 08:25, Pierre-Louis Bossart wrote:
> On 9/4/19 2:21 AM, Vinod Koul wrote:
> > On 21-08-19, 15:17, Pierre-Louis Bossart wrote:
> > > The Core0 needs to be powered before the SoundWire IP is initialized.
> > > 
> > > Call sdw_intel_init/exit and store the context. We only have one
> > > context, but depending on the hardware capabilities and BIOS settings
> > > may enable multiple SoundWire links.
> > > 
> > > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > ---
> > >   sound/soc/sof/intel/hda.c | 40 +++++++++++++++++++++++++++++++++------
> > >   sound/soc/sof/intel/hda.h |  5 +++++
> > >   2 files changed, 39 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> > > index a968890d0754..e754058e3679 100644
> > > --- a/sound/soc/sof/intel/hda.c
> > > +++ b/sound/soc/sof/intel/hda.c
> > > @@ -57,6 +57,8 @@ static int hda_sdw_init(struct snd_sof_dev *sdev)
> > >   {
> > >   	acpi_handle handle;
> > >   	struct sdw_intel_res res;
> > > +	struct sof_intel_hda_dev *hdev;
> > > +	void *sdw;
> > >   	handle = ACPI_HANDLE(sdev->dev);
> > > @@ -66,23 +68,32 @@ static int hda_sdw_init(struct snd_sof_dev *sdev)
> > >   	res.irq = sdev->ipc_irq;
> > >   	res.parent = sdev->dev;
> > > -	hda_sdw_int_enable(sdev, true);
> > > -
> > > -	sdev->sdw = sdw_intel_init(handle, &res);
> > > -	if (!sdev->sdw) {
> > > +	sdw = sdw_intel_init(handle, &res);
> > 
> > should this be called for platforms without sdw, I was hoping that some
> > checks would be performed.. For example how would skl deal with this?
> 
> Good point. For now we rely on CONFIG_SOUNDWIRE_INTEL to use a fallback, but
> if the kernel defines this config and we run on an older platform the only
> safety would be the hardware capabilities and BIOS dependencies, I need to
> test if it works.

Yes I am not sure given the experience with BIOS relying on that is a
great idea ! But if that works, that would be better.


> > > diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
> > > index c8f93317aeb4..48e09b7daf0a 100644
> > > --- a/sound/soc/sof/intel/hda.h
> > > +++ b/sound/soc/sof/intel/hda.h
> > > @@ -399,6 +399,11 @@ struct sof_intel_hda_dev {
> > >   	/* DMIC device */
> > >   	struct platform_device *dmic_dev;
> > > +
> > > +#if IS_ENABLED(CONFIG_SOUNDWIRE_INTEL)
> > 
> > is this really required, context is a void pointer

??

> > > +	/* sdw context */
> > > +	void *sdw;
> > 
> > > +#endif

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
