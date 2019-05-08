Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4F517EB5
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 19:02:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A93F1AB1;
	Wed,  8 May 2019 19:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A93F1AB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557334930;
	bh=Qrefd+AZYWBWRkVjU8kZO4AcivJ+us20ZUkS3eSByOg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QlBsASdDocrT0l00EcfDflDqmBUCIfI1JK2U0d0Ied6wIQh2nJKrd1TzSQyaplMih
	 u+xrqM4NGNc1GbD608guKWISC0hnC0z0e++o71Mbij5myAg8CAyX2tbBVJDXs468nx
	 qmuozcY3/TObLi/VLgCYRY9U9qmBsm6M4jGr902Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF1E5F896FD;
	Wed,  8 May 2019 19:00:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F343F896F0; Wed,  8 May 2019 19:00:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 521F4F80796
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 19:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 521F4F80796
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2019 10:00:18 -0700
X-ExtLoop1: 1
Received: from mayalewx-mobl1.amr.corp.intel.com (HELO [10.255.230.159])
 ([10.255.230.159])
 by fmsmga006.fm.intel.com with ESMTP; 08 May 2019 10:00:16 -0700
To: Evan Green <evgreen@chromium.org>
References: <20190507215359.113378-1-evgreen@chromium.org>
 <20190507215359.113378-2-evgreen@chromium.org>
 <cb0accd5-6b0d-065a-9b54-321252862d88@linux.intel.com>
 <CAE=gft7PtNWzH1QYigbQvDcJwZSb7ZLWoKzurPGBnh72DYcZrw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0d2c6330-7882-a7e5-8dcb-51eec0e845ba@linux.intel.com>
Date: Wed, 8 May 2019 12:00:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAE=gft7PtNWzH1QYigbQvDcJwZSb7ZLWoKzurPGBnh72DYcZrw@mail.gmail.com>
Content-Language: en-US
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: SOF: Add Comet Lake PCI IDs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 5/8/19 11:42 AM, Evan Green wrote:
> On Tue, May 7, 2019 at 3:14 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>> Minor nit-picks below. The Kconfig would work but select CANNONLAKE even
>> if you don't want it.
>>
>>>
>>> +config SND_SOC_SOF_COMETLAKE_LP
>>> +     tristate
>>> +     select SND_SOC_SOF_CANNONLAKE
>>
>> This should be
>> select SND_SOF_SOF_HDA_COMMON
> 
> You mean SND_SOC_SOF_HDA_COMMON I assume.
> Except that I also need &cnl_desc, so I need CANNONLAKE to be on as
> well. Should I select them both?

Ah I see. I'd rather use a different descriptor then, and make the two 
platforms independent, as I did for CoffeeLake. You can use the same 
descriptor for the two -H and -LP skews though.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
