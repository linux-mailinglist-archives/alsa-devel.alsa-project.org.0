Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BB98C9EA8
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 16:18:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AFDA1F4;
	Mon, 20 May 2024 16:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AFDA1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716214735;
	bh=peHwDBEur7dJUqau/hFcn9UDPW1Y0T9a/a2GeHr150A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iALr59BzOk2AjnSMwdixh0PDZeKosvYs1KP6zstGrcH/EiaUrB0IzH7qRVxqn2Hg+
	 b3328LQQG9/EEfZuLo6nA+N4xsm3C3/CINnQ80II8c2m0l28DmFx5usAHVn0AoNPz8
	 5r00ljJpymy+iZKKN7gK/5rZdSXwBK68SBn57jhY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE361F8020D; Mon, 20 May 2024 16:18:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7637FF80588;
	Mon, 20 May 2024 16:18:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D4F7F8026A; Mon, 20 May 2024 16:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7F93F800BA
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 16:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7F93F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VoTSaSLX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716214689; x=1747750689;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=peHwDBEur7dJUqau/hFcn9UDPW1Y0T9a/a2GeHr150A=;
  b=VoTSaSLXEiw0nRZYi3zgmV12nRBrzRgEYAwRHpJs89KicHxw04ZH5r6w
   BXgBbv27ZfwNLUn6K3uvwtXEpIADVZrYkmjoNlPtcqpUs+LdK+TDgGMtD
   GjZOzQ8ay/taF/m1m6H06Tg52kmBfhOSHYlac7m3RDgolInbuEHAfR30J
   TDSpyCmNCHM/nN68wUC/RnKDDd4fh2u9YyvKOATqG4ro2TcsspnuTs24D
   zwtC+EfPl46OAHgJRQeZcSjmzWDCLxkcxKQUE2tzDFbrLLKMaHM4dD/55
   6T02epjaCf1rXzWzM8MmuLov8DTYF3C7E9PAywKizZL9EC/y+UlvPB190
   w==;
X-CSE-ConnectionGUID: BbWh2jmASCqU+1I4yvBT9A==
X-CSE-MsgGUID: flLs8kXuRmyXOwQ98L4faw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="37723593"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000";
   d="scan'208";a="37723593"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 07:17:41 -0700
X-CSE-ConnectionGUID: Wr81R0+tRWepdgQR+P3/ng==
X-CSE-MsgGUID: RTbAOrwDQYKgvMPTGfeIvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000";
   d="scan'208";a="37374847"
Received: from daliomra-mobl3.amr.corp.intel.com (HELO [10.125.109.51])
 ([10.125.109.51])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 07:17:41 -0700
Message-ID: <0b8bbcf2-2c34-44ba-b493-e81619a89c7b@linux.intel.com>
Date: Mon, 20 May 2024 09:17:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: rt1320: Add RT1320 SDCA vendor-specific driver
To: =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "pierre-louis.bossart@intel.com" <pierre-louis.bossart@intel.com>
References: <20240520091801.399154-1-shumingf@realtek.com>
 <9853cf34-105f-4430-a232-af04c25a834b@linux.intel.com>
 <b5e030a953eb4401862781bd88395ed6@realtek.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <b5e030a953eb4401862781bd88395ed6@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HEAZWQJKHV2S5K4DXAPPRL23Z3N3OBV3
X-Message-ID-Hash: HEAZWQJKHV2S5K4DXAPPRL23Z3N3OBV3
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HEAZWQJKHV2S5K4DXAPPRL23Z3N3OBV3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/20/24 09:05, Shuming [范書銘] wrote:
>>> +static const struct sdw_device_id rt1320_id[] = {
>>> +     SDW_SLAVE_ENTRY_EXT(0x025d, 0x1320, 0x3, 0x0, 0),
>>> +     SDW_SLAVE_ENTRY_EXT(0x025d, 0x1320, 0x3, 0x1, 0),
>>> +     {},
>>
>> Sorry, not following why one of the two entries in the table is an SDCA class
>> device and the other not - both rely on SDCA controls/entities/functions/etc.
>> That doesn't really align with the notion that VA and VB only differ by their DSP
>> capabilities, so not sure what the 0/1 difference means.
> 
> VA/VB will use class id 0 because of the hardware issue.
> VC will fix this and use the class id 1.

ok, a comment would help.
