Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1302E1679A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 18:15:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CE6517EE;
	Tue,  7 May 2019 18:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CE6517EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557245711;
	bh=RbYZxA/ZhQ7CFaxT9OWkiJBpfQwC8HpuaOxdyGBJ8bM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OwySbfO/OBx3HPw75/hF/pm0OaD5b06/QZHtvczuirCeopEgJVwt8CkZh0ghpDvw8
	 IbD2WyIeiIKI675HO5Dn9a0l7qRR5yvTM11LYTgu732lOo96Xb9uWjItIDF1nqzrDP
	 cCuIWWjN7PaFgNFItgS1wGud+ceGSbt8latowamE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10C6EF89727;
	Tue,  7 May 2019 18:12:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E0F5F89678; Tue,  7 May 2019 18:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 333D7F89674
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 18:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 333D7F89674
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 09:12:47 -0700
X-ExtLoop1: 1
Received: from jcsedaya-mobl1.amr.corp.intel.com (HELO [10.255.228.16])
 ([10.255.228.16])
 by orsmga005.jf.intel.com with ESMTP; 07 May 2019 09:12:46 -0700
To: kbuild test robot <lkp@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
References: <201905072128.M0UIELnr%lkp@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <53f05fee-48d0-3ba3-56d3-2624f20e9f1e@linux.intel.com>
Date: Tue, 7 May 2019 10:57:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <201905072128.M0UIELnr%lkp@intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, kbuild-all@01.org
Subject: Re: [alsa-devel] [asoc:for-5.2 248/316] sound/soc/sof/core.c:279:
 undefined reference to `sof_nocodec_setup'
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



On 5/7/19 8:28 AM, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2
> head:   f153bf49ddf6169544b24ef5ea26fa3eb4996b95
> commit: 7e978fa37df7f771a5d02934ff828a0ee36bcf11 [248/316] ASoC: SOF: Add Build support for SOF core and Intel drivers
> config: i386-randconfig-l1-05071509 (attached as .config)
> compiler: gcc-5 (Debian 5.5.0-3) 5.4.1 20171010
> reproduce:
>          git checkout 7e978fa37df7f771a5d02934ff828a0ee36bcf11
>          # save the attached .config to linux build tree
>          make ARCH=i386
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     ld: sound/soc/sof/core.o: in function `sof_machine_check':
>>> sound/soc/sof/core.c:279: undefined reference to `sof_nocodec_setup'

Ack. this is a confusion between if (IS_ENABLED(SND_SOC_SOF_NOCODEC)) 
and #if IS_ENABLED(SND_SOC_SOF_NOCODEC)

Will send a formal fix shortly.

> 
> vim +279 sound/soc/sof/core.c
> 
> c16211d6 Liam Girdwood 2019-04-12  255
> c16211d6 Liam Girdwood 2019-04-12  256  /*
> c16211d6 Liam Girdwood 2019-04-12  257   * SOF Driver enumeration.
> c16211d6 Liam Girdwood 2019-04-12  258   */
> c16211d6 Liam Girdwood 2019-04-12  259  static int sof_machine_check(struct snd_sof_dev *sdev)
> c16211d6 Liam Girdwood 2019-04-12  260  {
> c16211d6 Liam Girdwood 2019-04-12  261  	struct snd_sof_pdata *plat_data = sdev->pdata;
> c16211d6 Liam Girdwood 2019-04-12  262  	struct snd_soc_acpi_mach *machine;
> c16211d6 Liam Girdwood 2019-04-12  263  	int ret;
> c16211d6 Liam Girdwood 2019-04-12  264
> c16211d6 Liam Girdwood 2019-04-12  265  	if (plat_data->machine)
> c16211d6 Liam Girdwood 2019-04-12  266  		return 0;
> c16211d6 Liam Girdwood 2019-04-12  267
> c16211d6 Liam Girdwood 2019-04-12  268  	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)) {
> c16211d6 Liam Girdwood 2019-04-12  269  		dev_err(sdev->dev, "error: no matching ASoC machine driver found - aborting probe\n");
> c16211d6 Liam Girdwood 2019-04-12  270  		return -ENODEV;
> c16211d6 Liam Girdwood 2019-04-12  271  	}
> c16211d6 Liam Girdwood 2019-04-12  272
> c16211d6 Liam Girdwood 2019-04-12  273  	/* fallback to nocodec mode */
> c16211d6 Liam Girdwood 2019-04-12  274  	dev_warn(sdev->dev, "No ASoC machine driver found - using nocodec\n");
> c16211d6 Liam Girdwood 2019-04-12  275  	machine = devm_kzalloc(sdev->dev, sizeof(*machine), GFP_KERNEL);
> c16211d6 Liam Girdwood 2019-04-12  276  	if (!machine)
> c16211d6 Liam Girdwood 2019-04-12  277  		return -ENOMEM;
> c16211d6 Liam Girdwood 2019-04-12  278
> c16211d6 Liam Girdwood 2019-04-12 @279  	ret = sof_nocodec_setup(sdev->dev, plat_data, machine,
> c16211d6 Liam Girdwood 2019-04-12  280  				plat_data->desc, plat_data->desc->ops);
> c16211d6 Liam Girdwood 2019-04-12  281  	if (ret < 0)
> c16211d6 Liam Girdwood 2019-04-12  282  		return ret;
> c16211d6 Liam Girdwood 2019-04-12  283
> c16211d6 Liam Girdwood 2019-04-12  284  	plat_data->machine = machine;
> c16211d6 Liam Girdwood 2019-04-12  285
> c16211d6 Liam Girdwood 2019-04-12  286  	return 0;
> c16211d6 Liam Girdwood 2019-04-12  287  }
> c16211d6 Liam Girdwood 2019-04-12  288
> 
> :::::: The code at line 279 was first introduced by commit
> :::::: c16211d6226dbde8819b84da07508083a1138a06 ASoC: SOF: Add Sound Open Firmware driver core
> 
> :::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
> :::::: CC: Mark Brown <broonie@kernel.org>
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
