Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 087E478B746
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 20:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F68E208;
	Mon, 28 Aug 2023 20:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F68E208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693247805;
	bh=oeUoUsTMHvgd5WYx2tulyFMANhy+r5J4Xx/cddLpevw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CjML/cEqvpUa6bGoLUMjzCdBhLYm3zuiik6z7Ft7CcNnnHZP4ogzDxHMMbhEHVCnU
	 faVaXcH8eiKYSZxVukWSKk7Yupwc/TsuI68VuJygpPsavNJvupHOONT2DQX6G+dXYm
	 7ycWKW82T5P8czEFX3FWC9MHEZY4qNaZijl4H73o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00172F80158; Mon, 28 Aug 2023 20:35:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A40CF800F5;
	Mon, 28 Aug 2023 20:35:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FA0EF80158; Mon, 28 Aug 2023 20:35:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35F2EF80074
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 20:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35F2EF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JYCMFthQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693247742; x=1724783742;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oeUoUsTMHvgd5WYx2tulyFMANhy+r5J4Xx/cddLpevw=;
  b=JYCMFthQcAJdiQJfyMMOtT8Ap0r0ZE99c1/Z0vl+AnjWXiM/1DNH3wYe
   YLqcItVndAH1XcxPldNqTDgbgROVeAiVH+F1hB8en2frHd+S4TexxAgg4
   DxZ4G5fXNnM2GnT11RJBujgg+1TjMF3iiegO8YIm6+ff4HvGimX3s/Bqa
   /w6zmz8MggAxqcU9bm+PmyPjcvnPJHECqfsTkoutPRM3oftqr91jbAETp
   rLxfhRFUq6FQdDPwbP5PK4G2q9gChnLKhe2KxRBHS9Ly+OoC6TUpjkwLt
   brXEA4UsnPN84q5iLp7+55caBF38BmSSnDFwcAXWT3aFsrhF0oLt/9m5Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="461551694"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000";
   d="scan'208";a="461551694"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 11:35:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="741513209"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000";
   d="scan'208";a="741513209"
Received: from raberech-mobl2.amr.corp.intel.com (HELO [10.212.13.163])
 ([10.212.13.163])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 11:35:30 -0700
Message-ID: <6d498d35-841d-4ea4-2fd9-990f9b02563e@linux.intel.com>
Date: Mon, 28 Aug 2023 13:35:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] ucm: docs: Add EchoReferenceDev
Content-Language: en-US
To: Curtis Malainey <cujomalainey@google.com>,
 Jaroslav Kysela <perex@perex.cz>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 ethan.geller@gmail.com
References: <20230824213312.1258499-1-cujomalainey@chromium.org>
 <ce20d02b-56ed-acd1-411b-8c68d8cabea8@perex.cz>
 <CAOReqxiDZOAEYYb5c73AHu+Nd2vZinLR5qdMAVJnEcV8TS6=Nw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CAOReqxiDZOAEYYb5c73AHu+Nd2vZinLR5qdMAVJnEcV8TS6=Nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O62CIZRFVDAJ54VGPACLZ4I267LGOPG3
X-Message-ID-Hash: O62CIZRFVDAJ54VGPACLZ4I267LGOPG3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O62CIZRFVDAJ54VGPACLZ4I267LGOPG3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/28/23 12:59, Curtis Malainey wrote:
> On Sat, Aug 26, 2023 at 4:28 AM Jaroslav Kysela <perex@perex.cz> wrote:
>>
>> On 24. 08. 23 23:33, cujomalainey@chromium.org wrote:
>>> From: Curtis Malainey <cujomalainey@chromium.org>
>>>
>>> Sometimes userspace may want to use a reference channel to cancel echos
>>> when using video chat, this value identifies the device which carries
>>> that channel.
>>
>> The UCM modifier should be used for this - see "Echo Reference" comments in
>> use-case.h.
>>
>> Note that this allows additional setup (in Sequences) for this stream.
>>
>>                                                 Jaroslav
> 
> I was under the impression modifiers were state manipulators that
> acted upon existing devices/pcms and did not designate their own PCM.
> That is at least how we use them in CRAS.
> 
> Are there any examples of how to designate a PCM? I don't see any
> modifiers at all in ucm-conf repo.

I will second Curtis' request for clarifications.

I naively thought that modifiers would be used to e.g. select a 'Deep
Buffer' output for low-power playback, or different capture streams
based on the needs of the applications. It's not uncommon for capture
applications to request different PCM streams for raw, AEC processed,
AEC+NS processed data.

Echo reference is not really something that varies based on any
qualifiers. And specifically in the Chrome case we want userspace to
open the PCM echo reference device whenever the playback is used. So
it's not really a use-case dependent thing but more a way to express a
dependency between PCM devices.
