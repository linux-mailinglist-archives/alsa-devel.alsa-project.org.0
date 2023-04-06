Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF25A6DA0C5
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 21:13:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64966F77;
	Thu,  6 Apr 2023 21:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64966F77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680808390;
	bh=lCk0Dc5JEPKXjgOjg4NcJcWtxDfaXq5ztesG7vOIce0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GgI0LdseTCvKweW0WBuC57SpxySRQUVxp+nYb0kxG4LP7h+aeWazZMApYPGta+WSM
	 wafp06GR7il7vMDYbH3jKGnOsPntQYKcb/BQl/EOsMTm8DDhFL/2/9CdpwLOwOx04t
	 Ppa14TVhkskc6j/HyGt2IALdlEQXcYyCbDjftrOs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B12C7F80171;
	Thu,  6 Apr 2023 21:12:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63B9BF80246; Thu,  6 Apr 2023 21:12:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49C05F8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 21:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49C05F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kuwLnEIz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680808333; x=1712344333;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lCk0Dc5JEPKXjgOjg4NcJcWtxDfaXq5ztesG7vOIce0=;
  b=kuwLnEIzQuAAozJcrNaUt+/WiKKEzQH8vbHX174hHHQd2qWbsugTwcGc
   UeuapH+PLswGc8h4upgo+wPmPIdQG0d3Pjl1nfECHL7WyWAo5doj69vTR
   X7gBtFPEnCbvwETJAvaFI/zHlIhEsXT17879eLzTl/HRn8QS8sCSdFqfN
   r07vrNBBzy+eyMZ5oYj3DIY3ExOLElzxD3b4X/NEhRyBml3ySTY3lkR9g
   K7fWj2t5bpuB3SSmMb7ykd1RBru6Ql2GO6wTNo5bXVpdkC0Z8CLeUM0Nt
   NIii2NKhaAnzDTJFEmdOFV0Kbu/d4oBobrpji8tmcElJhE7u75h4T0iNZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="429111510"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="429111510"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 12:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="687254920"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="687254920"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.209.83.247])
 ([10.209.83.247])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 12:11:54 -0700
Message-ID: <ded01bef-ad14-6870-6fa9-7172c71200e9@linux.intel.com>
Date: Thu, 6 Apr 2023 14:11:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] ASoC: SOF: Use no_reply calls for TX
To: Curtis Malainey <cujomalainey@google.com>, Mark Brown <broonie@kernel.org>
References: <20230406155026.18723-1-pierre-louis.bossart@linux.intel.com>
 <20230406155026.18723-3-pierre-louis.bossart@linux.intel.com>
 <a4145eda-3ff4-4ed0-8a57-fea8c358833b@sirena.org.uk>
 <CAOReqxjnBXP+e4i_kh8FwtKQJjJU-MdAU8c-P44LNMkNs-O6tg@mail.gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CAOReqxjnBXP+e4i_kh8FwtKQJjJU-MdAU8c-P44LNMkNs-O6tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DY7GNMAWMXVE7G2ZUVQNSXTXNSFCLWCL
X-Message-ID-Hash: DY7GNMAWMXVE7G2ZUVQNSXTXNSFCLWCL
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, tiwai@suse.de,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DY7GNMAWMXVE7G2ZUVQNSXTXNSFCLWCL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/6/23 13:28, Curtis Malainey wrote:
> On Thu, Apr 6, 2023 at 10:19 AM Mark Brown <broonie@kernel.org> wrote:
>>
>> On Thu, Apr 06, 2023 at 10:50:26AM -0500, Pierre-Louis Bossart wrote:
>>> From: Curtis Malainey <cujomalainey@chromium.org>
>>>
>>> Convert all existing calls that pass "NULL, 0" for reply data to the new
>>> no_reply calls. Also convert any calls that pass in data but don't
>>> actually parse the result.
>>
>> This breaks an x86 allmodconfig build:
>>
> 
> This is because a9737808b3e4 ("ASoC: SOF: compress: Set compress data
> offset") was sent first. Pierre, how do you want to resolve this?

Ah yes, this upstream patch is unfortunately not the one we have in our
tree [1], so the dependency was missed. We'll have to insist that all
SOF contributors send patches 'as-is' from the same topic/sof-dev-rebase
branch, and add allmodconfig to our CI and checklist.

Mark, please drop this version, we'll have to resend a v2 next week.
Sorry about the noise.

[1]
https://github.com/thesofproject/linux/commit/bfdc6b889069aab631af7b7c485f241a4a6d80f5

>> /build/stage/linux/sound/soc/sof/compress.c: In function ‘sof_compr_set_params’:
>> /build/stage/linux/sound/soc/sof/compress.c:238:46: error: ‘ipc_params_reply’ undeclared (first use in this function); did you mean ‘sof_ipc_pcm_params_reply’?
>>   238 |                                              ipc_params_reply.posn_offset);
>>       |                                              ^~~~~~~~~~~~~~~~
>>       |                                              sof_ipc_pcm_params_reply
>> /build/stage/linux/sound/soc/sof/compress.c:238:46: note: each undeclared identifier is reported only once for each function it appears in
