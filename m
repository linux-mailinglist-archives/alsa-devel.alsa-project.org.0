Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2FE48DAE6
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 16:45:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A4161FB2;
	Thu, 13 Jan 2022 16:44:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A4161FB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642088736;
	bh=m75ld79nt8TPm8DDWMvOut/woD0VIiTUU3VSnhxSZAQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TavMGOy8A7WICgfsIYdocMHmR97NX6lspw6kYsuEMAvZysIXXaNQrEXavZvP3ATRA
	 qGBE/CoGJM37oUqzOGUy0HGqWK0q5RfK4VfcMGFUxmf10DwVix1YIFPrkEIJFx0zUR
	 9ijPd8QcK3gh+sq9CQrruRs+n0wIQD1jpZwwUoJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE832F80141;
	Thu, 13 Jan 2022 16:44:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5011F8013F; Thu, 13 Jan 2022 16:44:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BB0BF800B9
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 16:44:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BB0BF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RUj4XTu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642088660; x=1673624660;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=m75ld79nt8TPm8DDWMvOut/woD0VIiTUU3VSnhxSZAQ=;
 b=RUj4XTu7319adLfTsWX0TNqmUunkpYyTM/cUYoX9/uQZtzEKFM+Yz4/6
 2F+cWC51miq7X6nDWuVjPrdV+6GR7286FPiBOx7j02Rc9r7ElEr+dLuxJ
 kB06dOzEh8tmle0zl2hIedTnDSk1a8p0/KuhCbykQJovT5NXY5AVh1ROk
 fNlcG0ttqbcO5H5Wiu4AJi15VTnJat3igKXJPf2rUsSUhZNkI+jaMAEUi
 yhT5pP5NADgVF7x86tq/AdZEMziNhgiZICMN7ms6sBEkFKoTdvyv5V+Po
 luyEp1cPEIyAJ4CndZ25D+gk4Bi2p3uXhpYiIQymHVkj+8qtgU453pSQO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="243988130"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="243988130"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 07:44:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="620639268"
Received: from ypchen-mobl.amr.corp.intel.com (HELO [10.212.66.70])
 ([10.212.66.70])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 07:44:11 -0800
Subject: Re: [PATCH 3/6] ASoC: amd: acp: Add generic PCI driver module for ACP
 device
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220113092842.432101-1-AjitKumar.Pandey@amd.com>
 <20220113092842.432101-4-AjitKumar.Pandey@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9da4d004-5fc3-125a-4e60-f0a6a4007d2b@linux.intel.com>
Date: Thu, 13 Jan 2022 09:27:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113092842.432101-4-AjitKumar.Pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Alexander.Deucher@amd.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <vsujithkumar.reddy@amd.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Bard Liao <bard.liao@intel.com>
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


> +static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
> +{
> +	struct platform_device_info pdevinfo;
> +	struct device *dev = &pci->dev;
> +	const struct resource *res_acp;
> +	struct acp_chip_info *chip;
> +	struct resource *res;
> +	unsigned int flag, addr, num_res, i;
> +	int ret;
> +
> +	flag = snd_amd_acp_find_config(pci);
> +	if (flag != FLAG_AMD_LEGACY)
> +		return -ENODEV;
> +
> +	chip = devm_kzalloc(&pci->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	if (pci_enable_device(pci)) {
> +		dev_err(&pci->dev, "pci_enable_device failed\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = pci_request_regions(pci, "AMD ACP3x audio");
> +	if (ret < 0) {
> +		dev_err(&pci->dev, "pci_request_regions failed\n");
> +		return -ENOMEM;
> +	}
> +
> +	pci_set_master(pci);
> +
> +	switch (pci->revision) {
> +	case 0x01:
> +		res_acp = acp3x_res;
> +		num_res = ARRAY_SIZE(acp3x_res);
> +		chip->name = "acp_asoc_renoir";
> +		chip->acp_rev = ACP3X_DEV;
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported device revision:0x%x\n", pci->revision);
> +		return -EINVAL;
> +	}
> +
> +	dmic_dev = platform_device_register_data(dev, "dmic-codec", PLATFORM_DEVID_NONE, NULL, 0);
> +	if (IS_ERR(dmic_dev)) {
> +		dev_err(dev, "failed to create DMIC device\n");
> +		return PTR_ERR(dmic_dev);
> +	}

Past this point, any error handling needs to use
platform_device_unregister(dmic_dev);
...

> +	addr = pci_resource_start(pci, 0);
> +	chip->base = devm_ioremap(&pci->dev, addr, pci_resource_len(pci, 0));
> +
> +	res = devm_kzalloc(&pci->dev, sizeof(struct resource) * num_res, GFP_KERNEL);
> +	if (!res)
> +		return -ENOMEM;

...which is missed here.

> +
> +	for (i = 0; i < num_res; i++, res_acp++) {
> +		res[i].name = res_acp->name;
> +		res[i].flags = res_acp->flags;
> +		res[i].start = addr + res_acp->start;
> +		res[i].end = addr + res_acp->end;
> +		if (res_acp->flags == IORESOURCE_IRQ) {
> +			res[i].start = pci->irq;
> +			res[i].end = res[i].start;
> +		}
> +	}
> +
> +	memset(&pdevinfo, 0, sizeof(pdevinfo));
> +
> +	pdevinfo.name = chip->name;
> +	pdevinfo.id = 0;
> +	pdevinfo.parent = &pci->dev;
> +	pdevinfo.num_res = num_res;
> +	pdevinfo.res = &res[0];
> +	pdevinfo.data = chip;
> +	pdevinfo.size_data = sizeof(*chip);
> +
> +	pdev = platform_device_register_full(&pdevinfo);
> +	if (IS_ERR(pdev)) {
> +		dev_err(&pci->dev, "cannot register %s device\n", pdevinfo.name);
> +		platform_device_unregister(dmic_dev);
> +		ret = PTR_ERR(pdev);
> +	}
> +
> +	return ret;
> +};

