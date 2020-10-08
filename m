Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B60542876B5
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 17:07:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 220CB167D;
	Thu,  8 Oct 2020 17:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 220CB167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602169629;
	bh=0opHIV+YGh4oTq1RpmL3T5suAs+vNjkfCa7Lm6OSxi0=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RjHupbyAnvLy8V0/Rftbj21PDuGVBAfRrfWLVn5nsOaWqzMvrEbaUeTPbGMk2ep1T
	 6f5JN/NoAuQCt8f+KaiUPKKSL0W3YF1agjwnfKm+7uoMNMy7IPu6OXOptr05im1Vcp
	 nyG1d7F/bWXKef+QOcNS/86aRZf5xbYtB1dtE6g4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6F46F80167;
	Thu,  8 Oct 2020 17:05:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D30CF80164; Thu,  8 Oct 2020 17:05:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D8F6F80090
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 17:05:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D8F6F80090
IronPort-SDR: gE38pP5IErMcJ1T5WMOlyVPkitVkiM1iGMggxOhNagHlOLmU/5/hfMMsZvUY7o3eLGMZOrsRv/
 pFT/aWCMGsbg==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="165460547"
X-IronPort-AV: E=Sophos;i="5.77,351,1596524400"; d="scan'208";a="165460547"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2020 08:04:41 -0700
IronPort-SDR: 8wUdwejBgP3ULgN5EJuNF7it4GJ09jutl4oUp+CrlINsKFVGvAKKTY/LJmERkwEQl1C+c80XEr
 Fq66BSkHgjNQ==
X-IronPort-AV: E=Sophos;i="5.77,351,1596524400"; d="scan'208";a="354526027"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2020 08:04:37 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1kQXUB-001t1W-LF; Thu, 08 Oct 2020 18:05:39 +0300
Date: Thu, 8 Oct 2020 18:05:39 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Stephen Warren <swarren@nvidia.com>, Lars-Peter Clausen <lars@metafoo.de>
Subject: (Optional?) DMA vs. PIO
Message-ID: <20201008150539.GQ4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>
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

Hi!

During internal review of one patch I have been puzzled with the following code
and Pierre suggested to ask mailing list for help.

My main concern is what was the idea behind? Does it mean we support optional
DMA in such case? If now, why not to return an error code directly?

---8<---8<---8<---

> Why ASoC core has the following code in the first place:
> 
> 387              chan = dma_request_chan(dev, name);
> 388              if (IS_ERR(chan)) {
> 389                      if (PTR_ERR(chan) == -EPROBE_DEFER)
> 390                              return -EPROBE_DEFER;
> 391                      pcm->chan[i] = NULL;
> 392              } else {
> 393                      pcm->chan[i] = chan;
> 394              }
> 
> (note lines 389-391).
> If PIO fallback is not okay, why not to return an error there?

no idea, the code has been this way since 2013
(5eda87b890f867b098e5566b5543642851e8b9c3)

It's worth asking the question on the mailing list, I don't know if this is a
bug or a feature.

-- 
With Best Regards,
Andy Shevchenko


