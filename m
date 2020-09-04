Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 666B325D49B
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 11:21:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB8951AEF;
	Fri,  4 Sep 2020 11:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB8951AEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599211270;
	bh=5muqg1n4qr0H2eZLDk1igsJ/uAMP9XgjBEFMVW5EZ4k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dSfI8tQP+WNTeSc9BfCvD623e4zKpDAjaBehu/cjhgwwvGltB03LvpzbdQbXbc4mz
	 NXw8NeJaj5KlqukBIjlAUhW0Dp+5SDpD6xexAKtuJjrRJVqQ/swZVzoKzbmuMO0gc5
	 dbDTBhefOHc65est7O0rPUp1e4mGRYEElDVbupGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DA87F800F0;
	Fri,  4 Sep 2020 11:20:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4512DF8025E; Fri,  4 Sep 2020 11:20:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 302E5F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 11:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 302E5F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JBnRSDSw"
Received: from localhost (unknown [122.182.253.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A132320770;
 Fri,  4 Sep 2020 09:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599211196;
 bh=5muqg1n4qr0H2eZLDk1igsJ/uAMP9XgjBEFMVW5EZ4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JBnRSDSwieNlZQTu40xloN/GNkLzOciw6Rmdan7tWghiOtF1uoLXUE8efnLYzWHwu
 /LN+87kCXL+q6WNYyZr7ma0OVvt2xDdR0hS63cUvqm/LeXVD7i7bNkuix5NBsFfQzA
 1ZZbw8SMbgLWMUJb/WPcPAHRZVWAhWr6PUPFMlT8=
Date: Fri, 4 Sep 2020 14:49:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 0/3] ASoC: Add sdw stream operations to dailink ops.
Message-ID: <20200904091950.GX2639@vkoul-mobl>
References: <20200903204650.31098-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903204650.31098-1-yung-chuan.liao@linux.intel.com>
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

On 04-09-20, 04:46, Bard Liao wrote:
> Sdw stream operation APIs can be called once per stream. Move these
> operations to dailink ops. The linked series is "soundwire: Remove sdw
> stream operations from Intel soundwire dai".
> 
> Pierre-Louis Bossart (3):
>   ASoC: soc-dai: clarify return value for get_sdw_stream()
>   ASOC: Intel: sof_sdw: add dailink .trigger callback
>   ASOC: Intel: sof_sdw: add dailink .prepare and .hw_free callback

s/ASOC/ASoC

with that:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
>  include/sound/soc-dai.h          |  3 +-
>  sound/soc/intel/boards/sof_sdw.c | 81 ++++++++++++++++++++++++++++++++
>  2 files changed, 83 insertions(+), 1 deletion(-)
> 
> -- 
> 2.17.1

-- 
~Vinod
