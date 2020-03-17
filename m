Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0525518877C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 15:27:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9197D1813;
	Tue, 17 Mar 2020 15:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9197D1813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584455239;
	bh=LQ03HQGlVfKaxW/TWW5yUhbYIxxdLHFItUig4q7ZuX0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iArlM8CvDTHTk/4CLbewM4+BBOyDCgIQq9JftVdgVQHKuMTDKwC+oabHIZacAzy4Y
	 W2GheAwu7VYrcwCyAVgsvFVfHOPvuuAWqYaCylBrMLcqvDeTLw3/Me64k4iMjZNme0
	 V7LmCONBLjPmpP72sFIMtpHDcg4ooes7At73Rm/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3143F80256;
	Tue, 17 Mar 2020 15:25:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0728EF800CD; Tue, 17 Mar 2020 15:24:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD6FAF800CD
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 15:24:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD6FAF800CD
IronPort-SDR: 9ZPUPXPnIIRRyE590qPpedBbSfo+BcNLfcnznxx0x3tiVMaciA9H94O+DVoANbWnG1aLZ4mIEl
 BjeU8gXYazHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 07:24:47 -0700
IronPort-SDR: z6tRhruIKRbKwnps9QQqh/kGaQsiaTyf8oiJ8dlyOzVcUcsrY4SHRb4A2gd41wBHxfUDFy0ulP
 6FsHsJT5mGrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; d="scan'208";a="247835629"
Received: from dasabhi1-mobl.amr.corp.intel.com (HELO [10.255.35.148])
 ([10.255.35.148])
 by orsmga006.jf.intel.com with ESMTP; 17 Mar 2020 07:24:44 -0700
Subject: Re: [PATCH] soundwire: stream: only change state if needed
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org
References: <20200317105142.4998-1-pierre-louis.bossart@linux.intel.com>
 <6bc8412a-f6d9-64d1-2218-ca98cfdb31c0@linaro.org>
 <27a73cbd-9418-4488-5cb2-fb21f9fc9110@linux.intel.com>
 <c1e5dc89-a069-a427-4912-89d90ecc0334@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6dde3b32-a29a-3ac9-d95d-283f5b05e64a@linux.intel.com>
Date: Tue, 17 Mar 2020 08:19:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c1e5dc89-a069-a427-4912-89d90ecc0334@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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



On 3/17/20 8:04 AM, Srinivas Kandagatla wrote:
> 
> 
> On 17/03/2020 12:22, Pierre-Louis Bossart wrote:
>>
>> The change below would be an error case for Intel, so it's probably 
>> better if we go with your suggestion. You have a very specific state 
>> handling due to your power amps and it's probably better to keep it 
>> platform-specific.
> 
> Just trying to understand, why would it be error for Intel case?
> 
> IMO, If stream state is SDW_STREAM_ENABLED that also implicit that its 
> prepared too. Similar thing with SDW_STREAM_DEPREPARED.
> Isn't it?

the stream state is a scalar value, not a mask. The state machine only 
allows transition from CONFIGURED TO PREPARED or from DEPREPARED TO 
PREPARED, or DISABLED to PREPARED.
There is no allowed transition from ENABLED TO PREPARED, you have to go 
through the DISABLED state and make sure a bank switch occurred, and 
re-do a bank switch to prepare again.
