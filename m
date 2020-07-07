Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F0F2172CE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 17:46:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B2379F6;
	Tue,  7 Jul 2020 17:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B2379F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594136760;
	bh=gcQpF7xSt010FeqP1uJCQPkUigxJFoNyhK9EkZI1fX8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bhyxDWxxTch1S5OHJxeCO4hNwmUisUq3bNtWgk0QxBjBKDzXBBtiKafCstMhsNnfV
	 CA7fLsi210Rugk4/ktGgtzqu1DJJVDZfD9dasaKT4gZV6dgzfqB7+aPRyCs+OdMlVZ
	 WZLp7dsSWQ2kICgepKQdKxCavy0QP3oMbOMCqGPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2F25F8025A;
	Tue,  7 Jul 2020 17:44:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52914F80257; Tue,  7 Jul 2020 17:44:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9193F800D0
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 17:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9193F800D0
IronPort-SDR: pwmh2LZkw+ivyVF7Vw/ZN3QUwYLqRpEv3FfPbEAMxKPfBD8Zq0P/65oyYVZ791BaAryVd3hPqj
 VyjV4lSVv2Qw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="212586964"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="212586964"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 08:44:04 -0700
IronPort-SDR: lVEFuGGebMOIIhryZWswJgUhO6QPYgQQKNHQ6D1CQNLR5J9ErFLjYPQgXVNCvIqG4PsUYgfDjV
 TEQMFl+6Er/Q==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="305704711"
Received: from stortizs-mobl1.amr.corp.intel.com (HELO [10.254.109.228])
 ([10.254.109.228])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 08:44:03 -0700
Subject: Re: [PATCH 00/28] Clean-up ASoC's W=1 build warnings
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
 <20200707101915.GC4870@sirena.org.uk> <20200707103735.GG3500@dell>
 <20200707104017.GG4870@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <91692dac-1723-bec8-a6cb-88dadb9bf424@linux.intel.com>
Date: Tue, 7 Jul 2020 10:44:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707104017.GG4870@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 linux-arm-kernel@lists.infradead.org
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



On 7/7/20 5:40 AM, Mark Brown wrote:
> On Tue, Jul 07, 2020 at 11:37:35AM +0100, Lee Jones wrote:
> 
>> Some of these issues have been present for years.  It's quite the
>> coincidence that we both submitted these this week!
> 
> I'm guessing you've both been inspired by the 0day bot turning W=1
> warnings on without having first done a cleanup run :/

Yep, I was tired of seeing my email polluted with trivial problems last 
week, as well as seeing dead code that reviewers miss but tools don't.

Lee, do you mind if I merge your v2 series and my own v2, and then 
resubmit what hasn't been merged by Mark?
