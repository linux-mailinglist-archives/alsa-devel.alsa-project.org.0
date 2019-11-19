Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF37102C84
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 20:24:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44F3E1694;
	Tue, 19 Nov 2019 20:24:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44F3E1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574191490;
	bh=OuDxn5xlnk8n1Ka2lryGUzqBH9J2UTB/aRFWfVFLP7s=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sVbwjAAZA+koKbCDV4dpF31T7YUmIJoy+DTfg6kb41qbGkFvju1avAwwMYw3uXNMf
	 +S3LK7A7hWESLu7prAsiYiZ0N3CmWZod8TQRfDRUND7ra3cCNOaAACPKjA8gwMLVMX
	 Ps911P5kv9cvEusW3mJnmOyccdZAEJElTfctjNFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8FECF80138;
	Tue, 19 Nov 2019 20:23:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EE13F80138; Tue, 19 Nov 2019 20:23:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A531AF80135
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 20:23:00 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7674AA0042;
 Tue, 19 Nov 2019 20:23:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7674AA0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574191380; bh=n2Qos8wSJGH52jgki5Ix9arG/islahBl4AHxRTGAuV0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mBD6pswB9RH7Zn7l9jAb2PqPtWdrOzTv/adjhlMUi9pFaPlx0X9SirVDKxzCE3i+a
 rOSAs728TNwVbEh+79dONbaEF8/EchAbEPzxPUKN2liQqAe/zkErD2N1qU8tli0bqK
 BAENfsI9hIE9kVWMWE1+Z8R6Ya+Dxar7vkxMPRbs=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 19 Nov 2019 20:22:56 +0100 (CET)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191119174933.25526-1-perex@perex.cz>
 <20191119174933.25526-2-perex@perex.cz>
 <72dfc285-70e8-706d-3018-535bda1e8630@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f2de9597-c9c2-7696-622b-a2bbc2c32bb7@perex.cz>
Date: Tue, 19 Nov 2019 20:22:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <72dfc285-70e8-706d-3018-535bda1e8630@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: Intel - use control components
 to describe card config
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

Dne 19. 11. 19 v 20:12 Pierre-Louis Bossart napsal(a):
> 
> 
> On 11/19/19 11:49 AM, Jaroslav Kysela wrote:
>> Use the control interface (field 'components' in the info structure)
>> to pass the I/O configuration details. The long card name might
>> be used in GUI. This information should be hidden.
>>
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Cc: Mark Brown <broonie@kernel.org>
>> ---
>>    sound/soc/intel/Kconfig                |  9 +++++++++
>>    sound/soc/intel/boards/bytcht_es8316.c | 16 ++++++++++++----
>>    sound/soc/intel/boards/bytcr_rt5640.c  | 14 +++++++++++---
>>    sound/soc/intel/boards/bytcr_rt5651.c  | 26 ++++++++++++++++----------
>>    4 files changed, 48 insertions(+), 17 deletions(-)
>>
>> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
>> index c8de0bb5bed9..3421957adedb 100644
>> --- a/sound/soc/intel/Kconfig
>> +++ b/sound/soc/intel/Kconfig
>> @@ -47,6 +47,15 @@ config SND_SOC_INTEL_SST_FIRMWARE
>>    	# Haswell/Broadwell/Baytrail legacy and will be set
>>    	# when these platforms are enabled
>>    
>> +config SND_SOC_INTEL_USE_CTL_COMPONENTS
>> +	bool "Use CTL components for I/O configuration"
>> +	help
>> +	  Some drivers might pass the I/O configuration through the
>> +	  soundcard's driver name in the control user space API.
>> +	  The new scheme is to put this information to the components
>> +	  field in the ALSA's card info structure. Say Y, if you
>> +	  have ALSA user space version 1.2.2+.
>> +
> 
> If this is at the board level, then maybe move this to
> sound/soc/intel/boards/Kconfig
> 
> I am not sure about the alsa-lib dependency, it's a bit odd, isn't it?
> shouldn't this be handled via protocol versions? or a configuration
> provided by alsa-lib somehow?

It's not about the protocol. It's about to move this type of information to 
another place. I can remove the ALSA version sentence from the help, because 
it's just a hint. I would like to create ucm2 configurations based on this 
rather than the misused long card names.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
