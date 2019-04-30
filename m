Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBC4FB31
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 16:15:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D93C416B3;
	Tue, 30 Apr 2019 16:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D93C416B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556633752;
	bh=I1/CLBRG4HnDZgv+0jWGnLHPu/S7NZVpwL9O0wg2A/Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lo1AwQ5mNvwEVYq//1pNo7GN+BZrcj7RnzO1UvaKLGvPLZbqkjqJgpeApJAFWhLaD
	 A8CyY+YbN3GDWf38d8FFmp7c5gntMuf5HdM9SVdGVYrrwP5Z7kH6Gj51uQODsqLpwm
	 tiMLP6PLI1Y43/UygzZsBxWY8XNK+t6aEjSZiiGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA02AF896EC;
	Tue, 30 Apr 2019 16:14:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04AF6F896AA; Tue, 30 Apr 2019 16:14:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FE69F80759
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 16:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FE69F80759
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 07:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,414,1549958400"; d="scan'208";a="138731419"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 30 Apr 2019 07:13:58 -0700
Received: from brettjgr-mobl1.ger.corp.intel.com (unknown [10.254.180.216])
 by linux.intel.com (Postfix) with ESMTP id CD494580372;
 Tue, 30 Apr 2019 07:13:56 -0700 (PDT)
To: Greg KH <gregkh@linuxfoundation.org>
References: <20190411031701.5926-1-pierre-louis.bossart@linux.intel.com>
 <20190411031701.5926-3-pierre-louis.bossart@linux.intel.com>
 <20190414095839.GG28103@vkoul-mobl>
 <08ea1442-361a-ecfc-ca26-d3bd8a0ec37b@linux.intel.com>
 <20190430085153.GS3845@vkoul-mobl.Dlink>
 <9866ac8c-103d-22cd-a639-a71c39a685c2@linux.intel.com>
 <20190430140526.GB18986@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b036a602-704f-4286-001c-6d4b32e0391e@linux.intel.com>
Date: Tue, 30 Apr 2019 09:13:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430140526.GB18986@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, Vinod Koul <vkoul@kernel.org>,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH v3 2/5] soundwire: fix style issues
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


> My patch-bot would reject a patch that tried to do multiple types of
> different cleanups on the same file(s).  Has done so for _years_, this
> is not a new thing.

If there are tools let's use them (all the fixes in this series were 
reported by tools). Can you share pointers and location of this patch-bot?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
