Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 945F9362417
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 17:38:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D32B16AB;
	Fri, 16 Apr 2021 17:37:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D32B16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618587513;
	bh=REA6oR45U6vMphi2HMWOwn2Q9+3w7Dj8WaZy2tX6Ez0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DqX60SjB4BiwgpQeCV5Pg6wwTec6tDhJty2dtIFmwzIiRNSmrpM1Jk38LUMST4M6P
	 R2YIVjteOiRsQQjvyxls87H30BXoAEDm6JY2oaHEMqPFwx87kLIfWb0RSajCG1hvjx
	 xIb96t/p7THYZuSOEVXCUZrNCq0UDSYaDVnwlqRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52A12F800B9;
	Fri, 16 Apr 2021 17:37:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1D67F8025B; Fri, 16 Apr 2021 17:37:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34FF6F800B9
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 17:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34FF6F800B9
IronPort-SDR: HBNG/0Z+d2/nhk9+nmg+h5PExCeYLmLm7FiaYC86JFAp8TkQKiH20w/TQVilgVt/FTKAqVvDpB
 vfRdXVdWh+tA==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="174549796"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="174549796"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 08:36:46 -0700
IronPort-SDR: U9GDfsSjg+tKgssUKACUwQMyHzJE5+tKXtqrl9fHUETDxLeEzHEMMLe8xKr4knoaqhm7GOdGEf
 S9e0Tn4XYQOg==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="615985902"
Received: from jaolanlo-mobl.amr.corp.intel.com (HELO [10.212.2.231])
 ([10.212.2.231])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 08:36:45 -0700
Subject: Re: [PATCH v2 2/3] ASoC: rt715: remove kcontrols which no longer be
 used
To: Mark Brown <broonie@kernel.org>
References: <5c314f5512654aca9fff0195f77264de@realtek.com>
 <20210330170915.GH4976@sirena.org.uk>
 <cb29ed5c-44b1-c1ce-b704-8b93ac9f7a43@perex.cz>
 <3102f11c-d2bc-c53e-ac68-60628b990515@linux.intel.com>
 <5292be30-7e2d-c2f2-85ed-a1a609feb6c6@linux.intel.com>
 <20210416130738.GB5560@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <43219280-2647-184d-eb73-7bc5e561d6a3@linux.intel.com>
Date: Fri, 16 Apr 2021 10:36:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416130738.GB5560@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 "pierre-louis.bossart@intel.com" <pierre-louis.bossart@intel.com>
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



On 4/16/21 8:07 AM, Mark Brown wrote:
> On Thu, Apr 15, 2021 at 04:35:14PM -0500, Pierre-Louis Bossart wrote:
> 
>> Was there any sustained objection to this change? Mark and Jaroslav?
> 
>> I would really like to fix the UCM files so that the mute and volume are
>> handled at the codec driver level, and not at the SOF level as it's
>> currently the case.
> 
> Well, you seemed to be objecting because it broke the UCM files and Jack
> didn't reply so as far as I understand it it'll break userspace.

I guess my wording was unclear.
No, I was not objecting, just clarifying that there will be a UCM change 
but that's needed anyways.

