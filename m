Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ADD64E876
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 10:08:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACCEB16CD;
	Fri, 16 Dec 2022 10:07:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACCEB16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671181708;
	bh=wuF1t6zWxO1u8aEWfWc2EQqFWHXs/FCOZq2UrnUhyK4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eErOSvpbi8DewCkgW5deBW6yz+9Y8TdEZQ/gISYe4SGtCcwtFohuVMqfgPRkiJaz/
	 Qz+Ei71zsOX28JJlS0NNwZRehg3pWZ3w4H5yjA8wxFOY9+XlP6lWbid6vUIgJtw2oh
	 0gWjrxIgB8siAvuOfFplPMp8dWTEDF0HqPWVMz8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D71AF804D0;
	Fri, 16 Dec 2022 10:07:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86F1DF804E2; Fri, 16 Dec 2022 10:07:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A37B1F804D0
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 10:07:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A37B1F804D0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fR4ume06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671181643; x=1702717643;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wuF1t6zWxO1u8aEWfWc2EQqFWHXs/FCOZq2UrnUhyK4=;
 b=fR4ume06I1MI1NvGbNnrjH2BB+wf4J4Y+Ys4v5ICq2Ed+Nun4cwQBWvL
 4CzR8pGKzSfSAqsmaVT0nrJtaxEFNj4WIyHVu43XsRTynbu4NXxSnLviM
 hdHRg2lal5VrCBDbLBSmalC6X1+FhszVz9MnwbJxq72w+oWhwrBumilqs
 3do+x7MJCuV9JYkJS5MW0bCIXSTKOeNzzVq4UA/Qnd0WSCa7JXIPKsH0v
 dhoTNOMzzoswwT9hDWkG2pdL8k+a2eK8B5hw9rQU558pvpR/uTz4mATZk
 KSWtXkAufHL3ByvIQ7uhehxVvCSDXkXyVSWrqim6gX+9b06bl7Rm0HvG3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="320808165"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="320808165"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 01:07:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="599879898"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="599879898"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 01:06:59 -0800
Message-ID: <f062be0f-0022-b77f-b13a-3e722baaa446@linux.intel.com>
Date: Fri, 16 Dec 2022 10:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] ASoC: SOF: pm: Always tear down pipelines before DSP
 suspend
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20221215185347.1457541-1-ranjani.sridharan@linux.intel.com>
 <20221215185347.1457541-3-ranjani.sridharan@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20221215185347.1457541-3-ranjani.sridharan@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: tiwai@suse.de,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 12/15/2022 7:53 PM, Ranjani Sridharan wrote:
> When the DSP is suspended while the firmware is in the crashed state, we
> skip tearing down the pipelines. This means that the widget reference
> counts will not get to reset to 0 before suspend. This will lead to
> errors with resuming audio after system resume. To fix this, invoke the
> tear_down_all_pipelines op before skipping to DSP suspend.
> 
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
>   sound/soc/sof/pm.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
> index 5f88c4a01fa3..f153881db189 100644
> --- a/sound/soc/sof/pm.c
> +++ b/sound/soc/sof/pm.c
> @@ -192,6 +192,9 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
>   	if (runtime_suspend && !sof_ops(sdev)->runtime_suspend)
>   		return 0;
>   
> +	if (tplg_ops && tplg_ops->tear_down_all_pipelines)
> +		tplg_ops->tear_down_all_pipelines(sdev, false);
> +
>   	if (sdev->fw_state != SOF_FW_BOOT_COMPLETE)
>   		goto suspend;
>   

Can tplg_ops even be null? Rest of SOF code seems to skip this check and 
only check for callback presence.

Also won't tearing down pipelines few lines later become unnecessary then?
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/sof/pm.c?id=a12a383e59ce486abd719b6bda33c353a3b385e7#n220

