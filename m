Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5914425BF65
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 12:50:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F124D191C;
	Thu,  3 Sep 2020 12:50:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F124D191C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599130253;
	bh=+niwvcTwlWvSoZv6kAV2JhpMuJDFPstWYms2USZ7d24=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V2INd+be8yOYyCmI4dlNV/D7YbpuFXLdWzk6awyrAEvUepdyXCuEKOfs/n98E6eL3
	 aJXXiTv/S98+7z+m4TOwxNXzFGEp6f6Z5uLqcUordKCIOMotcUG2itdYIA1wWGrt71
	 7gIWxL591+pL60uZUTMLnFfJnTD4VxVMasuonjRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8158EF800BA;
	Thu,  3 Sep 2020 12:45:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB682F8021D; Thu,  3 Sep 2020 12:45:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE045F8020D
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 12:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE045F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ny980hjy"
Received: from localhost (unknown [122.171.179.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D9F320716;
 Thu,  3 Sep 2020 10:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599129900;
 bh=+niwvcTwlWvSoZv6kAV2JhpMuJDFPstWYms2USZ7d24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ny980hjyju00iDOjfOO3hsBIP++lWvh948a0EcV7re146EvnnvB0w+0AWdukZNNGJ
 cNrxyewXQ5B+/FLfYF5pxQOoP7uc3817+kQdOkZur7UaRTNv4sYS3aX5cHXwXFzSUK
 aVxoy9hfzbDeHwcf4pFlS2Iw6UBrcSskCz5MATJk=
Date: Thu, 3 Sep 2020 16:14:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 00/10] soundwire: intel: add multi-link support
Message-ID: <20200903104456.GR2639@vkoul-mobl>
References: <20200901150556.19432-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901150556.19432-1-yung-chuan.liao@linux.intel.com>
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

On 01-09-20, 23:05, Bard Liao wrote:
> This series enables multi-link support for Intel platforms.

Applied all, thanks

> 
> Changes in v2:
> - Remove the "soundwire: intel: Only call sdw stream APIs for the first
>   cpu_dai" patch form this series. We will move the sounwdire stream
>   operations to machine driver in another series.
> - Update the commit message and title of "soundwire: intel: add error log
>   for clock-stop invalid configs"
> 
> Pierre-Louis Bossart (10):
>   soundwire: intel: disable shim wake on suspend
>   soundwire: intel: ignore software command retries
>   soundwire: intel: add multi-link support
>   soundwire: intel: add missing support for all clock stop modes
>   soundwire: bus: update multi-link definition with hw sync details
>   soundwire: intel: add multi-link hw_synchronization information
>   soundwire: stream: enable hw_sync as needed by hardware
>   soundwire: intel: add error log for clock-stop invalid configs
>   soundwire: intel: pass link_mask information to each master
>   soundwire: intel: don't manage link power individually
> 
>  drivers/soundwire/intel.c      | 264 ++++++++++++++++++++++++++++-----
>  drivers/soundwire/intel.h      |   2 +
>  drivers/soundwire/intel_init.c |   1 +
>  drivers/soundwire/stream.c     |  15 +-
>  include/linux/soundwire/sdw.h  |   6 +
>  5 files changed, 243 insertions(+), 45 deletions(-)
> 
> -- 
> 2.17.1

-- 
~Vinod
