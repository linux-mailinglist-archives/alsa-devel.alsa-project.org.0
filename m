Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD9960CF07
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 16:31:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19A8D5030;
	Tue, 25 Oct 2022 16:30:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19A8D5030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666708260;
	bh=LpEs9Dh6WEKwjoBjomhJgeLTy3LQTnt+qeE2EszVWfM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PI1cbI2muv+Hb+0ivV+iWWO4JTRjJgz4Aeb0jVQkKbwvQnmLbqP94kHNXrI47ctBq
	 J/w2d5cZg0OApvX80IH8R/6jSQq5QmwxQDsoAWstuM5OkbQ21DGPv2ac7/tgq+4sCQ
	 EugMSLicCG6jJRggKqOCYeI3NbMPoAWlWWTCaaqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96532F80448;
	Tue, 25 Oct 2022 16:30:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C681F80431; Tue, 25 Oct 2022 16:30:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60B8DF80240
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 16:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60B8DF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Xb+XESFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666708201; x=1698244201;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LpEs9Dh6WEKwjoBjomhJgeLTy3LQTnt+qeE2EszVWfM=;
 b=Xb+XESFpJuEnFoPvi2k4K3lb8fr65Z+AjEO0Rrjov9Lcgf+uNQmck+Gp
 SuR6LMqy7OQsTSlaSeFBagEKYbdy3gV2ZrL+t/1OsEBbwxp0DsEU3MyRx
 Q8YjphK+JTnCEGlTJfiHpNIkJXIoWrsCY9y4RHoG2W3+Wxo9Om17Ah5Nd
 DPqcyrMPUAne1N83eg+1ouDBuiz+VGgJ8BYpaYBm5eYbjouzTmUgRDwnr
 DP0parhpRr17cERRjN66KUAvr/jo69Emv+u5Fzh4eCFrlhkDG3BgfrbqJ
 OHjJwFws1rhdsaXlpORqth+cAAaJDQ6lgftL0AnTvDR9df0QFpqgvxkov g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="307684752"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="307684752"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 07:29:57 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="634117229"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="634117229"
Received: from pperezji-mobl.amr.corp.intel.com (HELO [10.212.98.192])
 ([10.212.98.192])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 07:29:56 -0700
Message-ID: <91287204-9a3b-af63-463f-99d579db8fe3@linux.intel.com>
Date: Tue, 25 Oct 2022 09:29:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH] ASoC: Intel: bytcht_es8316: Add quirk for the Nanote
 UMPC-01
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20221025140942.509066-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221025140942.509066-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
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



On 10/25/22 09:09, Hans de Goede wrote:
> The Nanote UMPC-01 mini laptop has stereo speakers, while the default
> bytcht_es8316 settings assume a mono speaker setup. Add a quirk for this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  sound/soc/intel/boards/bytcht_es8316.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
> index 6432b83f616f..a935c5fd9edb 100644
> --- a/sound/soc/intel/boards/bytcht_es8316.c
> +++ b/sound/soc/intel/boards/bytcht_es8316.c
> @@ -443,6 +443,13 @@ static const struct dmi_system_id byt_cht_es8316_quirk_table[] = {
>  					| BYT_CHT_ES8316_INTMIC_IN2_MAP
>  					| BYT_CHT_ES8316_JD_INVERTED),
>  	},
> +	{	/* Nanote UMPC-01 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "RWC CO.,LTD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "UMPC-01"),
> +		},
> +		.driver_data = (void *)BYT_CHT_ES8316_INTMIC_IN1_MAP,

the commit massage talks about a mono speaker, this quirk changes the
microphone setup. Is the quirk correct?

> +	},
>  	{	/* Teclast X98 Plus II */
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "TECLAST"),
