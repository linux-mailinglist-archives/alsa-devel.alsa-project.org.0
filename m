Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1895624623
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 16:40:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54D9D1654;
	Thu, 10 Nov 2022 16:39:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54D9D1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668094839;
	bh=ddpLecsH8kEdyDhhVfjrfDWQQotoRVC/dvg7MAackdw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TW9fR+ASQnToNNxQIipooUI8+YEYGrlPlb+1T5Z1kPJdK7QvOxKLkwpKH5VW5GQZX
	 h1B0k+cQ69d7XRBHa1CcEO8UXBBbFbpqZKpn1XStTl50qBkabXRot96sTFkw/84nyD
	 r2nkIyIGhKIQyeVf9wp6fqX1wgV/FsWo22JueyfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8B1AF802E8;
	Thu, 10 Nov 2022 16:39:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AD19F8021D; Thu, 10 Nov 2022 16:39:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B130CF80114
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 16:39:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B130CF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="c1wxCWbH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668094775; x=1699630775;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ddpLecsH8kEdyDhhVfjrfDWQQotoRVC/dvg7MAackdw=;
 b=c1wxCWbHF8QEDA5Cf+MFkFLA+rTWvit1JMvS0ZonPFwhzER/VteYCcay
 PV/hm4/BdbMIDTd0RS7xYUlU2hTpK0CTWwmY1JNUv3Qdx2HKbn9CKWpez
 ERewmcKzj/ADImEV31HzWhT6Uh9buF3tznkPR5N0Bw3RQV127+6LdhF5f
 I1zqO0AAkjiWyUtpZwjx6TlCUe7RXosAs6p799tXRign1xN9oqnzDTNDj
 N4P0L0rX+lL63xxEkeasEmmwAumkjzpa1V++OqIZRRQFZUnA0Faj7hmGx
 7TIfxSseGxAixRpKfG95LHQD14qOAvFm3iCrlxC3MK+uctPorMTRIQlmK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="311341597"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="311341597"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 07:39:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="637212501"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="637212501"
Received: from byrons1x-mobl.amr.corp.intel.com (HELO [10.212.85.58])
 ([10.212.85.58])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 07:39:31 -0800
Message-ID: <6f86718b-5d96-3e73-bfc0-321288e2232c@linux.intel.com>
Date: Thu, 10 Nov 2022 09:39:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] ASoC: Intel: avs: Disconnect substream if suspend or
 resume fails
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20221110141330.740916-1-cezary.rojewski@intel.com>
 <20221110141330.740916-3-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221110141330.740916-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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



On 11/10/22 08:13, Cezary Rojewski wrote:
> To improve performance and overall system stability, suspend/resume
> operations for ASoC cards always return success status and defer the
> actual work.
> 
> Because of that, if a substream fails to resume, userspace may still
> attempt to invoke commands on it as from their perspective the operation
> completed successfully. Set substream's state to DISCONNECTED to ensure
> no further commands are attempted.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/avs/pcm.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
> index ca624fbb5c0d..f95c530ffeb1 100644
> --- a/sound/soc/intel/avs/pcm.c
> +++ b/sound/soc/intel/avs/pcm.c
> @@ -934,8 +934,11 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
>  			rtd = snd_pcm_substream_chip(data->substream);
>  			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
>  				ret = op(dai, data);
> -				if (ret < 0)
> +				if (ret < 0) {
> +					data->substream->runtime->status->state =
> +						SNDRV_PCM_STATE_DISCONNECTED;

should runtime->state be used instead of runtime->status->state?

A quick grep shows the former seems more popular in drivers,
status->seems to be only used in pcm_native.c?

Another plumbing question is whether it's actually ok to change the
state of the runtime in a driver, are you not going to have locking
issues? Very few drivers change the internal state and I wonder how
legit/safe this is.

>  					return ret;
> +				}
>  			}
>  		}
>  
> @@ -944,8 +947,11 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
>  			rtd = snd_pcm_substream_chip(data->substream);
>  			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
>  				ret = op(dai, data);
> -				if (ret < 0)
> +				if (ret < 0) {
> +					data->substream->runtime->status->state =
> +						SNDRV_PCM_STATE_DISCONNECTED;
>  					return ret;
> +				}
>  			}
>  		}
>  	}
