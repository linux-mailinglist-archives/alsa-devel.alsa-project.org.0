Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FFA8A3605
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 20:52:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD36C27AB;
	Fri, 12 Apr 2024 20:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD36C27AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712947926;
	bh=XXFPVsizfUKlbLYg75o726rqFYPfLrkYyKabptRENuY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OgeH4PekD6y9zOVc4IogGSU6uv7xcBqpN7+JT+cSTI1jXbkLRqSGPLB/MU83C7b4K
	 qUKpXPi0JFVGMN/7XsKE+P868MRqKnvjXO9pMvMTf/m+mwEMrw5toh4I/ZBicc2BpO
	 PLhL4jvCEpqKPqdRz5MwilT5HHCx4RByHR4FvglA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5A5AF805D5; Fri, 12 Apr 2024 13:45:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDDE8F805C2;
	Fri, 12 Apr 2024 13:45:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDC27F805BA; Fri, 12 Apr 2024 13:45:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CB47F80130
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 13:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CB47F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SB34NkC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712922307; x=1744458307;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XXFPVsizfUKlbLYg75o726rqFYPfLrkYyKabptRENuY=;
  b=SB34NkC3hbwr9HcgR437vJ72EgOS2iGP95A86iKLt4XMwjYL7pFTpiEy
   u/+aCUCfJ+TCpLiqK0586SiCo+VA7KgBj0emYx058H56S2ld2Z1E6x+9i
   xUtO4BmBrtBBTCefsRkx+SpOeBrSoaAPn7aHoPQlTNqo5Uzp5+Qd5AMkC
   xeB81yr3lP4dGFutVhlkv+h4hOfxSEGOxMiE1x5GA1KwW7kaT5mOj9cAu
   itUWt3+ucBr1KcPCQ5yAg48poKMsNRo04a/E4SdSaVP/PAKxqR4dkhTqe
   rkPWIxO4vxO1pKdW5Qt2w4NWpTK5eeajJHSWwX03tu0lRjFAbX1+iBsoS
   A==;
X-CSE-ConnectionGUID: NZIqvy2aRm+3XaE9D1nGpQ==
X-CSE-MsgGUID: 1AsYRy4HTTi5elXyl0dfuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18930418"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000";
   d="scan'208";a="18930418"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 04:44:57 -0700
X-CSE-ConnectionGUID: dWybNnj/SP+GG+SiaVzICg==
X-CSE-MsgGUID: J0nhiP/UTu+n/o8okxM7Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000";
   d="scan'208";a="21705245"
Received: from aelgham-mobl2.ger.corp.intel.com (HELO [10.249.38.65])
 ([10.249.38.65])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 04:44:56 -0700
Message-ID: <96f4709c-6545-454c-b84b-25a78939abf6@linux.intel.com>
Date: Fri, 12 Apr 2024 14:44:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: UCM vs SOF vs HDMI passthrough
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.com>, wim.taymans@gmail.com
References: <fa1d1a94-57d9-4caf-9569-f9a9f3d725c2@linux.intel.com>
 <4fe03ef7-881e-4078-a819-cbe6500ede7d@perex.cz>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <4fe03ef7-881e-4078-a819-cbe6500ede7d@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ELLJ2OVYDIVWTK2U5AHWWNGSCUNNX2EO
X-Message-ID-Hash: ELLJ2OVYDIVWTK2U5AHWWNGSCUNNX2EO
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ELLJ2OVYDIVWTK2U5AHWWNGSCUNNX2EO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11/04/2024 16:38, Jaroslav Kysela wrote:
> On 11. 04. 24 15:15, Péter Ujfalusi wrote:
> 
>> [B] Using UCM
>> https://github.com/ujfalusi/alsa-ucm-conf/tree/topic/sof-hdmi
> 
> This is only way to go. The configuration for "legacy" PCM device names
> should be handled through UCM (when UCM config exists for this hw).

OK, I will drop the other option.

>> Should we add some parameter to 'amixer -c0 info', like ipc_version:4/3,
>> so if the ipc_version is 3 or missing we assume that passthrough is not
>> supported?
> 
> UCM must be able to detect sound card capabilities. For passthrough,
> there should be some controls for AES bits which may be used for the
> conditional matching. If it's not sufficient, a hint to the components
> string (mixer info structure) may be added by the driver. Also PCM name
> or subname may be matched for a substring, if you like (seems more
> related than the components string).

Thanks for the advice!

I have now something really working in a way it should be.
The kernel will add "hdmi-pt:1" to the card's components when HDMI
passthrough is possible (IPC4, ChainDMA enabled for HDMI PCM). [1]

UCM will use the existence of "hdmi-pt:1" to decide to create the needed
mapping PCMs [2]

[1] https://github.com/thesofproject/linux/pull/4921
[2] https://github.com/ujfalusi/alsa-ucm-conf/tree/topic/sof-hdmi

I'm not sure about the "hdmi-pt:1", can we just have plain "hdmi-pt" or
we need a param:value pair always?

There are still funky things done in the UCM patch due to lack of
experience with it. I guess I should create a formal PR to get it
reviewed and correct, right?

Thank you,
Péter
