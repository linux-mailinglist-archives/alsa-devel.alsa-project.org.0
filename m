Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8262F511C
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 18:29:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F3421694;
	Wed, 13 Jan 2021 18:28:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F3421694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610558940;
	bh=aMdClqp0q2Wm7gTwBwd4XQvIX7LwhrL8elXA2iYk3QQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fqk4tNPGvudXK1y1W0TSVCw+lMAhwWyV8eQCCTAAF9bwJHfegN8mnDtjKK5EKarJ/
	 28h86K1B7qaH/bvzEy1zc/ULnQUIpz+IrJ3nJfnAmIl7sErU8QABGYmZptSU2HzfkH
	 zSM5626+r+nRHcmHa8USN9qXzuaI9nNDZAhIGSPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 560BEF8016D;
	Wed, 13 Jan 2021 18:27:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86C77F801ED; Wed, 13 Jan 2021 18:27:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA5AEF8014D
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 18:27:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA5AEF8014D
IronPort-SDR: G5hM6r0TQRwH5+V1aOfykSjOOnj9eQvk44TQIo6LcTMfysWYk6AmYqKeUJzB80NasxWb/oDXLd
 yaCKdbbtXgWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="158016141"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="158016141"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 09:27:09 -0800
IronPort-SDR: kcXK9+/zSpc9I55EzBpVG6nLYXW4UnDWVaPf+2m9uI0945vxCOJO+0qCegWhBVfcokJ20gX4P6
 nP5DaNjn9lrw==
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="381936687"
Received: from aleung2-mobl1.amr.corp.intel.com (HELO [10.212.198.4])
 ([10.212.198.4])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 09:27:08 -0800
Subject: Re: [PATCH] ASoC: SOF: Intel: initial support to AlderLake-P
To: Takashi Iwai <tiwai@suse.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20210113160704.4106353-1-kai.vehmanen@linux.intel.com>
 <s5heeion6zg.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6047d856-ac8b-af9e-32a7-3700a74b92d7@linux.intel.com>
Date: Wed, 13 Jan 2021 11:27:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5heeion6zg.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, broonie@kernel.org, daniel.baluta@nxp.com
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



On 1/13/21 10:20 AM, Takashi Iwai wrote:
> On Wed, 13 Jan 2021 17:07:04 +0100,
> Kai Vehmanen wrote:
>>
>> Add PCI id for the AlderLake-P.
>>
>> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
>> ---
>>   sound/soc/sof/sof-pci-dev.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
>> index 63b989e3ec40..9c3cb719e268 100644
>> --- a/sound/soc/sof/sof-pci-dev.c
>> +++ b/sound/soc/sof/sof-pci-dev.c
>> @@ -512,6 +512,8 @@ static const struct pci_device_id sof_pci_ids[] = {
>>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
>>   	{ PCI_DEVICE(0x8086, 0x7ad0),
>>   		.driver_data = (unsigned long)&adls_desc},
>> +	{ PCI_DEVICE(0x8086, 0x51c8),
>> +		.driver_data = (unsigned long)&tgl_desc},
> 
> Is it correct?  It's referring to TGL thing and it's not enabled with
> CONFIG_SND_SOC_SOF_ALDERLAKE.

Yes that should be CONFIG_SND_SOC_SOF_TIGERLAKE.

I am starting to think as part of the Kconfig rework we might get rid of 
this granularity. It's not very useful to allow for a single PCI ID to 
be selected, and even internally we keep being confused by the platform 
variants.

What would be more useful is to split by IP versions, that helps 
identify common parts and IP-specific ones. We could have multiple PCI 
drivers, one per IP version, and unconditionally include all PCI IDs for 
that version. See e.g.

https://github.com/thesofproject/linux/pull/2683/commits/aafe349efc105f3dcba58ffff37bf783122e296b#diff-41bcb3c332dacee2f043205995bd688bdeca765334b4ddeba8056ad5735675bcR98

if we removed the #if IS_ENABLED() in that code it'd be a big 
simplification.

I still think it's useful at the Kconfig level to present a 
'user-friendly' option, but internally we should translate to which IP 
version is used and add additional choices (e.g. SoundWire only starts 
with CNL).

