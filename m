Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6991A905
	for <lists+alsa-devel@lfdr.de>; Sat, 11 May 2019 20:18:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 493D91794;
	Sat, 11 May 2019 20:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 493D91794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557598738;
	bh=94ls6v8wf7VJlBKTwJeFArkyu0N6y6LMUZiKWw6iK24=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fP8MHlfFUGodzZR5kDY77hQBlcSZaB+9x3+4vQIDuSEN83eOlWSfiCWbRPkoyzeH7
	 Nr5HNrW4scvZZAQZOeabK0iFDLIKjEgJ98g19wid0b0xs2RK+I5gc7i6PQncoAPAdt
	 1rOZYq62j7WJHNClq0Hcmn+fPqQqDLgD3oNnFcnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07B24F896DF;
	Sat, 11 May 2019 20:17:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5FC5F89682; Sat, 11 May 2019 20:17:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 131F2F80737
 for <alsa-devel@alsa-project.org>; Sat, 11 May 2019 20:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 131F2F80737
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 May 2019 11:17:03 -0700
X-ExtLoop1: 1
Received: from bgtruong-mobl1.amr.corp.intel.com (HELO [10.252.205.232])
 ([10.252.205.232])
 by orsmga006.jf.intel.com with ESMTP; 11 May 2019 11:17:01 -0700
To: Evan Green <evgreen@chromium.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20190510223929.165569-1-evgreen@chromium.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3cd20987-c251-f068-271a-546a83f27188@linux.intel.com>
Date: Sat, 11 May 2019 13:17:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510223929.165569-1-evgreen@chromium.org>
Content-Language: en-US
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Yu Zhao <yuzhao@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org, Ben Zhang <benzh@chromium.org>,
 Rakesh Ughreja <rakesh.a.ughreja@intel.com>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>,
 Guenter Roeck <groeck@chromium.org>
Subject: Re: [alsa-devel] [PATCH v3 0/2] ASoC: Intel: Add Cometlake PCI IDs
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



On 5/10/19 5:39 PM, Evan Green wrote:
> 
> This small series adds PCI IDs for Cometlake platforms, for a
> dazzling audio experience.
> 
> This is based on linux-next's next-20190510.

Thank you Evan, looks good. For the series

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Changes in v3:
> - Copy cnl_desc to new cml_desc, and avoid selecting cannonlake (Pierre-Louis)
> - Don't select CML_* in SND_SOC_INTEL_SKYLAKE (Pierre-Louis)
> 
> Changes in v2:
> - Add CML-H ID 0x06c8 (Pierre-Louis)
> - Add 0x06c8 for CML-H (Pierre-Louis)
> 
> Evan Green (2):
>    ASoC: SOF: Add Comet Lake PCI IDs
>    ASoC: Intel: Skylake: Add Cometlake PCI IDs
> 
>   sound/soc/intel/Kconfig                | 16 +++++++++++++
>   sound/soc/intel/skylake/skl-messages.c | 16 +++++++++++++
>   sound/soc/intel/skylake/skl.c          | 10 ++++++++
>   sound/soc/sof/intel/Kconfig            | 32 ++++++++++++++++++++++++++
>   sound/soc/sof/sof-pci-dev.c            | 28 ++++++++++++++++++++++
>   5 files changed, 102 insertions(+)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
