Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6D42F20D6
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 21:31:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 925E51761;
	Mon, 11 Jan 2021 21:30:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 925E51761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610397099;
	bh=l54jcH320mKYFdV1kJK92TCSWO8skbgYiY05K2OdCk8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oQkM+I6mvtqKzQuSh56GnzpXx3FeAS/RA5uqzPUFQsZ+s+5mnnjpU1MLO6y+DPDah
	 Ge6lhd0uvzJyq9uH668n7iy8N7jAiLmefPIOz7/pwYPYWuBZHQXvba0I2rFKWNsuI6
	 qv3UvyDMyTr1R+8xYFQgLtObwZZxhLrbDdxkHovU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C771F804CB;
	Mon, 11 Jan 2021 21:29:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54D91F8016C; Mon, 11 Jan 2021 21:28:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CAEBF8016D
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 21:28:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CAEBF8016D
IronPort-SDR: 6Dr7RTYgRyZ4fGJxAqXmvMO8xiNxXjR9JFdbKXRks7quAkZK12xMGT2ZiIZclA3ywDlQykJwvu
 l0q1sWryO5aw==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="262712507"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="262712507"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 12:28:37 -0800
IronPort-SDR: yJweLSGYpWuHf+6Bis0AQk7sqva1TsDN6KCkR5U/R6LON4Mz2ClnH4q7gPO4a30f89pnXKB1eG
 M3XQ90U288Sw==
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="344995371"
Received: from gkbech1x-mobl.amr.corp.intel.com (HELO [10.212.87.85])
 ([10.212.87.85])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 12:28:31 -0800
Subject: Re: [PATCH 0/3] ASoC: Intel: bytcr_rt5640: Add support for devices
 with only a headphone jack (no speakers/mic)
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20210109210119.159032-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2b6fb521-9cdf-0a06-f30f-281ca493456c@linux.intel.com>
Date: Mon, 11 Jan 2021 11:23:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210109210119.159032-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/9/21 3:01 PM, Hans de Goede wrote:
> Hi All,
> 
> This series adds support for devices with only a headphone jack
> (no speakers/internal mic). Specifically this adds support for the
> Mele PCG03 Mini PC. But the new no-speakers and no-internal-mic quirks
> will likely be useful on other devices too.

Yep, I have one device like this, will send the DMI quirk when I get a 
chance.
I wish there was a way to query this information from ACPI, we'll 
probably need a long list of quirks instead.
Thanks Hans!

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
