Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 465E517A826
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 15:53:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDF7A1655;
	Thu,  5 Mar 2020 15:52:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDF7A1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583419982;
	bh=uqff57SS7jRqgKy29pgCmioFnBb1qSE3CstbBzD2vXs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rXn2KxhI1qr4EEu7/C1RLYbEvu2PlIpGV9F5/lc8SsS6GTB9sJFlDhUTiIxG94MdT
	 caoZ7cJkFWuqRhJsLIAZ8FD4j9b9e2imw+UG1Gq+tZxNKayJJzF8O0/ctu4vwRY6X4
	 XHuMQpb2tWtbCHoo45dl+XM6RsqXDAtn9rZAuxZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E78CAF800D8;
	Thu,  5 Mar 2020 15:51:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 189FBF800D8; Thu,  5 Mar 2020 15:51:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0A38F800D8
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 15:51:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0A38F800D8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 06:51:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="240835438"
Received: from wnorris-mobl.amr.corp.intel.com ([10.251.20.24])
 by orsmga003.jf.intel.com with ESMTP; 05 Mar 2020 06:51:03 -0800
Subject: Re: [RFC PATCH 2/3] ASoC: Intel: bdw-rt5677: fix module load/unload
 issues
To: Mark Brown <broonie@kernel.org>
References: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
 <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
 <20200305133638.GE4046@sirena.org.uk>
 <13857c7b-f7d2-9be2-c1e1-a577a774773e@linux.intel.com>
 <20200305135908.GF4046@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c1419cb1-c1d6-897d-05a4-48e57a3e15db@linux.intel.com>
Date: Thu, 5 Mar 2020 08:51:03 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305135908.GF4046@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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



> This doesn't answer the question: why is the machine driver not
> requesting the GPIO on device model probe?

I *think* it's due to the need to use the codec component->dev, which is 
only available with the dailink callbacks - not on platform device probe 
which ends with the card registration.

> 
>> The issue happens when running our test scripts, which do a set a rmmod in a
>> specific order: rmmod of the machine driver, then doing an rmmod of the
>> codec driver. Somehow the second fails with the 'module in use error'.
> 
>> It's probably because the devm_ release does not happen when the card is
>> unregistered and the machine driver resources released since we use the
>> component device. There might very well be a bug somewhere in the devm_
>> handling, I just don't have a clue how to debug this - and the .exit() makes
>> sense regardless in other cases unrelated to GPIOs.
> 
> So you've removed the driver which will have unbound the device but devm
> actions don't seem to have fired?  That seems worrying...

Well, the devm uses the component device, not the card device, so when 
removing the machine driver nothing should happen. The problem seems to 
be in the removal of the codec and component drivers.

We tried to use the card device instead but then the gpiod_get fails.

