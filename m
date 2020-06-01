Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A19B81EB0F8
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 23:32:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36A291658;
	Mon,  1 Jun 2020 23:31:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36A291658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591047145;
	bh=IRXH0X6eSHA2KdOUwYlR5kcBsG+CrCS96Z/0DsLp8r4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qzweelc+KbY7ZyqnHL9S5sl/3NSEFKn9U1fvQ9jW2ngQ4O5bwEyhoKc/v/G7IAqvo
	 ZB3mlrQgZviUz3f3ZztBW4M0BowC28rCwurUCpJleWOfVE4QRdPmguOnKZQ1Cr1mSD
	 OilvX3D6s9d1bd9ve/Ab+kNaILVsL6iEvFUCAh40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CA32F801EC;
	Mon,  1 Jun 2020 23:30:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A53F0F801ED; Mon,  1 Jun 2020 23:30:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 766F1F800B8
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 23:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 766F1F800B8
IronPort-SDR: 5QI/+E+sognvmdzlW9KcycnF1cJZnDVmt9YMMIwj+tcqC7TOC3ApfwmFqBhhhbCmcgYF0YzFGK
 5L5Q4mns8Ytg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 14:30:33 -0700
IronPort-SDR: MlvKh8065aW0fZqYECYR3ggcezL7rz1PGBD58kqkF1FUWeG1CK6lkqJ2mLWcQmdpMX5/+rr6oR
 LG+VZLpa7R7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,462,1583222400"; d="scan'208";a="470430182"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.29.12])
 ([10.213.29.12])
 by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2020 14:30:31 -0700
Subject: Re: [PATCH v3 0/3] ASoC: Intel: Add KeemBay ASoC platform driver
To: Sia Jee Heng <jee.heng.sia@intel.com>
References: <1591005201-31704-1-git-send-email-jee.heng.sia@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <f3808e0a-e924-5b4a-5d83-0de139553651@intel.com>
Date: Mon, 1 Jun 2020 23:30:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <1591005201-31704-1-git-send-email-jee.heng.sia@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Andy Shevchenko <andriy.shevchenko@intel.com>,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

On 2020-06-01 11:53 AM, Sia Jee Heng wrote:
> The below series of patches support the KeemBay ASoC platform driver.
> The platform driver initialize the i2s to capture and playback the
> pcm data on the ARM. The i2s is running in polling mode.
> 
> There is no DSP in the KeemBay SoC. Users are rely on the Gstreamer plugin
> to perform Audio preprocessing.
> 
> Audio graph card is used to connect the platform driver with the
> tlv320aic3204 codec.
> 
> Change History:
> v3:
> - Adjusted header format.
> - Use Audio graph card instead of custom sound card.
> - Use if-else instead of conditional operator.
> - Enabled .set_fmt to configure master clock.
> 
> v2:
> - Corrected I2S naming for DT binding.
> 
> v1:
> - Initial version.
> 
> Sia Jee Heng (3):
>    ASoC: Intel: Add KeemBay platform driver
>    ASoC: Intel: Add makefiles and kconfig changes for KeemBay
>    dt-bindings: sound: Add documentation for KeemBay i2s
> 

As these series has been given plenty of comments internally from Andy, 
Pierre and me, I'd be best to have all reviewers CC'ed here.

Czarek
