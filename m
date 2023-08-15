Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 769EC77D1DA
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 20:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CEC43E8;
	Tue, 15 Aug 2023 20:28:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CEC43E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692124179;
	bh=dV6iBEDwXaH+NekjGOZAmxfs3ZQSlb8664ZMZ6YSn4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dQvlW9lXV3+l0m8EmQrWoR2BRf6znG4JAsFPxXoCtfvvroX22ajCgz+PcmsMNiC9m
	 za0B01HbmBL+8wGDsSHGPJd+GpEaSqFLg1TJsGrNTWIeHZkctFkvgGEha95/rgNe6k
	 WGa7ZTDnKMYcBDARCDvFzYiLyPuQmb5vaGd06Zmk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80592F801EB; Tue, 15 Aug 2023 20:28:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22E01F8016A;
	Tue, 15 Aug 2023 20:28:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C1C9F8016D; Tue, 15 Aug 2023 20:28:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62D08F800EE
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 20:28:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62D08F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Q2MAor6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692124114; x=1723660114;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dV6iBEDwXaH+NekjGOZAmxfs3ZQSlb8664ZMZ6YSn4I=;
  b=Q2MAor6dbV5RFz7jBdqyWilkENL5R0YxKJJ2/ng2fKrRvpBJbo16Fbu1
   SVISLKhlHon7Sf8xjQXQhJVZZE7Ldkh4odtOOG2CPVsSsC2LHqeHeD6fl
   pQmCulRV4/vxRp0E0FoXXWpkhcrortSXCDbfR96aTqLA0jX7IspNiwvy3
   k0my3AM9Yk3gNc5ohytKGC2N3vlAaLhNAI330DXN5Q+zrbJsqk+NDtWzB
   FdlCroG82h1cV0+CBXy2VwTkAntx66A8ksGuE1Ohye45RmSCYfzzjbPkt
   pc9AJpEGGYkDN5TQHsm75xOlJx8xa9AUfS7P9GAEGjY00Fz2ioZ7iRXoM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357322310"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200";
   d="scan'208";a="357322310"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 11:28:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="907713192"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200";
   d="scan'208";a="907713192"
Received: from bawerden-mobl.amr.corp.intel.com (HELO [10.209.163.183])
 ([10.209.163.183])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 11:28:21 -0700
Message-ID: <0beda41e-8dfa-054e-4069-7298b4caa879@linux.intel.com>
Date: Tue, 15 Aug 2023 13:28:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2] ALSA: hda: intel-dsp-cfg: Add Chromebook quirk to
 ADL/RPL
Content-Language: en-US
To: Curtis Malainey <cujomalainey@google.com>,
 Brady Norander <bradynorander@gmail.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 cezary.rojewski@intel.com, amadeuszx.slawinski@linux.intel.com,
 perex@perex.cz, tiwai@suse.de, cujomalainey@chromium.org
References: <ZNuDLk5hgmfKrZg6@arch>
 <850c5b2c-265e-a565-8a88-58a88f8fb4e8@linux.intel.com>
 <CAOReqxjbjkhkqfvTWs9i5NxK6QAsk42Daw1pA_1+b1zG5mbKmQ@mail.gmail.com>
 <ZNuyuerb0M6IGRKj@arch>
 <CAOReqxi_fkthH7SPdQ6ycyMx+2Mpi+JHHYhPJKi-u82SsfN9gA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CAOReqxi_fkthH7SPdQ6ycyMx+2Mpi+JHHYhPJKi-u82SsfN9gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YHMCXIZA72LENOJ22YVFKPONNZGTFNTS
X-Message-ID-Hash: YHMCXIZA72LENOJ22YVFKPONNZGTFNTS
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YHMCXIZA72LENOJ22YVFKPONNZGTFNTS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/15/23 13:00, Curtis Malainey wrote:
> On Tue, Aug 15, 2023 at 10:15 AM Brady Norander <bradynorander@gmail.com> wrote:
>>
>> On Tue, Aug 15, 2023 at 09:56:44AM -0700, Curtis Malainey wrote:
>>> On Tue, Aug 15, 2023 at 8:56 AM Pierre-Louis Bossart <
>>> pierre-louis.bossart@linux.intel.com> wrote:
>>>> On 8/15/23 08:52, Brady Norander wrote:
>>>>> AlderLake and RaptorLake Chromebooks currently use the HDA driver by
>>>>> default. Add a quirk to use the SOF driver on these platforms, which is
>>>>> needed for functional internal audio.
>>>>>
>>>>> Signed-off-by: Brady Norander <bradynorander@gmail.com>
>>>>
>>>> Thanks for the patch
>>>>
>>>> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>>
>>>
>>> Now that I am looking closer at the patch, I am very curious why we are not
>>> hitting the following case and using SOF
>>
>> The DMIC detection looks for DMIC endpoints in the NHLT, but these
>> devices don't have NHLT.
> 
> There would be the brokenness then. Is the DMIC not something that
> shows up in coreboot? Or is it only defined in the topology? If the
> latter we should probably extend this patch farther back to GLK.

You don't need to expose mics in NHLT, the premise has always been that
Chromebooks are assumed to expose 4 mics and userspace w/ UCM takes care
of selecting which mics are actually used on what platform.

Also there's a difference between NHLT (ACPI table) and NHLT blob in
topology used for IPC4. not the same thing.
