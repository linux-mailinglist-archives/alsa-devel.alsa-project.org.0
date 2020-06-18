Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 924E41FF5F6
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 16:59:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B41E16BF;
	Thu, 18 Jun 2020 16:59:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B41E16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592492391;
	bh=0lsdfzw+HOCH7/bslOEjsHkgniGY5LR62ZbxCk75BnA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IqpfBzhaL7ET0Qfsnl53KEp6pBStCaLZDs8brL6etK8c8uw3a2MzHstgus9HpegPy
	 XPyteopjse/lxdI2bfq1ul6dUC6JYfndtH93tK/3CD/CvPiHSwUQv8/bCPZfnBH4XY
	 N1GedbVzwFPycVN+dAsJdhoU98ZOBc0DyyFH9b7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8399F8025F;
	Thu, 18 Jun 2020 16:56:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A25AF80271; Thu, 18 Jun 2020 16:56:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18420F8010E;
 Thu, 18 Jun 2020 16:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18420F8010E
IronPort-SDR: p9wpob4zm9HYPIEtvJuZDQVOGA/LIaf8GOD+1WA0RGU5qaxYqzvv54GjAFmDImZ98PsIvelvX1
 73nPYTNG2cGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="131000319"
X-IronPort-AV: E=Sophos;i="5.75,251,1589266800"; d="scan'208";a="131000319"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 07:56:30 -0700
IronPort-SDR: WRstlpxjt1sMiABU5OkC+WJgszXlBw0nMBk48hg8Q7MDBFZqPvdQEIFlqjkyo1iJjLy/U5lIEu
 9HqF1/d3cd7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,251,1589266800"; d="scan'208";a="477268245"
Received: from richard2-mobl.amr.corp.intel.com (HELO [10.254.109.110])
 ([10.254.109.110])
 by fmsmga005.fm.intel.com with ESMTP; 18 Jun 2020 07:56:29 -0700
Subject: Re: [PATCH AUTOSEL 5.7 055/388] ASoC: SOF: Do nothing when DSP PM
 callbacks are not set
To: Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-55-sashal@kernel.org>
 <20200618110126.GC5789@sirena.org.uk>
 <1d1041f9-521b-98f5-a6ef-12d43615bc13@nxp.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c966e694-9ec8-3401-7d7c-fae5ca5fcce4@linux.intel.com>
Date: Thu, 18 Jun 2020 08:56:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1d1041f9-521b-98f5-a6ef-12d43615bc13@nxp.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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



On 6/18/20 6:44 AM, Daniel Baluta wrote:
> On 6/18/20 2:01 PM, Mark Brown wrote:
>> On Wed, Jun 17, 2020 at 09:02:32PM -0400, Sasha Levin wrote:
>>> From: Daniel Baluta <daniel.baluta@nxp.com>
>>>
>>> [ Upstream commit c26fde3b15ed41f5f452f1da727795f787833287 ]
>>>
>>> This provides a better separation between runtime and PM sleep
>>> callbacks.
>>>
>>> Only do nothing if given runtime flag is set and calback is not set.
>>>
>>> With the current implementation, if PM sleep callback is set but runtime
>>> callback is not set then at runtime resume we reload the firmware even
>>> if we do not support runtime resume callback.
>> This doesn't look like a bugfix, just an optimization?
> 
> Indeed can be seen as an optimization, but it does unexpected things 
> which can cause trouble
> 
> and weird behavior for people not familiar with the matter.
> 
> For example, as explained in the commit message if you only provide
> 
> System PM handler but not runtime PM handler, then the DSP will be resetted
> 
> even if this is not the intention.

I think it's a bug fix for Intel legacy platforms (Baytrail, Broadwell) 
where runtime_pm isn't supported. However the additional fixes for 
system suspend/resume were only provided for 5.8, so this patch in 
isolation will not do much for those platforms. Put differently, even if 
this patch is applied to 5.7 suspend/resume would still not work for 
Baytrail/Broadwell.
Daniel, your call if you need this for i.MX?
