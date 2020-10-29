Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D3129F1CB
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 17:43:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B1C41668;
	Thu, 29 Oct 2020 17:42:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B1C41668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603989785;
	bh=Yrkj47yWPXEwwXp2Y57HzfMAAqDAGWFL2e28Dfr1hDA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y7HZoH59p6O72AsTfxsLvKLdgRtBTR/PiR17AtJMslyAQOCgPKcOXbovefi2qg32n
	 VzCScwwSCaxclXohLCu9dWcLvOq1OqrmwyGubdgXO4+APaq0/8c5cmUTTw0gUsN0no
	 MZ7SKTMosf/qTiefNpPbfaZH2MwtYGDyZplabYSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8397F804BD;
	Thu, 29 Oct 2020 17:40:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB038F800FF; Thu, 29 Oct 2020 17:40:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57C72F8020D
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 17:40:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57C72F8020D
IronPort-SDR: N33pkRrSgomg/cwe63165KeyZVDksu0/anfsDFwYfHyq89D3hCTw4NspH9xchE7iDHdbtq/wJK
 2sw812g1/T3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="168563742"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="168563742"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 09:40:18 -0700
IronPort-SDR: rhlsDb9jKbP9HmivfA60EelfBvva7vwMyla+F7xP7GJYM2vXrKjZr34cYyp9ayF3KKbtSdb+TL
 BOuH47ax5DiA==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="323762890"
Received: from mghaffa-mobl1.amr.corp.intel.com (HELO [10.212.235.9])
 ([10.212.235.9])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 09:40:17 -0700
Subject: Re: [PATCH v2 5/6] ASoC: codecs: lpass-va-macro: Add support to VA
 Macro
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20201029110829.16425-1-srinivas.kandagatla@linaro.org>
 <20201029110829.16425-6-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8f33aac3-7a41-1482-ae8b-e24d13ba8f13@linux.intel.com>
Date: Thu, 29 Oct 2020 10:56:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029110829.16425-6-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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


> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> new file mode 100644
> index 000000000000..8cb23c32631d
> --- /dev/null
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -0,0 +1,882 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +

Missing copyright information?

[...]

> +module_platform_driver(va_macro_driver);
> +MODULE_DESCRIPTION("VA macro driver");
> +MODULE_LICENSE("GPL v2");

"GPL" ? The v2 adds no information.

https://www.kernel.org/doc/html/latest/process/license-rules.html

“GPL”	Module is licensed under GPL version 2. This does not express any 
distinction between GPL-2.0-only or GPL-2.0-or-later. The exact license 
information can only be determined via the license information in the 
corresponding source files.

“GPL v2”	Same as “GPL”. It exists for historic reasons.
