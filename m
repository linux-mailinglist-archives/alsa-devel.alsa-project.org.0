Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A047AD64
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 18:18:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB2B51731;
	Tue, 30 Jul 2019 18:17:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB2B51731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564503481;
	bh=ZFXbTP7xel8bf0ZMOTJMLusXh9KwGOmG3Mfzu14ahWQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o6ZUuZljf45d45b3+SLHZGcAZ+oqa9As7mfQG45OKnLbz0EXVAvlcm1t7Mb6Aw+9U
	 u5wX1KRUaPHygu2O+FkD5qPU1tl+u0O36tVdYw0PngUKj0jvJzvImtn6XqYZq5iD7z
	 /LxR8ZfDEQ9Q5g/UvJKOIIfs65X+kkc3Ao9UX44U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F39FFF800AB;
	Tue, 30 Jul 2019 18:16:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BC6CF804CA; Tue, 30 Jul 2019 18:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 108D6F80214;
 Tue, 30 Jul 2019 18:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 108D6F80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 09:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; d="scan'208";a="183177305"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 30 Jul 2019 09:16:04 -0700
Received: from htsang-mobl1.amr.corp.intel.com (unknown [10.252.134.143])
 by linux.intel.com (Postfix) with ESMTP id 120205805B9;
 Tue, 30 Jul 2019 09:16:04 -0700 (PDT)
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>, linux-firmware@kernel.org
References: <af2d45578f7cdf908eb83cad3371b41315b7b5c4.camel@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <69af4cd7-f9c2-3b2b-2774-4da1063395b2@linux.intel.com>
Date: Tue, 30 Jul 2019 11:16:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <af2d45578f7cdf908eb83cad3371b41315b7b5c4.camel@linux.intel.com>
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 SOF <sound-open-firmware@alsa-project.org>
Subject: Re: [alsa-devel] [Sound-open-firmware] [GIT PULL] SOF v1.3 firmware
	binaries
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

[fixed alsa-devel email]

On 7/30/19 10:33 AM, Liam Girdwood wrote:
> The following changes since commit dff98c6c57383fe343407bcb7b6e775e0b87274f:
> 
>    Merge branch 'master' of git://github.com/skeggsb/linux-firmware (2019-07-26 07:32:37 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/thesofproject/linux-firmware.git sof-v1.3
> 
> for you to fetch changes up to cde3a116cea96976125b9215b303edfda85c9b54:
> 
>    sof: Add Intel SOF V1.3 release firmware binaries. (2019-07-30 16:06:41 +0100)
> 
> ----------------------------------------------------------------
> Liam Girdwood (1):
>        sof: Add Intel SOF V1.3 release firmware binaries.
> 
>   LICENCE.sof                                  | 1090 ++++++++++++++++++++++++++

Humm, that LICENSE file needs to be double-checked. Is there any reason 
why the text of this LICENSE.sof is different the usual text, e.g. from 
the LICENSE.adsp_sst?

You are missing both the first part:

***** INTEL BINARY FIRMWARE RELEASE LICENCE ********************************

Copyright (c) 2014-15 Intel Corporation.
All rights reserved.

Redistribution.

Redistribution and use in binary form, without modification, are permitted
provided that the following conditions are met:
*    Redistributions must reproduce the above copyright notice and the
      following disclaimer in the documentation and/or other materials 
provided
      with the distribution.
*    Neither the name of Intel Corporation nor the names of its 
suppliers may
      be used to endorse or promote products derived from this software 
without
      specific prior written permission.
*    No reverse engineering, decompilation, or disassembly of this 
software is
      permitted.

and the DISCLAIMER part, both of which seem pretty important to me. 
IANAL, but seeing only a patent clause looks odd. There should be a 
mention of redistribution and a clear disclaimer (not sure about the 
reverse engineering parts since the code is available it makes no sense).

>   WHENCE                                       |   33 +
>   intel/sof/apl/intel/sof-apl-v1.3.ri          |  Bin 0 -> 270336 bytes
>   intel/sof/bdw/sof-bdw-v1.3.ri                |  Bin 0 -> 100144 bytes
>   intel/sof/byt/sof-byt-v1.3.ri                |  Bin 0 -> 89668 bytes
>   intel/sof/cht/sof-cht-v1.3.ri                |  Bin 0 -> 90484 bytes
>   intel/sof/cnl/intel/sof-cnl-v1.3-6cc8da10.ri |  Bin 0 -> 274432 bytes
>   intel/sof/icl/intel/sof-icl-v1.3.ri          |  Bin 0 -> 278528 bytes

There are two types of platforms, the ones which require the Intel 
firmware to be signed with a private production key and the ones that 
are signed with the SOF community key.

if we have a single directory, then how do we deal with the two cases? 
It's not even clear to me which of the two cases are handled here.

>   intel/sof/sof-apl.ri                         |    1 +
>   intel/sof/sof-bdw.ri                         |    1 +
>   intel/sof/sof-byt.ri                         |    1 +
>   intel/sof/sof-cht.ri                         |    1 +
>   intel/sof/sof-cml.ri                         |    1 +
>   intel/sof/sof-cnl.ri                         |    1 +
>   intel/sof/sof-glk.ri                         |    1 +
>   intel/sof/sof-icl.ri                         |    1 +
>   intel/sof/sof-whl.ri                         |    1 +

unless I am missing something, we don't have any tables in the Linux 
kernel for the WHL and CML configurations, and IIRC we only generate 
sof-cnl.ri. Is there actually a user for sof-whl.ri and sof-cml.ri?


>   17 files changed, 1132 insertions(+)
>   create mode 100644 LICENCE.sof
>   create mode 100644 intel/sof/apl/intel/sof-apl-v1.3.ri
>   create mode 100644 intel/sof/bdw/sof-bdw-v1.3.ri
>   create mode 100644 intel/sof/byt/sof-byt-v1.3.ri
>   create mode 100644 intel/sof/cht/sof-cht-v1.3.ri
>   create mode 100644 intel/sof/cnl/intel/sof-cnl-v1.3-6cc8da10.ri
>   create mode 100644 intel/sof/icl/intel/sof-icl-v1.3.ri
>   create mode 120000 intel/sof/sof-apl.ri
>   create mode 120000 intel/sof/sof-bdw.ri
>   create mode 120000 intel/sof/sof-byt.ri
>   create mode 120000 intel/sof/sof-cht.ri
>   create mode 120000 intel/sof/sof-cml.ri
>   create mode 120000 intel/sof/sof-cnl.ri
>   create mode 120000 intel/sof/sof-glk.ri
>   create mode 120000 intel/sof/sof-icl.ri
>   create mode 120000 intel/sof/sof-whl.ri
> 
> _______________________________________________
> Sound-open-firmware mailing list
> Sound-open-firmware@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/sound-open-firmware
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
