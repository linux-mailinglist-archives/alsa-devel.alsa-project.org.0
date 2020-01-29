Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDBA14C7D6
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 10:11:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56B03167C;
	Wed, 29 Jan 2020 10:10:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56B03167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580289074;
	bh=oBFn66NA4Sb4R0fFmWzV/uJGRUXmHdJPkC84XbKEN1g=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gTePqW9UAfTC2r+iPMOKKWyrH/8KX3sEnz45SxsMVSPek++1hZed3+Pb3gvLC5x5s
	 c3BCkEp0nlijdWEmHlNQwgUTNW0sjeGUlpoaktoOop4WHRQkMO9bmhSaIrjzyXMZbf
	 9qWLygMPTRwwnqv9uu8nFuO2el3WfrTEp544Xa4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFAA6F80123;
	Wed, 29 Jan 2020 10:09:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C55A4F8023F; Wed, 29 Jan 2020 10:09:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2E6EF80229
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 10:09:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2E6EF80229
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 01:09:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,377,1574150400"; d="scan'208";a="261738291"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2020 01:09:13 -0800
To: Daniel Baluta <daniel.baluta@nxp.com>
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
 <20200128104356.16570-10-cezary.rojewski@intel.com>
 <e8a5f019516a7db1d42143c18d8e1c9081d4e37f.camel@nxp.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <ccc529d7-a562-c74e-76f7-d83f09cbb0fd@intel.com>
Date: Wed, 29 Jan 2020 10:09:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e8a5f019516a7db1d42143c18d8e1c9081d4e37f.camel@nxp.com>
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 09/11] ASoC: SOF: Intel: Probe compress
 operations
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

On 2020-01-29 08:55, Daniel Baluta wrote:
> On Tue, 2020-01-28 at 11:43 +0100, Cezary Rojewski wrote:
>> diff --git a/sound/soc/sof/intel/hda-compress.c
>> b/sound/soc/sof/intel/hda-compress.c
>> new file mode 100644
>> index 000000000000..da7de867d0af
>> --- /dev/null
>> +++ b/sound/soc/sof/intel/hda-compress.c
>> @@ -0,0 +1,132 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> 
> I think SPDX is enough.
> 
>> +//
>> +// This file is provided under a dual BSD/GPLv2 license.  When using
>> or
>> +// redistributing this file, you may do so under either license.
> 
> No need to add this boilerplate code.
> 

Header shares structure of all other headers within sof directory. If 
your claim is true, then all headers have to be updated, not just this 
one. Such change should be provided in a separate patch/ series.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
