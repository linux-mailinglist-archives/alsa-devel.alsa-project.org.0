Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4165C241AE0
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 14:19:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEE1D1667;
	Tue, 11 Aug 2020 14:18:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEE1D1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597148348;
	bh=INiVoWIgEAxLXLUgraT74jYadiIyR9jNF4g/vDcI+Mo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HWDvn7pjSn/vLXwsZBURjspPIJtIFKDObKZTqgY70K82qef7EujBNkQIwN5fpnoXx
	 Ye4C2gCpqWZTcsRhrJf1jogv9UlhQFPm8RdxF4nsT9+g35oUynrCs3PHXHTz3SvZgL
	 ma/Pdo/GglFEvYwCMSN3CQ5lfbCspO2mehy+vf0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0C85F800BC;
	Tue, 11 Aug 2020 14:17:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73CB1F8015B; Tue, 11 Aug 2020 14:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2979F800BC
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 14:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2979F800BC
IronPort-SDR: AoaBR5WniGG9NEMSu7qcZ9tqs+Xz3xbvpNuydKHmHoy3YPtMlfIkrL8OXrsyeDBMH+aTkUgant
 SI5dHrwD/mmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="141573440"
X-IronPort-AV: E=Sophos;i="5.75,461,1589266800"; d="scan'208";a="141573440"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 05:17:14 -0700
IronPort-SDR: 5w9uAwSEmU4coxguTvMNK3oHBd8ZFiXMXMiFjM+KJ7GONqMZzfSMvpKKMfl49oszoEEKMCWuzs
 n28gwwCLUE1A==
X-IronPort-AV: E=Sophos;i="5.75,461,1589266800"; d="scan'208";a="495126740"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.154.141])
 ([10.249.154.141])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 05:17:10 -0700
Subject: Re: [PATCH v2 01/13] ASoC: Intel: Add catpt device
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200811100034.6875-1-cezary.rojewski@intel.com>
 <20200811100034.6875-2-cezary.rojewski@intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <76ca9300-f995-f5c3-48c4-6cc22f7a80c3@linux.intel.com>
Date: Tue, 11 Aug 2020 14:17:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200811100034.6875-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: andriy.shevchenko@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, ppapierkowski@habana.ai, marcin.barlik@intel.com,
 zwisler@google.com, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 filip.proborszcz@intel.com, broonie@kernel.org, michal.wasko@intel.com,
 tiwai@suse.com, krzysztof.hejmowski@intel.com, cujomalainey@chromium.org,
 vamshi.krishna.gopal@intel.com
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



On 8/11/2020 12:00 PM, Cezary Rojewski wrote:
> Declare base structures, registers and device routines for the catpt
> solution. Catpt deprecates and is a direct replacement for
> sound/soc/intel/haswell. Supports Lynxpoint and Wildcat Point both.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---

...

> diff --git a/sound/soc/intel/catpt/registers.h b/sound/soc/intel/catpt/registers.h
> new file mode 100644
> index 000000000000..62c968a4721a
> --- /dev/null
> +++ b/sound/soc/intel/catpt/registers.h
> @@ -0,0 +1,191 @@
> +/* SPDX-License-Identifier: GPL-2.0-only

If we are making sure that SPDX headers are correct, from what I 
remember SPDX identifier should be a separate comment line, even if 
followed by comment. Checkpatch doesn't seem to care and I can't find 
anything explicitly saying that's a rule in 
Documentation/process/license-rules.rst (apart from one line "C Header" 
example, which is one line comment). Can someone else chime in? Also all 
other header that are included in patchset seem to follow this scheme...

> + *
> + * Copyright(c) 2020 Intel Corporation. All rights reserved.
> + *
> + * Author: Cezary Rojewski <cezary.rojewski@intel.com>
> + */
> +
