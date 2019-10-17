Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0815DB358
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 19:34:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F05716B8;
	Thu, 17 Oct 2019 19:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F05716B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571333649;
	bh=kwB1GcYmnR0tIqlUFSkm2rjJ3Z37yRKijjJvxesiBqY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LyfnuNwTa0dfVDppkH8ns2XvCqUVBHYjdKQWM1fhpqnZEUT7P8eC5D9nqNew5qVEL
	 xCoAij80d5J6CwQWdCcOix3stGrJRrqpzee8Rko4VDRmeeflS1UCwEMP6EeYM9AnuB
	 jsU3XIfZVG4pTf2zV/RRN0JL9KgLw3Xtb1cv7o9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1277BF80322;
	Thu, 17 Oct 2019 19:32:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35645F804AA; Thu, 17 Oct 2019 19:32:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78F57F80322
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 19:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78F57F80322
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 10:32:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,308,1566889200"; d="scan'208";a="279956391"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 17 Oct 2019 10:32:12 -0700
Received: from mchancoc-mobl.amr.corp.intel.com (unknown [10.251.8.4])
 by linux.intel.com (Postfix) with ESMTP id 194685802F0;
 Thu, 17 Oct 2019 10:32:12 -0700 (PDT)
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20191017152645.65892c78@canb.auug.org.au>
 <e8994e88-bdab-b3be-d62f-550ce9f2c76d@infradead.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0f8fa7fb-dd1d-c26d-7756-a525aa46cf71@linux.intel.com>
Date: Thu, 17 Oct 2019 12:31:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e8994e88-bdab-b3be-d62f-550ce9f2c76d@infradead.org>
Content-Language: en-US
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, Vinod Koul <vkoul@kernel.org>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] linux-next: Tree for Oct 17 (soundwire)
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 10/17/19 10:22 AM, Randy Dunlap wrote:
> On 10/16/19 9:26 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20191016:
>>
> =

> on x86_64:
> =

> # CONFIG_BLOCK is not set
> =

>    CC [M]  drivers/soundwire/intel_init.o
> In file included from ../drivers/soundwire/intel_init.c:12:0:
> ../include/linux/iomap.h: In function =91iomap_sector=92:
> ../include/linux/iomap.h:76:48: error: =91SECTOR_SHIFT=92 undeclared (fir=
st use in this function); did you mean =91SECTIONS_SHIFT=92?
>    return (iomap->addr + pos - iomap->offset) >> SECTOR_SHIFT;
>                                                  ^~~~~~~~~~~~
>                                                  SECTIONS_SHIFT

Yes, looks like by fixing cross-compilation issues I added new ones.
We can either add an explicit dependency on CONFIG_BLOCK or remove the =

use of ioread32() and use readl() instead. I didn't write the initial =

code and I have no idea what the intent behind using ioread32 was.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
