Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 672F212500F
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 19:04:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD2B6166A;
	Wed, 18 Dec 2019 19:03:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD2B6166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576692284;
	bh=JgBW4qMZh23GrbxvZuaN/BL1cvRLC2nI8rNZB/zgetQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VrRfJgfsZgoIAYZ5LfpjtSzonBv6LxEscnaewso10wlcHF15eAFcyKzI0+2mf37WE
	 t67QNYrrds0JSKCkJg5xMLxyRbcJzoExxV8SXBZGhAHrq1p1+/wC90CI/d5+D/Og3B
	 0TPqh0nwzJH85L7X+tywFo8qna5q2BqADHR1CKo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC222F80247;
	Wed, 18 Dec 2019 19:02:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02E08F80258; Wed, 18 Dec 2019 19:02:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D863AF8022C
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 19:02:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D863AF8022C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 10:02:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="415912271"
Received: from dshoemak-mobl.amr.corp.intel.com (HELO [10.251.3.243])
 ([10.251.3.243])
 by fmsmga005.fm.intel.com with ESMTP; 18 Dec 2019 10:02:08 -0800
To: Mark Brown <broonie@kernel.org>
References: <87r212jqt1.wl-kuninori.morimoto.gx@renesas.com>
 <87o8w6jqrk.wl-kuninori.morimoto.gx@renesas.com>
 <CAFQqKeWWdwCMEO9idW4sANYio3y1ye3Q3okbOEd=zwYrRXDSYg@mail.gmail.com>
 <87eex2jnck.wl-kuninori.morimoto.gx@renesas.com>
 <bc4cef12-0095-e2af-5c91-63b06d815b8c@linux.intel.com>
 <20191218171415.GJ3219@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <aa512532-908d-c1e4-6284-b550da05d3f2@linux.intel.com>
Date: Wed, 18 Dec 2019 11:48:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218171415.GJ3219@sirena.org.uk>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH v2 2/7] ASoC: soc-core: care
 .ignore_suspend for Component suspend
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



On 12/18/19 11:14 AM, Mark Brown wrote:
> On Wed, Dec 18, 2019 at 08:54:27AM -0600, Pierre-Louis Bossart wrote:
> 
>> Even for dai links, it's not clear to me what .ignore_suspend means.
> 
> It means exactly what it says, don't do anything on suspend.
> 
>> For Intel machine drivers, the .ignore_suspend flag is used for DMIC links
>> which may be used in S0ix/D0ix states. I don't believe this works if there
>> are multiple target states, e.g. you would probably want to leave the link
>> active in S0ix, but suspend it in S3?
> 
>> I think the current .ignore_suspend settings only work with the assumption
>> that applications will close all capture streams before going to S3.
> 
> These numbered suspend states are a platform specific concept, other
> systems will typically just suspend or not suspend.  It sounds like this
> feature does not map onto your systems.

Correct. What is not clear to me is how we can specify a behavior that 
would be dependent on the target states.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
