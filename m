Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC81833940C
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 17:58:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D1AC1760;
	Fri, 12 Mar 2021 17:57:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D1AC1760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615568302;
	bh=qwu3JJrApo0SllxyjJOb9HKx+n91stp/YIyHIRg0UBg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RoBjfKFgtju74PH97TV/mEwe8zlxYvRlHNortImPhBNdvtvs4t9W76W9YtVpNIPWn
	 3JrWsKzX71JUwX0exhF395ePKOp0MZ3VlFAa2JrZHX7vjc9B5UrJ9LYXCCSkJRZ5kv
	 sy4IZ2CHtavHpIiS9C2GO7ZkMQZs+ro+Sf3vWECE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29FACF800AB;
	Fri, 12 Mar 2021 17:56:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BBC3F8020D; Fri, 12 Mar 2021 17:56:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47435F8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 17:56:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47435F8012A
IronPort-SDR: ABs87S9D0HjlygB5hUWcZZd2zVfhMBUwyoVqtheQvf09GJvDYnwdJ9Wz6BVsB9/qKU+CBY/gZI
 X3Eijj2lqSCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="250223212"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="250223212"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 08:56:32 -0800
IronPort-SDR: p9G9sRx80qUS6WZBn6/3QvqU6zhFcVGvOvEy/+ESOOS1U9L2FNH/sNMqZumEXczVZtlLWt3zWr
 jnOsgpjVO7BA==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="411064601"
Received: from akharche-mobl2.ccr.corp.intel.com (HELO [10.212.135.254])
 ([10.212.135.254])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 08:56:31 -0800
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Enable jack-detect support on
 Asus T100TAF
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20210312114850.13832-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cae394d5-461f-2c07-3d8c-471023beed02@linux.intel.com>
Date: Fri, 12 Mar 2021 10:24:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210312114850.13832-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 3/12/21 5:48 AM, Hans de Goede wrote:
> The Asus T100TAF uses the same jack-detect settings as the T100TA,
> this has been confirmed on actual hardware.
> 
> Add these settings to the T100TAF quirks to enable jack-detect support
> on the T100TAF.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/boards/bytcr_rt5640.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 1f6a636571c2..59d6d47c8d82 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -482,6 +482,9 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>   			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100TAF"),
>   		},
>   		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
> +					BYT_RT5640_JD_SRC_JD2_IN4N |
> +					BYT_RT5640_OVCD_TH_2000UA |
> +					BYT_RT5640_OVCD_SF_0P75 |
>   					BYT_RT5640_MONO_SPEAKER |
>   					BYT_RT5640_DIFF_MIC |
>   					BYT_RT5640_SSP0_AIF2 |
> 
