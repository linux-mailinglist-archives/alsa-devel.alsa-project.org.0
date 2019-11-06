Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EE5F1BAA
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 17:51:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D31BA16A8;
	Wed,  6 Nov 2019 17:50:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D31BA16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573059078;
	bh=7raWpZH+MK4WFPI1/7qdhYocT4aRKjCe5ub3oXZimS8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lvehOaWIwuraK/pH3hpv5cnEgFeh/j3fo6tM0susa0XMj5PRac5psriraMzcXJOzP
	 aQ9gGjT/n9NIGsRUwJRZaBvZhZOYtVhXoNRtDBrxV3Zi3AJR9wFFaJ+cwzItvfzFhV
	 UjgBUZ8SqmEUdSwfb4/oY2v7fojTxQeQLqRMXVOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 393E8F8045F;
	Wed,  6 Nov 2019 17:49:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44E8DF803D0; Wed,  6 Nov 2019 17:49:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0D3EF80291
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 17:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0D3EF80291
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 08:49:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="285713413"
Received: from pdblomfi-mobl.gar.corp.intel.com (HELO [10.254.107.145])
 ([10.254.107.145])
 by orsmga001.jf.intel.com with ESMTP; 06 Nov 2019 08:49:20 -0800
To: Mark Brown <broonie@kernel.org>, Dragos Tarcatu <dragos_tarcatu@mentor.com>
References: <20191106145816.9367-1-pierre-louis.bossart@linux.intel.com>
 <20191106162146.292802743193@ypsilon.sirena.org.uk>
 <20191106162927.GC11849@sirena.co.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <14d026ab-a898-358e-34ea-4f73d6c0fc0a@linux.intel.com>
Date: Wed, 6 Nov 2019 10:49:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191106162927.GC11849@sirena.co.uk>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Jaska Uimonen <jaska.uimonen@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] Applied "ASoC: SOF: topology: Fix bytes control
 size checks" to the asoc tree
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



On 11/6/19 10:29 AM, Mark Brown wrote:
> On Wed, Nov 06, 2019 at 04:21:46PM +0000, Mark Brown wrote:
>> The patch
>>
>>     ASoC: SOF: topology: Fix bytes control size checks
>>
>> has been applied to the asoc tree at
>>
>>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4
> 
> It's not immediately obvious if something similar is needed for -next,
> the relevant code has been redone since v5.4 was branched off.  If
> something is needed someone will have to send something.

I checked that the patch applies even before Jaska's October rework, 
where the same bug was present. so in theory picking this fix for 
5.2..5.4 would work as usual.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
