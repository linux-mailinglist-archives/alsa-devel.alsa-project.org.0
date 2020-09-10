Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 668A3263CC9
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 07:54:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16409166A;
	Thu, 10 Sep 2020 07:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16409166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599717252;
	bh=Rr43ETN5BnzQnh/AFr/VfVFBOAJWVE/smD7x0ee6+uw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n1n7f94LrHhfHKOe3Cpe1jC+VPZ8RRRnPA3kEPA/cERuRvhhKYo9CLTJHPEVF8Yn/
	 opjNkmc5cNv6xy06T+2WO9wtR0GhBBksORtvDXTzBa8TinKoUqzFFJ/ytB4OjxM3fi
	 NqVlKmW4EWUQnWEzn3gUjDhw53rulEO3hwjKZ+Qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5874F8026F;
	Thu, 10 Sep 2020 07:52:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A17FF8026F; Thu, 10 Sep 2020 07:52:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7B0FF8026F
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 07:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7B0FF8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="azvVm+IW"
Received: from localhost (unknown [122.179.50.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95A3A2080A;
 Thu, 10 Sep 2020 05:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599717143;
 bh=Rr43ETN5BnzQnh/AFr/VfVFBOAJWVE/smD7x0ee6+uw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=azvVm+IWvehvYY+s1HCB4ERwEKVwMQ5t9T1K3DBKkeP1KKsj+f4itjrORb7vzMxDm
 6dyZwRwHF1To/S7EAf0hqf5w/FLkkvVMwYFQHo3s8XTjnY88179Z3DOt8SERJY8H0h
 qgISUJwBsyUeD3yj2ZFrbUgEu3M8YR2JF1g6AMC0=
Date: Thu, 10 Sep 2020 11:22:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH -next] soundwire: intel: Remove ununsed function
Message-ID: <20200910055215.GP77521@vkoul-mobl>
References: <20200909131531.31380-1-yuehaibing@huawei.com>
 <14a09132-d0ed-7129-73df-cbeb3154429b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14a09132-d0ed-7129-73df-cbeb3154429b@linux.intel.com>
Cc: yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 YueHaibing <yuehaibing@huawei.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 09-09-20, 08:46, Pierre-Louis Bossart wrote:
> 
> 
> On 9/9/20 8:15 AM, YueHaibing wrote:
> > If CONFIG_PM is not set, build warns:
> > 
> > drivers/soundwire/intel.c:488:12: warning: 'intel_link_power_down' defined but not used [-Wunused-function]
> > 
> > Move this to #ifdef block.
> 
> Yes, thanks for the report, it's a valid issue, but maybe the fix is to add
> __maybe_unused more consistently and remove the CONFIG_PM dependency.
> 
> Vinod, what would you prefer?

__maybe_unused is the recommendation, it should be updated to use that

Thanks
-- 
~Vinod
