Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C64379232D
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 15:55:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE3DE86F;
	Tue,  5 Sep 2023 15:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE3DE86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693922134;
	bh=B5Z6r2/wpqcrYO+tULT83pjjgUfW2tcmh/nmJXRPbWY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CoEbKtgJ5NXKaUuwpdc9srYUHZPS1h9COQSZLO65yMe/D70oCn1WTNvpmbF2R7971
	 lJNzTxWNNvTBS7OGNoXMVH/sL/OOh5pLPsW5u8xnSKe37VGtRiF5JnhezSLnxZWJQt
	 Chj0qWCWLf9EsTQi+rs9EG9OoK4IJUfU71P2UhfU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D635F80568; Tue,  5 Sep 2023 15:54:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46F3FF80236;
	Tue,  5 Sep 2023 15:54:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17AD2F80494; Tue,  5 Sep 2023 15:52:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84D17F80236
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 15:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84D17F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MDciL5ct
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693921973; x=1725457973;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=B5Z6r2/wpqcrYO+tULT83pjjgUfW2tcmh/nmJXRPbWY=;
  b=MDciL5ctz4kG0zYeEi30pHZAmq6dUzWJ5je/yVHZp9n+dVzY/Oq+M0Q9
   xJPFH1jhyaGVLec3wVKsc2H1TabchS4sPWr6J2hRkNICPJn55eQ7ewyB8
   LibYY3iwOAyWCm5lhWH1ZI4kQoFB80H/AmLs5ceK9JH7DBRjVwqXJwMZp
   UBJFKtN2L0QCDEyPVYMJpxhHhOHcPYrRcVE5u2Cc60rHRdENkGtXoddlN
   cqTBWGgkW42T9vuRJlST6hNtQkJ02exY29sEl4klQWqeDSX4EJgqzvOUR
   dCHPXpRowjOM7Hvja1wEjk6tjgJKRSO0fvsEzkLKbhzaj5fQNG1IK/HvJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="463165906"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000";
   d="scan'208";a="463165906"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 06:52:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="741100797"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000";
   d="scan'208";a="741100797"
Received: from qatran-mobl2.amr.corp.intel.com (HELO [10.212.36.84])
 ([10.212.36.84])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 06:52:45 -0700
Message-ID: <41c370c9-9be7-ae50-c183-63d7024aa389@linux.intel.com>
Date: Tue, 5 Sep 2023 08:42:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: Intel: avs: Provide support for fallback topology
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai
 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org
References: <20230905093147.1960675-1-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230905093147.1960675-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PMLOFKJFGUN55VRMWSCY57AUOF3JAVIP
X-Message-ID-Hash: PMLOFKJFGUN55VRMWSCY57AUOF3JAVIP
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PMLOFKJFGUN55VRMWSCY57AUOF3JAVIP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/5/23 05:31, Amadeusz Sławiński wrote:
> HDA and HDMI devices are simple enough that in case of user not having
> topology tailored to their device, they can use fallback topology.
> 
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/soc/intel/avs/pcm.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
> index 1fbb2c2fadb5..8565a530706d 100644
> --- a/sound/soc/intel/avs/pcm.c
> +++ b/sound/soc/intel/avs/pcm.c
> @@ -796,6 +796,28 @@ static int avs_component_probe(struct snd_soc_component *component)
>  
>  	ret = avs_load_topology(component, filename);
>  	kfree(filename);
> +	if (ret == -ENOENT && !strncmp(mach->tplg_filename, "hda-", 4)) {
> +		unsigned int vendor_id;
> +
> +		if (sscanf(mach->tplg_filename, "hda-%08x-tplg.bin", &vendor_id) != 1)
> +			return ret;
> +
> +		if (((vendor_id >> 16) & 0xFFFF) == 0x8086)
> +			mach->tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL,
> +							     "hda-8086-generic-tplg.bin");

it's very odd to test for 0x8086 in a driver that only supports Intel
devices, isn't it?

One of these two branches is always-true or there's a missing
explanation on what this 0x8086 is used for?

> +		else
> +			mach->tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL,
> +							     "hda-generic-tplg.bin");
> +
> +		filename = kasprintf(GFP_KERNEL, "%s/%s", component->driver->topology_name_prefix,
> +				     mach->tplg_filename);
> +		if (!filename)
> +			return -ENOMEM;
> +
> +		dev_info(card->dev, "trying to load fallback topology %s\n", mach->tplg_filename);
> +		ret = avs_load_topology(component, filename);
> +		kfree(filename);
> +	}
>  	if (ret < 0)
>  		return ret;
>  
