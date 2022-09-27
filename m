Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 904465EBBA7
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 09:36:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ECDAAEA;
	Tue, 27 Sep 2022 09:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ECDAAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664264208;
	bh=nWRhK5+WAsVRbdRrm7e6YA/MoeAuFkRulWcszj149yU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AtPWky+UTrFwZWgRy23l+y1MLRZXfe6C8f96+XYXrYVQ/h6/6IlyIgNS7M9BdugnI
	 HAR4BpkaRju48quLXdBU8uFHfPzc2QKewJLpxQmOLEpV2ECuwQBsHL35FAncNbU7Uk
	 T2eoJLrOSgXYicy7vWVS2V9l78bRtZgIuw6Qw3LI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC4FCF8011C;
	Tue, 27 Sep 2022 09:35:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2864F8011C; Tue, 27 Sep 2022 09:35:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A677F8011C
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 09:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A677F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RX5Ukva+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664264150; x=1695800150;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nWRhK5+WAsVRbdRrm7e6YA/MoeAuFkRulWcszj149yU=;
 b=RX5Ukva+UaWimIDLf1eOMl60iZotD5wOI4mXnLD+LQZlDSWl/h0FJzyy
 wfc4cdyOo4NEpayvy0Wf7uzxW7SCEsBvewnS+YxPBowtudcKGjCqFbgWf
 AULAfgJujBK7ZQT3yZSa3QhdTstq5QdM3uhUNfeynzOIGICp5OP4+xKrb
 N15AbKHt1c3Gz56NieDzdP7gmoz3XR09YvBmr0DTz7GdKkuDiUzzw7m/l
 K43u+n5VY/FL3AnvDyWIemAP7/W0ot2THAapfARq5knEt8mkJ8EXhP3CT
 5EqnoASW90SSRk3wdFDgfvJHFV5TDAuYEYRbCqwCX9Tx1oDSDSGSWIEwB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="280968436"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="280968436"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 00:35:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="572558720"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="572558720"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.206])
 ([10.99.249.206])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 00:35:43 -0700
Message-ID: <4d7caa50-9271-b062-2e0d-ad200b8a95f7@linux.intel.com>
Date: Tue, 27 Sep 2022 09:35:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH][next] ASoC: Intel: Skylake: Replace zero-length arrays
 with DECLARE_FLEX_ARRAY() helper
Content-Language: en-US
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <YzIuiUul2CwPlkKh@work>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <YzIuiUul2CwPlkKh@work>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
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

On 9/27/2022 12:58 AM, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated and we are moving towards adopting
> C99 flexible-array members, instead. So, replace zero-length arrays
> declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
> helper macro.
> 
> This helper allows for flexible-array members in unions.
> 
> Link: https://github.com/KSPP/linux/issues/193
> Link: https://github.com/KSPP/linux/issues/226
> Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>   sound/soc/intel/skylake/skl-topology.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
> index a5bccf2fcd88..017ac0ef324d 100644
> --- a/sound/soc/intel/skylake/skl-topology.h
> +++ b/sound/soc/intel/skylake/skl-topology.h
> @@ -233,8 +233,8 @@ struct skl_uuid_inst_map {
>   struct skl_kpb_params {
>   	u32 num_modules;
>   	union {
> -		struct skl_mod_inst_map map[0];
> -		struct skl_uuid_inst_map map_uuid[0];
> +		DECLARE_FLEX_ARRAY(struct skl_mod_inst_map, map);
> +		DECLARE_FLEX_ARRAY(struct skl_uuid_inst_map, map_uuid);
>   	} u;
>   };
>   

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
