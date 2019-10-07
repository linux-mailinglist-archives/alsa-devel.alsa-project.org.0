Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F65CE99E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 18:46:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA19D15E0;
	Mon,  7 Oct 2019 18:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA19D15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570466761;
	bh=hrvuAq+nunreJyovlOD9qgF+IpVYTOsNdWwcDBqwJPE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GVZGHqCvfuTtMJA4Jalgz3FgUmOMOKHUDHBmKUO3iyAb1z/CoDU+r3m8bsVjbPghb
	 yydfTvv3TB0nw1zx+Hpx7+gTaX44rSNl8fP2tEg2svHVq9ToyINfSiJKJNMAM3CtFe
	 Ep8kdnygUYmzRyQbJkuR3fbLcIK2anHI4NdQnb0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E0D7F802BD;
	Mon,  7 Oct 2019 18:44:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32B47F802BE; Mon,  7 Oct 2019 18:44:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDFEDF80273
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 18:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDFEDF80273
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 09:44:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,268,1566889200"; d="scan'208";a="222965624"
Received: from cbeck2-t460s.amr.corp.intel.com (HELO [10.255.228.186])
 ([10.255.228.186])
 by fmsmga002.fm.intel.com with ESMTP; 07 Oct 2019 09:44:05 -0700
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191006152232.17701-1-perex@perex.cz>
 <fd997c93-c7c9-6ede-90c2-a94df93a613e@linux.intel.com>
 <d79e7cdd-2f94-1f00-0025-907682ab9988@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ad1e5360-6eb6-c22c-b29a-b990447e2d14@linux.intel.com>
Date: Mon, 7 Oct 2019 11:44:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d79e7cdd-2f94-1f00-0025-907682ab9988@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [alsa-devel] [PATCH v3] ALSA: hda: add Intel DSP configuration
 / probe code
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


>>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
>>> +	{
>>> +		.flags = FLAG_SOF,
>>
>> can we have more than one table per PCI ID? e.g. in this case it'd be
>> good to have the DMIC case separate from Google.
> 
> Yes, first match wins. So we need to add flags = FLAG_SOF |
> FLAG_SOF_ONLY_IF_DMIC entry bellow the dmi exceptions for device == 0x3198, too?

I need to check this, I am not sure if the firmware (Coreboot or Legacy) 
includes the NHLT definitions.
> 
>>
>>> +		.device = 0x3198,
>>> +		.dmi_table = (const struct dmi_system_id []) {
>>> +			{
>>> +				.ident = "Google Chromebooks",
>>> +				.matches = {
>>> +					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
>>> +				}
>>> +			},
>>> +			{}
>>> +		}
>>> +	},
>>> +#endif
>>> +#if IS_ENABLED(CONFIG_SND_SOC_INTEL_GLK)
>>
>> should it be elif, as done for CometLake/CML?
> 
> I though that the SST driver is the default for 0x3198. Or the legacy driver
> is in the game, too? If yes, we need to add conditional SST entries.

I am not aware of any GLK platform where the SST driver is required.

let me work off-line on a list of quirks that are needed.

> 
>>> +	{
>>> +		.flags = FLAG_SST,
>>> +		.device = 0x3198,
>>> +	},
>>> +#endif
>>> +/* Icelake */
>>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
>>> +	{
>>> +		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
>>> +		.device = 0x34c8,
>>> +	},
>>> +#endif
>>> +/* Elkhart Lake */
>>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
>>> +	{
>>> +		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
>>> +		.device = 0x4b55,
>>> +	},
>>> +#endif
>>> +/* Appololake (Broxton-P) */
>>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
>>> +	{
>>> +		.flags = FLAG_SOF,
>>> +		.device = 0x5a98,
>>> +		.dmi_table = (const struct dmi_system_id []) {
>>> +			{
>>> +				.ident = "Up Squared",
>>> +				.matches = {
>>> +					DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
>>> +					DMI_MATCH(DMI_BOARD_NAME, "UP-APL01"),
>>> +				}
>>> +			},
>>> +			{}
>>> +		}
>>> +	},
>>> +#endif
>>> +#if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
>>
>> elif?
> 
> Same. What's the default driver for APL?

Should be legacy except for Chromebooks where it's SST.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
