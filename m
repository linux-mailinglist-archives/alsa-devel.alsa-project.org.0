Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE078DF54
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 22:53:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09B2C1678;
	Wed, 14 Aug 2019 22:52:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09B2C1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565815990;
	bh=AlsrC2waLzw0L0nF9y3YV6lv2Vxck9n4ohbM+3NLAak=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qSDiiZ6yB/001sDLq0sO5H4PhaEEjrxvAgRSOVfrwId2poVYeIGJm0kS6wKHUXbHt
	 PQAk3X5YCZa4GdZM00Y4RHhGILOiHGUKcDFUSSafgtYXhSPnuqYPQEuFkZaog7FWYg
	 mtPC+ymnnRa7z97uKRmJxSfQJVTDzIzelnMNYrr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5DF8F80214;
	Wed, 14 Aug 2019 22:51:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 588FDF80214; Wed, 14 Aug 2019 22:51:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A940F801DF
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 22:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A940F801DF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Aug 2019 13:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,386,1559545200"; d="scan'208";a="181675926"
Received: from thegde-mobl.amr.corp.intel.com (HELO [10.252.134.116])
 ([10.252.134.116])
 by orsmga006.jf.intel.com with ESMTP; 14 Aug 2019 13:51:15 -0700
To: Jon Flatley <jflat@chromium.org>, yang.jie@intel.com
References: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
 <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
 <ac7bcb42e40ac12d9924fd65c3e2c68b9b11b093.camel@linux.intel.com>
 <37ede7ea-e760-eac9-a1d5-0eb8e3bff3cb@linux.intel.com>
 <CACJJ=pyb==xWqKMB-gAzW7-FCFgEU7Rm+b-CL-ANO-eorDKy=A@mail.gmail.com>
 <356b3f4eacb43f23c40c4cd8e3c54ae9514a34c6.camel@linux.intel.com>
 <7e08e45d-7cec-9fdd-36c5-5e82632968f8@linux.intel.com>
 <CACJJ=pzcMCaOvHMVhmYKKL2Z45-XdrBB9FT8VjSzX_obVtKzyw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d80c2f4d-b5f4-5bbe-9529-36b9859ab8be@linux.intel.com>
Date: Wed, 14 Aug 2019 15:51:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACJJ=pzcMCaOvHMVhmYKKL2Z45-XdrBB9FT8VjSzX_obVtKzyw@mail.gmail.com>
Content-Language: en-US
Cc: benzh@chromium.org, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 cujomalainey@chromium.org
Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
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


> There seems to be an issue when suspending the ALC5650. I think the
> nondeterministic behavior I was seeing just had to do with whether or
> not the DSP had yet suspended.
> 
> I reverted commit 0d2135ecadb0 ("ASoC: Intel: Work around to fix HW D3
> potential crash issue") and things started working, including
> suspend/resume of the DSP. Any ideas for why this may be? I would like
> to resolve this so I can finish upstreaming the bdw-rt5650 machine
> driver.

Copying Keyon in case he remembers the context.

Reverting a 5yr-old commit with all sorts of clock/power-related fixes 
looks brave, and it's not clear why this would work with the rt5677 and 
not with 5650.

Are you using the latest upstream firmware btw? Or the one which shipped 
with the initial device (which could be an issue if the protocol changed).
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
