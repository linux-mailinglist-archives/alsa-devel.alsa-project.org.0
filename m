Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E667575EEC9
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 11:13:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0657D828;
	Mon, 24 Jul 2023 11:12:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0657D828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690189982;
	bh=IJuS2NPpHW5yxPKPbFGIfcOiW3Jkp5gRaCUPlulOu7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Py6MoK02wVnV3YxQoyn95/ejtmz/J0Vv8pF5Vhg8m3jS7ce9QNVRfQ3UGxu1ilzNS
	 vfvHI2OJintp+4atSoku90TohM3TvCGNbmEHo4TtPBJJYP4BWS95lEZoG6J6OG0eo2
	 BLMn5KwL7yupsOzzu+rA8DH2AXdeqPa3+Wm9OoFQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47C34F80557; Mon, 24 Jul 2023 11:11:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4CAEF80535;
	Mon, 24 Jul 2023 11:11:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EB8DF80549; Mon, 24 Jul 2023 11:11:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3D26F8019B
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 11:11:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3D26F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YKNhnT18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690189894; x=1721725894;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IJuS2NPpHW5yxPKPbFGIfcOiW3Jkp5gRaCUPlulOu7Y=;
  b=YKNhnT18DIvKoHjSy/okAWO4pzC974rzAlqe6nmQEvF+BOrA9/BT8Tsp
   chYTeu/0Cc6Pg6XDBr2IihfmQAcnwW4IKuoH64OQntDYXAN5wPUAd+xrW
   D5KNWWDNXIy2fb0/KLj6q5oE0d1V+P+uogQ9X/t9/k7rVEx/I6Bf3cds2
   9N/nCdtVIDOTN1ZLiFYgJvA+W4vw+o7vKZOvMSjVVaZsdMJQ8/feWctt8
   Z4Fzy5ZcGh9QOo5sm3RhUh4CLlcTEwV6ZW9Mfa4F6OQsNyKRjxG7N7OAu
   zzPZOSqCL+NCM9kPmVGCGr9fcvclcDbjMcqU145Fxs83EwAsANt/bctaD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="370060619"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200";
   d="scan'208";a="370060619"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="1056353961"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200";
   d="scan'208";a="1056353961"
Received: from sosterlu-mobl.ger.corp.intel.com (HELO [10.249.37.56])
 ([10.249.37.56])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:11:24 -0700
Message-ID: <dc6de509-6984-1434-b53f-9600e8bc7c49@linux.intel.com>
Date: Mon, 24 Jul 2023 11:08:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] ASoC: Intel: maxim-common: get codec number from ACPI
Content-Language: en-US
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Yong Zhi <yong.zhi@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Uday M Bhat <uday.m.bhat@intel.com>, Terry Cheong <htcheong@chromium.org>,
 Mac Chiang <mac.chiang@intel.com>,
 "Dharageswari . R" <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230720092628.758834-1-brent.lu@intel.com>
 <20230720092628.758834-2-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230720092628.758834-2-brent.lu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DZSX3ONQPHMFRWFNLQBQSWGR5SX2T37Z
X-Message-ID-Hash: DZSX3ONQPHMFRWFNLQBQSWGR5SX2T37Z
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZSX3ONQPHMFRWFNLQBQSWGR5SX2T37Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/20/23 11:26, Brent Lu wrote:
> Implement a helper function to get number of codecs from ACPI
> subsystem to remove the need of quirk flag in machine driver.
> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>  sound/soc/intel/boards/sof_maxim_common.c | 174 +++++++++++++---------
>  sound/soc/intel/boards/sof_maxim_common.h |  21 ++-
>  2 files changed, 113 insertions(+), 82 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
> index 112e89951da0..f8b44a81fec1 100644
> --- a/sound/soc/intel/boards/sof_maxim_common.c
> +++ b/sound/soc/intel/boards/sof_maxim_common.c
> @@ -4,6 +4,7 @@
>  #include <linux/module.h>
>  #include <linux/string.h>
>  #include <sound/pcm.h>
> +#include <sound/pcm_params.h>
>  #include <sound/soc.h>
>  #include <sound/soc-acpi.h>
>  #include <sound/soc-dai.h>
> @@ -11,6 +12,21 @@
>  #include <uapi/sound/asound.h>
>  #include "sof_maxim_common.h"
>  
> +/* helper function to get the number of specific codec */
> +static int get_num_codecs(const char *hid)
> +{
> +	struct acpi_device *adev = NULL;
> +	int dev_num = 0;
> +
> +	do {
> +		adev = acpi_dev_get_next_match_dev(adev, hid, NULL, -1);

Humm, I am a bit worried about reference counts.

See
https://elixir.bootlin.com/linux/latest/source/drivers/acpi/utils.c#L916,
it's not clear to me where the get() is done.

Adding Andy to make sure this is done right.

> +		if (adev)
> +			dev_num++;
> +	} while (adev != NULL);
> +
> +	return dev_num;
> +}
