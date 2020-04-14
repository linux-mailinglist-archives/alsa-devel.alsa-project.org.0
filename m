Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E611A8B8A
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 21:55:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C98E41658;
	Tue, 14 Apr 2020 21:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C98E41658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586894127;
	bh=yIuE2PeE7UOO5ZyNWXUhE59trWdpkRqyihK3KhFtYBI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c0ZTJiG+I0M3E5xIdK0/FXEDhfMy8WCB8Gt0PgXsbqB8x51DdID01KEuvyhHBwcaf
	 QXJQnma2wcy8NEcnZNS+XjHpBL4pUyP89fwtVLAMxmoBaB7RNifVIIKgU7eJICF+qu
	 2dYgaM3jhVRU6f8C+0YMlS+4wkEq4TbdLWqOiomk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 067AAF800F5;
	Tue, 14 Apr 2020 21:53:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D2F9F800F5; Tue, 14 Apr 2020 21:53:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85A05F800F5
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 21:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85A05F800F5
IronPort-SDR: 0ulIr+4uEboZ/lcnFMW17NvYHTLuMIeR3ygHs9Zg53NVFNaGorV3t/zzOyWpVFLQ5yrhH4snWU
 G5thrgo0BZQQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 12:53:37 -0700
IronPort-SDR: K8PzKGe3/jwdy9SXZ7JQqasIBrAoadMme1gQ19RmYmMAkShCgfhcK6r5YaWJVvvgVnvXuPicff
 XdpRA5fKzmWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,384,1580803200"; d="scan'208";a="277378888"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.0.57])
 ([10.213.0.57])
 by fmsmga004.fm.intel.com with ESMTP; 14 Apr 2020 12:53:34 -0700
Subject: Re: [PATCH] ASoC: Intel: sst: ipc command timeout
To: "Lu, Brent" <brent.lu@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1586506705-3194-1-git-send-email-brent.lu@intel.com>
 <4f495cf1-4740-cf3b-196f-cc850c503b43@linux.intel.com>
 <BN6PR1101MB21328B6F4147640D07F9E40A97DA0@BN6PR1101MB2132.namprd11.prod.outlook.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <c8309abf-cbfb-a3db-5aa7-2e2f748a6d34@intel.com>
Date: Tue, 14 Apr 2020 21:53:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <BN6PR1101MB21328B6F4147640D07F9E40A97DA0@BN6PR1101MB2132.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Richard Fontana <rfontana@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 Mark Brown <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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

On 2020-04-14 18:20, Lu, Brent wrote:
>>
>> I have mixed feelings about this.
>>
>> One one hand, this looks simple enough.
>>
>> But on the other hand we have other users of memcpy_fromio(), including
>> SOF drivers, so what are the odds we have the same problems in other
>> places? Wouldn't it be safer to either change this function so that it's
>> behavior is not ambiguous or compiler-dependent, or fix the compiler?
>>
> 
> Hi Pierre and Amadeusz,
> 
> I have to admit that I didn't dig into clang's __builtin_memcpy to see what's
> happening inside so I don't have direct evidence to say it's clang's problem.
> What I know is kernel built by clang10 works fine but have this issue once
> changed to clang11. At first I also suspect that it's a timing issue so I checked
> the command transaction. The transaction is simple, host writes command
> in SST_IPCX register, the DSP then writes reply in SST_IPCD register and
> trigger an interrupt. Finally the irq thread sst_byt_irq_thread() reads the
> SST_IPCD register to complete the transaction. I added some debug messages
> to see if there is something wrong in the transaction but it all looks good.
> 
> I am also confused that why this only happens to BYT but not BDW since they
> share the same register accessing code in sst-dsp.c. I checked the code and
> realized that in BDW, the irq thread (hsw_irq_thread) performs 32-bit register
> read instead of 64-bit in BYT platform. Therefore I change the code in BYT to
> use two readl() calls and found the problem is gone. My best guess is it's
> related to the implementation of __builtin_memcpy() but not sure it's the
> timing or implementing cause this problem.
> 
> 
> Regards,
> Brent
> 

Regs width difference between BDW and BYT comes from specification. BDW 
has IPC registers which are 32 wide. This fact ain't exactly the reason 
to modify sst_shim32_read64.

I'm sharing Amadeo's point of view. Your change should slow down 
execution a bit - but that might be just what handlers needed to make 
everything work again. Debug prints also slow down the execution what 
could have prevented you from spotting the real problem.
Let's ignore the memcpy stuff for a moment - could you focus on 
elaborating the scenario where such issue occurs? Your initial commit 
message also skips important bits such as platform used when reproducing 
and so on, please add them.

Thanks,
Czarek
