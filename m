Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9115193A1C
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 09:00:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 755851670;
	Thu, 26 Mar 2020 08:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 755851670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585209645;
	bh=8VpW10+aCq3xWdKbDCMKThCG60FCE5+BKCVSiTkD0hc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GHKEuwAxPhCK0uaeehTsKfa0mbJ/mdLEQqE1QOMsmOY0WZpjmRizm56KJjoSSmfkA
	 9c5FidmkLP+iQ41y6wPIMRL+CANT/qMTqg/g4Sym4VOsKFIM9oWRel3B6gzkAKJJOz
	 +tstzckyd/xX+HTQ8gwTR6xmSFKWtmm6qIBmzgsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D58BF802DC;
	Thu, 26 Mar 2020 08:55:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA32CF80158; Wed, 25 Mar 2020 08:51:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B589AF800EF
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 08:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B589AF800EF
IronPort-SDR: waHZfAtYyzaQIyamNTsXQPxIXRxVRQ5c/JVjd+CKEnYBs97OM5eNE/Gzm1RrlzReZXXGIxCldU
 GWP/UsgHHP+g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 00:51:15 -0700
IronPort-SDR: G7wxsgTkr9vkVTq86VoZiIsFMwRyn2djwraZZSJ87AUyU3GKX2805IK+Rv8hRb++qD9s2NF9th
 YWKEyahXeNUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,303,1580803200"; d="scan'208";a="238457638"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.3]) ([10.239.13.3])
 by fmsmga007.fm.intel.com with ESMTP; 25 Mar 2020 00:51:05 -0700
Subject: Re: [cpufreq] 06c4d00466: will-it-scale.per_process_ops -53.4%
 regression
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20200320131509.564059710@linutronix.de>
 <20200324060124.GC11705@shao2-debian>
 <CAHp75VeeKZLeZ8E3Py7LECN54SPFHaRgkxrMzBYQWXM8x+4JhA@mail.gmail.com>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <43a4189a-7153-18e8-4657-4a4400002c05@intel.com>
Date: Wed, 25 Mar 2020 15:50:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VeeKZLeZ8E3Py7LECN54SPFHaRgkxrMzBYQWXM8x+4JhA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Thu, 26 Mar 2020 08:54:37 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Mark Gross <mgross@linux.intel.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-pci@vger.kernel.org,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Len Brown <lenb@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Linux PM <linux-pm@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, lkp@lists.01.org,
 Takashi Iwai <tiwai@suse.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 linux-crypto <linux-crypto@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
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



On 3/24/20 6:24 PM, Andy Shevchenko wrote:
> On Tue, Mar 24, 2020 at 8:02 AM kernel test robot <rong.a.chen@intel.com> wrote:
>> Greeting,
>>
>> FYI, we noticed a -53.4% regression of will-it-scale.per_process_ops due to commit:
>> commit: 06c4d00466eb374841bc84c39af19b3161ff6917 ("[patch 09/22] cpufreq: Convert to new X86 CPU match macros")
>> url: https://github.com/0day-ci/linux/commits/Thomas-Gleixner/x86-devicetable-Move-x86-specific-macro-out-of-generic-code/20200321-031729
>> base: https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git linux-next
>>
>> in testcase: will-it-scale
>> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 8G memory
>> with following parameters:
>
> drivers/cpufreq/speedstep-centrino.c change missed the terminator,
> perhaps it's a culprit, because I don't believe removing dups and
> reordering lines may affect this.
> Can you restore terminator there and re-test?
>

I have retested with the change, but it has no effect on the performance.

Best Regards,
Rong Chen
