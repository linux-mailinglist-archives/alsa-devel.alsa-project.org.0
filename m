Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D63346D0399
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 13:43:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD7461EF;
	Thu, 30 Mar 2023 13:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD7461EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680176589;
	bh=aTonF+bWWDyHhYl4mUlkksCTBQHQGLsUDjjhjtUNpQc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oaglM1tc+1U/oA15zwtmQN6skBNawrmvqR+CTcBwpNuwOarG5PM4MInU6ZDgCoqoO
	 CpVSyJVOGolGNKdvYj+e5Xo2GNFzSvr+lrSrhY8ysTbEnDHzzHy7YAKm61Kiib72cp
	 QNXuj8fgMf17Dae2UfpwHb4Pwmmmm2uzGZGs+Vok=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A98AF8024E;
	Thu, 30 Mar 2023 13:42:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B919F80272; Thu, 30 Mar 2023 13:42:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8079DF8024E
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 13:42:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8079DF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=etmLwV/x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680176529; x=1711712529;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aTonF+bWWDyHhYl4mUlkksCTBQHQGLsUDjjhjtUNpQc=;
  b=etmLwV/xiAaLwbeLnA7PudSawQZliZUKJ+5IHlk3q1vb23XJVmoZUmp/
   gnnFPk6/uwv95KMh3e+m/bTcZ6x75xViF13X1kxwSUQ9z/paVtBcz5Gy7
   gv5HKb3sTI0vRQrbOtMff+NmsZ6qv2CA5JgahN+zsZArTKODB04B5eu3v
   fTrD+NX/A9P6+d4R+F7W4YN91UA6Ty9UEt8kaBRq5nO60cQEBHOgiaZXO
   /dNd8RXlK393yEZk2lVNhJwSjf3rN9bKLtPsxVJRWyq8R7bKAhl2Ko/0C
   MORNV6yVdxeCnodBTIXKFoCEte2PsN6/ze5wljoVEkBfOEfya+PSBpXpj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="341159361"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400";
   d="scan'208";a="341159361"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 04:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="687204996"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400";
   d="scan'208";a="687204996"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 04:42:04 -0700
Message-ID: <c063bc6e-9d1e-71d2-3f5c-b35bc212ce9b@linux.intel.com>
Date: Thu, 30 Mar 2023 13:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 08/18] ASoC: SOF: Intel: hda-mlink: introduce helpers for
 'extended links' PM
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org, tiwai@suse.de, perex@perex.cz
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
 <20230327112931.23411-9-peter.ujfalusi@linux.intel.com>
 <cc5a4267-f050-c311-5d56-a2e7cfe7e747@linux.intel.com>
 <d826c3ac-4211-d4b7-38d4-059ccaea179c@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <d826c3ac-4211-d4b7-38d4-059ccaea179c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LRCXW34EAMYZXYYXAXLUVOTPDWEVRFD6
X-Message-ID-Hash: LRCXW34EAMYZXYYXAXLUVOTPDWEVRFD6
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LRCXW34EAMYZXYYXAXLUVOTPDWEVRFD6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/28/2023 3:24 PM, Pierre-Louis Bossart wrote:
> 
> 
> 
>>> +static int check_power_active(u32 __iomem *lctl, int sublink, bool
>>> enable)
>>
>> Should last argument be named 'active' instead of 'enable'? It would
>> make more sense to me.
> 
> Naming is the hardest part, eh?
> 

I don't disagree ;)

> I am not super happy with 'active', since the 'not-active' part is not
> very clear: it's not suspended, it's really powered-off/disabled.
> 
> I also didn't want to introduce a power state, since again it's on or
> off and we don't want to introduce the Dx concepts here.
> 
> If I had to revisit this, my preference would be:
> 
> static int check_sublink_power(u32 __iomem *lctl, int sublink, bool enabled)

Yes that reads better to me.
