Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 939312014C2
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 18:20:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F0601612;
	Fri, 19 Jun 2020 18:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F0601612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592583636;
	bh=Ssq+EIXwoS0Z9cTjvOy2UvjHlg17fb+uGvRtAL1XWw0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fe1tVhIG4HIeIzT6blBVikpEjxNEXGzlzfqkQSqvb3tuovtvdfIfFZOoMuSbaG7Kn
	 iPDUB2OmQr8EhAMRYjsQphbmMhH/TGAcFB7qgiXoqm0Jaj4/g8l+N9j3fwXP96unEQ
	 UyYYVP31WIYX7qQrG0BPGH1mKnAPU+O25qPZSgMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BE63F8029B;
	Fri, 19 Jun 2020 18:18:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC7AAF80271; Fri, 19 Jun 2020 18:18:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C756F80252
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 18:18:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C756F80252
IronPort-SDR: 8H89AbtvHN6aPV8F1hvBIHMmtW4Rng9HUPSZ33Fgblotlj84nSEbPCbYYIMJS9w2mV9XTIfqok
 MA2BGk0cC/PA==
X-IronPort-AV: E=McAfee;i="6000,8403,9657"; a="122734141"
X-IronPort-AV: E=Sophos;i="5.75,255,1589266800"; d="scan'208";a="122734141"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 09:18:32 -0700
IronPort-SDR: /DmFc+3cPqdIRaz3sIKgfeJEkOARq2UBRc1SRgPSYVfFs06DmDEwDZlGOBMJJY15Bto79enO74
 0qF3y6avS/cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,255,1589266800"; d="scan'208";a="318155789"
Received: from lewest-mobl1.amr.corp.intel.com (HELO [10.255.230.148])
 ([10.255.230.148])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jun 2020 09:18:31 -0700
Subject: Re: [PATCH 2/3] ALSA: compress: document the compress gapless audio
 state machine
To: Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
References: <20200619045449.3966868-1-vkoul@kernel.org>
 <20200619045449.3966868-3-vkoul@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5c878ccf-43dd-4e13-aa6b-a6cb1e82af72@linux.intel.com>
Date: Fri, 19 Jun 2020 09:27:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200619045449.3966868-3-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-kernel@vger.kernel.org
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


> +For Gapless, we move from running state to partial drain and back, along
> +with setting of meta_data and signalling for next track ::
> +
> +
> +                                        +----------+
> +                compr_drain_notify()    |          |
> +              +------------------------>|  RUNNING |
> +              |                         |          |
> +              |                         +----------+
> +              |                              |
> +              |                              |
> +              |                              | compr_next_track()
> +              |                              |
> +              |                              V
> +              |                         +----------+
> +              |                         |          |
> +              |                         |NEXT_TRACK|
> +              |                         |          |
> +              |                         +----------+
> +              |                              |
> +              |                              |
> +              |                              | compr_partial_drain()
> +              |                              |
> +              |                              V
> +              |                         +----------+
> +              |                         |          |
> +              +------------------------ | PARTIAL_ |
> +                                        |  DRAIN   |
> +                                        +----------+

May I suggest having a single state machine, not a big one and an 
additional partial one. It would help explain why in one case 
compr_drain_notify() triggers a transition to RUNNING while in the other 
one it goes to SETUP.

I realize it's more complicated to edit but it'd be easier on 
reviewers/users.
