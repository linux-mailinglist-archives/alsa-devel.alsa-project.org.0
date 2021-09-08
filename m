Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 146CA403DB6
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 18:40:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5865A16AA;
	Wed,  8 Sep 2021 18:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5865A16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631119255;
	bh=XUpAV1YeBLo77SXA5+BIgblbG+VplBdhWsGJd+XCjrs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vLPVYJ5FDZ1PXdzjvwEVci51J5hztHJjpXLlBAGsVv8SDvMhSurbYTEspNtKyiz3Q
	 uSGvLSyEM8vv1PTfHHF8fQfOKRoOKYgFGalvqcsQIpM4whiZk7NnBWaKjCybraI8WV
	 BjqOukw1249N9IvKYhVdDVTt9UFpw28iu9BiBpcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA8D7F8049C;
	Wed,  8 Sep 2021 18:39:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C08C3F802E7; Wed,  8 Sep 2021 18:39:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DDDCF80166
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 18:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DDDCF80166
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="207767971"
X-IronPort-AV: E=Sophos;i="5.85,278,1624345200"; d="scan'208";a="207767971"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 09:38:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,278,1624345200"; d="scan'208";a="547903077"
Received: from sgevirtz-mobl.amr.corp.intel.com (HELO [10.209.141.208])
 ([10.209.141.208])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 09:38:55 -0700
Subject: Re: [PATCH] ASoC: SOF: fix a typo in put operations for kcontrol
To: alsa-devel@alsa-project.org
References: <20210907184603.33243-1-pierre-louis.bossart@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <267c65d5-3d3e-84c9-2e83-8d36f9e65b95@linux.intel.com>
Date: Wed, 8 Sep 2021 11:38:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907184603.33243-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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



On 9/7/21 1:46 PM, Pierre-Louis Bossart wrote:
> From: Rander Wang <rander.wang@intel.com>
> 
> SOF_CTRL_TYPE_VALUE_CHAN_SET should be used for put operations
> for consistency. The current use of _GET is obviously incorrect
> but _GET and _SET result in the same action so there is no
> functional change introduced by this patch.
> 
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Rander Wang <rander.wang@intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Please discard this patch, it was already sent by Peter on September 2.
The effect of the long week-end I guess...

Sorry for the noise.

> ---
>  sound/soc/sof/control.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
> index a5dd728c580a..504500dd4d43 100644
> --- a/sound/soc/sof/control.c
> +++ b/sound/soc/sof/control.c
> @@ -108,7 +108,7 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
>  	if (pm_runtime_active(scomp->dev))
>  		snd_sof_ipc_set_get_comp_data(scontrol,
>  					      SOF_IPC_COMP_SET_VALUE,
> -					      SOF_CTRL_TYPE_VALUE_CHAN_GET,
> +					      SOF_CTRL_TYPE_VALUE_CHAN_SET,
>  					      SOF_CTRL_CMD_VOLUME,
>  					      true);
>  	return change;
> @@ -179,7 +179,7 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
>  	if (pm_runtime_active(scomp->dev))
>  		snd_sof_ipc_set_get_comp_data(scontrol,
>  					      SOF_IPC_COMP_SET_VALUE,
> -					      SOF_CTRL_TYPE_VALUE_CHAN_GET,
> +					      SOF_CTRL_TYPE_VALUE_CHAN_SET,
>  					      SOF_CTRL_CMD_SWITCH,
>  					      true);
>  
> @@ -226,7 +226,7 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
>  	if (pm_runtime_active(scomp->dev))
>  		snd_sof_ipc_set_get_comp_data(scontrol,
>  					      SOF_IPC_COMP_SET_VALUE,
> -					      SOF_CTRL_TYPE_VALUE_CHAN_GET,
> +					      SOF_CTRL_TYPE_VALUE_CHAN_SET,
>  					      SOF_CTRL_CMD_ENUM,
>  					      true);
>  
> 
