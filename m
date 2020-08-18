Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B83C0247E7A
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 08:33:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6411E16E0;
	Tue, 18 Aug 2020 08:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6411E16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597732409;
	bh=nMXqbm32hbEmgherpbeAfukazmSMKSnx5p8qVF7HpdM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BtJntvTHmUqSCECS0h50+hQwpdVJ5+uTI64RuzKlwAD38vCSXRrizjoC+ZH68I/Nx
	 tUj5ud/m8nDE6xe+BdPe8+umwWnm3pjEVSknr968fMGZMnIq0Qu6LAxTyiPxi3G2GQ
	 SzoPwlcD40zmd4TlL2d5pRIZV1v5uEJtXtVxTjT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7F8CF80228;
	Tue, 18 Aug 2020 08:31:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFDDDF8023F; Tue, 18 Aug 2020 08:31:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0F48F80114
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 08:31:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0F48F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xokRm1Y5"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC62D20738;
 Tue, 18 Aug 2020 06:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597732293;
 bh=nMXqbm32hbEmgherpbeAfukazmSMKSnx5p8qVF7HpdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xokRm1Y5cHMsvqz/9Dee/dubm0DU44Vxjn19pOHo29aeICf2tae4OLfSA+MCqpMO4
 e5S2jfTqb1N5wTVId+DYtV+h56Cay/Q7sMAMprQC4b37RP5OeMdYIsiqBXy6H8HPLW
 suLU3wAe2Auawk26nxHlWfJ8Pj0u3kL4olz+pmHA=
Date: Tue, 18 Aug 2020 12:01:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 00/12] soundwire: intel: add power management support
Message-ID: <20200818063129.GU2639@vkoul-mobl>
References: <20200817152923.3259-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817152923.3259-1-yung-chuan.liao@linux.intel.com>
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

On 17-08-20, 23:29, Bard Liao wrote:
> This series adds power management support for Intel soundwire links.

Applied all, thanks

> 
> Changes in v2:
> - Move "#include <linux/pm_runtime.h>" to the first required patch.
> - Fit debug log in single line. 
> 
> Bard Liao (1):
>   soundwire: intel: reinitialize IP+DSP in .prepare(), but only when
>     resuming
> 
> Pierre-Louis Bossart (9):
>   soundwire: intel: add pm_runtime support
>   soundwire: intel: reset pm_runtime status during system resume
>   soundwire: intel: fix race condition on system resume
>   soundwire: intel: call helper to reset Slave states on resume
>   soundwire: intel: pm_runtime idle scheduling
>   soundwire: intel: add CLK_STOP_TEARDOWN for pm_runtime suspend
>   soundwire: intel: add CLK_STOP_NOT_ALLOWED support
>   soundwire: intel_init: handle power rail dependencies for clock stop
>     mode
>   soundwire: intel: support clock_stop mode without quirks
> 
> Rander Wang (2):
>   soundwire: intel: add CLK_STOP_BUS_RESET support
>   soundwire: intel: refine runtime pm for SDW_INTEL_CLK_STOP_BUS_RESET
> 
>  drivers/soundwire/cadence_master.h |   4 +
>  drivers/soundwire/intel.c          | 363 ++++++++++++++++++++++++++++-
>  drivers/soundwire/intel.h          |   2 +
>  drivers/soundwire/intel_init.c     |  19 +-
>  4 files changed, 382 insertions(+), 6 deletions(-)
> 
> -- 
> 2.17.1

-- 
~Vinod
