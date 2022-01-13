Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EE148DDC9
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 19:40:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 878DB202A;
	Thu, 13 Jan 2022 19:39:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 878DB202A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642099203;
	bh=Gi4RruhGOfgPLhHsmifWsDVbzVX7ucpNyu1gYBrO4CE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nZjQYyGuTDihBAv+83um39SEq6McWQIC62VQULvERrTEMURZhNsCbfz1e2zj9/hcJ
	 L/sWDxASUY8LpovdJyzqpqwV7hbZ8Z/wejUePOiRQtWN4eQaEBoUoWLv+nzbPFsW7s
	 Plqh2AnaN9Uf8w4AU/kJ8TtMflItoNKz7VUWIUTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6335F8010B;
	Thu, 13 Jan 2022 19:38:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0032CF80141; Thu, 13 Jan 2022 19:38:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1BACF8010B
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 19:38:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1BACF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JpL8aLdz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642099132; x=1673635132;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Gi4RruhGOfgPLhHsmifWsDVbzVX7ucpNyu1gYBrO4CE=;
 b=JpL8aLdzsNEfqKTBBd3yciu1zh0+4fxIQ8u/wg7Oam+M9M4SKkgLZ/N3
 bTLv80UniNGhaNlzeeHYPS+GE0qkFNhiteRsXBTtADf3LYzymz14/EEuD
 RHFKuAl1V2wqVICR12Hm7UihelsFtmhK2PV2MY0sPZ7SW7IHE1+nEvkHl
 /wamuZM8g+CtqZBcezzKmG1+2NRdXxitUuvYT4A1IWIL4KZPI7Spvn4BI
 +gLYtTdfMB2VXkSYvsWoLgq7eiX+tSv1OpR8Rk0AfB/7zZNUlTz2u8zp9
 II3CfT+oodI9wMNFP6OsIHkHqqfJjwGza41iM0oLJnNz6bTb/pYS9Nrzg Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="307431363"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="307431363"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:38:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="620699922"
Received: from ypchen-mobl.amr.corp.intel.com (HELO [10.212.66.70])
 ([10.212.66.70])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:38:45 -0800
Subject: Re: [PATCH v2 3/6] ASoC: amd: acp: Add generic PCI driver module for
 ACP device
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220113163348.434108-1-AjitKumar.Pandey@amd.com>
 <20220113163348.434108-4-AjitKumar.Pandey@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fad0f35c-0641-ee43-1efc-d6e5c8c44656@linux.intel.com>
Date: Thu, 13 Jan 2022 12:36:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113163348.434108-4-AjitKumar.Pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Alexander.Deucher@amd.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <vsujithkumar.reddy@amd.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Bard Liao <bard.liao@intel.com>
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


> diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
> new file mode 100644
> index 000000000000..3a0511fd1de2
> --- /dev/null
> +++ b/sound/soc/amd/acp/acp-pci.c
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +//
> +// This file is provided under a dual BSD/GPLv2 license. When using or
> +// redistributing this file, you may do so under either license.
> +//
> +// Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.

2022?


