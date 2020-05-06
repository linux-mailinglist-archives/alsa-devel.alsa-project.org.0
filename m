Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 838B11C78D5
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 20:00:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FFCB17AB;
	Wed,  6 May 2020 19:59:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FFCB17AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588788031;
	bh=m0/o8GeMiSAWVfXsftlI4bwVC/e/MXzrM5RUc3fRpfs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rJ5CZmcJ1xNGTEP6QOgqwriGnaSdAbxF9GUjUO0+rLYEyycRvofPL3iyBr+raLJNR
	 ctWUvW0w8VRXyerXXxPFPD0rsqaVM/pbRru2x2G3fZm3ymVHF525K0Rdz6rjpioehq
	 +aSekVveP5Nvhc+0MBDWRFEQtwY8TW12EZ+tklQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16A7FF800DE;
	Wed,  6 May 2020 19:58:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11B0EF80249; Wed,  6 May 2020 19:58:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98192F800DE
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 19:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98192F800DE
IronPort-SDR: pMYZBU4L1Vf5ankoFT831aT/1UwLSbdw2qtA4zmrjZ2asP51VU6kSboI14n786IyRDua2RJ5Z3
 48rldUefYk0Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 10:58:35 -0700
IronPort-SDR: p03coR9whAxFop8IrIThmOCom+2+l1yonxsheZlct63rCTwLIHG4+z6m2rz+WjP7q+eAU0wuEC
 +RYkBycu8SNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="249834219"
Received: from sbhat1-mobl.amr.corp.intel.com (HELO [10.251.3.11])
 ([10.251.3.11])
 by fmsmga007.fm.intel.com with ESMTP; 06 May 2020 10:58:34 -0700
Subject: Re: [PATCH 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-10-alexander.deucher@amd.com>
 <7a675344-e5be-0570-f56e-6def475d19b8@linux.intel.com>
 <DM6PR12MB263348006EAC4B664E7E556F97A40@DM6PR12MB2633.namprd12.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5de8263b-414f-8ef0-1a46-215e9f736161@linux.intel.com>
Date: Wed, 6 May 2020 12:58:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB263348006EAC4B664E7E556F97A40@DM6PR12MB2633.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
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




>>> @@ -233,6 +234,12 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
>>>    		ret = PTR_ERR(adata->pdev);
>>>    		goto unregister_devs;
>>>    	}
>>> +	pm_runtime_set_autosuspend_delay(&pci->dev,
>> ACP_SUSPEND_DELAY_MS);
>>> +	pm_runtime_use_autosuspend(&pci->dev);
>>> +	pm_runtime_set_active(&pci->dev);
>>
>> is the set_active() needed? I haven't seen this in the other PCI audio
>> drivers? >
> We have similar implementation in our Raven ACP PCI driver as well
> which got up streamed.
> I will give a try by modifying this sequence.
> Could you please point me , what's exactly wrong with this code?

you would use pm_runtime_set_active() if the device was suspended. I 
don't think this can possibly happen since there is a _get done by the 
PCI core, which you compensate for in the line below.

Also look at drivers/pci/pci.c, the core already does this set_active() 
and _enable().

void pci_pm_init(struct pci_dev *dev)
{
...

	pm_runtime_forbid(&dev->dev);
	pm_runtime_set_active(&dev->dev);
	pm_runtime_enable(&dev->dev);

>>> +	pm_runtime_put_noidle(&pci->dev);
>>> +	pm_runtime_enable(&pci->dev);
>>
>> same, is the _enable() needed()?
> 
> We have similar implementation in Raven ACP PCI driver as well.

It's quite common unfortunately that extended pm_runtime sequences are 
used without checking what's necessary - it took Intel some time to 
clearly define what we needed and what was redundant/noop.

>>> +	pm_runtime_allow(&pci->dev);
>>>    	return 0;
>>>
>>>    unregister_devs:
>>> @@ -250,6 +257,42 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
>>>    	return ret;
>>>    }
>>>
> 
