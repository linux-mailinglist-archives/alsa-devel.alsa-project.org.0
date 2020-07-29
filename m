Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C71F23264F
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 22:39:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 917221724;
	Wed, 29 Jul 2020 22:38:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 917221724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596055145;
	bh=VUlbA9kkIZ63grw7r/ARcJHeCi1vpfZIFNb8RudT9c8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tGI91sGBeblMmj42TD9itufaJaQnqVcVPhxYwgMnRpLEfM1XXYrkxpEZhNDksbhGB
	 XzMtFfhLVBGj6TVdfL0UuXPvcRKPfw6xPL/PAC/8w2mzSSuGOdtb//tJ7Bqlb8N9eX
	 Imqdk2/XihgcM7PP7hbSTgJSLmXoJNB5f6+X+3nk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5FFCF801D9;
	Wed, 29 Jul 2020 22:37:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9D3FF8012F; Wed, 29 Jul 2020 22:37:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DATE_IN_PAST_06_12,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6670BF8012F
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 22:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6670BF8012F
IronPort-SDR: zC/9utzKGT0ayp8JSRhg/iQWsJ0r6npN5MajVb2Zs9ya4OM2T9+5ngy4ixrM86gRzDyDPpTHBi
 3pwFx4mx5uyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="150667495"
X-IronPort-AV: E=Sophos;i="5.75,411,1589266800"; d="scan'208";a="150667495"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 13:37:09 -0700
IronPort-SDR: AhBbttFInNRymbG7AeDpgZHAm401upJ2/B9J015ZQnLat1qHHvuQgZIhOq1EzVdM9qTLTLovj3
 fodJr0dxeIpA==
X-IronPort-AV: E=Sophos;i="5.75,411,1589266800"; d="scan'208";a="464991564"
Received: from jayeshpa-mobl1.amr.corp.intel.com (HELO [10.209.169.93])
 ([10.209.169.93])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 13:37:07 -0700
Subject: Re: [PATCH 2/2] ASoC: Intel: Add period size constraint on strago
 board
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
 <1596020585-11517-3-git-send-email-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4fe97f63-e552-3b2f-803c-53894b196bfd@linux.intel.com>
Date: Wed, 29 Jul 2020 09:08:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596020585-11517-3-git-send-email-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Damian van Soelen <dj.vsoelen@gmail.com>
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



On 7/29/20 6:03 AM, Brent Lu wrote:
> From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> 
> The CRAS server does not set the period size in hw_param so ALSA will
> calculate a value for period size which is based on the buffer size
> and other parameters. The value may not always be aligned with Atom's
> dsp design so a constraint is added to make sure the board always has
> a good value.
> 
> Cyan uses chtmax98090 and others(banon, celes, edgar, kefka...) use
> rt5650.

Is this patch required if you've already constrained the period sizes 
for the platform driver in patch1?

