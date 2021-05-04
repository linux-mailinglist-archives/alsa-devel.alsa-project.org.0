Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61307372E1F
	for <lists+alsa-devel@lfdr.de>; Tue,  4 May 2021 18:31:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F120C169A;
	Tue,  4 May 2021 18:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F120C169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620145899;
	bh=+rIApT/YfvZ7tsa45RVoFNskD5nQrTFcaECYN1tzTOc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=drReH+OaELwrEwYba2ahanmGbDAOIHKKquCP24W7o6eFsDsiSMf+ScVqtQaNVV8IZ
	 xXqQvgEwwus9DdI5VkUwmJd3+IcwbtAjR17l2QxjLPu3VMciFyDBeSic9WhIXiFtUN
	 Y5A8p1CAjCdsw2t24eMFSNLR9Ei4of0sjU6OBsMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FC8EF80234;
	Tue,  4 May 2021 18:30:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFD5BF8021C; Tue,  4 May 2021 18:30:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80C57F80162
 for <alsa-devel@alsa-project.org>; Tue,  4 May 2021 18:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80C57F80162
IronPort-SDR: btbIQSnAzHyq6CC1rZXxBwklS2nHY2PjDSd4Oy+QPwO1XYGMLH+TYh51hvJsCWOfGE02McOlOk
 OIHMb4M6SGcw==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="185157053"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="185157053"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 09:29:56 -0700
IronPort-SDR: meqDpjmddwRPpnCXSVF2o8WipqWtg7NGT3BEMO05OyGkWIpil43auS7A33YgpWfHGjIyjtrX1X
 /tTwcwcKxw1g==
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="390026452"
Received: from lcoronad-mobl.amr.corp.intel.com (HELO [10.212.111.147])
 ([10.212.111.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 09:29:51 -0700
Subject: Re: [PATCH 0/9] ASoC: Intel: add new TGL/ADL configurations
To: Mark Brown <broonie@kernel.org>
References: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
 <161858869852.28833.4104992497142755503.b4-ty@kernel.org>
 <ce1dde92-6d5b-8fa7-8b36-a6efbb39b922@linux.intel.com>
 <20210504162426.GD7094@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <35089fde-74b1-1b9f-84bd-f8ab4e46d68f@linux.intel.com>
Date: Tue, 4 May 2021 11:29:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210504162426.GD7094@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, "Lu,
 Brent" <brent.lu@intel.com>
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



On 5/4/21 11:24 AM, Mark Brown wrote:
> On Tue, May 04, 2021 at 11:19:09AM -0500, Pierre-Louis Bossart wrote:
> 
>> Mark, I thought the series was applied but only 3 out of 9 patches seemed to
>> have been merged. There wasn't any expectation/pressure that they would land
>> in 5.13 so that's not a problem, but for the 5.14 cycle should I resend the
>> remaining ones, we now have a new machine driver developed by Brent Lu [1]
>> that relies on the sof-maxim-common module in patch 9?
>> Let me know what's easiest for you, thanks!
> 
> I don't recall deliberately discarding any of the patches, I can only
> assume that something caused b4 to only see some of them.  Please
> resend.

will do, thanks for the quick feedback.
