Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9BB770528
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 17:48:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2137420C;
	Fri,  4 Aug 2023 17:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2137420C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691164129;
	bh=4efVL8CsNKKKpHCJ0hTgIbsnya7V3WE/VEoZGEOV3YQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SYz9xeHRDsm+d5a7cBOZPX277dXvdGl8l2f716g6QRk5NLFJeNjJPl0YvSilVe478
	 I0qhxf9LfBg/meuAB7cytaZgLIHiwT8Qk1L/9uwKJQRkw/QdqucCzVN1iouSRsU5jZ
	 jPRr8FYXLLS1pbMD5kcaYmv0RdmNEXvw1rEjfI0c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35542F8053B; Fri,  4 Aug 2023 17:47:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBCD5F801D5;
	Fri,  4 Aug 2023 17:47:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B824F8025A; Fri,  4 Aug 2023 17:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F13B0F80087
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 17:47:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F13B0F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LJvnCele
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691164070; x=1722700070;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4efVL8CsNKKKpHCJ0hTgIbsnya7V3WE/VEoZGEOV3YQ=;
  b=LJvnCeleNv5phMZJ2eDQ7P/m732WzQGY1vE+0zH+odbslymQkfUgen/h
   +IgfGLvsC2Q53X3k3wvzJ1X/LGZdja4Z7e/0xl0tPB3SVvze625fEbFRQ
   dafL5REg08/doOHD3Q2OlPqhPvYE9wguJLgUEqCmHN/aAeUuPwFRV+N1o
   yGXy1dXNAx+RZTpclqRF7VZPSME1uju2t+8if/fc7m0sWzTK3tATmm0my
   dCkRcpo/bEQCcqBkPUJWDgOvCKSa116wMk7CnkHC99xBXELVFhlf2mdkR
   02IjLVTUbwrVF7bcH+38IHVu39rGKJ6yZ6+/Px22sUIQBRHOrCrtH5Epv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="355115198"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200";
   d="scan'208";a="355115198"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 08:47:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="820174327"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200";
   d="scan'208";a="820174327"
Received: from tbonamo-mobl.amr.corp.intel.com (HELO [10.212.96.176])
 ([10.212.96.176])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 08:47:46 -0700
Message-ID: <504e9b36-4a7f-65ab-d506-88968100f727@linux.intel.com>
Date: Fri, 4 Aug 2023 10:28:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: lower "no backend DAIs enabled for ... Port" log
 severity
To: Hans de Goede <hdegoede@redhat.com>, Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
References: <20230804132628.302385-1-hdegoede@redhat.com>
 <63eec3cf-ebba-a366-a66b-34daf76bc0f2@linux.intel.com>
 <878raqq36t.wl-tiwai@suse.de>
 <9baef866-07e4-ddea-c495-bb5f924f5ab9@redhat.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <9baef866-07e4-ddea-c495-bb5f924f5ab9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 55MIYLPNOFH3GJZPA2JNTDAJ5S5WCOTM
X-Message-ID-Hash: 55MIYLPNOFH3GJZPA2JNTDAJ5S5WCOTM
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> Maybe, but it's a questionable flow if pipewire tries to open stuff
>>> without the mixer values set-up. Is there something done about this?
> 
> I'm working with the pipewire folks to see if we can fix this on
> pipewire's side too:
> 
> Link: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3407
> 
>> I think it's an oft-seen problem when user runs the system without
>> installing a proper UCM profile.
>>
>>> The reason why I am pushing back is that we had a similar issue with
>>> HDaudio where HDMI/DP PCM devices were opened without checking if the
>>> jack was connected.
>>>
>>> It really makes no sense for userspace to try and open devices that are
>>> known to be problematic. We can push kernel error logs below the rug, it
>>> doesn't make the programming flows better.
>>
>> Downgrading the message also hides to show what's wrong there.
>> Although the message doesn't indicate how to fix the problem, no
>> message would make debug harder.
>>
>> So in general I agree that it's annoying and it should be fixed, but
>> hiding all as default can be bad, too.  Maybe we can introduce a
>> counter and shut out after three strikes?
> 
> Right, this also happens with unsupported codecs (either unsupported in the kernel or no UCM profile available yet). So making this less "chatty" would be good.
> 
> I would prefer to just go for only log this once rather then
> three strikes though, then we can simply use 'dev_err_once()'
> for this.

I'd be fine with dev_err_once(). In general when you have this error 
it's a telltale sign that a configuration is missing. Repeating the 
message does not makes things better.

Maybe also add some information for the user, e.g. "ASoC: no backend 
DAIs enabled for Baytrail Audio Port, possibly missing ALSA mixer-based 
routing or UCM profile"

