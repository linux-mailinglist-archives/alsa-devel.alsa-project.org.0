Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD5E8082FD
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 09:28:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C861D83A;
	Thu,  7 Dec 2023 09:28:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C861D83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701937737;
	bh=QofVFSYs9O79ICYnq3eo2N+6XhGMF2P6AlIdiIAKLE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BX4JBg+DcH1SPuFldgjEe4NwgYHHe5m6kjgK6JypfxrIH58GIPSLltkm3L9uluLD2
	 sh/TkGo3dHM9xIt3+bdWYo+ViwNos41gIcyjgMoF3m8iJqX7qdMryHCya9i+gHBhLj
	 M+Nm7977XcZ9+KjYbeJZmRSwJvwxainOVHry02Pg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C5F6F80494; Thu,  7 Dec 2023 09:28:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C5CFF80570;
	Thu,  7 Dec 2023 09:28:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7CD0F8024E; Thu,  7 Dec 2023 09:25:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_FILL_THIS_FORM_SHORT,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC8C0F800D2
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 09:24:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC8C0F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XhABa1P9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701937500; x=1733473500;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QofVFSYs9O79ICYnq3eo2N+6XhGMF2P6AlIdiIAKLE0=;
  b=XhABa1P9whCIQoVmV5AgzyGHhW+q1qNi9hRHjJ/XDOMAi705Jw1gnsPH
   UOvoVbuUCSbIEXarXBVWXWsWNjLyz4CBG5iYvZ4865UWeTlznxQ4tY352
   6n936jRGsjN1Mg+LNGxR66CBsoh/ZI3p06oQpazlSbcio0ZpSf7TSIjp9
   3AVAljAgt6vHYSRtm3pe9190smDIor2P0qJ1VFCRnEOjgAhl/55U5C2gp
   nbMsF/A8Crcy8zx+bDKsJcDUS2tYtbN4Qp/aL/Rc3DdJhYFbfuLr53dqQ
   5C2sfHPiWITnSlGu8uT7RTrYfpsDkaaYVD7its9+COPlM9aitxtxWu5ro
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1301616"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600";
   d="scan'208";a="1301616"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 00:24:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="862400979"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600";
   d="scan'208";a="862400979"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107])
 ([10.94.8.107])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 00:24:51 -0800
Message-ID: <f4dfebd6-db57-4588-a3fe-ab198d2ac366@linux.intel.com>
Date: Thu, 7 Dec 2023 09:24:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ASoC: soc.h: don't create dummy Component via
 COMP_DUMMY()
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <053ec252-e4df-4ccb-80fd-a802dd212b15@linux.intel.com>
 <87h6kuolii.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87h6kuolii.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6G7VQXZPDPN22XEMEXPHAK3VIMRAIBF5
X-Message-ID-Hash: 6G7VQXZPDPN22XEMEXPHAK3VIMRAIBF5
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6G7VQXZPDPN22XEMEXPHAK3VIMRAIBF5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/7/2023 2:21 AM, Kuninori Morimoto wrote:
> 
> Hi Amadeusz
> 
> Thank you for your feedback
> 
>>> --- a/include/sound/soc.h
>>> +++ b/include/sound/soc.h
>>> @@ -938,7 +938,7 @@ snd_soc_link_to_platform(struct snd_soc_dai_link *link, int n) {
>>>    #define COMP_PLATFORM(_name)		{ .name = _name }
>>>    #define COMP_AUX(_name)			{ .name = _name }
>>>    #define COMP_CODEC_CONF(_name)		{ .name = _name }
>>> -#define COMP_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
>>> +#define COMP_DUMMY()			/* see snd_soc_fill_dummy_dai() */
>>
>> Isn't it effectively making COMP_DUMMY same as COMP_EMPTY, or am I not
>> seeing something? I guess next step could be to just remove all
>> COMP_DUMMY and replace them with COMP_EMPTY to avoid two definitions
>> which are same thing?
> 
> It is a little bit macro magic
> 
> COMP_EMPTY()
> 	static struct snd_soc_dai_link_component name[]	= {{ }},
> 	                                                   ^^^
> COMP_DUMMY()
> 	static struct snd_soc_dai_link_component name[]	= {   },
> 	                                                   ^^^
> EMPTY case will be 1 element array, DUMMY case will be 0 element array.
> So, EMPTY case has empty element, and is not a special/strange array.
> But DUMMY case, it has pointer but 0 size array, very special/strange.
> This patch making this special/strange array on purpose, and convert it
> to asoc_dummy_dlc() on soc-core.c
> Is this good answer for you ?
> 

Yes, thanks!

>>> +		if (dai_link->num_platforms == 0 && dai_link->platforms) {
>>> +			dev_warn(card->dev, "platform don't need dummy Component/DAI\n");
>>
>> I would just replace above print with code comment, no need to spam dmesg.
> 
> OK, will fix in v2
> 
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Renesas Electronics
> Ph.D. Kuninori Morimoto

