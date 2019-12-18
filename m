Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB70C123BFA
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 01:52:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76DBD1615;
	Wed, 18 Dec 2019 01:51:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76DBD1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576630354;
	bh=YSdwp4s1PohdXI4hkYriPJnBZYv5uH3nwJMfTvK1S10=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AW/oqCmHmXizjBkdXvzHt0KDFmZoYAxRhl3qalQVA/Wb8uo7POnZ3wPJHqxiaBAgo
	 4gRL2gH22rhDruFCys2I2s81supcaCrIgV5Eiqif7lQjgQQ9f4Pds4cdkNL71CbRnL
	 y1dDSZszkY13ROvILPEQ1EFDqZq8urvAlUfT8lOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEA4FF80234;
	Wed, 18 Dec 2019 01:50:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2242F80234; Wed, 18 Dec 2019 01:50:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5655FF80100
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 01:50:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5655FF80100
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 16:50:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="209904154"
Received: from dshoemak-mobl.amr.corp.intel.com (HELO [10.251.3.243])
 ([10.251.3.243])
 by orsmga008.jf.intel.com with ESMTP; 17 Dec 2019 16:50:42 -0800
To: Takashi Iwai <tiwai@suse.de>
References: <20191126141423.21523-1-pierre-louis.bossart@linux.intel.com>
 <s5h4kyqzpge.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0131b134-46dc-991f-230b-fe843f43f078@linux.intel.com>
Date: Tue, 17 Dec 2019 18:50:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <s5h4kyqzpge.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Intel: add PCI ID for
	CometLake-S
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


>> diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
>> index bbeffd932de7..0b39ea6117cf 100644
>> --- a/sound/soc/sof/sof-pci-dev.c
>> +++ b/sound/soc/sof/sof-pci-dev.c
>> @@ -417,6 +417,10 @@ static const struct pci_device_id sof_pci_ids[] = {
>>   	{ PCI_DEVICE(0x8086, 0x06c8),
>>   		.driver_data = (unsigned long)&cml_desc},
>>   #endif
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_S)
>> +	{ PCI_DEVICE(0x8086, 0xa3f0),
>> +		.driver_data = (unsigned long)&cml_desc},
>> +#endif
>>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
>>   	{ PCI_DEVICE(0x8086, 0xa0c8),
>>   		.driver_data = (unsigned long)&tgl_desc},

Sorry Takashi, I was checking why this patch wasn't merged and only 
realized now that I missed your feedback (likely an effect of the 
Thanksgiving holiday).

> I guess the change in ifdef for cml_desc definition is still missing.

Not sure what change you are referring to?

> But, I wonder whether it'd be simpler to have Kconfigs only per
> sof_dev_desc?  That is, have CONFIG_SND_SOC_SOF_COMETLAKE, and all CML
> model PCI entries are enabled by that as long as they use the same
> cml_desc definition.

it's difficult to have a classification that's complete and accurate, 
some PCH versions are reused in products that use a different family 
name. For example you will find the same PCI ID for CNL and WHL, and in 
others the -H, -U and -Y skews are not identical. Even Intel folks get 
lost at times, myself included.

For now we prefer having one Kconfig per PCI ID, and we try to provide a 
name for the Kconfig that is the most accurate without being cryptic. 
One of the reasons for having different Kconfigs is that we have 
multiple versions of the audio IP, and the ability to narrow the 
selection to a single device helps make sure the code is in the right 
place/module and dependencies are correct.

> Also, can we reduce even the ifdef around sof_dev_desc definitions by
> __maybe_unused atttribute?

Sorry, I am not following your suggestion. I would really like to keep 
the ifdefs for now, and while it can be seen as overkill to have 
descriptors that are identical in some cases the past experience shows 
it's useful when we have to add quirks for specific 'hardware 
recommended programming sequences'.

Thanks,
-Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
