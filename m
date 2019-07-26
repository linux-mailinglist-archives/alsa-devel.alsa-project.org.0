Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC99764A3
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 13:33:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0F062029;
	Fri, 26 Jul 2019 13:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0F062029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564140830;
	bh=j5k0FPCRh2aA6D6AqKfbjxdgZGjt9MbEj19E6ibbIGo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e4sdrCS/r8YBREKjCZCMTlSBwo4JOJTQjRRIOTY+5W8E/ydHUUeGPP0JzVuKuT8w/
	 OAAFZSPVL+wMAazUU69VJda4MZElFlDz2LsK/3iRnt39h/90jQCDv9TwfmgCgbxmal
	 gHt+aYevB3P/NPT4dEsdxniji2TDFaUx1mjgg+us=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF713F800E8;
	Fri, 26 Jul 2019 13:32:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE129F80393; Fri, 26 Jul 2019 13:32:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3752AF800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 13:31:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3752AF800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 04:31:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,310,1559545200"; d="scan'208";a="175568924"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.89.116])
 ([10.251.89.116])
 by orsmga006.jf.intel.com with ESMTP; 26 Jul 2019 04:31:54 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190723145854.8527-1-cezary.rojewski@intel.com>
 <20190724124250.GM12733@vkoul-mobl.Dlink>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <1543807a-0f5a-76a5-971e-4d95cc019e06@intel.com>
Date: Fri, 26 Jul 2019 13:31:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724124250.GM12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com
Subject: Re: [alsa-devel] [RESEND PATCH v2 0/7] ASoC: Intel: Skylake: Driver
 fundaments overhaul
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

On 2019-07-24 14:42, Vinod Koul wrote:
> On 23-07-19, 16:58, Cezary Rojewski wrote:
>> Changes since v1:
>> - Rebased onto 5.4
> 
> On a lighter note:
> 
> Did this series time travel from the future! Did you charge the flux
> capacitor to go back?
> 

Damn, seems MLs are still merciless : )

Sorry for the typo - while doing rebases on "for-5.4" internally for 
future releases, simply smudged my commit messages.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
