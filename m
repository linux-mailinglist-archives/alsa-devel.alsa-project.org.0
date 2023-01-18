Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CB867273C
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 19:40:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5A6D7971;
	Wed, 18 Jan 2023 19:39:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5A6D7971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674067224;
	bh=fNVfUI0/Z0DjRR7gwu1N9IY2Ziu6mt7cPXccrzYKj08=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CewfjcH1ZYGd3WMUIR7rHNi0w0o5fGoJcviu4Sj7jlgcFpMpSRcMPruOOF0f3DS7m
	 tjMGtOfBZSKdBgSM/1wrkUw68MIZ7c+7xvj+QUToAZ7fnnmGCdBRZMiN8v+iYkAoQ9
	 rfQSIIIxRTLRUP1ROEHt0F/pBjpNNyWPETyqEme8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA865F80552;
	Wed, 18 Jan 2023 19:38:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B715F80542; Wed, 18 Jan 2023 19:38:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3813AF80495
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 19:38:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3813AF80495
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hJbvU6AH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674067104; x=1705603104;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fNVfUI0/Z0DjRR7gwu1N9IY2Ziu6mt7cPXccrzYKj08=;
 b=hJbvU6AHsjI81rQmymHitMYKP06HMBhujSG/y/HdLgLBZ1byPAuXAH2Z
 ySI687UrGbz0aSIzOlY3U/JuPnaDDAf3uKRyHe/p8vQxyiPnLskGRu8hr
 Wzmyn+Vde4hiRXfvSpxqqF6x00PUfHZmD++S4zsaDk2QDK5YFJQQozVXR
 EDGv4jKP36sm66+YA3tZIkXxeZJ1/y2xAJYxaCdH8WJwbKnvPdU7lkn65
 sy130BO/NSYrWZRw597plbRLxM7uRC9ckvjkBHqLQpuFM8DlvGQNPgV69
 7PNnEipB5HDn/9pcTHah+5ilbyJPdxQ9+uhDGw869AuoXUK0faP8edFpU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327138543"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="327138543"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 10:38:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="783777265"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="783777265"
Received: from jaibarra-mobl.amr.corp.intel.com (HELO [10.209.131.1])
 ([10.209.131.1])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 10:37:59 -0800
Message-ID: <feb8eedc-c7fe-ef0e-85c8-faf6b0f3592e@linux.intel.com>
Date: Wed, 18 Jan 2023 11:43:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2 0/8] ASoC: cs42l42: Add Soundwire support
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
References: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/18/23 10:04, Stefan Binding wrote:
> The CS42L42 has a Soundwire interface for control and audio. This
> chain of patches adds support for this.
> 
> Patches #1 .. #5 split out various changes to the existing code that
> are needed for adding Soundwire. These are mostly around clocking and
> supporting the separate probe and enumeration stages in Soundwire.
> 
> Patches #6 .. #8 actually adds the Soundwire handling.
> 
> Changes since v1:
> - fixes for various review comments from v1
> - add support for wakeup from clock stop using hardware interrupts
> - use port_prep callback to prepare/deprepare codec
> 
> Richard Fitzgerald (6):
>   ASoC: cs42l42: Add SOFT_RESET_REBOOT register
>   ASoC: cs42l42: Ensure MCLKint is a multiple of the sample rate
>   ASoC: cs42l42: Separate ASP config from PLL config
>   ASoC: cs42l42: Export some functions for Soundwire
>   ASoC: cs42l42: Add Soundwire support
>   ASoC: cs42l42: Don't set idle_bias_on
> 
> Stefan Binding (2):
>   soundwire: stream: Add specific prep/deprep commands to port_prep
>     callback

probably want to CC: Vinod and Bard to get their Acked-by tag...

>   ASoC: cs42l42: Wait for debounce interval after resume
> 
>  drivers/soundwire/stream.c     |   4 +-
>  include/linux/soundwire/sdw.h  |   8 +-
>  include/sound/cs42l42.h        |   5 +
>  sound/soc/codecs/Kconfig       |   8 +
>  sound/soc/codecs/Makefile      |   2 +
>  sound/soc/codecs/cs42l42-sdw.c | 603 +++++++++++++++++++++++++++++++++
>  sound/soc/codecs/cs42l42.c     | 127 ++++---
>  sound/soc/codecs/cs42l42.h     |   9 +-
>  8 files changed, 716 insertions(+), 50 deletions(-)
>  create mode 100644 sound/soc/codecs/cs42l42-sdw.c
> 
