Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1367C7A1A38
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 11:18:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C1DE950;
	Fri, 15 Sep 2023 11:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C1DE950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694769503;
	bh=CDwlISH8mA5+8r/atwWQjOKJK6Fu8LdmLkEDKau+iAQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rVsLF7qz714NU68dcUJgnnzRswG1P20UyUDWquDCDu4nqk0V0bXbcdIQ+nI8fCWkh
	 z5BomxINcQdzV14NKGv489mc2rlOm+RUN9lR/xfY3pBWjnWIWz2k/wfAhhQVoDm4Hk
	 GjDkd40Za0qu5PEnnkNLXNGm97HU8LAuGDeGszNg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA19AF80558; Fri, 15 Sep 2023 11:17:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2246DF80246;
	Fri, 15 Sep 2023 11:17:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 761D9F80425; Fri, 15 Sep 2023 11:17:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3A52F80141
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 11:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3A52F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J0h7d6Cg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694769427; x=1726305427;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CDwlISH8mA5+8r/atwWQjOKJK6Fu8LdmLkEDKau+iAQ=;
  b=J0h7d6CgnwN2bPmfjfeadX5bjSuqBjByWDaRPSzovSK8r4NWWrQydJjl
   JrByLBUGghwpLd8zwWv6URKkeN2vc6Jy/lNxOqpmv+/q6ISWRN0ftdJnz
   4N5J3rNdsLME3Um6OdiBYFfbV41sV6ROfxmBmFG3WvVT9NNiMhTL3LwIA
   VockiNi4M15CicN8n8CfYqqwtRCVltSFyIfHwdhnUJOb8wf6BncYZb8pv
   gtoEiVnfURkjx2zqvwRfFwHo++zf7uqcrIOqAcyviPVMMxKFKdyF5EEvG
   aUb4YdbpGCq496F3zZ5ooZOi/a/ODpMNqqOxu+zPK7/1R00ZJNSxX7L2L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369524153"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="369524153"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 02:17:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="744906235"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="744906235"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 02:16:59 -0700
Message-ID: <1c887615-0e59-8556-e2ab-b985033519d7@linux.intel.com>
Date: Fri, 15 Sep 2023 11:16:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] ASoC: hdaudio.c: Add missing check for devm_kstrdup
Content-Language: en-US
To: Chen Ni <nichen@iscas.ac.cn>, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com, brent.lu@intel.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230915021344.3078-1-nichen@iscas.ac.cn>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230915021344.3078-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T5ZLQVJKOQOVZ5QKZGQ4ZUK6VSHHTD5E
X-Message-ID-Hash: T5ZLQVJKOQOVZ5QKZGQ4ZUK6VSHHTD5E
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5ZLQVJKOQOVZ5QKZGQ4ZUK6VSHHTD5E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/15/2023 4:13 AM, Chen Ni wrote:
> Because of the potential failure of the devm_kstrdup(), the
> dl[i].codecs->name could be NULL.
> Therefore, we need to check it and return -ENOMEM in order to transfer
> the error.
> 
> Fixes: 97030a43371e ("ASoC: Intel: avs: Add HDAudio machine board")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   sound/soc/intel/avs/boards/hdaudio.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
> index cb00bc86ac94..8876558f19a1 100644
> --- a/sound/soc/intel/avs/boards/hdaudio.c
> +++ b/sound/soc/intel/avs/boards/hdaudio.c
> @@ -55,6 +55,9 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
>   			return -ENOMEM;
>   
>   		dl[i].codecs->name = devm_kstrdup(dev, cname, GFP_KERNEL);
> +		if (!dl[i].codecs->name)
> +			return -ENOMEM;
> +
>   		dl[i].codecs->dai_name = pcm->name;
>   		dl[i].num_codecs = 1;
>   		dl[i].num_cpus = 1;

Good catch

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
