Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 815234C3BCE
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 03:41:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F5EF1AF4;
	Fri, 25 Feb 2022 03:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F5EF1AF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645756891;
	bh=vfXenIa2xeajxPYZ5qcsiU3HZFxGzB1pegqZTEHv5O4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OBQ8fNskSuwUhqj3tlCI+YXqo6zOTwZXqiJBSCLGqIA8mrjWSenSvSgOUhW+BtU0g
	 83H4R8CvDrfupRJdKtYOEcV02XZ7UCzc1VAlzdkCytQHTugmhNcPC4y2wnBGmPJBR8
	 +q1L05D89n8h8IAdPa8p35CICotXpmCtEPhFEtDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D440FF80518;
	Fri, 25 Feb 2022 03:39:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5784EF804FD; Fri, 25 Feb 2022 03:39:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2E6EF80430
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 03:39:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2E6EF80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FeY9mIue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645756762; x=1677292762;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vfXenIa2xeajxPYZ5qcsiU3HZFxGzB1pegqZTEHv5O4=;
 b=FeY9mIueGmBTyAWrHS2rGDNuTPduAXMcidLlRJqeqrpZdiLXUYOAWjJP
 q/TX2ANdFafBMbECZVYSsuwE8OB5us3X+LzsirTEG3EQ7hl5/G+YOdaR1
 tdIm2LnI0PPbzDbUygmaDdtFe7NxjcYycQDeUfMz1iVSe3YGQNrSFudn2
 ujsnjk0omx+9/QYJzGPM0t61NWqyfZrl2xXXsuEFzoBWRiGCV1bk4dIAX
 QVOFihpGbWI6TIQ+wWwXg6eXso0AkKSgo0fFhdKMUNl8gBTns+xc3pWl3
 ma6blto03/UrVq2kvoJmgtyecCwt2Q8bEV84xt/I1B8NgkKLy22P0pR9j g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277036147"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="277036147"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:16 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="491832630"
Received: from jsegev-mobl1.ger.corp.intel.com (HELO [10.212.99.193])
 ([10.212.99.193])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:15 -0800
Message-ID: <d2a94d30-cfee-7821-fcb8-7b7ba129e5e9@linux.intel.com>
Date: Thu, 24 Feb 2022 19:11:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 06/17] ASoC: Intel: avs: Add pipeline management requests
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-7-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207122108.3780926-7-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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



On 2/7/22 06:20, Cezary Rojewski wrote:
> A 'Pipeline' represents both a container of module instances, and a
> scheduling entity. Multiple pipelines can be bound together to create an
> audio graph. The Pipeline state machine is entirely controlled by IPCs
> (creation, deletion and state changes).

How are the module instances connected within a pipeline? You've said
too much or too little here.


> +int avs_ipc_create_pipeline(struct avs_dev *adev, u16 req_size, u8 priority,
> +			    u8 instance_id, bool lp, u16 attributes)
> +{
> +	union avs_global_msg msg = AVS_GLOBAL_REQUEST(CREATE_PIPELINE);
> +	struct avs_ipc_msg request = {0};
> +	int ret;
> +
> +	msg.create_ppl.ppl_mem_size = req_size;
> +	msg.create_ppl.ppl_priority = priority;
> +	msg.create_ppl.instance_id = instance_id;
> +	msg.ext.create_ppl.lp = lp;

you may want to describe what the concepts of 'priority', 'lp' and
'attributes' are and which entity defines the values (topology?)

> +	msg.ext.create_ppl.attributes = attributes;
> +	request.header = msg.val;
> +
> +	ret = avs_dsp_send_msg(adev, &request, NULL);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "create pipeline", ret);
> +
> +	return ret;
> +}

>  			u32 val;
> +			/* pipeline management */
> +			struct {
> +				u32 lp:1;
> +				u32 rsvd:3;
> +				u32 attributes:16;
> +			} create_ppl;
> +			struct {
> +				u32 multi_ppl:1;
> +				u32 sync_stop_start:1;

these two are not described at all?

> +			} set_ppl_state;
>  		} ext;
>  	};
>  } __packed;

> +/* Pipeline management messages */
> +enum avs_pipeline_state {
> +	AVS_PPL_STATE_INVALID,
> +	AVS_PPL_STATE_UNINITIALIZED,
> +	AVS_PPL_STATE_RESET,
> +	AVS_PPL_STATE_PAUSED,
> +	AVS_PPL_STATE_RUNNING,
> +	AVS_PPL_STATE_EOS,
> +	AVS_PPL_STATE_ERROR_STOP,
> +	AVS_PPL_STATE_SAVED,
> +	AVS_PPL_STATE_RESTORED,

can you describe that the last two enums might entail and what the
purpose might be?

I can see how the firmware state could be saved in IMR for faster
suspend/resume, but save/restore at the pipeline level doesn't seem to
have an obvious match for an ASoC driver?
