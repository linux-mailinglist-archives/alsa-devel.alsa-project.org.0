Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BE51A6A0E
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 18:40:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C67B1691;
	Mon, 13 Apr 2020 18:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C67B1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586796012;
	bh=ZzounlKCf+SxmeVsHr72GHByriM7Obo+AUkjPeADrfY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iy4sxqY+3nlcfk4pRjsXqt9W4tQHp1dxVLQUFBktU4E4adm6NAHUl/XehafML0cWD
	 MFwWZUpM8m2H98vWdHJrLV2a/BlO+1aP7cTpPlAxNRxWQpk1sQw0PQcjGk6iRs+gVd
	 TxUu2XB2IBqT2j6K4bzSjoV26KLiGuafRUv6npuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33C3BF80115;
	Mon, 13 Apr 2020 18:38:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1796FF80245; Mon, 13 Apr 2020 18:38:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88299F800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 18:38:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88299F800B9
IronPort-SDR: PXdkpLF5QhfUW9CLES92pGDF+cljKoSyjLjiWfEu/uwlApnfDPcsYZSdZB7mwoXKKGfyBSwTka
 QxF++sG6ae2A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2020 09:38:20 -0700
IronPort-SDR: P9MFAD5hVIj6/D40Krm6yqjswCFuhWRupgfdJE7Pg8y2o+TMWXaFI02khNJnf0/EmV45Ctho3z
 45xTLCIP8dIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; d="scan'208";a="454262343"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.25.178])
 ([10.213.25.178])
 by fmsmga006.fm.intel.com with ESMTP; 13 Apr 2020 09:38:18 -0700
Subject: Re: [PATCH] ASoC: Intel: haswell: Power transition refactor
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200330194520.13253-1-cezary.rojewski@intel.com>
 <293372ae-5270-a1d4-2577-04991c08e33f@intel.com>
 <ee6c0545-a325-8df4-9c26-d823582735af@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <49a16c64-5951-f327-c12a-d3264353b74b@intel.com>
Date: Mon, 13 Apr 2020 18:38:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ee6c0545-a325-8df4-9c26-d823582735af@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vkoul@kernel.org, broonie@kernel.org, Ross Zwisler <zwisler@google.com>,
 lgirdwood@gmail.com, tiwai@suse.com
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

On 2020-04-06 17:02, Pierre-Louis Bossart wrote:
> On 4/6/20 3:48 AM, Cezary Rojewski wrote:
>> On 2020-03-30 21:45, Cezary Rojewski wrote:
>>> Update D0 <-> D3 sequence to correctly transition hardware and DSP core
>>> from and to D3. On top of that, set SHIM registers to their recommended
>>> defaults during D0 and D3 proceduces as HW does not reset registers for
>>> us.
>>>
>>> Connected to:
>>> [alsa-devel][BUG] bdw-rt5650 DSP boot timeout
>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153098.html 
>>>
>>>
>>> Github issue ticket reference:
>>> https://github.com/thesofproject/linux/pull/1842
>>>
>>> Tested on:
>>> - BDW-Y RVP with rt286
>>> - SAMUS with rt5677
>>>
>>> Proposed solution (both in July 2019 and on github):
>>> 'Revert "ASoC: Intel: Work around to fix HW d3 potential crash issue"'
>>> is NAKed as it only covers the problem up and actually brings back the
>>> undefined behavior: some registers (e.g.: APLLSE) are describing LPT
>>> offsets rather than WPT ones. In consequence, during power-transitions
>>> driver issues incorrect writes and leaves the regs of interest alone.
>>>
>>> Existing patch - the non-revert - does not resolve the HW D3 issue at
>>> all as it ignores the recommended sequence and does not initialize
>>> hardware registers as expected. And thus, leaving things as are is also
>>> unacceptable.
>>>
>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>> ---
>>
>> Pierre, your thoughts on this? This has already been confirmed working.
> 
> I don't have any specific knowledge on Broadwell to comment. I also 
> haven't had time to test this patch, I was expecting Ross to provide his 
> Tested-by tag?

Hello,

Ross has provided his Tested-by tag already. Patch has been tested by 
Intel & Google side both. Given problem's impact, this fix is considered 
a critical one. I think we are good-to-go for quite a while now?

Czarek
