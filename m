Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96354622FA2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 17:07:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E579C201;
	Wed,  9 Nov 2022 17:06:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E579C201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668010040;
	bh=DUDgxCo8gHkX29vLar7UjmY10ZyQHpxE5MRL+xpehOw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g2jXRDQYuTeAZaJlpB9h2ahTSKI0tlF2lbwlTgbAFICFVJAS/3pkELn4aUlcVduRr
	 0klcW6HBWnXSquoxL1fk5uI0yBomsVp4r6mCTX1tSVANRaDA1/zy0V+hLfDXq/MDus
	 NmWqTO8qo8TUtSN46qLh//hmxDVixn4qikNcQL/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73892F800EC;
	Wed,  9 Nov 2022 17:06:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 882CAF80217; Wed,  9 Nov 2022 17:06:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5E3AF800EC
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 17:06:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5E3AF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Yu61WIky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668009977; x=1699545977;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DUDgxCo8gHkX29vLar7UjmY10ZyQHpxE5MRL+xpehOw=;
 b=Yu61WIkywjLV2cBU6uIPHyJn3YHrLUkVj6/YDhnvu2tDNfNA2a0LsGPf
 J+bMseij1+cmN/kz/Ksewx/xr8vbAQPdbs2EJo9LXnQZL9cNDRhOaOUZt
 tzrS4ax5m2OjTTs4TWbFYIPcvNWJcAYvTcMlu6QgePkmeORKZYpFzYwOy
 91hJCC6OOlrZ8M18bytrh3KTPZqBeaoWhJ6SkyU6UytgHbXjK6gXxt956
 ABWUtK7eB+3O1d/kkEWDshw7nwjx7TIH+mqksqRq5AQUX7v5Ol2oEn/MV
 dgR4lBbD1TZaUhR0I7l0iLdpAajG9B9r6fXTQXW7199SuRzPiF0IArQ77 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="337755490"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="337755490"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 08:05:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="669999464"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="669999464"
Received: from ktan43-mobl2.amr.corp.intel.com (HELO [10.213.170.218])
 ([10.213.170.218])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 08:05:45 -0800
Message-ID: <e5acf9e3-20b9-00b3-8d5f-687d47ccd49c@linux.intel.com>
Date: Wed, 9 Nov 2022 10:05:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH] soundwire: intel: Initialize clock stop timeout
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20221020015624.1703950-1-yung-chuan.liao@linux.intel.com>
 <Y1u855YZ/B3Q+FiI@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Y1u855YZ/B3Q+FiI@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, bard.liao@intel.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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



On 10/28/22 06:28, Vinod Koul wrote:
> On 20-10-22, 09:56, Bard Liao wrote:
>> From: Sjoerd Simons <sjoerd@collabora.com>
>>
>> The bus->clk_stop_timeout member is only initialized to a non-zero value
>> during the codec driver probe. This can lead to corner cases where this
>> value remains pegged at zero when the bus suspends, which results in an
>> endless loop in sdw_bus_wait_for_clk_prep_deprep().
>>
>> Corner cases include configurations with no codecs described in the
>> firmware, or delays in probing codec drivers.
>>
>> Initializing the default timeout to the smallest non-zero value avoid this
>> problem and allows for the existing logic to be preserved: the
>> bus->clk_stop_timeout is set as the maximum required by all codecs
>> connected on the bus.
> 
> Applied to fixes, thanks

Thanks Vinod, was this sent to Greg/Linus? the last pull request I see
was for 6.1-rc1.
Arch Linux cherry-picked this patch but other distros did not, so quite
a few users are left with no audio card.
