Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CED9721A
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 08:16:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE06D1658;
	Wed, 21 Aug 2019 08:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE06D1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566368185;
	bh=MeUWqrAd+YqVmIDwST76V1Dm7P/JiCDENmn/v2fz93A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=abIHOd35gPWwS8zO7n1Ung8bMtveXyMPQ1jOlZulDbtM85cyu6JckwLbSu06KWnzO
	 AlPy3ZZlIAu9ueScn7HzWGQSJpuOui24qk6MXv2l7r5sOnlfKp0TxG/LTagfXSsT+p
	 YxSy6u+vpPb4+4kg40UTLgB9QQ9yTk5av2+B/Qco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF6CEF80157;
	Wed, 21 Aug 2019 08:14:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 781F9F8036E; Tue, 20 Aug 2019 10:41:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CE23F802E0
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CE23F802E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 01:41:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="172385728"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.6]) ([10.239.13.6])
 by orsmga008.jf.intel.com with ESMTP; 20 Aug 2019 01:41:00 -0700
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <alpine.DEB.2.21.1908091229140.2946@hadrien>
 <20190809123112.GC3963@sirena.co.uk>
 <88ac4c79-5ce3-3f1a-5f6e-3928a30a1ef5@ti.com>
 <alpine.DEB.2.21.1908091519400.2946@hadrien>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <297e44a8-e08d-ddf2-e5e8-b532965b4a8d@intel.com>
Date: Tue, 20 Aug 2019 16:41:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908091519400.2946@hadrien>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 21 Aug 2019 08:14:38 +0200
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Julia Lawall <julia.lawall@lip6.fr>, Mark Brown <broonie@kernel.org>,
 kbuild-all@01.org
Subject: Re: [alsa-devel] [kbuild-all] [PATCH] fix odd_ptr_err.cocci warnings
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Peter,

We have updated to only send the reports to you, please see 
https://github.com/intel/lkp-tests/blob/master/repo/linux/omap-audio

Best Regards,
Rong Chen

On 8/9/19 9:21 PM, Julia Lawall wrote:
>
> On Fri, 9 Aug 2019, Peter Ujfalusi wrote:
>
>>
>> On 09/08/2019 15.31, Mark Brown wrote:
>>> On Fri, Aug 09, 2019 at 12:30:46PM +0200, Julia Lawall wrote:
>>>
>>>> tree:   https://github.com/omap-audio/linux-audio peter/ti-linux-4.19.y/wip
>>>> head:   62c9c1442c8f61ca93e62e1a9d8318be0abd9d9a
>>>> commit: 62c9c1442c8f61ca93e62e1a9d8318be0abd9d9a [34/34] j721e new machine driver wip
>>>> :::::: branch date: 20 hours ago
>>>> :::::: commit date: 20 hours ago
>>>>
>>>>   j721e-evm.c |    4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> --- a/sound/soc/ti/j721e-evm.c
>>>> +++ b/sound/soc/ti/j721e-evm.c
>>>> @@ -283,7 +283,7 @@ static int j721e_get_clocks(struct platf
>>> This file isn't upstream, it's only in the TI BSP.
>> Yes, it is not upstream, but the fix is valid.
>>
>> Julia: is it possible to direct these notifications only to me from
>> https://github.com/omap-audio/linux-audio.git ?
>>
>> It mostly carries TI BSP stuff and my various for upstream branches nowdays.
> Please discuss it with the kbuild people.  They should be able to set it
> up as you want.
>
> You can try lkp@intel.com
>
> julia
> _______________________________________________
> kbuild-all mailing list
> kbuild-all@lists.01.org
> https://lists.01.org/mailman/listinfo/kbuild-all

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
