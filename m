Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90885971E62
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 17:45:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0507844;
	Mon,  9 Sep 2024 17:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0507844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725896758;
	bh=YgYd4UDRaHUx/I4aBI/a5xRLjPGeXP51J3gubakkuJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ALFWVkXa1Li41cxDw8ZtLP3asT68gT9kjwgukhMzkBnRp9zxL/VLd5unDiaHWDZVE
	 ngiheCDPMcaTkqeC/iAwCKF+KnA8YfufHAGQVcFPItAiSuhYkf8Ae5lSRQKyovN55q
	 GtfYbHi4jKDAFXsW6TgaGvDXTfJxd8NhC1YGj7Lk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64139F805B2; Mon,  9 Sep 2024 17:45:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE7AAF805AD;
	Mon,  9 Sep 2024 17:45:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8C5FF801F5; Mon,  9 Sep 2024 17:45:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 822A4F80107
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 17:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 822A4F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=f/3r1+1I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725896722; x=1757432722;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YgYd4UDRaHUx/I4aBI/a5xRLjPGeXP51J3gubakkuJk=;
  b=f/3r1+1IHFkDY3iaXWWjs1gSevxMIDSxX/isTQ3TTzmfhhFQbIR8SyeR
   A5A12OT95kqOj5zJVjJ8NWnsN9l/JFLsV7jEVAxc1vADWr9kk7idq9b1v
   gW6w4F+dalhY6Nt+gK5wZL8mCZu6ytQSGVIQHkkoFR+dHpkeJ5nQcLml7
   7fqBpWNdlxM2DoQyGZk7Wq+wu3o/GL06rCjqc5HITLz/3pcW6g92JLvck
   XTdG0nQEI0jmTDUVdyg0HACXYHNiq+lEus2fPzvbLw/hRJO4F/OY4q17g
   GjKjFrIlRFfkp/6a1yqhEo/JaozGhYohd6DmfTqB9PMxxXJ7C0PEU21vH
   g==;
X-CSE-ConnectionGUID: +bXex1oATkGu7gARv+NLZw==
X-CSE-MsgGUID: RQ23f2DuTQarcnLNKi/b9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24149200"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600";
   d="scan'208";a="24149200"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 08:45:17 -0700
X-CSE-ConnectionGUID: 1F/bI0RxRoKO7kAoUB8ykA==
X-CSE-MsgGUID: 9w46N3gdQ5KYPrVn7LS6tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600";
   d="scan'208";a="67014967"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.241])
 ([10.245.246.241])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 08:45:15 -0700
Message-ID: <8462d322-a40a-4d6c-99c5-3374d7f3f3a0@linux.intel.com>
Date: Mon, 9 Sep 2024 17:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: stream: Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20240904145228.289891-1-krzysztof.kozlowski@linaro.org>
 <Zt8H530FkqBMiYX+@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Zt8H530FkqBMiYX+@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VIKVB6MVPM3CSEWOHNFU22JLLGXQ6JUR
X-Message-ID-Hash: VIKVB6MVPM3CSEWOHNFU22JLLGXQ6JUR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIKVB6MVPM3CSEWOHNFU22JLLGXQ6JUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/9/24 16:36, Charles Keepax wrote:
> On Wed, Sep 04, 2024 at 04:52:28PM +0200, Krzysztof Kozlowski wrote:
>> This reverts commit ab8d66d132bc8f1992d3eb6cab8d32dda6733c84 because it
>> breaks codecs using non-continuous masks in source and sink ports.  The
>> commit missed the point that port numbers are not used as indices for
>> iterating over prop.sink_ports or prop.source_ports.
>>
>> Soundwire core and existing codecs expect that the array passed as
>> prop.sink_ports and prop.source_ports is continuous.  The port mask still
>> might be non-continuous, but that's unrelated.
>>
>> Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> Closes: https://lore.kernel.org/all/b6c75eee-761d-44c8-8413-2a5b34ee2f98@linux.intel.com/
>> Fixes: ab8d66d132bc ("soundwire: stream: fix programming slave ports for non-continous port maps")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
> 
> Would be good to merge this as soon as we can, this is causing
> soundwire regressions from rc6 onwards.

the revert also needs to happen in -stable. 6.10.8 is broken as well.

https://github.com/thesofproject/linux/issues/5168


