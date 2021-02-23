Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0763230A3
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 19:24:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26A15169B;
	Tue, 23 Feb 2021 19:23:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26A15169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614104684;
	bh=cD3nZuKMtvm94Q7MJokbZMsxs5kVxUAuPbPyA0bPJYc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=upksBUv3eZXrIYKMfwSGFmaFPz1FwKImq9UlbDcv/K98fJimEdgzr+Li2eJkgj4oP
	 WCRHDljVf4AuoiNiqJ0qZMZzjycBXakzD7wlHEQ6uzxohVCywsbiY4Iq/FQVbO37yh
	 DH8OIuQQ9Wnhs9JO4fuyzP33HC7YuPBcD50cD1f8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E9F3F804DA;
	Tue, 23 Feb 2021 19:20:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 825EDF804E0; Tue, 23 Feb 2021 19:20:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,TVD_SUBJ_WIPE_DEBT autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 196E9F804DA
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 19:20:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 196E9F804DA
IronPort-SDR: hiAZ3LtVZ6Z6Yb87OHdEq46//SstqDody9cwwBzFHI4YX8m6zMVuQG7Wk/KcJU99MkUgIHO0wm
 hQkUO4WQoqVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="184957469"
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="184957469"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 10:20:48 -0800
IronPort-SDR: /0gM3f526rJ3Az5sgtx+N91cijojE0AY+SkQc5QZYNvd15nwNeSNogq8MzpIQ85E9YkrK+v/0j
 KNLfXfU4Y7tA==
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="380600380"
Received: from aruizmcc-mobl1.amr.corp.intel.com (HELO [10.212.53.181])
 ([10.212.53.181])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 10:20:47 -0800
Subject: Re: [PATCH v2 6/6] ASoC: samsung: tm2_wm5510: remove shadowed variable
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, alsa-devel@alsa-project.org
References: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
 <CGME20210222213327eucas1p270af686a642a4cd31852635eed870c0c@eucas1p2.samsung.com>
 <20210222213306.22654-7-pierre-louis.bossart@linux.intel.com>
 <2625c1b1-1e05-9d04-e414-252674688eee@samsung.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <31e6f8a8-8346-0cd7-9f35-035f097b9cb5@linux.intel.com>
Date: Tue, 23 Feb 2021 09:13:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2625c1b1-1e05-9d04-e414-252674688eee@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
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



On 2/23/21 5:25 AM, Sylwester Nawrocki wrote:
> On 22.02.2021 22:33, Pierre-Louis Bossart wrote:
>> Move the top-level variable to the lower scope where it's needed.
> 
> Actually I like your original patch better as there is really no need
> for multiple lower scope declarations in that fairly small function.

I have no opinion, just let me know what the consensus is.
