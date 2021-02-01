Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D8230A5A9
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 11:43:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B897E1776;
	Mon,  1 Feb 2021 11:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B897E1776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612176214;
	bh=jMGFVom3o9SisYFVYliXyOSgOs0PraIR76dQsjdWD4U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JVStGpfXUU2ZKJbbafv5T4hV7930yRt6sHo7oS1dsSFQLlVqn5fNfXNjKXtI64koL
	 gXTUFfN4KUbZZNLjVIfDOKFgcB8tk/Kj9KqYX+CoeAqpgZ0mBBXjqwt7NFI7oFWdaw
	 dQCDZuiUg9uuP1yrNB7ALxKKcC4kvANw9TVVhx0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B9C7F801DB;
	Mon,  1 Feb 2021 11:42:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FD68F80155; Mon,  1 Feb 2021 11:42:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAD0CF80152
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 11:42:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAD0CF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cVTJQwwh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0905864DD8;
 Mon,  1 Feb 2021 10:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612176154;
 bh=jMGFVom3o9SisYFVYliXyOSgOs0PraIR76dQsjdWD4U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cVTJQwwhar+cPS71ncFP3tPnD5B+l6r0zNy4ecVf1qbRwkvrlWytYsEC+Tl3M7/w8
 1zMJQKIKzzQE+W2sRnAx5w6ebr7s52li9qWsfnM/9AtTFkBo/2yTgSroAoaU2gYGQ/
 KTIe33lSR+X/LXJ7RgAPTFDhFUrbhTEi8PJt3bUBcSzzkOZMBGVZc0a+tzui427Dxi
 D369kDe0/92oXxy4qOP0HPDOBoHbSJplkh79Uk9RZCC5kv4DiknSElKud6SQeqCdh/
 c2q+t58lGdAnG/c1L0KFVX+CZ77drW9MgN85KVEdFSbLV9xv/+62An7HHCGWDTxXTi
 nHHBaHncbeTLg==
Date: Mon, 1 Feb 2021 16:12:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 2/3] soundwire: intel: add
 SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH quirk
Message-ID: <20210201104229.GY2771@vkoul-mobl>
References: <20210126083746.3238-1-yung-chuan.liao@linux.intel.com>
 <20210126083746.3238-3-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126083746.3238-3-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 26-01-21, 16:37, Bard Liao wrote:
> There is nothing we can do to handle the bus clash interrupt before
> interrupt mask is enabled.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index a2d5cdaa9998..f7ba1a77a1df 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1286,6 +1286,8 @@ static int sdw_master_read_intel_prop(struct sdw_bus *bus)
>  	if (quirk_mask & SDW_INTEL_QUIRK_MASK_BUS_DISABLE)
>  		prop->hw_disabled = true;
>  
> +	prop->quirks = SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH;

Should this not be last 'enabling' the quirk patch in series :)

-- 
~Vinod
