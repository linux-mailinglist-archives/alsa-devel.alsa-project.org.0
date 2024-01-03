Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AD382313B
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 17:25:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A651EE8A;
	Wed,  3 Jan 2024 17:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A651EE8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704299106;
	bh=e7A5dG1jEF9eZADbVxTs8U3CR1jOZzXgY4h4AvHFeh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NMg+K0n9JFgqMGtA+vBeb7xhgL44glvsfDzBUXKkA999giF615sYSX5itDg5wniv0
	 zcsW7rAk1Wlxhy6L0/Loanw/C/wS4ko0EF041R7CEzjwngGNoSuQgsCgWyd9Cn8fWu
	 DeGyomwkuLSms/jEqXSdV9xu9vaEwzHbKhWyFeAY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 801EAF80588; Wed,  3 Jan 2024 17:24:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DC61F8057F;
	Wed,  3 Jan 2024 17:24:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C69FF80537; Wed,  3 Jan 2024 17:24:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84518F80533
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 17:24:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84518F80533
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ngbK0dO8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704299067; x=1735835067;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=e7A5dG1jEF9eZADbVxTs8U3CR1jOZzXgY4h4AvHFeh0=;
  b=ngbK0dO8cqJJKeGwFkWxzoH1OXHYUU4HLOgrNdBFtD85eSaVnQ0cdDki
   GyKCqA4cdtWoocyspxs98U0fTq+MyxDscbj5LmUoNP2XBs4xdFV8YgUMq
   RN0DBI8jajGRBWQcKBoTZmrHfFuDmf8V5sgVWooF5eaNQLwvAaX/iAvVw
   0kKd8g5tnpcT9y7VdOBB2Kp6TYzCCFOPJuhY/6pbbW0qiX9ZYQxrbkAFP
   ROvWMJMBDkL3KicSjrePdQS4yw1aLsBEPUUa1bDFM/kr5K0ziGadC134u
   1I0iG1N/xsdkX0ioGERbhinRrJucQeRjK0vr8fulHvXwpEqvVSO8VpZe/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="18553022"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600";
   d="scan'208";a="18553022"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 08:24:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="780026987"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600";
   d="scan'208";a="780026987"
Received: from homichel-mobl2.amr.corp.intel.com (HELO [10.252.51.214])
 ([10.252.51.214])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 08:24:01 -0800
Message-ID: <d61245f1-cd4a-4369-9d32-087b892cf4fa@linux.intel.com>
Date: Wed, 3 Jan 2024 18:24:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Oops in hdac_hda_dev_probe (6.7-rc7)
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <ZYvUIxtrqBQZbNlC@shine.dominikbrodowski.net>
 <87sf3lxiet.wl-tiwai@suse.de> <ZY7kosArPqhlCfOA@shine.dominikbrodowski.net>
 <874jg1x7ao.wl-tiwai@suse.de> <ZY_Gb8-rncuOjRq-@shine.dominikbrodowski.net>
 <87plyovwg7.wl-tiwai@suse.de>
 <3260e806-a708-4462-9d4e-346e54143a65@linux.intel.com>
 <87y1d8ulxv.wl-tiwai@suse.de> <87o7e2a3hr.wl-tiwai@suse.de>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87o7e2a3hr.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CQPUMJMY6XTWBZZYFDPQEW5I4CN5X2KA
X-Message-ID-Hash: CQPUMJMY6XTWBZZYFDPQEW5I4CN5X2KA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQPUMJMY6XTWBZZYFDPQEW5I4CN5X2KA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 03/01/2024 16:36, Takashi Iwai wrote:
>>> Mark, Takashi, can you pick the fix for 6.7 (it is in -next)? I think we
>>> might have time for it to land?
>>
>> Oh that landed to Mark's for-next branch, i.e. only for 6.8.
>> Mark, please cherry-pick and send a PR before 6.7 final.
> 
> I ended up with cherry-picking by myself now.
> 
> I'm going to send a PR to Linus for 6.7 final in tomorrow.

Thank you, I really appreciate it!

-- 
Péter
