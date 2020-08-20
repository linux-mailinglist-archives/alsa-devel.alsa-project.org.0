Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7940624BFF8
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Aug 2020 16:00:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 131FD1684;
	Thu, 20 Aug 2020 16:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 131FD1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597932055;
	bh=eHYrEeD3RUV23521by+Jpr+VGgUcMTn/TODr8duNkWk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kbRIzbpr+7ulop9E5vzyuE2kGX2IhweZBOHxifEGqzspJPhjTweAYMcnuYjzJRaOT
	 xLFqi2JoGrf9anPGHzYUuDMQfDlwxzds7UxBhnabn0FvgaArrI72d/jVUNrVVmXUfG
	 OCfAV9kRUv7BVp07Vndpstj/bo/Sc4xQeBnZ6+Tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C942F8023F;
	Thu, 20 Aug 2020 15:59:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9D9BF80228; Thu, 20 Aug 2020 15:59:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E5E0F800C0
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 15:59:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E5E0F800C0
IronPort-SDR: S+heiZ3xBq+c6Yms/eXyXKAL7kT7so8lq+oT8+RPh2/OQnEuVxNfSybHtlkl55gR9cO0bhTgkA
 WWY92BtRbzoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="219604254"
X-IronPort-AV: E=Sophos;i="5.76,333,1592895600"; d="scan'208";a="219604254"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 06:58:58 -0700
IronPort-SDR: 6IZe+4HdOlnXu4sAQ/X3emqRQvBALEapqQL42ZN2ur/bjkfRKDZeTNcMdOby3hs2weB9+4+/xA
 bFlPy4XPZtPA==
X-IronPort-AV: E=Sophos;i="5.76,333,1592895600"; d="scan'208";a="293488541"
Received: from svemulap-mobl2.amr.corp.intel.com (HELO [10.209.157.176])
 ([10.209.157.176])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 06:58:57 -0700
Subject: Re: [RESEND] ASoC: SOF: Intel: add build support for SoundWire
To: Jaroslav Kysela <perex@perex.cz>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, broonie@kernel.org,
 tiwai@suse.de
References: <20200819124429.3785-1-yung-chuan.liao@linux.intel.com>
 <5db411e9-2dba-fe5e-f200-9f5e05410007@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <61354e28-641d-b359-f1ed-d018458c4a97@linux.intel.com>
Date: Thu, 20 Aug 2020 08:58:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5db411e9-2dba-fe5e-f200-9f5e05410007@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org, bard.liao@intel.com
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


> Can we enable SDW/SOF also for the 5.8 stable kernel or some vital pieces are
> missing in 5.8?
> 
> If I am not wrong, it's a 5.9 patch, right?

I just tried with v5.8 stable and there are compilation issues due to 
missed dependencies between ASoC and SoundWire subsystems.

sound/soc/intel/boards/sof_sdw.c: In function ‘sdw_startup’:
sound/soc/intel/boards/sof_sdw.c:162:9: error: implicit declaration of 
function ‘sdw_startup_stream’; did you mean ‘sdw_enable_stream’? 
[-Werror=implicit-function-declaration]
   162 |  return sdw_startup_stream(substream);
       |         ^~~~~~~~~~~~~~~~~~
       |         sdw_enable_stream
sound/soc/intel/boards/sof_sdw.c: In function ‘sdw_shutdown’:
sound/soc/intel/boards/sof_sdw.c:167:2: error: implicit declaration of 
function ‘sdw_shutdown_stream’; did you mean ‘sdw_shutdown’? 
[-Werror=implicit-function-declaration]
   167 |  sdw_shutdown_stream(substream);
       |  ^~~~~~~~~~~~~~~~~~~
       |  sdw_shutdown

I also tried with plain vanilla v5.9-rc1, and I didn't see any issues. I 
think it'd be good to have this patch (and the other one with the 
namespace) be added to v5.9 indeed.

That said, this just adds compilation/build support. We are still 
missing PM patches that were merged by Vinod earlier this week, we 
submitted the multi-link patches and the last batch will be the 
bandwidth allocation.

UCM files + PulseAudio changes were shared earlier, so at this point 
5.10 should hopefully be the first intercept where SoundWire 'just 
works'(tm) across kernel/userspace.
