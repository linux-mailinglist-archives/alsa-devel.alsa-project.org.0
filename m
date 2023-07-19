Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ABA75C0C1
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE5C2112;
	Fri, 21 Jul 2023 10:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE5C2112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689926717;
	bh=u7pl41cx1E9pSqKdR5uyMPbKntCtWP0OWuxw4zXSz0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SV61UUZEZx+/VPhVmENtyJAJgSZ2gO2Wv4VJ7gTv9aZc4So9fvEBal+Y7Hk42XRR5
	 09a54jTsaKCZsRrhVL85rNSkPGpMgUC6yDjsgLOk7FYawNh55Lk68rgbji4p+gNrDs
	 y7lsnZL6Rk8ZscCjnPABIrwAaUvG+hUK+e19pSw8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18E96F80494; Fri, 21 Jul 2023 10:04:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2A8DF8032D;
	Fri, 21 Jul 2023 10:04:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E96FF8032D; Wed, 19 Jul 2023 18:00:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B84CF8007E;
	Wed, 19 Jul 2023 17:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B84CF8007E
Message-ID: <5cd0d41b-8307-9db3-fb4f-037b181a390d@linux.intel.com>
Date: Wed, 19 Jul 2023 17:59:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: SOF: Intel: Remove deferred probe for SOF
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Alsa-devel <alsa-devel@alsa-project.org>,
 sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Matthew Auld <matthew.auld@intel.com>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
 <20230718084522.116952-7-maarten.lankhorst@linux.intel.com>
 <alpine.DEB.2.22.394.2307181922160.3532114@eliteleevi.tm.intel.com>
 <874jm0modf.wl-tiwai@suse.de>
 <66d22637-069f-5262-2249-6041ef9d4614@linux.intel.com>
 <875y6g5feo.wl-tiwai@suse.de>
 <2ed288d0-c8fe-1856-dbe9-74f4f7c075ba@linux.intel.com>
 <04ed7ed8-8a8d-427a-84e1-a326feee5547@sirena.org.uk>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <04ed7ed8-8a8d-427a-84e1-a326feee5547@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UEBSUYOFZILBB2PU2FTYHVG63IT4LCZ7
X-Message-ID-Hash: UEBSUYOFZILBB2PU2FTYHVG63IT4LCZ7
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:04:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEBSUYOFZILBB2PU2FTYHVG63IT4LCZ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey,

On 2023-07-19 14:39, Mark Brown wrote:
> On Wed, Jul 19, 2023 at 02:13:59PM +0200, Maarten Lankhorst wrote:
>>
>> On 2023-07-19 13:06, Takashi Iwai wrote:
>>> On Wed, 19 Jul 2023 11:48:06 +0200,
>>> Maarten Lankhorst wrote:
>>>>
>>>>       The 60 seconds timeout is a thing "better than complete disablement",
>>>>       so it's not ideal, either.  Maybe we can add something like the
>>>>       following:
>>>>       - Check when the deferred probe takes too long, and warn it
>>>>       - Provide some runtime option to disable the component binding, so
>>>>         that user can work around it if needed
>>>> A module option to snd_hdac_i915_init would probably be the least of all evils
>>>> here.
>>>
>>> Yes, probably it's the easiest option and sufficient.
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>> Hey,
>>
>> Patch below, can be applied immediately iresspective of the other patches.
>>
>> ---->8----------
>>
>> Selecting CONFIG_DRM selects CONFIG_VIDEO_NOMODESET, which exports
>> video_firmware_drivers_only(). This can be used as a first approximation
>> on whether i915 will be available. It's safe to use as this is only built
> 
> Please don't bury new patches in the middle of mails, it just makes it
> hard to apply the patch since tooling doesn't understand what's going
> on.
> 
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.
I will send a new version in a bit, with all comments addressed.

I need to finish testing first.

~Maarten
