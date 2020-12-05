Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6BD2CFBA4
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 16:01:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 403EE1921;
	Sat,  5 Dec 2020 16:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 403EE1921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607180504;
	bh=g78cXERgZMB82jkZMfWYXnVIz0zVILchaTSS7bFsayw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HbAd4GX4cn12CQUIKwpwww+38cHOOD3IBZj40P1/nEuMeMlv5roJoBleebca2pEgj
	 z8/SFZixnEO4krqb7pGxjraPfLZjAjiraEHYFnQZxQEDhzWqehyyygt34UZS2EoNPi
	 GEJ7MZR/6gB/C1mLQS4qOLHlbYNxA0dPjuzr3Y0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3174DF80290;
	Sat,  5 Dec 2020 16:00:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97AC5F80290; Sat,  5 Dec 2020 16:00:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAEDAF800E8
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 15:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAEDAF800E8
IronPort-SDR: DGEWhBoxsN+VZbbDzPsiGonl0vvHZKR2sGeoCOo7OEH249Ndd7yCFRTf1ZhPgM3xwLQn++o8lg
 wqhTMG4QdaWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="237628583"
X-IronPort-AV: E=Sophos;i="5.78,395,1599548400"; d="scan'208";a="237628583"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2020 06:59:54 -0800
IronPort-SDR: 8AWgwzUhEEs3eyeszZBytfK8vf8IHarISd5ixf6hqDSjMJ/oF0NPBiziNSPRVk7Aiic8dOKM2O
 g0oX0LMLnd7g==
X-IronPort-AV: E=Sophos;i="5.78,395,1599548400"; d="scan'208";a="436104267"
Received: from schamb2-mobl2.amr.corp.intel.com (HELO [10.212.89.161])
 ([10.212.89.161])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2020 06:59:53 -0800
Subject: Re: [PATCH 5/7] regmap: sdw: use no_pm routines for SoundWire 1.2 MBQ
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20201202204645.23891-1-yung-chuan.liao@linux.intel.com>
 <20201202204645.23891-6-yung-chuan.liao@linux.intel.com>
 <20201205074630.GS8403@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e4e3d7ea-0825-2c8c-4182-6d1b578200a3@linux.intel.com>
Date: Sat, 5 Dec 2020 08:52:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201205074630.GS8403@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 bard.liao@intel.com
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


>>   MODULE_DESCRIPTION("Regmap SoundWire MBQ Module");
>> -MODULE_LICENSE("GPL v2");
>> +MODULE_LICENSE("GPL");
> 
> Why do you want to change this ?

We only use MODULE_LICENSE("GPL") for new contributions since 'GPL v2' 
does not bring any information on the license, is equivalent to 'GPL' 
and only exists for 'historical reasons', see

https://www.kernel.org/doc/html/latest/process/license-rules.html


“GPL”	Module is licensed under GPL version 2. This does not express any 
distinction between GPL-2.0-only or GPL-2.0-or-later. The exact license 
information can only be determined via the license information in the 
corresponding source files.

“GPL v2”	Same as “GPL”. It exists for historic reasons.

We should have used 'GPL' in the initial regmap MBQ patch but didn't for 
some reason, this change just realigns with what we intended.

That said, this is unrelated to this no_pm patch so could be in a 
separate one if you preferred it that way.
