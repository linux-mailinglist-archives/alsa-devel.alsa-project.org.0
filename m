Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 837CE700501
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 12:14:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D74651DC;
	Fri, 12 May 2023 12:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D74651DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683886440;
	bh=NzqTguvFSjV2kCOcUZD87BdAd11HK9QDEusrkoTQGlo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nMgFjHjEJxJOeotjEhZbnV9EiaJyzz/LPqOE90/lCqzZInqS+gYwqlkl5j4Gjl81j
	 CHPC7JzTsnG0G/SxY04QVcYCKutngL0YaYIFkxRxZI/s1zEeqPd5GEO+Fp0Y0ISbHx
	 KJmKI7w7HAS9BHF8qp9nHzYQpPcd39zgFZjF/rgQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8197FF802E8; Fri, 12 May 2023 12:13:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C421CF8032D;
	Fri, 12 May 2023 12:13:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06918F80534; Fri, 12 May 2023 12:13:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99A85F802E8;
	Fri, 12 May 2023 12:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99A85F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=D2/Ezibx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683886384; x=1715422384;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NzqTguvFSjV2kCOcUZD87BdAd11HK9QDEusrkoTQGlo=;
  b=D2/Ezibx0P0/iXampKNqQPPVTLoy0S6ALwMeaUK9ypYPEDqz9262KDgO
   M9wB4FfPQDMeK6q4R65vSXgiyLwWA8pMJq2+IQs1a7uIIGvGbNKz2ZWns
   khiSUyRxuMn+J0jxsoeJnyWk3B8UN07anZFsOkWBH/2rVWVoUwr2G9Rok
   CclEuLzt6HMuYaML1Osl3S776xoq6eVFmu+SicffPDvVuxaUyH4ZIkRUZ
   TdtFzs6EtLrryvvwZTb3lHCVgu4pJTDWRYAO1KGkj4/4znmAfVgswdAO6
   Pfy8qvX/ZpeP6sn8CPHzFCJpaISuYTTQ6ou2Ebwaa+Jjfd2y/MgBKdxn9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416386435"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="416386435"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 03:12:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="824309039"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="824309039"
Received: from nhanph1x-mobl.amr.corp.intel.com (HELO [10.249.38.84])
 ([10.249.38.84])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 03:12:55 -0700
Message-ID: <12e47cb1-0744-6470-d79b-af1aeea86f9a@linux.intel.com>
Date: Fri, 12 May 2023 13:13:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
Subject: Re: [PATCH] ASoC: SOF: Simplify the calculation of variables
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 pierre-louis.bossart@linux.intel.com
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20230512064225.75358-1-jiapeng.chong@linux.alibaba.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230512064225.75358-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2RXM2YUETNSCQHSZ2BZZZW7CRWHCXMTC
X-Message-ID-Hash: 2RXM2YUETNSCQHSZ2BZZZW7CRWHCXMTC
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2RXM2YUETNSCQHSZ2BZZZW7CRWHCXMTC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/05/2023 09:42, Jiapeng Chong wrote:
> ./sound/soc/sof/pcm.c:372:27-29: WARNING !A || A && B is equivalent to !A || B.

This is correct.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4938
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  sound/soc/sof/pcm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> index 567db32173a8..d14e7fd2c2ee 100644
> --- a/sound/soc/sof/pcm.c
> +++ b/sound/soc/sof/pcm.c
> @@ -369,7 +369,7 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>  	case SNDRV_PCM_TRIGGER_STOP:
>  		/* invoke platform trigger to stop DMA even if pcm_ops isn't set or if it failed */
> -		if (!pcm_ops || (pcm_ops && !pcm_ops->platform_stop_during_hw_free))
> +		if (!pcm_ops || !pcm_ops->platform_stop_during_hw_free)
>  			snd_sof_pcm_platform_trigger(sdev, substream, cmd);
>  		break;
>  	default:

-- 
Péter
