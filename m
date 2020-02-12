Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5207E15ACCA
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 17:06:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5300D1664;
	Wed, 12 Feb 2020 17:05:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5300D1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581523576;
	bh=fZNilD9Esr8zGSaSKpQwe4lgFppF51Pi1PKu8DZ9z30=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hj4Q1mZLPc3WgZzniye5KAFCB8etfcRm2WLCFs/LwdFcONMn9Z7W9/UaTfjTse3Oa
	 sN3aE9kUMqkA5NQLW7CpDvUwRGVJroC18UX/XUW5Q8RnP3a0kKErMjGSI2v8oaAOEu
	 ptyFS1v8Q7EoqArdo48lBx1uZfPRnyPaS+7ie1wY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5A4FF80125;
	Wed, 12 Feb 2020 17:03:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAF4DF800E7; Wed, 12 Feb 2020 17:03:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=PRX_BODY_72,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A74AF8014F
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 17:03:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A74AF8014F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 08:03:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,433,1574150400"; d="scan'208";a="313442316"
Received: from gmoralez-mobl.amr.corp.intel.com (HELO [10.252.135.232])
 ([10.252.135.232])
 by orsmga001.jf.intel.com with ESMTP; 12 Feb 2020 08:03:36 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>
References: <87d0anceze.wl-kuninori.morimoto.gx@renesas.com>
 <874kvzcey1.wl-kuninori.morimoto.gx@renesas.com>
 <095fdf34-5736-b79a-7bad-56f5a478e939@linux.intel.com>
 <20200211121616.GI4543@sirena.org.uk>
 <87ftfgmyro.wl-kuninori.morimoto.gx@renesas.com>
 <87d0akmwq1.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <191001ea-1554-0ba2-4336-8f95f159e65b@linux.intel.com>
Date: Wed, 12 Feb 2020 09:26:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87d0akmwq1.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [PATCH v3 6/8] ASoC: soc-pcm: call
 snd_soc_component_open/close() once
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



On 2/11/20 7:16 PM, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis, Mark
> 
>>>> Maybe a red-herring but is there a potential for race conditions here if
>>>> that function is called twice from different places? Don't we need some sort
>>>> of lock for all the new flags introduced here?
>>>
>>> The probe stuff is all going to get pretty upset if it's called from
>>> multiple paths already.
>>
>> Hmm.. indeed we need to consider about it.
>> But I think it can/should/will be incremental patch.
>> Thank you for pointing it.
> 
> Is it OK for you ?
> Or, do we need v4 patch ?

I can't prove that the code is broken, this was a question. If there is 
a follow-up that looks into potential conflicts that's fine, I can see 
the benefits of the series as is so

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thank you Morimoto-san for all this work, much appreciated.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
