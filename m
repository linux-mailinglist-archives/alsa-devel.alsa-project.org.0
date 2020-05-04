Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 206F81C3582
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 11:25:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFA9816F5;
	Mon,  4 May 2020 11:24:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFA9816F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588584342;
	bh=NewRAtZXp7UoUYEVXKnaDn1HTkwLJmgmye2c+dhlcFY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ioJLmtoW2TT4jaVEjmRtN+2oKc6fT1fZX3OjkVCMNFEQcaNrqoCuNrx7oN1wGo4k+
	 rGlIRznIVxaeEZT17TYNieSQQbEf8L90cexppGrLGU9iY4JsNTzuMmsSGvfvPxyrgp
	 M6B88rvzF4bF+VwbuqEWXOV0WX+5EQxJALkrx5m8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDB51F800DE;
	Mon,  4 May 2020 11:24:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 217A0F80249; Mon,  4 May 2020 11:23:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B301FF800DE
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 11:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B301FF800DE
IronPort-SDR: fvsk9YbzwPJxKl5CaTqt7wrKiVfzrsV3sKKjxeO4VwJCYPt2MT4iQcgGHb3//eBjkd6/m8HsdH
 BLEIgGxyPFUw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 02:23:49 -0700
IronPort-SDR: J1Cu5dy96mFd8lt0e95yC5aH2xOFfUGHqnzHJD6rhtCYkV88/ylCCYoTfZ9K3hG60rnEgIxdrj
 BMqyUlnNnE8g==
X-IronPort-AV: E=Sophos;i="5.73,351,1583222400"; d="scan'208";a="434044101"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.151.177])
 ([10.249.151.177])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 02:23:45 -0700
Subject: Re: [PATCH] ASoC: Intel: sst: ipc command timeout
To: "Lu, Brent" <brent.lu@intel.com>,
 "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1586506705-3194-1-git-send-email-brent.lu@intel.com>
 <4f495cf1-4740-cf3b-196f-cc850c503b43@linux.intel.com>
 <BN6PR1101MB21328B6F4147640D07F9E40A97DA0@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <c8309abf-cbfb-a3db-5aa7-2e2f748a6d34@intel.com>
 <BN6PR1101MB21328C54E66082227B9F497A97D50@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <5e84c48c-a5d1-b2ff-c197-5efa478c5916@linux.intel.com>
 <BN6PR1101MB2132D23B042284DDA667642A97AC0@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <9d003948-a651-9920-86b6-307e912dd8ed@linux.intel.com>
 <BN6PR1101MB21325FA4FB1446DC2CAF6C6797AA0@BN6PR1101MB2132.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <a0648aff-1c85-cc76-650c-1880381c026f@linux.intel.com>
Date: Mon, 4 May 2020 11:23:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BN6PR1101MB21325FA4FB1446DC2CAF6C6797AA0@BN6PR1101MB2132.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fontana <rfontana@redhat.com>, Mark Brown <broonie@kernel.org>,
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



On 4/30/2020 5:38 PM, Lu, Brent wrote:
>>
>> Hi,
>> yes that seems bit weird. It is bit better as it does not modify common code,
>> but still... Maybe going back to your original idea of replacing memcpy, try
>> replacing it with readq? It should generate one instruction read (although it is
>> only for x64_64, for 32 bit kernel we would still need to do something else).
>>
>> Thanks,
>> Amadeusz
> 
> Hi,
> 
> I've compared the assembly to see if there is clue. Both kernels are using 64-bit
> mov to read register and the only difference is optimized or not. Both
> implementations are looking good to me. Currently I don't have answer why
> slower kernel hits the problem while optimized one survived.
> 
> 1. Old kernel. Code is optimized and not able to reproduce the issue on this kernel.
> 
> (gdb) disas sst_shim32_read64
> Dump of assembler code for function sst_shim32_read64:
>     0x000000000000096c <+0>:     call   0x971 <sst_shim32_read64+5>
> => call __fentry__
>     0x0000000000000971 <+5>:     push   rbp
>     0x0000000000000972 <+6>:     mov    rbp,rsp
>     0x0000000000000975 <+9>:     mov    eax,esi
>     0x0000000000000977 <+11>:    mov    rax,QWORD PTR [rdi+rax*1]
> => perform 64-bit mov
>     0x000000000000097b <+15>:    pop    rbp
>     0x000000000000097c <+16>:    ret
> End of assembler dump.
> 

Hi,

That's why I would suggest trying with readq, it should also generate 
one instruction read x86_64 platforms, I looked a bit more and there is 
fallback to generate two 32 bit reads on 32bit platforms, so my previous 
concern about having to write separate handling for those platforms was 
unneeded. So I would recommend checking using it.

diff --git a/sound/soc/intel/common/sst-dsp.c 
b/sound/soc/intel/common/sst-dsp.c
index ec66be269b69..e96f636387d9 100644
--- a/sound/soc/intel/common/sst-dsp.c
+++ b/sound/soc/intel/common/sst-dsp.c
@@ -34,16 +34,13 @@ EXPORT_SYMBOL_GPL(sst_shim32_read);

  void sst_shim32_write64(void __iomem *addr, u32 offset, u64 value)
  {
-       memcpy_toio(addr + offset, &value, sizeof(value));
+       writeq(value, addr + offset);
  }
  EXPORT_SYMBOL_GPL(sst_shim32_write64);

  u64 sst_shim32_read64(void __iomem *addr, u32 offset)
  {
-       u64 val;
-
-       memcpy_fromio(&val, addr + offset, sizeof(val));
-       return val;
+       return readq(addr + offset);
  }
  EXPORT_SYMBOL_GPL(sst_shim32_read64);


Thanks,
Amadeusz
