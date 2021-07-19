Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B6F3CE06E
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 17:59:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CFBB1660;
	Mon, 19 Jul 2021 17:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CFBB1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626710340;
	bh=TE5WU0vjSmqKcXSpP/TWG5MJRfjtJ14KJBn9uPl2FYI=;
	h=Subject:From:To:References:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RAlNQXfGMTw4mMMFdQr8PiJkL7WLuCSZ7KRGFxQvEZeKiD2gasycgEG/lQ2eRW1zF
	 5K+85bAfjmOhTLtILdmh4fJbXDTxfiAbgH4aAuaIIeUAnt6HN8rpOnnZwx7j0yHFEe
	 0tBLW7B7tSdJX1nP1MqJRda+ciZXZFOagRzFyI6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05E75F800C5;
	Mon, 19 Jul 2021 17:57:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9B08F80227; Mon, 19 Jul 2021 17:57:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95FB2F800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 17:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95FB2F800C5
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="296642820"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="296642820"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 08:57:26 -0700
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="414382608"
Received: from rraymond-mobl1.amr.corp.intel.com (HELO [10.209.130.70])
 ([10.209.130.70])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 08:57:26 -0700
Subject: Re: 5.14 regression, Intel SST (BYT) audio no longer works
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <6ebbcf0f-3a4b-0b28-1f17-8e1108f040c0@redhat.com>
 <f5dbc1c8-0118-17f7-1f6c-4dc8366b8dd0@linux.intel.com>
Message-ID: <808f4c7f-4460-40b7-aa91-68bebc639db2@linux.intel.com>
Date: Mon, 19 Jul 2021 10:57:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f5dbc1c8-0118-17f7-1f6c-4dc8366b8dd0@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


>> I just noticed and I won't have time to dig any deeper for approx. the
>> coming 10 days. Still I wanted to report this in case anyone has any
>> ideas. Or maybe you can reproduce and look for a fix ?
>>
>> After building + installing 5.14-rc1 on a HP Elitepad 1000 G2
>> (Bay Trail) with a RT5642 codec, I noticed that sound over the
>> speakers and over the docks line-out jack no longer works.
>>
>> Downgrading to 5.13 (without any other changes) fixes this, so this
>> seems to be a regression with 5.14.
>>
>> I've no been able to make time to test this on other BYT/CHT hardware,
>> but I suspect that other models will be affected too.
> 
> Thanks Hans for the report, will look into this. 
> I can't think of anything that might explain this regression.
> I need to update the series to remove device properties so if the baseline is broken I'll see it as well...

I don't see any issues seen on a headless CHT Zotac device with RT5640, both with v5.14-rc1 or broonie/for-next.
Maybe something else happening with e.g. ACPI or GPIOs?
