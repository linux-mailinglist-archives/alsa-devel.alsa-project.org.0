Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9EE4254F0
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 16:01:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 702DF1685;
	Thu,  7 Oct 2021 16:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 702DF1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633615272;
	bh=//2L6fZhSmLYXeEj56NJ/3LVWAKfB8n2vC/pu0njWKM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qB1nlROw+YoEwpjeR74dkzVERQ3Um/HPe/WT4MpN6GIzMb7usxw4JqrAyTFc0i1JF
	 lpYVVxN9U/Eu0zyAcGVWrmWln/7eUwKqHlfZt+IQQCddoY+RAG91aVGu8RXCb+lytu
	 +VfffzFmUJxVV+5oR3yr7OCNo4pkoSRnF7w5y/Dc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C42DBF804BB;
	Thu,  7 Oct 2021 15:59:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CCC2F800F0; Thu,  7 Oct 2021 15:59:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC0A5F800F0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 15:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC0A5F800F0
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="225027000"
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="225027000"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 06:59:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="440273795"
Received: from klmutolo-mobl.amr.corp.intel.com (HELO [10.212.1.203])
 ([10.212.1.203])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 06:59:37 -0700
Subject: Re: [PATCH v1 1/4] ASoC: Intel: bytcht_es8316: Get platform data via
 dev_get_platdata()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20211006150428.16434-1-andriy.shevchenko@linux.intel.com>
 <c8b85524-6b9f-8fd3-3978-1d26b92660fd@linux.intel.com>
 <CAHp75VdiY98mO2Sj_Urv6m3GgpoUrSyDiPttGxTQeCv_z_1DzQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <16f652da-2473-35bb-acde-9b9cfd23a31a@linux.intel.com>
Date: Thu, 7 Oct 2021 07:59:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdiY98mO2Sj_Urv6m3GgpoUrSyDiPttGxTQeCv_z_1DzQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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



On 10/7/21 2:08 AM, Andy Shevchenko wrote:
> On Wed, Oct 6, 2021 at 7:14 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>> On 10/6/21 10:04 AM, Andy Shevchenko wrote:
>>> Access to platform data via dev_get_platdata() getter to make code cleaner.
>>>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> For the series
>>
>> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.com>
> 
> Are you sure you gave the correct email here?

Thanks for catching this, I need a break obviously.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

