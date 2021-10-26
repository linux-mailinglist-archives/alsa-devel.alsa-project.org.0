Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F09A243BA05
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 20:56:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7125B16FC;
	Tue, 26 Oct 2021 20:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7125B16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635274601;
	bh=ikXyrTVCeTVJplxDNwRHfLI3SHLdheBWVLAxngdvzHM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RqP0FooFlTRvgrrwkFPNJG8Uq++SBxPE9+yrQiZErjXIisuk3UZA3Q+L+nqQYvtkD
	 1Z9BBNKXXwmkqsKVIvORKcgW80DmUktWPd2xA1uZoBHw1aKaxhnp2YUaIn8FIR+YiX
	 +xln7N109ffl+JhYp/+lcfCad36b9YSFOKvaXqcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE848F802E7;
	Tue, 26 Oct 2021 20:55:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 180BFF802C8; Tue, 26 Oct 2021 20:55:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F278F80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 20:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F278F80105
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="228743124"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="228743124"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 11:53:59 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="494338425"
Received: from irmercad-mobl.amr.corp.intel.com (HELO [10.212.65.151])
 ([10.212.65.151])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 11:53:58 -0700
Subject: Re: [PATCH 1/3] ASoC: nau8825: add set_jack coponment support
To: Mark Brown <broonie@kernel.org>
References: <20211026093828.4188145-1-CTLIN0@nuvoton.com>
 <20211026093828.4188145-2-CTLIN0@nuvoton.com>
 <55937591-e1f1-9f1e-2355-e7680026f05d@linux.intel.com>
 <YXhBt0rEYSVP9CNR@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <71293267-0b7f-00bd-1c1a-10386db7132e@linux.intel.com>
Date: Tue, 26 Oct 2021 13:53:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXhBt0rEYSVP9CNR@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com, David Lin <CTLIN0@nuvoton.com>
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


>>> Co-Developed-by: Mac Chiang <mac.chiang@intel.com>
>>
>> if you use the Co-developed-by: tag (no capital letter after 'C'), you
>> still need to provide your Signed-off-by: tag
>>
>> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by
>>
>> same comment for the 2 other patches in this series.
>>
>>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> 
> The signoff is there AFAICT?

I meant the Signed-off-by: tag of the first co-developer. The rule is:

"
Since Co-developed-by: denotes authorship, every Co-developed-by: must
be immediately followed by a Signed-off-by: of the associated co-author.
"

so each patch should be tagged as follows:

Co-developed-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: David Lin <CTLIN0@nuvoton.com>
