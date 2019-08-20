Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47677967B8
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:41:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3849E165D;
	Tue, 20 Aug 2019 19:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3849E165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566322902;
	bh=FK0bCwXbgTbEneM3NjB9ihGqDjiUR8LokqsLnEY2DI8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eG1ag0Wu7AkfegGBaj7czTgWpk5DlrLm+eqeqDJizizy3CqRSZ7/BSRxYIA9xk6t+
	 T5w+VzlyG8bR5Ymx1hi2/qR2r+vEU/IVYMowslj7Hys05pXs1My+wp+lIjGZux7Nzg
	 MutkqyCAmolc/f9jPC58ju+KVd3gBS5r5czwimn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5865DF8036E;
	Tue, 20 Aug 2019 19:40:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48DF1F8036E; Tue, 20 Aug 2019 19:40:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46BFDF803F3
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:39:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46BFDF803F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 10:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="262237378"
Received: from slawrenx-mobl.amr.corp.intel.com (HELO [10.251.28.5])
 ([10.251.28.5])
 by orsmga001.jf.intel.com with ESMTP; 20 Aug 2019 10:39:56 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87pnlhahr6.wl-kuninori.morimoto.gx@renesas.com>
 <87d0hhahon.wl-kuninori.morimoto.gx@renesas.com>
 <928df91b-997f-c1eb-5ab5-bda1fc374c1a@intel.com>
 <27f25fb3-1d50-2b60-3e3b-da61eef1f6ad@linux.intel.com>
 <1bbf24d4-c6cb-00ee-ffbe-18da53d1f942@intel.com>
 <fc461e37-7363-af5a-63a4-9db7a2b8c1cd@linux.intel.com>
 <b3d7dc47-36e9-749f-94be-32854de624be@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <74038eed-a134-5c41-b402-dedf0ace8134@linux.intel.com>
Date: Tue, 20 Aug 2019 12:39:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b3d7dc47-36e9-749f-94be-32854de624be@intel.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 09/25] ASoC: soc-core: tidyup for
 snd_soc_dapm_add_routes()
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


>>>>> Question is simple: are we staying with all-for-one/ one-for-all 
>>>>> approach or we reverting to permissive behavior?
>>>>
>>>> Can you elaborate in which test case this patch creates a problem? 
>>>> Just curious why the route addition fails in the first place.
>>>
>>> If snd_soc_instantiate_card fails so does any test, really. Red wall 
>>> was easy to spot even for a hungry developer : )
>>>
>>> Our cnl_rt274 board declares several routes, yet our topology does 
>>> not provide necessary info for all of them. And thus, addition of 
>>> some routes fails. This was fine till now. That's also why I'd 
>>> mentioned in the very first sentence: it might be simply a board 
>>> issue. Maybe we should have never abused permissive behavior in the 
>>> first place.
>>
>> Yep, and that driver is not upstream as well so Intel can't complain 
>> here...
> 
> ??
> 
> It's not about complaining, rather starting a discussion. If I were 
> using boards with topology not fully matching its board equivalent 
> (because if has never been required of me) then there may be others who 
> did the exact same trick. Your card won't be enumerated now == change of 
> behavior.
> 
> Board bxt_rt298 is upstreamed and the exact same failures could be 
> reproduced since topology has something to say here too..

That's different. For bxt_rt298 there is a topology that was released, 
and if it's incorrect it should be fixed.
I *hope* we are not going to see such regressions with SKL/KBL 
Chromebooks, that would be more of a problem since there are more users.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
