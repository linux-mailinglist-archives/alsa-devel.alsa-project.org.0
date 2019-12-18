Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F6B124D46
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 17:26:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7573E950;
	Wed, 18 Dec 2019 17:25:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7573E950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576686379;
	bh=6z7I8gK69H2rG3kqRbkEDOA4YEo37qKa9etmOUUciio=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a1bGbo//G97jSqgEoDlxRSJLl9d+X8Z3AEcVHVKVmGUeQn276NBvI4VDGk0MgKjOs
	 7TUcrrebC1GkEhHCzpTARdXVT5rxJq/mVuJJwC94yi0dIZNbMKp8H6ms3cgHzgWyRV
	 iLJEyNIlrrliyhOqc9PZO4ncg73uvIcMsw41ua6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0A8BF80096;
	Wed, 18 Dec 2019 17:24:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3457CF80266; Wed, 18 Dec 2019 17:23:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CC9EF80096
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 17:23:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CC9EF80096
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 08:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="415881650"
Received: from dshoemak-mobl.amr.corp.intel.com (HELO [10.251.3.243])
 ([10.251.3.243])
 by fmsmga005.fm.intel.com with ESMTP; 18 Dec 2019 08:23:44 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
References: <87r212jqt1.wl-kuninori.morimoto.gx@renesas.com>
 <87o8w6jqrk.wl-kuninori.morimoto.gx@renesas.com>
 <CAFQqKeWWdwCMEO9idW4sANYio3y1ye3Q3okbOEd=zwYrRXDSYg@mail.gmail.com>
 <87eex2jnck.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bc4cef12-0095-e2af-5c91-63b06d815b8c@linux.intel.com>
Date: Wed, 18 Dec 2019 08:54:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87eex2jnck.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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


>>      Card dai_link has .ignore_suspend, and ALSA SoC cares it when suspend.
>>      For example, like this
>>     
>>              for_each_card_rtds(card, rtd) {
>>                      if (rtd->dai_link->ignore_suspend)
>>                              continue;
>>                      ...
>>              }
>>     
>>      But in snd_soc_suspend(), it doesn't care about
>>      it when suspending Component. This patch cares it.
>>
>> Morimoto-san,
>>
>> I am a bit skeptical about this change but I could be wrong.
>> I am not sure if the ignore_suspend field in the DAI link
>> definitions was meant to be applicable for the components as well.
>> Mark/Takashi would have to confirm this.

Even for dai links, it's not clear to me what .ignore_suspend means.

For Intel machine drivers, the .ignore_suspend flag is used for DMIC 
links which may be used in S0ix/D0ix states. I don't believe this works 
if there are multiple target states, e.g. you would probably want to 
leave the link active in S0ix, but suspend it in S3?

I think the current .ignore_suspend settings only work with the 
assumption that applications will close all capture streams before going 
to S3.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
