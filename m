Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 662C92A836C
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 17:23:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 898401695;
	Thu,  5 Nov 2020 17:22:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 898401695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604593427;
	bh=xHIHEruoFCjZE/+iLGPi4UtgPbm1U10eFI1IRDkw14Y=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W65hwjAZbOd3Ss3TC29pYK6aX6jAPhyzNL0y/SbzIlGLnv4EVYhzKlQM1YK1StRua
	 KsEo2Q2Lbluki0yRn7PT2/Sv6cMQ5G3NqqNZKAX7Sk/qs+1gr+ST+ql02E1XXUKuue
	 i8PX0we8GN/Q5uMfWXDx3tx1UmMrnz9byVGII5ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31AF1F802A9;
	Thu,  5 Nov 2020 17:22:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA01AF80162; Thu,  5 Nov 2020 17:22:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27D49F800BA
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 17:21:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27D49F800BA
IronPort-SDR: MsSCc9j5F99kCegzTd+YTq9VBzN9+kVZEZCcPwMaeX6DeyTHXiMTs528sNjFLoKet0holaciXR
 vynMP8z4bHvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="254117008"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="254117008"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 08:21:50 -0800
IronPort-SDR: v21laxcnGwjvgZzt5CIQs440Ch9S/XmBQrqLZ7Q5j4Icm5uecrrvvJg8iP7a0+ly2xfvZ0oHE6
 uKJlJMjmU4VQ==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="539466790"
Received: from umedepal-mobl2.amr.corp.intel.com (HELO [10.254.6.114])
 ([10.254.6.114])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 08:21:49 -0800
Subject: Re: [PATCH] ASoC: nau8315: add codec driver
To: Mark Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>
References: <20201102023212.594137-1-CTLIN0@nuvoton.com>
 <0adb99c2-d0d9-5052-c163-4d9a341239fc@linux.intel.com>
 <da4d4666-3c91-16d7-926b-b339ae4e39be@nuvoton.com>
 <da9232f9-15c9-01ea-44cf-107ff4dd6c58@linux.intel.com>
 <CA+Px+wVGosx=pmSkJKtYd9dQZ98D0aYG0KaDq6-ov67UoiV8Jw@mail.gmail.com>
 <20201105150249.GC4856@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bd3d3b6f-2cca-cd4b-2eff-b32792b3b2e4@linux.intel.com>
Date: Thu, 5 Nov 2020 10:21:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105150249.GC4856@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>, WTLI@nuvoton.com,
 KCHSU0@nuvoton.com, Liam Girdwood <lgirdwood@gmail.com>, YHCHuang@nuvoton.com,
 CTLIN0 <CTLIN0@nuvoton.com>
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



On 11/5/20 9:02 AM, Mark Brown wrote:
> On Thu, Nov 05, 2020 at 10:20:33AM +0800, Tzung-Bi Shih wrote:
> 
>> If nau8315 doesn't share I2S with other components for now, it could
>> be better to not introduce the software mute control.
> 
> The mute callback is there because there's some controllers that don't
> start up cleanly and end up outputing glitches (for example due to not
> being able to flush their FIFOs) - keeping the CODEC muted until after
> the I2S is running covers those glitches.

Thanks for explaining those dependencies. The code looks good to me:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

