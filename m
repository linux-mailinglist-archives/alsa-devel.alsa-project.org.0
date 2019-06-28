Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E21593E2
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 07:57:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E6DE1675;
	Fri, 28 Jun 2019 07:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E6DE1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561701457;
	bh=bV0dm29uLpFRXpueAR/LVjpFyX/tI/WF4eA1BM0kJsU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qOFt3Mf3hEdfLTVg1jLeBPRUSM1lXRB2aQxNwwMucMg/kdlpIXIjLHb1J98y6u2Zk
	 sK79dy6UKFzaveOm2uUzTqtGFXvVBrqh0hQQthbuiKAdKgM5MCKQFzSxx/mdrZpRxF
	 xY4xE41ldRGY3n7C4sKu4M4bMW2PVa2XFd1iUnzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4B97F896CB;
	Fri, 28 Jun 2019 07:56:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43157F896B9; Fri, 28 Jun 2019 07:56:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA697F80768
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 07:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA697F80768
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 22:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,426,1557212400"; d="scan'208";a="153273755"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 27 Jun 2019 22:56:09 -0700
Received: from pbossart-mac01.local (unknown [10.237.140.61])
 by linux.intel.com (Postfix) with ESMTP id 96CA158047D;
 Thu, 27 Jun 2019 22:56:07 -0700 (PDT)
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
 <87sgsnfjge.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZBnvfuZDbnvbmqAavh9DAbA_EeRc6OuH6OOiR1WB4zUrg@mail.gmail.com>
 <8761d853-2b3f-7b26-0073-05d0c3ce1362@linux.intel.com>
 <87d0iytqi8.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <288441e7-eaa7-8005-4026-97c31125375b@linux.intel.com>
Date: Fri, 28 Jun 2019 07:56:06 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87d0iytqi8.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Daniel Baluta <daniel.baluta@gmail.com>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 paul.olaru@nxp.com, Mark Brown <broonie@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH v2 116/146] ASoC: sof: use modern dai_link
 style
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

On 6/28/19 4:06 AM, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
>>> @@ -1883,7 +1883,7 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
>>>           int ret;
>>>
>>>           /* link + cpu + codec */
>>> -       link = kzalloc(sizeof(*link) + (2 * sizeof(*dlc)), GFP_KERNEL);
>>> +       link = kzalloc(sizeof(*link) + (3 * sizeof(*dlc)), GFP_KERNEL);
>>>           if (link == NULL)
>>>                   return -ENOMEM;
>>>
>>> @@ -1891,9 +1891,11 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
>>>
>>>           link->cpus      = &dlc[0];
>>>           link->codecs    = &dlc[1];
>>> +       link->platforms = &dlc[2];
>>>
>>>           link->num_cpus   = 1;
>>>           link->num_codecs = 1;
>>> +       link->num_platforms = 1;
>>>
>>> Can you please help me figure this out?
>>
>> Isn't this fixed by my patch "ASoC: soc-topology: fix modern dai link
>> style" applied on 6/13? Looks like the same issue to me.
> 
> This is very impertinent comment, but it is possible to allow NULL platform
> instead of dummy platform by this or similar code ?
> I guess it is nice for SOF future.
> I can't test and not familiar with SOF thought...
> 
> 	if (link->platforms)
> 		link->platforms->name = dev_name(sdev->dev);

It's a good question. To be honest I don't fully understand what this 
'platform' field is needed for... I was just trying to maintain 'as-is' 
functionality. If anyone has a good explanation on when this field might 
be required and for what purpose, and when it can be made optional, I am 
all ears.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
