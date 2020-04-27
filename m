Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C391BA22A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 13:17:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE68E168F;
	Mon, 27 Apr 2020 13:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE68E168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587986265;
	bh=oBB4N1iFOjeg9mPi1elJRqkjJu6XY6/7XsOO0GHRmiM=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KZ5kHCNBbKdobMW6aNzd+zbJkE5mIu0rleg6KuuRtH2FKj0K7E8JO7vZ7t0PQoSlI
	 1Lx+eokrC60X4ppDkQqWZ2XFAAzORZj35Z7JKTkwILCn1Mqdf+JSvPyuxQBrGKXDmX
	 ZnX3HyOD04QCc/4C1meh6gRyQl6PBWSLQf4ws+/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0FE7F8028D;
	Mon, 27 Apr 2020 13:15:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7A8AF8027D; Mon, 27 Apr 2020 13:15:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8012FF80257
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 13:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8012FF80257
IronPort-SDR: zZ1nFqv83i9gFXIDcUFGeqqkHEzjYKDh5+mgPgTRBMxUjCuVpgbGN6GCtEFtp5h0ZpA+JnjEfK
 CKF7WxA5jd7g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 04:15:23 -0700
IronPort-SDR: +nrXKwSZzV//j+aXOP97YPj85q1rBwY5FhpqG9bSEEfrOrwvPViTqHDfT576ZcXGUSJHYI2UP6
 d5FZJs7DAijg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,323,1583222400"; d="scan'208";a="302345746"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.7.127])
 ([10.213.7.127])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Apr 2020 04:15:20 -0700
Subject: Re: [PATCH 0/3] add channel constraint for BDW machine drivers
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <1587976638-29806-1-git-send-email-brent.lu@intel.com>
 <1375d0b1-fafa-95b5-9a06-eefb1897ca42@intel.com>
Message-ID: <1bcd3310-34c3-7d90-cb18-f474d9e30c25@intel.com>
Date: Mon, 27 Apr 2020 13:15:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1375d0b1-fafa-95b5-9a06-eefb1897ca42@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>
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

On 2020-04-27 13:01, Cezary Rojewski wrote:
> On 2020-04-27 10:37, Brent Lu wrote:
>> The machine driver bdw-rt5650 (for Google buddy) supports 2 or 4-channel
>> recording while other two drivers support only 2-channel recording. HW
>> constraints are implemented to reflect the hardware limitation on BDW
>> platform.
>>
> 
> Message body relates to bdw-rt5650 while the series touches every of BDW 
> boards.

Ignore my first sentence :-) Second still applies though

> 
> Apart from review given for each and every patch (although most issues 
> are shared so there is not as much to address) my question is:
> - are these hw limitations or software (machine board) limitations?
> 
> Czarek
> 
>> Brent Lu (3):
>>    ASoC: bdw-rt5677: channel constraint support
>>    ASoC: bdw-rt5650: channel constraint support
>>    ASoC: broadwell: channel constraint support
>>
>>   sound/soc/intel/boards/bdw-rt5650.c | 34 
>> ++++++++++++++++++++++++++++++++++
>>   sound/soc/intel/boards/bdw-rt5677.c | 33 
>> +++++++++++++++++++++++++++++++++
>>   sound/soc/intel/boards/broadwell.c  | 33 
>> +++++++++++++++++++++++++++++++++
>>   3 files changed, 100 insertions(+)
>>
