Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B191D7EBB
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 18:40:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DED151709;
	Mon, 18 May 2020 18:39:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DED151709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589820021;
	bh=RMKLM85Pvxf0nf2z4++GpDIdz6S2+rbp4vVTJmqTsMU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oMf3EH17dHAlHYmPocMvbUnrxrLV9JUOPrqQ0TmqQvikc5Y4YJwFCNTMOxdZLLk4R
	 VbhAuYbRT0AsE6EucsBwv7fgCWZpQv7tb4kk2KWQlldnVMAmawylyNC2hBV8IDjC2a
	 5zF3Xc/S63OZ2toGOlhbKlAUDeI0/Tuu/khHuWcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18689F800C9;
	Mon, 18 May 2020 18:38:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC81CF801DA; Mon, 18 May 2020 18:38:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8605F800C9
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 18:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8605F800C9
IronPort-SDR: MDKOzBm1MjfvCcGUtgDH490rto5LHFYI3kbvt8AgbT3nBEqSGSXRzlYxbpX0Z/gLJi2HxmCvIq
 paiEtf5p6IFg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 09:38:26 -0700
IronPort-SDR: cqdHRSJMnXQmW0DNXB9GS9Fw4+88yLQ8t+QFY3/hxfektuqq63+K4fClyngsDIkVtEzkswCL4L
 lVaaDinjNJtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; d="scan'208";a="465641504"
Received: from iremsen-mobl1.amr.corp.intel.com (HELO [10.254.66.150])
 ([10.254.66.150])
 by fmsmga005.fm.intel.com with ESMTP; 18 May 2020 09:38:25 -0700
Subject: Re: [PATCH v2 0/4] ASoC: Intel: Add KeemBay ASoC driver
To: Sia Jee Heng <jee.heng.sia@intel.com>, alsa-devel@alsa-project.org
References: <1589768242-4594-1-git-send-email-jee.heng.sia@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <66d7e059-c132-f04d-5dfd-4771b4aafc5e@linux.intel.com>
Date: Mon, 18 May 2020 11:38:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1589768242-4594-1-git-send-email-jee.heng.sia@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: liam.r.girdwood@linux.intel.com, broonie@kernel.org, tiwai@suse.com
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



On 5/17/20 9:17 PM, Sia Jee Heng wrote:
> The below series of patches support the KeemBay ASoC driver.
> It enabled the tlv320aic3204 machine driver and the platform driver initialize
> the i2s to capture and playback the pcm data on the ARM. The i2s is running
> in polling mode.
> 
> There is no DSP in the KeemBay SoC. Users are rely on the Gstreamer plugin
> to perform some Audio preprocessing.

This patch series matches what was reviewed internally at Intel by Andy 
Shevchenko, Cezary and I, so for patches 1..3:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Note that my review is mostly high-level, I don't personally have any 
knowledge or detailed information on this IP and architecture.

> 
> Change History:
> v2:
> - Corrected I2S naming for DT binding.
>    
> v1:
> - Initial version.
> 
> Sia Jee Heng (4):
>    ASoC: Intel: Add KeemBay platform driver
>    ASoC: Intel: Boards: Add KeemBay machine driver
>    ASoC: Intel: Add makefiles and kconfig changes for KeemBay
>    dt-bindings: sound: Add documentation for KeemBay sound card and i2s
> 
>   .../bindings/sound/intel,keembay-i2s.yaml          |  57 ++
>   .../bindings/sound/intel,keembay-sound-card.yaml   |  30 +
>   sound/soc/intel/Kconfig                            |   7 +
>   sound/soc/intel/Makefile                           |   1 +
>   sound/soc/intel/boards/Kconfig                     |  15 +
>   sound/soc/intel/boards/Makefile                    |   4 +
>   sound/soc/intel/boards/kmb_tlv3204.c               | 144 ++++
>   sound/soc/intel/keembay/Makefile                   |   4 +
>   sound/soc/intel/keembay/kmb_platform.c             | 746 +++++++++++++++++++++
>   sound/soc/intel/keembay/kmb_platform.h             | 145 ++++
>   10 files changed, 1153 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
>   create mode 100644 Documentation/devicetree/bindings/sound/intel,keembay-sound-card.yaml
>   create mode 100644 sound/soc/intel/boards/kmb_tlv3204.c
>   create mode 100644 sound/soc/intel/keembay/Makefile
>   create mode 100644 sound/soc/intel/keembay/kmb_platform.c
>   create mode 100644 sound/soc/intel/keembay/kmb_platform.h
> 
