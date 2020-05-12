Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A19AA1CF943
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 17:33:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 130E916AB;
	Tue, 12 May 2020 17:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 130E916AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589297634;
	bh=K9ORSLHie1QDJwKh1q7BIlIGS2Qij0sOklhwRE5S7Xo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WDof1EjpDyIHuXsySn4chHZyVZ/fR0RzsLXBPlumgG9fRiTFh7t+vgnmZtd3ivcH2
	 3TP83fshhbW2JIMtD1pHk3VFUF599cIEuhnBKCk3HYNTucPwto/KDT+HBcbLb4rkJS
	 mGjpjbFyap0HmnQoG1LpsO2vtvypdNCWe8Qk1+HM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60223F800E3;
	Tue, 12 May 2020 17:31:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9DD9F80158; Tue, 12 May 2020 17:30:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4145F80112
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 17:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4145F80112
IronPort-SDR: +yFpf3VzeFWaLSQCKikNVF8F6R6TtAKtwNYMd440QbnpQQif86a7O3NRZ6SomK8D16/IAfUwtB
 2XGGqEiTFxug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2020 08:30:26 -0700
IronPort-SDR: qImuXtlVbuMp4uqZuo8ZJSer0opO/EFYN33kRQrOVCa6SYie+oFRp1NpSA5u7hNuKPsTyG7RTl
 4oKL8sKEVEjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; d="scan'208";a="409336652"
Received: from bmtannen-mobl.amr.corp.intel.com (HELO [10.255.228.231])
 ([10.255.228.231])
 by orsmga004.jf.intel.com with ESMTP; 12 May 2020 08:30:25 -0700
Subject: Re: [PATCH v2 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
To: Alex Deucher <alexdeucher@gmail.com>
References: <20200511212014.2359225-1-alexander.deucher@amd.com>
 <20200511212014.2359225-10-alexander.deucher@amd.com>
 <3c131eb1-9f5c-fd37-687c-182888774e08@linux.intel.com>
 <CADnq5_NHzg5dVhbx9ZqNDgVZVWfGaUteVtxLRORCXVM6UOP1nQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <565ebd07-e515-c84c-f4c5-7997dbac308b@linux.intel.com>
Date: Tue, 12 May 2020 10:16:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_NHzg5dVhbx9ZqNDgVZVWfGaUteVtxLRORCXVM6UOP1nQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Alex Deucher <alexander.deucher@amd.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <vijendar.mukunda@amd.com>
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



On 5/12/20 8:46 AM, Alex Deucher wrote:
> On Mon, May 11, 2020 at 6:37 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>> @@ -233,6 +234,11 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
>>>                ret = PTR_ERR(adata->pdev);
>>>                goto unregister_devs;
>>>        }
>>> +     pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
>>> +     pm_runtime_use_autosuspend(&pci->dev);
>>> +     pm_runtime_allow(&pci->dev);
>>> +     pm_runtime_mark_last_busy(&pci->dev);
>>> +     pm_runtime_put_autosuspend(&pci->dev);
>>
>> usually there is a pm_runtime_put_noidle() here?
> 
> I'm not sure.
> 
>>
>> [...]
>>
>>>    static void snd_rn_acp_remove(struct pci_dev *pci)
>>>    {
>>>        struct acp_dev_data *adata;
>>> @@ -260,6 +302,9 @@ static void snd_rn_acp_remove(struct pci_dev *pci)
>>>        ret = rn_acp_deinit(adata->acp_base);
>>>        if (ret)
>>>                dev_err(&pci->dev, "ACP de-init failed\n");
>>> +     pm_runtime_put_noidle(&pci->dev);
>>> +     pm_runtime_get_sync(&pci->dev);
>>> +     pm_runtime_forbid(&pci->dev);
>>
>> doing a put_noidle() followed by a get_sync() and immediately forbid()
>> is very odd at best.
>> Isn't the recommendation to call get_noresume() here?
>>
> 
> I'm not sure here either.  Is there some definitive documentation on
> what exact sequences are supposed to be used in drivers?  A quick
> browse through drivers that implement runtime pm seems to show a lot
> of variation.  This sequence works.  I'm not sure if it's optimal or
> not.

We based our sequence on the comments in drivers/pci/pci-driver.c

/*
  * Unbound PCI devices are always put in D0, regardless of
  * runtime PM status.  During probe, the device is set to
  * active and the usage count is incremented.  If the driver
  * supports runtime PM, it should call pm_runtime_put_noidle(),
  * or any other runtime PM helper function decrementing the usage
  * count, in its probe routine and pm_runtime_get_noresume() in
  * its remove routine.
  */

