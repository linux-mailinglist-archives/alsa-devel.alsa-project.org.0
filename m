Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4A37617AE
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 13:53:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6691E151D;
	Tue, 25 Jul 2023 13:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6691E151D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690286006;
	bh=k6/u/1XMQpXjvrXgtgebDH12/mWRzw4Bj/4oC6lpoks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tx+q1bByG6e0WWhOU+TBc5YBGZVz19HF17iTNl6QTn9ubL+5V78jhX/mW5Lh4KmIF
	 Asf1dR8fJKc+PlFVEw4j8TQ9hKzjzPm7y/QtkrNEbQ1UPxfsIsc5L91NPAPf5zFYCX
	 ydbtgXNX47lP5WHkNTH8Y60NIneCmAMTul2D4zGc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E429F80570; Tue, 25 Jul 2023 13:51:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F146CF8055A;
	Tue, 25 Jul 2023 13:51:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E86CF80163; Tue, 25 Jul 2023 11:54:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A31DAF80149;
	Tue, 25 Jul 2023 11:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A31DAF80149
Message-ID: <932c4293-375f-685c-2cfd-0bc80fd80683@linux.intel.com>
Date: Tue, 25 Jul 2023 11:54:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/9] ALSA: hda/i915: Allow override of gpu binding.
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
 <20230719164141.228073-3-maarten.lankhorst@linux.intel.com>
 <9b285ede-eaeb-40a2-086d-30cf74185784@linux.intel.com>
 <d75c1902-b715-4a33-1965-ec06d625e3ac@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <d75c1902-b715-4a33-1965-ec06d625e3ac@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: U7NYYVPFGR76PR7NERGKCLVQPSSP7KNQ
X-Message-ID-Hash: U7NYYVPFGR76PR7NERGKCLVQPSSP7KNQ
X-Mailman-Approved-At: Tue, 25 Jul 2023 11:51:33 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7NYYVPFGR76PR7NERGKCLVQPSSP7KNQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey,

On 2023-07-24 12:25, Pierre-Louis Bossart wrote:
> 
> 
> On 7/21/23 14:19, Péter Ujfalusi wrote:
>>
>>
>> On 19/07/2023 19:41, Maarten Lankhorst wrote:
>>> Selecting CONFIG_DRM selects CONFIG_VIDEO_NOMODESET, which exports
>>> video_firmware_drivers_only(). This can be used as a first
>>> approximation on whether i915 will be available. It's safe to use as
>>> this is only built when CONFIG_SND_HDA_I915 is selected by CONFIG_I915.
>>>
>>> It's not completely fool proof, as you can boot with "nomodeset
>>> i915.modeset=1" to make i915 load regardless, or use
>>> "i915.force_probe=!*" to never load i915, but the common case of
>>> booting with nomodeset to disable all GPU drivers this will work as
>>> intended.
>>>
>>> Because of this, we add an extra module parameter,
>>> snd_hda_core.gpu_bind that can be used to signal users intent.
>>> -1 follows nomodeset, 0 disables binding, 1 forces wait/-EPROBE_DEFER
>>> on binding.
>>
>> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>>
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> ---
>>>   sound/hda/hdac_i915.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
>>> index 161a9711cd63e..c32709fa4115f 100644
>>> --- a/sound/hda/hdac_i915.c
>>> +++ b/sound/hda/hdac_i915.c
>>> @@ -11,6 +11,13 @@
>>>   #include <sound/hda_i915.h>
>>>   #include <sound/hda_register.h>
>>>   
>>> +#include <video/nomodeset.h>
>>> +
>>> +static int gpu_bind = -1;
>>> +module_param(gpu_bind, int, 0644);
>>> +MODULE_PARM_DESC(gpu_bind, "Whether to bind sound component to GPU "
>>> +			   "(1=always, 0=never, -1=on nomodeset(default))");
>>> +
>>>   #define IS_HSW_CONTROLLER(pci) (((pci)->device == 0x0a0c) || \
>>>   				((pci)->device == 0x0c0c) || \
>>>   				((pci)->device == 0x0d0c) || \
>>> @@ -121,6 +128,9 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
>>>   {
>>>   	struct pci_dev *display_dev = NULL;
>>>   
>>> +	if (!gpu_bind || (gpu_bind < 0 && video_firmware_drivers_only()))
>>> +		return false;
> 
> 
> Bear with me since I am just going back to work mode but I can't figure
> out what the second part of the test does
> 
> bool video_firmware_drivers_only(void)
> {
> 	return video_nomodeset;
> }
> EXPORT_SYMBOL(video_firmware_drivers_only);
> 
> and video_nomodeset=1 by default, so why would we return false when
> gpu_bind = -1?
> 
> This seems to be a change of functionality, what am I missing?
video_nomodeset is 0 by default, only when nomodeset is given as 
argument is it set to 1. :-)

Cheers,
~Maarten
