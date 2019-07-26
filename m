Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F48476E2F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 17:43:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C842C2087;
	Fri, 26 Jul 2019 17:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C842C2087
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564155807;
	bh=BwEXnncOs9rqLW0PD9ULgfTMD+Zb/rlrh18+r4KXanQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TwFxud7QGvAT9zLT+mYk++pIkenbQnd0qOsnHVcPpAzhiWI9PsgMWgktdOkq0s3ve
	 wjWRcRmhyIhQM3qnmjknu6CH6gG9led00zhMefZIZkSZV/1DNTbY3tr81NPDxOAGVZ
	 jnMUGKKyhWW3yNh919avyfylGjBFfyrCMiNOastE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06302F803D1;
	Fri, 26 Jul 2019 17:41:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3017F80393; Fri, 26 Jul 2019 17:41:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27E22F801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 17:41:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27E22F801A4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 08:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="345852506"
Received: from bcstewar-mobl1.amr.corp.intel.com (HELO [10.251.147.177])
 ([10.251.147.177])
 by orsmga005.jf.intel.com with ESMTP; 26 Jul 2019 08:41:34 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190722134410.9602-1-pierre-louis.bossart@linux.intel.com>
 <20190722134410.9602-3-pierre-louis.bossart@linux.intel.com>
 <b302a687-36a8-c3b4-32a9-27c47d3fb9cd@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7a46f2df-54e8-fdf8-8ce9-934aa84295b9@linux.intel.com>
Date: Fri, 26 Jul 2019 10:41:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b302a687-36a8-c3b4-32a9-27c47d3fb9cd@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v3 2/5] ALSA: hda: move parts of NHLT code
 to new module
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



On 7/26/19 7:10 AM, Cezary Rojewski wrote:
> On 2019-07-22 15:44, Pierre-Louis Bossart wrote:
>> Move parts of the code outside of the Skylake driver to help detect
>> the presence of DMICs (which are not supported by the HDaudio legacy
>> driver).
>>
>> No functionality change (except for the removal of useless OR
>> operations), only indentation and checkpatch fixes, and making sure
>> that the code compiles without ACPI
>>
>> Signed-off-by: Pierre-Louis Bossart 
>> <pierre-louis.bossart@linux.intel.com>
> 
> I didn't really see response to previous review apart from CONFIG_ thingy.

I just realize I missed your other comments, will look at them later today.

> - By the way, thanks Takashi for in-depth explanation!
> 
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/152407.html
> 
> Especially the ACPI leak part, though I'd hoped you would jump on my 
> shift-left train too :s
> Although, maybe those changes should be separated from relocation patch 
> and ignored for current series..
> 
> Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
