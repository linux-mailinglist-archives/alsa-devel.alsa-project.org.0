Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DCB38F26D
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 19:42:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89252166E;
	Mon, 24 May 2021 19:41:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89252166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621878121;
	bh=MVeoK2xHI7txDZ3+ukBpmQO3t/38okqJ2C6RLrYxuAw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EoTWnaKjixFOougnpyjQZkYv3YlpfvLkx1SXNgc67QwytmOlAZcDgyjOoLFf7NHFU
	 KU0SHfkZnWjEs1xg29QrKT8dvxdRhYxhfKLdPBAO5EqUCZMui1rsy7h+k5ePHEdPuY
	 YShmmUMAruQOpKvdfY5jPohQ9MpmKV2hXJCH4BFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39220F800B8;
	Mon, 24 May 2021 19:40:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E66B2F8025C; Mon, 24 May 2021 19:40:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CD01F800B8
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 19:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CD01F800B8
IronPort-SDR: B1XKWlry3cuztdjVsz1FSgfYZgtG62ZQ8oLUhFtjmTVWApvhLMggjSq7db0zT31tMX2+YBg27E
 UjGFFocYdAtg==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="202012728"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="202012728"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 10:40:09 -0700
IronPort-SDR: OlsffDRvw6Ck3jliqwWLI7pWWUS5/npJ8ygggjY68fmIX9s4ZMbLsUimSKdr2EGbtrN0r0dRIR
 zyiRPgKH5g0w==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="632710287"
Received: from cagalind-mobl2.amr.corp.intel.com (HELO [10.213.163.143])
 ([10.213.163.143])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 10:40:08 -0700
Subject: Re: [PATCH] ASoC: Intel: boards: Select SND_SOC_HDAC_HDMI for
 Soundwire machine driver
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
 cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com,
 yang.jie@linux.intel.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20210520163324.19046-1-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9ed54875-fe77-f70f-9085-0f3b4c9d576e@linux.intel.com>
Date: Mon, 24 May 2021 11:32:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520163324.19046-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 5/20/21 11:33 AM, Richard Fitzgerald wrote:
> Add select of SND_SOC_HDAC_HDMI for SND_SOC_INTEL_SOUNDWIRE_SOF_MACH.
> Without this the build results in missing references to
> hdac_hdmi_jack_port_init and hdac_hdmi_jack_init.

Kai, can you comment on this one? There is nothing specific to HDMI in 
this driver.

all the machine driver entries are now protected with a
	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC

but some entries have the select SND_SOC_HDAC_HDMI, others don't.

Something's inconsistent here, it's not limited to SoundWire I am afraid


> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>   sound/soc/intel/boards/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
> index eef5f4ac87c5..6a1639b14b67 100644
> --- a/sound/soc/intel/boards/Kconfig
> +++ b/sound/soc/intel/boards/Kconfig
> @@ -601,6 +601,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
>   	select SND_SOC_DMIC
>   	select SND_SOC_INTEL_HDA_DSP_COMMON
>   	select SND_SOC_INTEL_SOF_MAXIM_COMMON
> +	select SND_SOC_HDAC_HDMI
>   	help
>   	  Add support for Intel SoundWire-based platforms connected to
>   	  MAX98373, RT700, RT711, RT1308 and RT715
> 
