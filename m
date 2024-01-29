Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9CA841F07
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 10:14:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48FE4E65;
	Tue, 30 Jan 2024 10:14:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48FE4E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706606085;
	bh=+alcMqWzoqRZ7JJ8HhnU4GL4SH7uxxmtulwhpdyc7mE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PoXu/v9f+pAwgWt6JzMGMYJCv5unzU9cQ/FzwsDhgiBgD4uHDxZ44HWS81oBiS/DE
	 NP28lTXvhAFS2WshyPOtLFlPsKKmVpWbCZF5UcVRvZAYS/VmA6CA+Ff5ebtBGXtlBP
	 dgySMujO4M+NU68yL4YRPj4t+Hq3pzfkrMgk4ygg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01610F8057E; Tue, 30 Jan 2024 10:14:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1C89F80579;
	Tue, 30 Jan 2024 10:14:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C46EAF80548; Tue, 30 Jan 2024 10:11:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F06AF8020D
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 10:11:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F06AF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ApWj/15r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706605896; x=1738141896;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+alcMqWzoqRZ7JJ8HhnU4GL4SH7uxxmtulwhpdyc7mE=;
  b=ApWj/15rLy+jLdfnzFC0rCKlkV0fNWvDXz/qfE+KQLyn+9rW6jW6XV+A
   4EaljBRdY0ddqq4yTTzCzC4xcp7bbqnt6IPJCWGZZdwdtaG7SX0NwJz+r
   U/6OStR8iYkgaLlhP0uB9Eb3vvrTslhZuwRbMdTs82/abnAbEzgipk2A9
   dNKEtuV8a6WfFL2S3l9Vie7JDbNgKiJu7AFIS7edP6C4YOYfdD6M/bPYP
   rXkBC/HGBk860yBkNuWjYsO69QS0UZVDFWafHyfCzQKjqmgAuoRsXtHzI
   n5AwhGeWFu5ZR61hLrf36G1HTPaa7vtsMy5gOcj6NspHcxDwNXiBqDhJL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="3055990"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400";
   d="scan'208";a="3055990"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 01:08:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="931378672"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400";
   d="scan'208";a="931378672"
Received: from vkamysba-mobl1.amr.corp.intel.com (HELO [10.254.116.178])
 ([10.254.116.178])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 01:07:21 -0800
Message-ID: <fb5e670d-1814-4f96-96a0-ea14bdd551bf@linux.intel.com>
Date: Mon, 29 Jan 2024 18:10:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: Intel: mtl-match: Add cs42l43_l0 cs35l56_l23 for
 MTL
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240123113246.75539-1-mstrozek@opensource.cirrus.com>
 <Zbe0yi5Qo1eG5yCk@ediswmail9.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Zbe0yi5Qo1eG5yCk@ediswmail9.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: L2XERMNIWBOTYDHYHGV5OYTD3UZ72HXZ
X-Message-ID-Hash: L2XERMNIWBOTYDHYHGV5OYTD3UZ72HXZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2XERMNIWBOTYDHYHGV5OYTD3UZ72HXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 1/29/24 15:23, Charles Keepax wrote:
> On Tue, Jan 23, 2024 at 11:32:46AM +0000, Maciej Strozek wrote:
>> The layout is configured as:
>> - Link0: CS42L43 Jack and mics (2ch)
>> - Link2: 2x CS35L56 Speaker (amps 3 and 4, right)
>> - Link3: 2x CS35L56 Speaker (amps 1 and 2, left)
>>
>> Corresponding SOF topology:
>> https://github.com/thesofproject/sof/pull/8773
>>
>> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
>> ---
> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

