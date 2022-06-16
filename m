Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5308354D994
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 07:12:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAE0A1ABD;
	Thu, 16 Jun 2022 07:11:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAE0A1ABD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655356346;
	bh=NkEFYvNXfkRiyQzrKr5w73UFu/bNjvCsd8osZsw1FkQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HuJTt5d3RTfjOCDdgb+87qIuvW3dMvpS+Too2MiWD8h4hdw9ht2VQjr6gMsEPeJjO
	 vdu1ZY5CrXTjP0g9KAs6nlHeS+0E/EvPTc3FajoIQn/BUmflaR6JiC2uYd19NNryFA
	 y0n0wwA84a6Lzr4ImfbR6fDLUqQtipfWHuq7XnZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21ABFF80310;
	Thu, 16 Jun 2022 07:11:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA533F801D8; Thu, 16 Jun 2022 07:11:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B99E5F800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 07:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B99E5F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RzuDUnMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655356279; x=1686892279;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NkEFYvNXfkRiyQzrKr5w73UFu/bNjvCsd8osZsw1FkQ=;
 b=RzuDUnMsSut/Ui2HgQt8dBdjhR5bAAAXpQ9bi2fZ6nAwSTC/LVP/Gm9t
 gesKm/KuPQA96wIoZHm/tqrRBCONfOT5mdWMms9rZAJXaVVZiXPrAD1Ue
 d0UyeqVZjd0VIp8uCm2hxYP0VxU3lwKyFdqKgBi4Bwm4k5o4e80ZyRt5V
 NmitK42lQxsP2IElLuh3qXUDOSyuLiG+S3e4CL8E3HoPhmeUmzV5S7HKM
 H85Q9Y+8tE1OzPIywd77TucO7Vzt4Rh+Jqe5sTHc1M95nMjlxjnejDJSV
 n+5bTKmnbqGP5Yr1JSHxCFGE1HyttHDMbTRQcAA4QCLKZAoEiR8gS9gsj A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="280201010"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="280201010"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 22:11:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="641365226"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.174.230])
 ([10.249.174.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 22:11:05 -0700
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
 <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <7a9f0c2d-f1e9-dd2f-6836-26d08bfa45a0@intel.com>
Date: Thu, 16 Jun 2022 13:11:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-parport@lists.infradead.org, kvm list <kvm@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Networking <netdev@vger.kernel.org>,
 linux-staging@lists.linux.dev, bpf <bpf@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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



On 5/26/2022 4:32 PM, Arnd Bergmann wrote:
> On Wed, May 25, 2022 at 11:35 PM kernel test robot <lkp@intel.com> wrote:
>> .__mulsi3.o.cmd: No such file or directory
>> Makefile:686: arch/h8300/Makefile: No such file or directory
>> Makefile:765: arch/h8300/Makefile: No such file or directory
>> arch/Kconfig:10: can't open file "arch/h8300/Kconfig"
> 
> Please stop building h8300  after the asm-generic tree is merged, the
> architecture is getting removed.
> 
>          Arnd
> 

Hi Arnd,

Thanks for the advice, we have stopped building h8300 for new kernel.

Best Regards,
Rong Chen
