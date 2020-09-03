Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC0C25BF61
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 12:50:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C0AC18FB;
	Thu,  3 Sep 2020 12:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C0AC18FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599130217;
	bh=Y17fOItbzHxWxDdPgwuBKoBEommCrq+F8Xn4jHcXZAI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PAUzEscPkSmw8L6qXQvLlpRLYZgfvcvrYQWg3DC1fnIGcmSb5ZX7m5sBdUr1lsHGk
	 R0AutGlUXU22p0p7ljbnjbaLlhay8n0jeykH9XHvPmA4UB/yPlBTf0lEbKSWpBk0Hf
	 A+WZP7qmgNzwIPL2IW2xgqFfibScvI1JcZGMuooI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A91CF8033F;
	Thu,  3 Sep 2020 12:43:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 518BDF8033E; Thu,  3 Sep 2020 12:43:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 171B3F802DC
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 12:42:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 171B3F802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OJ1xUt//"
Received: from localhost (unknown [122.171.179.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F72D20767;
 Thu,  3 Sep 2020 10:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599129773;
 bh=Y17fOItbzHxWxDdPgwuBKoBEommCrq+F8Xn4jHcXZAI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OJ1xUt//QkPMx0Cfc4p/DXpBnaafHLIK6mBMO4UnmugYOZ0hJi4IYYDgPYjBHzZS7
 qoCUTd5cy14V3mj7Xs5Ax+ZdUenLGKJngmE15ChxdkThCBPQJA1475Xkaook6vHjVS
 mAo2GA4iU++XEza0AFZqh0jHjA67DZPjqkPqoVyw=
Date: Thu, 3 Sep 2020 16:12:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: soundwire: Move sdw stream operations to
Message-ID: <20200903104248.GQ2639@vkoul-mobl>
References: <20200901150240.19288-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901150240.19288-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On 01-09-20, 23:02, Bard Liao wrote:
> sdw stream operation APIs can be called once per stream. dailink
> callbacks are good places to call these APIs.

Again, please mention here if this is to be merged thru sdw tree or ASoC
tree

> 
> Pierre-Louis Bossart (7):
>   ASoC: soc-dai: clarify return value for get_sdw_stream()
>   soundwire: stream: fix NULL/IS_ERR confusion
>   soundwire: intel: fix NULL/ERR_PTR confusion
>   ASOC: Intel: sof_sdw: add dailink .trigger callback
>   ASOC: Intel: sof_sdw: add dailink .prepare and .hw_free callback

These should be ASoC

>   soundwire: intel: remove .trigger operation
>   soundwire: intel: remove stream handling from .prepare and .hw_free
> 
>  drivers/soundwire/intel.c        | 60 ++++-------------------
>  drivers/soundwire/stream.c       |  2 +-
>  include/sound/soc-dai.h          |  3 +-
>  sound/soc/intel/boards/sof_sdw.c | 81 ++++++++++++++++++++++++++++++++
>  4 files changed, 92 insertions(+), 54 deletions(-)
> 
> -- 
> 2.17.1

-- 
~Vinod
