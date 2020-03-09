Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 204DD17E609
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 18:50:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B21C816AA;
	Mon,  9 Mar 2020 18:49:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B21C816AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583776229;
	bh=pTeEiJ2VoddvpkEKeklRkUsDjm5VcQXqrYzwvTfi6yc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uSX3kvGJ4gPv6vS9cKSZ2U5Cz4nWrQKilap8ucGDejNJbblfWyn4LhXAJfAUR4tgz
	 YpecH13D9nEiOPS9zQoctu6ZL1XojygSrIO8tUX/fnsuxASwVzsKlTYU84QTsCbXCb
	 LG2WYKqB/8orcNFG13isONSt1t2CrcreXnOKJios=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95CE2F800DA;
	Mon,  9 Mar 2020 18:48:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97BF0F801EB; Mon,  9 Mar 2020 18:48:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6115AF800DA
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 18:48:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6115AF800DA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 10:48:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="231012647"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.15.110])
 ([10.252.15.110])
 by orsmga007.jf.intel.com with ESMTP; 09 Mar 2020 10:48:37 -0700
Subject: Re: [PATCH 0/7] ASoC: Intel: Skylake: Fix HDaudio and Dmic
To: Mark Brown <broonie@kernel.org>
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
 <9d53337b-b02b-efd7-790e-c3db18562346@linux.intel.com>
 <20200309113844.GA4101@sirena.org.uk>
 <e50a52eb-ea7a-4528-cfdb-1dd9210b5779@intel.com>
 <20200309165413.GH4101@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <34fadb92-e9b5-08f6-a5b6-3db28842f88f@intel.com>
Date: Mon, 9 Mar 2020 18:48:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309165413.GH4101@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com
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

On 2020-03-09 17:54, Mark Brown wrote:
> On Mon, Mar 09, 2020 at 03:02:25PM +0100, Cezary Rojewski wrote:
> 
>> Mark, what's your take on backporting these to 4.19 LTS? Do we abandon the
>> subject and "just" merge (once reviewed/ approved) into 5.5? I believe
>> addressing all the issues mentioned on 4.19 is important.
> 
> I didn't actually look at the patches since by the time I went to look
> at them it was clear that there was going to be a new version.  Pierre
> was saying that they added new functionality which would generally not
> be suitable.
> 
> See Documentation/process/stable-kernel-rules.rst for the official
> rules.
> 

Ok, sure. Should the 'Fixes' be appended regardless or leave it as is?
