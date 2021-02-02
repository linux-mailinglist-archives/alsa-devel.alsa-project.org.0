Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 236CF30C7BB
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 18:29:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 822C21782;
	Tue,  2 Feb 2021 18:28:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 822C21782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612286979;
	bh=4AAE37e2Bxdt60R42XqHsMYAs+6VtrgnnIYrfKK7/mc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=piZpSqBj4nJIJGEsZncTf6LUdzU3IB9TgkUOG9hOq/dKjnYDQOlk7coEMq5aBw6dw
	 KtkJtWE/W6af2Kmbp7NwdfYfV3HZLxIxF4d4rvh/1THISnNi4TCOJhfa4GGh/hEpxw
	 ZnC8elZ4cBKshH9MsAN1JyM/kolhbgYq78AyFzwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89577F8023E;
	Tue,  2 Feb 2021 18:27:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 390F0F8023B; Tue,  2 Feb 2021 18:27:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4F89F80109
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 18:27:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4F89F80109
IronPort-SDR: C0VxHBld9H33j6ijRL2F5q0MIccVq7BE4+EuuLrdIsy9pQAd7lKT09osXJayp7E2vusDLblIEE
 DfwCi/QpI3nw==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="265726526"
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="265726526"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 09:27:48 -0800
IronPort-SDR: IR5PjwCStZQdpQtqcFgz7Wkc3sQluaVrplLmP+UXdn9IEf6Dj2MrBuPMBZhqPK9XXI78Fl3zZx
 Dee3RsH9FPoQ==
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="370798487"
Received: from ncruzgar-mobl.amr.corp.intel.com (HELO [10.212.75.122])
 ([10.212.75.122])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 09:27:46 -0800
Subject: Re: [PATCH 2/3] soundwire: intel: add
 SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH quirk
To: Vinod Koul <vkoul@kernel.org>
References: <20210126083746.3238-1-yung-chuan.liao@linux.intel.com>
 <20210126083746.3238-3-yung-chuan.liao@linux.intel.com>
 <20210201104229.GY2771@vkoul-mobl>
 <0ed1c91b-09ca-dc6f-39d1-850d12f4f9c4@linux.intel.com>
 <20210202044139.GH2771@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <32df8d27-3393-f049-a493-4ba43962d490@linux.intel.com>
Date: Tue, 2 Feb 2021 10:53:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210202044139.GH2771@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org, jank@cadence.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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



>>>> +	prop->quirks = SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH;
>>>
>>> Should this not be last 'enabling' the quirk patch in series :)
>>
>> Sorry, I don't understand the comment. Do you mind clarifying Vinod?
> 
> Sure, I would like to series built as, first defining the quirk
> along/followed by bus changes. Then the last patch should be intel
> controller changes and setting the quirks (like above) in the last
> patch.
> 
> Let me know if you would need further clarification

Got it, thanks.
