Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAF925FBF0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 16:19:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 256951796;
	Mon,  7 Sep 2020 16:18:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 256951796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599488348;
	bh=A/bIY1WckCrPgIOMj+IxDI6uQGFD84uO7r4OFtsQEjA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O8pYHEoRcGwFW/juCQiCLLvYNnz3jcRIeogGfMIK4mQg8o+8flsw8HwvNCQhSDjzY
	 VXBkBZkl9EYrO4BwGPO6qtQhP+EYiuBPnGBqyerTFZK8YuP4lkpphYWEtsT5blLBZV
	 mV1Y2IE9OMk8VQ8dzMKeZVmPzRKxh+bDKMJS/Wh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66D61F800B9;
	Mon,  7 Sep 2020 16:18:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EF51F80227; Mon,  7 Sep 2020 16:18:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E94DDF800D3
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 16:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E94DDF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RA7qHpWq"
Received: from localhost (unknown [122.167.151.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7398A20714;
 Mon,  7 Sep 2020 14:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599488282;
 bh=A/bIY1WckCrPgIOMj+IxDI6uQGFD84uO7r4OFtsQEjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RA7qHpWqcT/wOyxkE9ohLbGlYvN/qrbtGw/RkZjV6AW5EMVtnMbYnmxQakUMQGOyU
 lCRqmPMxHW5M0SBB0NQAXJk4O1/lZqk4gntcKdrWy34EbeXFtDpyT+aQ/SM8Q0w8rP
 nA/oZWQ8f554p+mHA7NVB+GxE6eOKpDDX0HYzU9M=
Date: Mon, 7 Sep 2020 19:47:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 0/4] soundwire: qcom: add support for mmio soundwire
 master
Message-ID: <20200907141752.GD2639@vkoul-mobl>
References: <20200905173905.16541-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200905173905.16541-1-jonathan@marek.ca>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 05-09-20, 13:39, Jonathan Marek wrote:
> This adds initial support for soundwire device on sm8250.
> 
> Tested with the "wsa" sdw device, which is simpler than the others.
> 
> v2 addresses some feedback, but I kept this series as simple as possible.
> In particular, I didn't implement CMD_NACKED from FIFO_STATUS, because
> the downstream driver doesn't define this bit, so I can't implement it.
> Soundwire works without it and It shouldn't be difficult to implement later.

Applied all, thanks

-- 
~Vinod
