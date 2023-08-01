Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D6976B702
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 16:16:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12E326C0;
	Tue,  1 Aug 2023 16:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12E326C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690899373;
	bh=io8/VrbQq+Mwn+5uIJ++zeZMaPmoDyCncI6fOrRwRuw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YFCAWYxxyCeeQIKh1XIRkLyHOPQvV3WkFx+K9iIxO1zSSHHp7r+ExPkis5Hn0oO7f
	 QJOwNdZBbVhqdJjAv+mYS93ZsM3YneKNfBD77RWYXHCgpxwVCT7GbTpWpjv9cqGAUA
	 jkDP9DomhoLohVAzEQyHk5p9eFGMtE2deZEKoF+s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 209F7F80535; Tue,  1 Aug 2023 16:15:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91E9DF8016D;
	Tue,  1 Aug 2023 16:15:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FBCCF8016D; Tue,  1 Aug 2023 16:15:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFA34F80149
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 16:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFA34F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ju78MAZe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690899313; x=1722435313;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=io8/VrbQq+Mwn+5uIJ++zeZMaPmoDyCncI6fOrRwRuw=;
  b=ju78MAZexdyvPb++rgLCjJq1rYRTCO0eS0Qz2JuA8uSrWcUr7LodciRg
   amm0iG8kj5PRgS/RkzkSc/y8SPLOJEUgdKxxb+NAPLkd2eWpect9M3Bj/
   Qr2fzyy6dG+uDdKNyyxfUMIQOPDSGXqeXQEpaU8AGaE2Tt3qfBwfNJJsV
   f/4OpTNJKh7SYrnb2Pg14dfA2XslMQzgij7/vMoPejdnXnQ3HbAiwq66c
   almSdGtqvB8yk9XcsFd9ny4QV2wwFhZc2NikbA1c5M2oVLPPZxdBtxAqR
   4rqDDKby0OFwqjlhwvTLB6zw0erhjtJR9DOC4273JM0S0uyEopXhSkLbg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="368202605"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200";
   d="scan'208";a="368202605"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:14:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="728700928"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200";
   d="scan'208";a="728700928"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:14:39 -0700
Message-ID: <5d8f3ae1-7f9f-8076-f5ff-36f9fe666ceb@linux.intel.com>
Date: Tue, 1 Aug 2023 16:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: intel: use devm_snd_soc_register_dai()
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
References: <87v8dzpsvm.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87v8dzpsvm.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PT3ZQLOIKV2GSCNC5SG42SO62P4HFOTG
X-Message-ID-Hash: PT3ZQLOIKV2GSCNC5SG42SO62P4HFOTG
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PT3ZQLOIKV2GSCNC5SG42SO62P4HFOTG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/1/2023 1:23 AM, Kuninori Morimoto wrote:
> It is still using snd_soc_{un}register_dai() manually.
> Let's use devm_snd_soc_register_dai().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

There are two other related patches..., should this have been a patch 
series?

And while I like the series, after applying all three patches I get 
failures in module reload tests.

If I remember correctly the reason we did explicit flow of register_ and 
free_, instead of using devm_register_ is that the lifetime may be 
correlated to existence of other device and we need to unregister at 
correct moment. Maybe something to revisit, but I would prefer to keep 
tests green for now.
